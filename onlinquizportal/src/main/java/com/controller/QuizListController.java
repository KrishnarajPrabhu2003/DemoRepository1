package com.controller;

import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.QuizDAO;
import com.dto.QuizDTO;


public class QuizListController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminName") == null) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }

        QuizDAO dao = new QuizDAO();
        List<QuizDTO> quizList = dao.getAllQuizzes();

        request.setAttribute("quizList", quizList);
        RequestDispatcher rd = request.getRequestDispatcher("QuizList.jsp");
        rd.forward(request, response);
    }
}
