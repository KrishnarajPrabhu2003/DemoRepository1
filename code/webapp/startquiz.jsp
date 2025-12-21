<%@ page language="java" import="java.util.*, com.dto.*" %>
 <jsp:include page="userhome.jsp"/>

<%
    UserDTO user = (UserDTO) session.getAttribute("userdata");
    if (user == null) {
        response.sendRedirect("userlogin.jsp");
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

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f4f6fb; /* light neutral background */
    color: #333;
}

h2 {
    text-align: center;
    margin-top: 30px;
    font-size: 28px;
    color: #333;
}

h3 {
    text-align: center;
    margin-top: 10px;
    font-size: 20px;
    color: #333;
}

form {
    width: 80%;
    max-width: 800px;
    margin: 30px auto;
    background: #fff;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0px 2px 10px rgba(0,0,0,0.15);
}

p {
    font-size: 18px;
    line-height: 1.6;
    margin-bottom: 15px;
}

b {
    color: #222;
}


hr {
    border: 0;
    border-top: 1px solid #ddd;
    margin: 20px 0;
}

input[type="submit"] {
    background: #333;
    color: #fff;
    padding: 14px 24px;
    border: none;
    border-radius: 6px;
    font-size: 18px;
    cursor: pointer;
    display: block;
    margin: 30px auto 10px auto;
    transition: background 0.3s ease;
}

input[type="submit"]:hover {
    background: #555;
}

@media (max-width: 768px) {
    form {
        width: 95%;
        padding: 20px;
    }
    p {
        font-size: 16px;
    }
    input[type="submit"] {
        width: 100%;
    }
}

</style>

</head>

<body>

<div>
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

<input type="radio" name="q<%= q.getQuestionId() %>" value="A"> <%= q.getOptionA() %><br>
<input type="radio" name="q<%= q.getQuestionId() %>" value="B"> <%= q.getOptionB() %><br>
<input type="radio" name="q<%= q.getQuestionId() %>" value="C"> <%= q.getOptionC() %><br>
<input type="radio" name="q<%= q.getQuestionId() %>" value="D"> <%= q.getOptionD() %><br>

</p>
<hr>

<%
    }
%>

<input type="submit" value="Submit Quiz">

</form>
</div>
</body>
</html>