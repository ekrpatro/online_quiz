<%@ page import="java.sql.*" %>
<%
    Connection con = (Connection) session.getAttribute("dbConnection");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM questions");

    int score = 0;
    while (rs.next()) {
        int questionId = rs.getInt("id");
        int correctAnswer = rs.getInt("correct_option");

        String selectedOption = request.getParameter("q" + questionId);
        if (selectedOption != null && Integer.parseInt(selectedOption) == correctAnswer) {
            score++;
        }
    }

    out.println("<h2>Your Score: " + score + "</h2>");
%>
