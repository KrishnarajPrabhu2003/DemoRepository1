<%@ page language="java" import="java.util.*, com.dto.*" %>

<%
    UserDTO user = (UserDTO) session.getAttribute("userdata");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    QuizDTO quiz = (QuizDTO) request.getAttribute("quiz");
    List<QuestionDTO> questions =
            (List<QuestionDTO>) request.getAttribute("questions");
%>

<!DOCTYPE html>
<html>
<head>
<title>Quiz</title>
</head>

<body>

<h2>Quiz: <%= quiz.getQuizTitle() %></h2>
<h3>Category: <%= quiz.getCategory() %></h3>

<form action="SubmitQuizController" method="post">

<input type="hidden" name="quizid" value="<%= quiz.getQuizId() %>">

<%
    int qno = 1;
    for (QuestionDTO q : questions) {
%>

<p>
<b>Q<%= qno++ %>. <%= q.getQuestionText() %></b><br>

<input type="radio" name="q_<%= q.getQuestionId() %>" value="a"> <%= q.getOptionA() %><br>
<input type="radio" name="q_<%= q.getQuestionId() %>" value="b"> <%= q.getOptionB() %><br>
<input type="radio" name="q_<%= q.getQuestionId() %>" value="c"> <%= q.getOptionC() %><br>
<input type="radio" name="q_<%= q.getQuestionId() %>" value="d"> <%= q.getOptionD() %><br>

</p>
<hr>

<%
    }
%>

<input type="submit" value="Submit Quiz">

</form>

</body>
</html>
