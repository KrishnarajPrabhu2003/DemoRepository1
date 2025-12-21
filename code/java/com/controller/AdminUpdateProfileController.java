package com.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.AdminDAO;

public class AdminUpdateProfileController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminId") == null) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }

        int adminId = (int) session.getAttribute("adminId");
        String fullName = request.getParameter("fullname");
        String password = request.getParameter("password");

        AdminDAO dao = new AdminDAO();
        boolean updated = dao.updateProfile(adminId, fullName, password);

        if (updated) {
            session.setAttribute("adminName", fullName);

            request.setAttribute("msg", "Profile updated successfully");
        } else {
            request.setAttribute("msg", "Profile update failed");
        }

        request.getRequestDispatcher("adminupdateprofile.jsp")
               .forward(request, response);
    }
}
