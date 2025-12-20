<%@ page import="java.util.*" %>
 <jsp:include page="userhome.jsp"/>

<!DOCTYPE html>
<html>
<head>
<title>Quiz Result</title>
<style>
    h2 {
        margin-bottom: 20px;
        color: #333;
    }
    p {
        font-size: 20px;
        margin-bottom: 30px;
    }
    b {
        color: #222;
    }

    a {
        display: inline-block;
        background: #333;
        color: #fff;
        padding: 12px 24px;
        border-radius: 6px;
        text-decoration: none;
        font-size: 18px;
        transition: background 0.3s ease;
    }

    a:hover {
        background: #555;
    }

    .result-box {
        max-width: 500px;
        margin: 0 auto;
        background: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0px 2px 10px rgba(0,0,0,0.15);
    }
</style>
</head>
<body>
<div class="result-box">
    <h2>Quiz Completed!</h2>
    <p>Your Score: <b><%= request.getAttribute("score") %></b>/<%= request.getAttribute("total") %></p>

    <a href="LeaderboardController?quizid=<%= request.getAttribute("quizid") %>">
        View Leaderboard
    </a>
</div>
</body>

</html>