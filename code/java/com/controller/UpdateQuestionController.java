package com.controller;
 
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import com.dao.QuestionDAO;
import com.dto.QuestionDTO;
 
public class UpdateQuestionController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminName") == null) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }
 
        int id = Integer.parseInt(request.getParameter("id"));
        QuestionDAO dao = new QuestionDAO();
        QuestionDTO q = dao.getQuestionById(id);
 
        if (q != null) {
            request.setAttribute("question", q);
            RequestDispatcher rd = request.getRequestDispatcher("editQuestion.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("QuestionListController?msg=Question Not Found");
        }
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminName") == null) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }
 
        int id = Integer.parseInt(request.getParameter("questionid"));
        String questionText = request.getParameter("questionText");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String correctOption = request.getParameter("correctOption");
 
        QuestionDTO q = new QuestionDTO();
        q.setQuestionid(id);
        q.setQuestionText(questionText);
        q.setOptionA(optionA);
        q.setOptionB(optionB);
        q.setOptionC(optionC);
        q.setOptionD(optionD);
        q.setCorrectOption(correctOption);
 
        QuestionDAO dao = new QuestionDAO();
        boolean status = dao.updateQuestion(q);
 
        if (status) {
            response.sendRedirect("QuestionListController?msg=Question Updated Successfully");
        } else {
            response.sendRedirect("QuestionListController?msg=Error Updating Question");
        }
    }
}
