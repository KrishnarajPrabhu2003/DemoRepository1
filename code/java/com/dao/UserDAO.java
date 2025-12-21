package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DBConnector;
import com.dto.UserDTO;

public class UserDAO {
	public boolean registerUser(UserDTO user) {
		boolean result = false;
		try {
            Connection con = DBConnector.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(username,password,fullname) VALUES (?, ?, ?)"
            );
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFullName());
   
            int row = ps.executeUpdate();
            if(row>0) {
            	return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
	}
	
	public UserDTO login(String username, String password) {
        UserDTO user = null;
 
        try {
            Connection con = DBConnector.getConnection();
            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
 
            ResultSet rs = ps.executeQuery();
 
            if (rs.next()) {
                user = new UserDTO();
 
                user.setUserId(rs.getInt("userid"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullName(rs.getString("fullname"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        return user;
    }

}