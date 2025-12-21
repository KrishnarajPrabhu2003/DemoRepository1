package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AdminDAO;
import com.dao.UserDAO;
import com.dto.AdminDTO;
import com.dto.UserDTO;


public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UserLoginController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String username = request.getParameter("username");
	     String password = request.getParameter("password");
	 
	        UserDAO dao = new UserDAO();
	        UserDTO user = dao.login(username, password);
	 
	        if (user != null) {
	            HttpSession session = request.getSession();
	            session.setAttribute("userdata",user);  
	 
	            RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp");
	            rd.forward(request, response);
	 
	        } else {
	            request.setAttribute("msg", "Invalid Username or Password");
	            RequestDispatcher rd = request.getRequestDispatcher("userlogin.jsp");
	            rd.forward(request, response);
	        }
	    }

}