package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.QuizDAO;
import com.dto.QuizDTO;
import com.dto.UserDTO;

public class UserQuizListController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // USER LOGIN CHECK
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("userdata");

        if (user == null) {
            response.sendRedirect("userlogin.jsp");
            return;
        }

        QuizDAO dao = new QuizDAO();
        List<QuizDTO> quizList = dao.getAllQuizzes();

        request.setAttribute("quizList", quizList);
        RequestDispatcher rd = request.getRequestDispatcher("userquizlist.jsp");
        rd.forward(request, response);
    }
}