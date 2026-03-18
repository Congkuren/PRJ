package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.AttendanceRecord;

public class AttendanceDAO extends DBContext {

    public List<AttendanceRecord> getAttendanceByStudent(int studentId) {
        List<AttendanceRecord> list = new ArrayList<>();
        String sql = "SELECT a.attendance_date, a.status, c.class_name, s.subject_name "
                + "FROM Attendance a "
                + "JOIN Classes c ON a.class_id = c.class_id "
                + "JOIN Subjects s ON a.subject_id = s.subject_id "
                + "WHERE a.student_id = ? "
                + "ORDER BY a.attendance_date DESC";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                AttendanceRecord record = new AttendanceRecord();
                record.setAttendanceDate(rs.getDate("attendance_date"));
                record.setStatus(rs.getString("status"));
                record.setClassName(rs.getString("class_name"));
                record.setSubjectName(rs.getString("subject_name"));
                list.add(record);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
