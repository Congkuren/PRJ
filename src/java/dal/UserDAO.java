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
   public void register(String account, String password, String role){

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
   public boolean checkAccount(String account){

        String sql = "SELECT * FROM Users WHERE account=?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, account);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    }
