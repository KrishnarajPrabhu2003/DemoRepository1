package com.dao;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DBConnector;
import com.dto.QuestionDTO;
import com.dto.QuizDTO;
 
public class QuizDAO {
    
    public boolean createQuiz(QuizDTO quiz) {
        try {
            Connection con = DBConnector.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO quizzes(title, category) VALUES (?, ?)"
            );
            ps.setString(1, quiz.getTitle());
            ps.setString(2, quiz.getCategory());
 
            int i = ps.executeUpdate();
            return i > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<QuizDTO> getAllQuizzes() {
        List<QuizDTO> list = new ArrayList<>();

        try (Connection con = DBConnector.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT quizid, title, category FROM quizzes");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                QuizDTO q = new QuizDTO();
                q.setQuizid(rs.getInt("quizid"));
                q.setTitle(rs.getString("title"));
                q.setCategory(rs.getString("category"));
                list.add(q);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    
    public void addQuestionsToQuiz(int quizId, String[] questionIds) {
        try (Connection con = DBConnector.getConnection()) {
            String sql = "INSERT INTO quizquestions (quizid, questionid) VALUES (?, ?)";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                for (String qid : questionIds) {
                    ps.setInt(1, quizId);
                    ps.setInt(2, Integer.parseInt(qid));
                    ps.addBatch();
                }
                ps.executeBatch();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    public QuizDTO getQuizById(int quizId) {
        QuizDTO quiz = null;
        try (Connection con = DBConnector.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM quizzes WHERE quizid = ?")) {
            ps.setInt(1, quizId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    quiz = new QuizDTO();
                    quiz.setQuizid(rs.getInt("quizid"));
                    quiz.setTitle(rs.getString("title"));
                    quiz.setCategory(rs.getString("category"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return quiz;
    }


	public List<QuestionDTO> getQuestionsByQuizId(int quizId) {
		List<QuestionDTO> list = new ArrayList<>();
		try(Connection con = DBConnector.getConnection();
		PreparedStatement ps = con.prepareStatement("SELECT q.* FROM questions q JOIN quizquestions qq on q.questionid=qq.questionid where qq.quizid=?")){
            ps.setInt(1, quizId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
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
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}