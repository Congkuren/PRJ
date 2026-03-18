package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.ClassOffer;

public class CourseDAO extends DBContext {

    public List<ClassOffer> getAvailableClasses(int studentId) {
        List<ClassOffer> list = new ArrayList<>();
        String sql = "SELECT c.class_id, c.class_name, "
                + "COALESCE(t.name, u.account) AS teacher_name, "
                + "sub.subject_name, "
                + "COUNT(e2.enroll_id) AS student_count, "
                + "CASE WHEN e.student_id IS NULL THEN 0 ELSE 1 END AS enrolled "
                + "FROM Classes c "
                + "JOIN Teachers t ON c.teacher_id = t.user_id "
                + "JOIN Users u ON u.user_id = t.user_id "
                + "LEFT JOIN ( "
                + "    SELECT cs.class_id, "
                + "           STUFF(( "
                + "               SELECT ', ' + s2.subject_name "
                + "               FROM ClassSubjects cs2 "
                + "               JOIN Subjects s2 ON s2.subject_id = cs2.subject_id "
                + "               WHERE cs2.class_id = cs.class_id "
                + "               FOR XML PATH(''), TYPE "
                + "           ).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS subject_name "
                + "    FROM ClassSubjects cs "
                + "    GROUP BY cs.class_id "
                + ") sub ON sub.class_id = c.class_id "
                + "LEFT JOIN Enrollments e ON e.class_id = c.class_id AND e.student_id = ? "
                + "LEFT JOIN Enrollments e2 ON e2.class_id = c.class_id "
                + "GROUP BY c.class_id, c.class_name, COALESCE(t.name, u.account), "
                + "sub.subject_name, e.student_id "
                + "ORDER BY c.class_name";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ClassOffer offer = new ClassOffer();
                offer.setClassId(rs.getInt("class_id"));
                offer.setClassName(rs.getString("class_name"));
                offer.setTeacherName(rs.getString("teacher_name"));
                offer.setSubjectName(rs.getString("subject_name"));
                offer.setStudentCount(rs.getInt("student_count"));
                offer.setEnrolled(rs.getInt("enrolled") == 1);
                list.add(offer);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean enrollStudent(int studentId, int classId) {
        String sql = "INSERT INTO Enrollments(student_id, class_id) "
                + "SELECT ?, ? "
                + "WHERE NOT EXISTS ( "
                + "    SELECT 1 FROM Enrollments WHERE student_id = ? AND class_id = ?"
                + ")";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            ps.setInt(2, classId);
            ps.setInt(3, studentId);
            ps.setInt(4, classId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
