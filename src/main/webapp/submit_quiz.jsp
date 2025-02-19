<%@ page import="java.sql.*" %>
<%
    Connection con = (Connection) session.getAttribute("dbConnection");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM questions");
    int total_question=(Integer)session.getAttribute("total_questions");
    int score = 0;
    String q= "INSERT INTO `quiz_attempts`(`user_id`, `question_id`, `chosen_option`) VALUES (?,?,?)";
    PreparedStatement ps = con.prepareStatement(q);
   	int user_id=(Integer)session.getAttribute("user_id");
   	int questionId=0;
    while (rs.next()) 
    {
        questionId = rs.getInt("id");
        int correctAnswer = rs.getInt("correct_option");

        String selectedOption = request.getParameter("q" + questionId);
        if (selectedOption != null && Integer.parseInt(selectedOption) == correctAnswer) 
        {
            score++;
        }
        ps.setInt(1,user_id);
        ps.setInt(2,questionId);
        ps.setInt(3,Integer.parseInt(selectedOption));
        ps.executeUpdate();
       
	}   
	
    out.println("<h2>Your Score: " + score + "/"+total_question+ "</h2>");
%>

