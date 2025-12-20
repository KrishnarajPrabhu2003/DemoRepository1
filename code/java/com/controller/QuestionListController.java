package com.controller;
 
import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.dao.QuestionDAO;
import com.dto.QuestionDTO;
 
public class QuestionListController extends HttpServlet {
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminName") == null) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }
 
        QuestionDAO dao = new QuestionDAO();
        List<QuestionDTO> questionList = dao.getAllQuestions();
 
        request.setAttribute("questionList", questionList);
 
        RequestDispatcher rd = request.getRequestDispatcher("questionList.jsp");
        rd.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	 
 }
}