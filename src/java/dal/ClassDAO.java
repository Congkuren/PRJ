package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.ClassInfo;

public class ClassDAO extends DBContext {

    public List<ClassInfo> getRegisteredClasses(int studentId) {
        List<ClassInfo> list = new ArrayList<>();
        String sql = "SELECT c.class_id, c.class_name, "
                + "COALESCE(t.name, u.account) AS teacher_name, "
                + "sub.subject_name, "
                + "(SELECT COUNT(*) FROM Enrollments e2 WHERE e2.class_id = c.class_id) AS student_count "
                + "FROM Classes c "
                + "JOIN Teachers t ON c.teacher_id = t.user_id "
                + "JOIN Users u ON u.user_id = t.user_id "
                + "JOIN Enrollments e ON e.class_id = c.class_id "
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
                + "WHERE e.student_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ClassInfo info = new ClassInfo();
                info.setClassId(rs.getInt("class_id"));
                info.setClassName(rs.getString("class_name"));
                info.setTeacherName(rs.getString("teacher_name"));
                info.setSubjectName(rs.getString("subject_name"));
                info.setStudentCount(rs.getInt("student_count"));
                list.add(info);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean leaveClass(int studentId, int classId) {
        String sql = "DELETE FROM Enrollments WHERE student_id = ? AND class_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            ps.setInt(2, classId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
