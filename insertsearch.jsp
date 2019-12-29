<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date,java.lang.*" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date"%>
<title>updating rank</title>

<%
		
	
	try{
		
		String key = request.getParameter("key");
		String stype=request.getParameter("stype");
		String user=(String)application.getAttribute("user");
	  String grp=(String)application.getAttribute("grp");
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		Date now = new Date();
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt=strDate+" "+strTime;

			
		
				
				String sql1="insert into searchhistory (username,grp,stype,keyword,dt)values('"+user+"','"+grp+"','"+stype+"','"+key+"','"+dt+"')"; 
				Statement st1=connection.createStatement();
				st1.executeUpdate(sql1);
				
				if(stype.equalsIgnoreCase("intra"))
				{
				response.sendRedirect("searchimgresults.jsp?key="+key+"");
				}
				else if(stype.equalsIgnoreCase("inter"))
				{
				response.sendRedirect("searchimgresults1.jsp?key="+key+"");
				}
		
		
		connection.close();
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>


			
			
			
			
			
			
			
			
			
			
			
			
			
		