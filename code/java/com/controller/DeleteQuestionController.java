package com.controller;
 
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import com.dao.QuestionDAO;
 
public class DeleteQuestionController extends HttpServlet {
	
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        String adminName = (String) request.getSession().getAttribute("adminName");
        if (adminName == null) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }
 
        int id = Integer.parseInt(request.getParameter("id"));
        QuestionDAO dao = new QuestionDAO();
        boolean status = dao.deleteQuestion(id);
 
        if (status) {
            response.sendRedirect("QuestionListController?msg=Question Deleted Successfully");
        } else {
            response.sendRedirect("QuestionListController?msg=Error Deleting Question");
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	 
 }
}