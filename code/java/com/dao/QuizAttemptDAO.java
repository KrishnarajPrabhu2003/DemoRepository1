package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import com.DBConnector;

public class QuizAttemptDAO {

    public void saveAttempt(int userId, int quizId, int score) {
        try {
            Connection con = DBConnector.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO quizattempts(userid, quizid, score) VALUES (?, ?, ?)"
            );
            ps.setInt(1, userId);
            ps.setInt(2, quizId);
            ps.setInt(3, score);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Map<String, String>> getLeaderboard(int quizId) {
    	 
        List<Map<String, String>> list = new ArrayList<>();
     
        try {
            Connection con = DBConnector.getConnection();
     
            String sql =
                "SELECT u.fullname, q.category, COUNT(qa.attemptid) AS attempts, MAX(qa.attempt_time) AS latest_time, " +
                "(SELECT qa2.score FROM quizattempts qa2 JOIN quizzes q2 ON qa2.quizid = q2.quizid " +
                "WHERE qa2.userid = qa.userid AND q2.category = q.category  ORDER BY qa2.attempt_time DESC LIMIT 1) AS latest_score " +
                "FROM quizattempts qa JOIN users u ON qa.userid = u.userid JOIN quizzes q ON qa.quizid = q.quizid " +
                "GROUP BY qa.userid, q.category ORDER BY latest_score DESC";
     
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
     
            int rank = 1;
            while (rs.next()) {
                Map<String, String> row = new HashMap<>();
                row.put("rank", String.valueOf(rank++));
                row.put("name", rs.getString("fullname"));
                row.put("category", rs.getString("category"));
                row.put("score", rs.getString("latest_score"));
                row.put("attempts", rs.getString("attempts"));
                list.add(row);
            }
     
        } catch (Exception e) {
            e.printStackTrace();
        }
     
        return list;
    }
}