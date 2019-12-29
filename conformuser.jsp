<%@ page import="java.sql.*,java.util.Random" %>
<%@ include file="connect.jsp" %>
<html><title>users authorize</title>
<body>
	<center>&nbsp;</center>
	<br><br><br>
	<%
  		int mid = Integer.parseInt(request.getParameter("mid"));
		String gtype=request.getParameter("gtype");
   		try {
	   		Random rr = new Random();
	   		String str = "Authorized";
				
       		Statement st1 = connection.createStatement();
       		String query1 ="update user set status='"+str+"' where id="+mid+" ";
	   		st1.executeUpdate (query1);
	   		connection.close();
       	}
      	catch(Exception e)
     	{
			out.println(e.getMessage());
   		}
   		response.sendRedirect("allusers.jsp?gtype="+gtype+"");  
	%>
</body>
</html>