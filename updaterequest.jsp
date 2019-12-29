<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date,java.lang.*" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date"%>
<title>updating friend request</title>

<%
		int n=0;
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

		Date now = new Date();
		
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate + "   " + strTime;
		String status = "waiting";
						
	try{
		String rto = request.getParameter("toname");
		String rfrom = (String)application.getAttribute("user"); 
		String fromgrp = (String)application.getAttribute("grp");
		String togrp=request.getParameter("togrp"); 
		String key=request.getParameter("key");
		String type1=request.getParameter("type1");
	
 		String sql="select * from friends where (rfrom='"+rfrom+"' && rto='"+rto+"' && fromgrp='"+fromgrp+"' && togrp='"+togrp+"')||(rfrom='"+rto+"' && rto='"+rfrom+"' && fromgrp='"+togrp+"' && togrp='"+fromgrp+"')";
       	Statement stmt = connection.createStatement();
	   	ResultSet rs=stmt.executeQuery(sql);
		if(rs.next())
		{
			if(type1.equalsIgnoreCase("inter"))
			{
				response.sendRedirect("interfrndresults.jsp?key="+key+"" );
			}
			else if(type1.equalsIgnoreCase("intra"))
			{
				response.sendRedirect("intrafrndresults.jsp?key="+key+"" );
			}
		}
		else
		{
					
	   	String sql3="insert into friends(fromgrp,rfrom,togrp,rto,status,dt) values ('"+fromgrp+"','"+rfrom+"','"+togrp+"','"+rto+"','"+status+"','"+dt+"')";
       	Statement stmt3 = connection.createStatement();
	   	 n =stmt3.executeUpdate(sql3);
		}
	   	if(n>0)
	   	{
			
			//String msg="Request Sent to "+rto;
			//application.setAttribute("msg",msg);
			if(type1.equalsIgnoreCase("inter"))
			{
				response.sendRedirect("interfrndresults.jsp?key="+key+"" );
			}
			else if(type1.equalsIgnoreCase("intra"))
			{
				response.sendRedirect("intrafrndresults.jsp?key="+key+"" );
			}
			
	    
     	}
	    else
	    {	
			//request.setAttribute("msg","Failure in Recommendation");
			if(type1.equalsIgnoreCase("inter"))
			{
				response.sendRedirect("interfrndresults.jsp?key="+key+"" );
			}
			else if(type1.equalsIgnoreCase("intra"))
			{
				response.sendRedirect("intrafrndresults.jsp?key="+key+"" );
			}
			
      	}
		connection.close();
	}catch(Exception e)
	{
		out.print(e);
	}
%>


			
			
			
			
			
			
			
			
			
			
			
			
			
		