package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AdminDAO;
import com.dao.DashboardDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/AdminDashboardController")
public class AdminDashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminDashboardController() {
        super();
   
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);		 
	        if (session == null || session.getAttribute("adminName") == null) {
	            response.sendRedirect("adminlogin.jsp");
	            return;
	        }
	        DashboardDAO dao = new DashboardDAO();
	        int totalQuiz = dao.getTotalQuizzes();
	        int totalQuestions = dao.getTotalQuestions();
	        int totalUsers = dao.getTotalUsers();
	        request.setAttribute("totalQuiz", totalQuiz);
	        request.setAttribute("totalQuestions", totalQuestions);
	        request.setAttribute("totalUsers", totalUsers);
	        
	        request.getRequestDispatcher("admindashboard.jsp").forward(request, response);
	        

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doGet(request,response);
	}

	
	

}
