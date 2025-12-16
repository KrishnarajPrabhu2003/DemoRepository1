package com.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class UserLogoutController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        response.sendRedirect("userlogin.jsp");
    }
}
