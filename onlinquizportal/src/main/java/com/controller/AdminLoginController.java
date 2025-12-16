package com.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AdminDAO;
import com.dto.AdminDTO;

public class AdminLoginController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("a1");
        String password = request.getParameter("a2");

        AdminDAO dao = new AdminDAO();
        AdminDTO admin = dao.login(username, password);

        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("adminName", admin.getFullname());   // IMPORTANT
            session.setAttribute("adminUsername", admin.getUsername());

            RequestDispatcher rd = request.getRequestDispatcher("admindashboard.jsp");
            rd.forward(request, response);

        } else {
            request.setAttribute("msg", "Invalid Username or Password");
            RequestDispatcher rd = request.getRequestDispatcher("adminlogin.jsp");
            rd.forward(request, response);
        }
    }
}
