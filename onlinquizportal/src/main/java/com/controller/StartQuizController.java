package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.QuizDAO;
import com.dto.QuestionDTO;
import com.dto.QuizDTO;
import com.dto.UserDTO;

public class StartQuizController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        UserDTO user = (UserDTO) session.getAttribute("userdata");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int quizId = Integer.parseInt(request.getParameter("quizid"));

        QuizDAO dao = new QuizDAO();

        QuizDTO quiz = dao.getQuizById(quizId);
        List<QuestionDTO> questions = dao.getQuestionsByQuizId(quizId);

        request.setAttribute("quiz", quiz);
        request.setAttribute("questions", questions);

        RequestDispatcher rd = request.getRequestDispatcher("createquiz.jsp");
        rd.forward(request, response);
    }
}
