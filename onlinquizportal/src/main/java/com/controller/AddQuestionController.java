package com.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.QuestionDAO;
import com.dto.QuestionDTO;


public class AddQuestionController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String questionText = request.getParameter("questionText");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String correctOption = request.getParameter("correctOption");

        QuestionDTO q = new QuestionDTO();
        q.setQuestionText(questionText);
        q.setOptionA(optionA);
        q.setOptionB(optionB);
        q.setOptionC(optionC);
        q.setOptionD(optionD);
        q.setCorrectOption(correctOption);

        QuestionDAO dao = new QuestionDAO();
        boolean status = dao.addQuestion(q);

        if (status) {
            response.sendRedirect("addquestion.jsp?msg=Question Added Successfully");
        } else {
            response.sendRedirect("addquestion.jsp?msg=Error Adding Question");
        }
    }
}
