package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.ClassRoom;
import models.Student;

public class ClassDAO extends DBContext {

    public List<ClassRoom> getClassesByTeacher(int teacherId) {
        List<ClassRoom> list = new ArrayList<>();

        String sql = "SELECT class_id, class_name FROM Classes WHERE teacher_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, teacherId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ClassRoom c = new ClassRoom();
                c.setClassId(rs.getInt("class_id"));
                c.setClassName(rs.getString("class_name"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<ClassRoom> getAllClasses() {
        List<ClassRoom> list = new ArrayList<>();

        String sql = "SELECT class_id, class_name FROM Classes";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ClassRoom c = new ClassRoom();
                c.setClassId(rs.getInt("class_id"));
                c.setClassName(rs.getString("class_name"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public String getClassName(int classId) {
        String sql = "SELECT class_name FROM Classes WHERE class_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, classId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getString("class_name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Student> getStudentsByClass(int classId) {
        List<Student> list = new ArrayList<>();

        String sql = "SELECT u.user_id, "
                   + "COALESCE(s.name, 'Chua cap nhat') AS name, "
                   + "COALESCE(s.email, u.account) AS email "
                   + "FROM Enrollments e "
                   + "JOIN Users u ON e.student_id = u.user_id "
                   + "LEFT JOIN Students s ON u.user_id = s.user_id "
                   + "WHERE e.class_id = ? AND u.role = 'student' AND u.status = 1";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, classId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Student st = new Student();
                st.setUserId(rs.getInt("user_id"));
                st.setName(rs.getString("name"));
                st.setEmail(rs.getString("email"));
                list.add(st);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
