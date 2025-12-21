package com.dao;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 
import com.DBConnector;
import com.dto.AdminDTO;
 
public class AdminDAO {
    AdminDTO admin = null;

    public AdminDTO login(String username, String password) {
 
        try {
            Connection con = DBConnector.getConnection();
            String sql = "SELECT * FROM admin WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
 
            ResultSet rs = ps.executeQuery();
 
            if (rs.next()) {
                admin = new AdminDTO();
 
                admin.setAdminId(rs.getInt("adminid"));
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
                admin.setFullname(rs.getString("fullname"));
            }
 
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        return admin;
    }
    
    public boolean updateProfile(int adminId, String fullName, String password) {

        String sql =
            "UPDATE admin SET fullname = ?, password = ? WHERE adminid = ?";

        try (Connection con = DBConnector.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, fullName);
            ps.setString(2, password);
            ps.setInt(3, adminId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}