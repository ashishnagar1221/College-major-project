<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date,java.lang.*" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date,java.util.*,java.lang.*,java.util.regex.*"%>
<title>updating friend request</title>

<%
		int n=0;
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

		Date now = new Date();
		
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate + "   " + strTime;
		
						
	try{
		String sender = (String)application.getAttribute("user"); 
		String sgrp = (String)application.getAttribute("grp");
		String fname = request.getParameter("sel");
		String type1=request.getParameter("type1"); 
		int imgid=(Integer.parseInt(request.getParameter("id")));
		String str=new String(fname);
		String a[]=str.split("\\(");
		String s1=a[0];
		String s2=a[1];
		String a1[]=s2.split("\\)");
	String s11=a1[0];
	
 	String sql="select * from recommends where (username='"+sender+"' && ugrp='"+sgrp+"' && fname='"+s1+"' && fgrp='"+s11+"' && imgid="+imgid+")";
       	Statement stmt = connection.createStatement();
	   	ResultSet rs=stmt.executeQuery(sql);
		if(rs.next())
		{
			if(type1.equalsIgnoreCase("same"))
			{
				String key=request.getParameter("key");
				response.sendRedirect("searchimgresults.jsp?key="+key+"" );
			}
			else if(type1.equalsIgnoreCase("all"))
			{
				String key=request.getParameter("key");
				response.sendRedirect("searchimgresults1.jsp?key="+key+"" );
			}
			else if(type1.equalsIgnoreCase("recmd"))
			{
				response.sendRedirect("viewrecommends.jsp" );
			}
		
		}
		else
		{
					
	   	String sql3="insert into recommends(username,ugrp,fname,fgrp,imgid,dt) values ('"+sender+"','"+sgrp+"','"+s1+"','"+s11+"','"+imgid+"','"+dt+"')";
       	Statement stmt3 = connection.createStatement();
	   	 n =stmt3.executeUpdate(sql3);
		}
	   	if(n>0)
	   	{
			
			String msg="Image Recommended Succesfully ";
			application.setAttribute("msg",msg);
			if(type1.equalsIgnoreCase("same"))
			{
				String key=request.getParameter("key");
				response.sendRedirect("searchimgresults.jsp?key="+key+"" );
			}
			else if(type1.equalsIgnoreCase("all"))
			{
				String key=request.getParameter("key");
				response.sendRedirect("searchimgresults1.jsp?key="+key+"" );
			}
			else if(type1.equalsIgnoreCase("recmd"))
			{
				response.sendRedirect("viewrecommends.jsp" );
			}
		
	    
     	}
		connection.close();
	}catch(Exception e)
	{
		out.print(e);
	}
%>


			
			
			
			
			
			
			
			
			
			
			
			
			
		