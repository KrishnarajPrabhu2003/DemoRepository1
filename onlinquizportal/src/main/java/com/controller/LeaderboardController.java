package com.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.QuizAttemptDAO;

public class LeaderboardController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int quizId = Integer.parseInt(request.getParameter("quizid"));

        QuizAttemptDAO dao = new QuizAttemptDAO();
        List<Map<String, String>> leaderboard = dao.getLeaderboard(quizId);

        request.setAttribute("leaderboard", leaderboard);
        request.getRequestDispatcher("leaderboard.jsp").forward(request, response);
    }
}
