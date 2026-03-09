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
    public User getUser(String email, String password ) {
        String sql = "select * from users where account = ?" ;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String dataPassword = rs.getString("password");
                if (dataPassword.equals(password)) {
                    User u = new User();
                   u.setAccount(rs.getString("account"));
                   u.setPassword(rs.getInt("password"));
                   u.setUserid(rs.getInt("user_id"));
                   u.setRole(rs.getString("role"));
                    return u;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    
}
