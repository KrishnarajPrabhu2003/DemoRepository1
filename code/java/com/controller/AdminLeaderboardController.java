package com.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.QuizAttemptDAO;
import com.dto.LeaderboardDTO;

public class AdminLeaderboardController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminName") == null) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }

        QuizAttemptDAO dao = new QuizAttemptDAO();
        List<LeaderboardDTO> leaderboard = dao.getAdminLeaderboard();

        request.setAttribute("leaderboard", leaderboard);
        RequestDispatcher rd =
                request.getRequestDispatcher("adminleaderboard.jsp");
        rd.forward(request, response);
    }
}
