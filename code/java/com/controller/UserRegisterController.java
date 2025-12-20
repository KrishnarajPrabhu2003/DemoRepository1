package com.controller;
 
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
 
import com.dao.UserDAO;
import com.dto.UserDTO;
 
public class UserRegisterController extends HttpServlet {
 
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String fullname = req.getParameter("fullname");
 
        UserDTO user = new UserDTO();
        user.setUsername(username);
        user.setPassword(password);
        user.setFullname(fullname);
 
        UserDAO dao = new UserDAO();
 
        boolean saved = dao.registerUser(user);
 
        if (saved) {
            req.setAttribute("msg", "Registration Successful! Please login.");
          
        } else {
            req.setAttribute("msg", "Registration Failed. Try again.");
        }
        RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
        rd.forward(req, resp);
    }
}