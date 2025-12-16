package com.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.QuizDAO;
import com.dao.QuizAttemptDAO;
import com.dto.QuestionDTO;
import com.dto.UserDTO;

public class SubmitQuizController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        UserDTO user = (UserDTO) session.getAttribute("userdata");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int quizId = Integer.parseInt(request.getParameter("quizid"));

        QuizDAO quizDao = new QuizDAO();
        List<QuestionDTO> questions = quizDao.getQuestionsByQuizId(quizId);

        int score = 0;

        for (QuestionDTO q : questions) {
            String userAns = request.getParameter("q_" + q.getQuestionId());
            if (userAns != null && userAns.equals(q.getCorrectOption())) {
                score++;
            }
        }

        // SAVE SCORE
        QuizAttemptDAO attemptDao = new QuizAttemptDAO();
        attemptDao.saveAttempt(user.getUserId(), quizId, score);

        request.setAttribute("score", score);
        request.setAttribute("total", questions.size());
        request.setAttribute("quizid", quizId);

        request.getRequestDispatcher("quizresult.jsp").forward(request, response);
    }
}
