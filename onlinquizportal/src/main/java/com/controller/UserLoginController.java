package com.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.UserDAO;
import com.dto.UserDTO;

public class UserLoginController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        UserDTO user = dao.login(username, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userdata", user);

            response.sendRedirect("userdashboard.jsp");
        } else {
            request.setAttribute("msg", "Invalid Username or Password");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
    }
}
