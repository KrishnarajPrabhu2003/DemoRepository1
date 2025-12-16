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
                "SELECT u.fullname, qa.score " +
                "FROM quizattempts qa " +
                "JOIN users u ON qa.userid = u.userid " +
                "WHERE qa.quizid = ? " +
                "ORDER BY qa.score DESC";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, quizId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, String> row = new HashMap<>();
                row.put("name", rs.getString("fullname"));
                row.put("score", rs.getString("score"));
                list.add(row);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
