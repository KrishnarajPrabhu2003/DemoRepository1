package com.dao;


import java.sql.*;
import com.dto.UserDTO;
import com.DBConnector;

public class UserDAO {

    public boolean registerUser(UserDTO user) {
        boolean result = false;

        try (Connection con = DBConnector.getConnection()) {
            String sql = "INSERT INTO users (username, password, fullname) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFullName());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    public UserDTO login(String username, String password) {
        UserDTO u = null;

        try {
            Connection con = DBConnector.getConnection();
            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                u = new UserDTO();
                u.setUserId(rs.getInt("userid"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setFullName(rs.getString("fullname"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return u;
    }
}
