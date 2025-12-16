package com.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.QuestionDAO;
import com.dto.QuestionDTO;


public class EditQuestionController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminName") == null) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));
        QuestionDAO dao = new QuestionDAO();
        QuestionDTO q = dao.getQuestionById(id);

        if (q != null) {
            request.setAttribute("question", q);
            RequestDispatcher rd = request.getRequestDispatcher("editQuestion.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("QuestionListController?msg=Question Not Found");
        }
    }
}
