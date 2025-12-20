package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DBConnector;

public class DashboardDAO {
	public int getTotalQuizzes() {
		return getCount("select count(*) from quizzes");
	}
	public int getTotalQuestions() {
		return getCount("select count(*) from questions");
	}
	public int getTotalUsers() {
		return getCount("select count(*) from users");
	}
	private int getCount(String sql) {
		int count =0;
		 try(
			Connection con = DBConnector.getConnection();
		    PreparedStatement ps = con.prepareStatement(sql);
		    ResultSet rs = ps.executeQuery()){
			 	if(rs.next()) {
			 		count = rs.getInt(1);
			 	}
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		 return count;
	}


}
