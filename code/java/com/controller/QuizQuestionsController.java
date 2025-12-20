package com.controller;
 
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.List;
import com.dao.QuizDAO;
import com.dto.QuizDTO;
import com.dto.QuestionDTO;
 
public class QuizQuestionsController extends HttpServlet {
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
 
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminName") == null) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }
 
        int quizId = Integer.parseInt(request.getParameter("quizid"));
 
        QuizDAO dao = new QuizDAO();
 
        // Load quiz list again
        List<QuizDTO> allQuizzes = dao.getAllQuizzes();
 
        // Selected quiz
        QuizDTO quiz = dao.getQuizById(quizId);
 
        // Questions for selected quiz
        List<QuestionDTO> questions = dao.getQuestionsByQuizId(quizId);
 
        request.setAttribute("quizList", allQuizzes);
        request.setAttribute("selectedQuiz", quiz);
        request.setAttribute("quizQuestions", questions);
 
        RequestDispatcher rd = request.getRequestDispatcher("quizList.jsp");
        rd.forward(request, response);
    }
}