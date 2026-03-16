/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Student;
import models.Teacher;

import models.User;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext {

    public User getUser(String email, String password) {
        String sql = "SELECT * FROM Users WHERE account = ? AND password = ? AND status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                User u = new User();
                u.setAccount(rs.getString("account"));
                u.setPassword(rs.getString("password"));
                u.setUserid(rs.getInt("user_id"));
                u.setRole(rs.getString("role"));
                u.setStatus(rs.getInt("status"));
                return u;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void register(String account, String password, String role) {

        String sql = "INSERT INTO Users(account,password,role) VALUES(?,?,?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, account);
            ps.setString(2, password);
            ps.setString(3, role);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean checkAccount(String account) {

        String sql = "SELECT * FROM Users WHERE account=?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, account);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public void updateTeacher(int userId, String name, String email, String phone, String experience) {

        String sql = "UPDATE Teachers SET name=?, email=?, phone=?, experience=? WHERE user_id=?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, experience);
            ps.setInt(5, userId);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void updateStudent(int userId, String name, String dob, String email, String phone) {

        String sql = "UPDATE Students SET name=?, dob=?, email=?, phone=? WHERE user_id=?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, dob);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setInt(5, userId);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public Teacher getTeacher(int userId) {

        String sql = "SELECT * FROM Teachers WHERE user_id=?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Teacher t = new Teacher();
                t.setName(rs.getString("name"));
                t.setEmail(rs.getString("email"));
                t.setPhone(rs.getString("phone"));
                t.setExperience(rs.getString("experience"));
                return t;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public Student getStudent(int userId) {

        String sql = "SELECT * FROM Students WHERE user_id=?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Student s = new Student();
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setPhone(rs.getString("phone"));
                s.setDob(rs.getDate("dob"));
                return s;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM Users WHERE role <> 'admin'";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                User u = new User();

                u.setUserid(rs.getInt("user_id"));
                u.setAccount(rs.getString("account"));
                u.setRole(rs.getString("role"));
                u.setStatus(rs.getInt("status"));   // QUAN TRỌNG

                list.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void banUser(int id) {
        String sql = "UPDATE Users SET status = 0 WHERE user_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void unbanUser(int id) {
        String sql = "UPDATE Users SET status = 1 WHERE user_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void saveAttendance(int studentId, String status){

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
