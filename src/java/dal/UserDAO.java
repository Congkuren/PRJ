/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import models.User;

/**
 *
 * @author Admin
 */
public class UserDAO  extends DBContext{
   public User getUser(String email, String password) {
    String sql = "SELECT * FROM Users WHERE account = ? AND password = ?";
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
            return u;
        }
    } catch (Exception e) {
        System.out.println(e);
    }
    return null;
}
    }
