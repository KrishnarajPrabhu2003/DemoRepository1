package com.controller;
 
import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.dao.QuestionDAO;
import com.dao.QuizDAO;
import com.dto.QuestionDTO;
import com.dto.QuizDTO;
 
public class AddQuestionsToQuizController extends HttpServlet {
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminName") == null) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }
        int quizId = Integer.parseInt(request.getParameter("quizid"));
 
        QuestionDAO questionDAO = new QuestionDAO();
        List<QuestionDTO> questionList = questionDAO.getAllQuestions();
 
        QuizDAO quizDAO = new QuizDAO();
        QuizDTO quiz = quizDAO.getQuizById(quizId);
 
        request.setAttribute("quiz", quiz);
        request.setAttribute("questionList", questionList);
 
        RequestDispatcher rd = request.getRequestDispatcher("AddQuestionsToQuiz.jsp");
        rd.forward(request, response);
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminName") == null) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }
 
        int quizId = Integer.parseInt(request.getParameter("quizid"));
        String[] selectedQuestions = request.getParameterValues("questionIds");
 
        if (selectedQuestions != null && selectedQuestions.length > 0) {
            QuizDAO quizDAO = new QuizDAO();
            quizDAO.addQuestionsToQuiz(quizId, selectedQuestions);
        }
 
        response.sendRedirect("QuizListController?msg=Questions Added Successfully");
    }
}