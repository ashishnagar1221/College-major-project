<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date,java.lang.*" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date"%>
<title>updating rank</title>

<%
		
	
	try{
		String user = (String)application.getAttribute("user");
		String grp = (String)application.getAttribute("grp");
		String id = request.getParameter("id");
		String key = request.getParameter("key");
		String itype=request.getParameter("itype");
		String itype1=request.getParameter("itype1");
		
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		Date now = new Date();
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt=strDate+" "+strTime;

			if(itype.equalsIgnoreCase("like"))
			{
				
				String sql1="update images set rank=rank+1 where id='"+id+"'"; 
				Statement st1=connection.createStatement();
				st1.executeUpdate(sql1);
				
				if(itype1.equalsIgnoreCase("intra"))
				{
				response.sendRedirect("u_imgdetails.jsp?id="+id+"&key="+key+"");
				}
				else if(itype1.equalsIgnoreCase("inter"))
				{
				response.sendRedirect("u_imgdetails1.jsp?id="+id+"&key="+key+"");
				}
				
			}
			
			else if(itype.equalsIgnoreCase("view"))
			{
				
				String sql1="update images set rank=rank+1 where id='"+id+"'"; 
				Statement st1=connection.createStatement();
				st1.executeUpdate(sql1);
				if(itype1.equalsIgnoreCase("intra"))
				{
				response.sendRedirect("u_imgdetails.jsp?id="+id+"&key="+key+"");
				}
				else if(itype1.equalsIgnoreCase("inter"))
				{
				response.sendRedirect("u_imgdetails1.jsp?id="+id+"&key="+key+"");
				}
				
			}
			else if(itype.equalsIgnoreCase("dislike"))
			{
				
				String reason=request.getParameter("reason");
				String imgname=request.getParameter("imgname");
				String sql1="insert into dislike (imgid,username,grp,imgname,reason,dt)values('"+id+"','"+user+"','"+grp+"','"+imgname+"','"+reason+"','"+dt+"')"; 
				Statement st1=connection.createStatement();
				st1.executeUpdate(sql1);
				if(itype1.equalsIgnoreCase("intra"))
				{
				response.sendRedirect("u_imgdetails.jsp?id="+id+"&key="+key+"");
				}
				else if(itype1.equalsIgnoreCase("inter"))
				{
				response.sendRedirect("u_imgdetails1.jsp?id="+id+"&key="+key+"");
				}
				
			}
      
		connection.close();
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>


			
			
			
			
			
			
			
			
			
			
			
			
			
		