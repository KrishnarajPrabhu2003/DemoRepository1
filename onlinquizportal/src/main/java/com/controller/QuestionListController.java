package com.controller;

import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.QuestionDAO;
import com.dto.QuestionDTO;


public class QuestionListController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check if admin is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminName") == null) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }

        // Fetch all questions from DB
        QuestionDAO dao = new QuestionDAO();
        List<QuestionDTO> questionList = dao.getAllQuestions();

        // Set attribute for JSP
        request.setAttribute("questionList", questionList);

        // Forward to JSP
        RequestDispatcher rd = request.getRequestDispatcher("QuestionList.jsp");
        rd.forward(request, response);
    }
}
