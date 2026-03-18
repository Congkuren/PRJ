package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Student;

public class StudentDAO extends DBContext {

    public List<Student> getAllStudents(){

        List<Student> list = new ArrayList<>();

        String sql = "SELECT u.user_id, "
                   + "COALESCE(s.name, 'Chua cap nhat') AS name, "
                   + "COALESCE(s.email, u.account) AS email "
                   + "FROM Users u "
                   + "LEFT JOIN Students s ON u.user_id = s.user_id "
                   + "WHERE u.role = 'student' AND u.status = 1";

        try{

            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Student s = new Student();

                s.setUserId(rs.getInt("user_id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));

                list.add(s);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

    public void saveAttendance(int studentId, String status){

        if(status == null) return;

        String sql = "INSERT INTO Attendance(student_id,status,date) VALUES(?,?,GETDATE())";

        try{

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, studentId);
            ps.setString(2, status);

            ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
