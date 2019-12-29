<%@ page import="java.sql.*,java.util.Random" %>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date,java.lang.*" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date"%>
<html><title>search request</title>
<body>
	<center>&nbsp;</center>
	<br><br><br>
	<%
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

		Date now = new Date();
		
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate + "   " + strTime;
		String status = "waiting";
		
		String user=(String)application.getAttribute("user");
		String grp=(String)application.getAttribute("grp");
  		
   		try {
	   		
			Statement st1 = connection.createStatement();
       		String query1 ="select * from searchrequest where username='"+user+"' and grp='"+grp+"'";
	   		ResultSet rs1=st1.executeQuery(query1);
			if(rs1.next())
			{
				String msg="Search Request is already sent";
				application.setAttribute("msg",msg);
				response.sendRedirect("searchrequest.jsp");
				
					
				
			}
	   		else
			{
				
				Statement st = connection.createStatement();
				String query ="insert into searchrequest (username,grp,status,dt)values('"+user+"','"+grp+"','"+status+"','"+dt+"')";
				st1.executeUpdate (query);
				
				String msg="Search Request sent";
				application.setAttribute("msg",msg);
				response.sendRedirect("searchrequest.jsp");
				
       		}
			connection.close();
		}
		
      	catch(Exception e)
     	{
			out.println(e.getMessage());
   		}	
	%>
</body>
</html>

