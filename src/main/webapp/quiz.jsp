<%@ page import="java.sql.*, java.util.*" %>
<%
    Connection con = (Connection) session.getAttribute("dbConnection");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM questions");

    List<String> questions = new ArrayList<>();
    while (rs.next()) {
        questions.add("<p>" + rs.getString("question") + "</p>"
            + "<input type='radio' name='q" + rs.getInt("id") + "' value='1'> " + rs.getString("option1") + "<br>"
            + "<input type='radio' name='q" + rs.getInt("id") + "' value='2'> " + rs.getString("option2") + "<br>"
            + "<input type='radio' name='q" + rs.getInt("id") + "' value='3'> " + rs.getString("option3") + "<br>"
            + "<input type='radio' name='q" + rs.getInt("id") + "' value='4'> " + rs.getString("option4") + "<br>"
        );
    }
%>
<html>
<head>
    <title>Online Quiz</title>
</head>
<body>
    <h2>Quiz</h2>
    <form action="submit_quiz.jsp" method="post">
        <%= String.join("<br>", questions) %>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
