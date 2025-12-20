package com.dao;
 
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.dto.QuestionDTO;
import com.DBConnector;
 
public class QuestionDAO {
 
    public boolean addQuestion(QuestionDTO q) {
        try {
            Connection con = DBConnector.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO questions(questiontext, optiona, optionb, optionc, optiond, correctoption) VALUES (?, ?, ?, ?, ?, ?)"
            );
            ps.setString(1, q.getQuestionText());
            ps.setString(2, q.getOptionA());
            ps.setString(3, q.getOptionB());
            ps.setString(4, q.getOptionC());
            ps.setString(5, q.getOptionD());
            ps.setString(6, q.getCorrectOption());
 
            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
 
    public List<QuestionDTO> getAllQuestions() {
        List<QuestionDTO> list = new ArrayList<>();
        try {
            Connection con = DBConnector.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM questions");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                QuestionDTO q = new QuestionDTO();
                q.setQuestionid(rs.getInt("questionid"));
                q.setQuestionText(rs.getString("questiontext"));
                q.setOptionA(rs.getString("optiona"));
                q.setOptionB(rs.getString("optionb"));
                q.setOptionC(rs.getString("optionc"));
                q.setOptionD(rs.getString("optiond"));
                q.setCorrectOption(rs.getString("correctoption"));
                list.add(q);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
 
    public boolean deleteQuestion(int id) {
        try {
            Connection con = DBConnector.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM questions WHERE questionid=?");
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
 
    public QuestionDTO getQuestionById(int id) {
        QuestionDTO q = null;
        try {
            Connection con = DBConnector.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM questions WHERE questionid=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                q = new QuestionDTO();
                q.setQuestionid(rs.getInt("questionid"));
                q.setQuestionText(rs.getString("questiontext"));
                q.setOptionA(rs.getString("optiona"));
                q.setOptionB(rs.getString("optionb"));
                q.setOptionC(rs.getString("optionc"));
                q.setOptionD(rs.getString("optiond"));
                q.setCorrectOption(rs.getString("correctoption"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return q;
    }
 
    public boolean updateQuestion(QuestionDTO q) {
        try {
            Connection con = DBConnector.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "UPDATE questions SET questiontext=?, optiona=?, optionb=?, optionc=?, optiond=?, correctoption=? WHERE questionid=?"
            );
            ps.setString(1, q.getQuestionText());
            ps.setString(2, q.getOptionA());
            ps.setString(3, q.getOptionB());
            ps.setString(4, q.getOptionC());
            ps.setString(5, q.getOptionD());
            ps.setString(6, q.getCorrectOption());
            ps.setInt(7, q.getQuestionid());
            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
