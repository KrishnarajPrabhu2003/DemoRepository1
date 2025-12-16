package com.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class LogoutController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();  // Remove admin session
        }

        // Redirect back to login page
        response.sendRedirect("adminlogin.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
