package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.QuizDAO;
import com.dto.QuizDTO;


public class CreateQuizController extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String title = req.getParameter("title");
        String category = req.getParameter("category");

        QuizDTO quiz = new QuizDTO();
        quiz.setQuizTitle(title);
        quiz.setCategory(category);

        QuizDAO dao = new QuizDAO();
        boolean status = dao.createQuiz(quiz);

        if (status) {
            resp.sendRedirect("createnewquiz.jsp?msg=Quiz Created Successfully");
        } else {
            resp.sendRedirect("createnewquiz.jsp?msg=Error Creating Quiz");
        }
    }
}
