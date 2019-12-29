<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>recommended  image results</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="style1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-titillium-900.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style2 {color: #0099FF}
.style3 {
	font-size: 36px;
	font-weight: bold;
}
.style7 {font-size: 30px}
.style8 {color: #0066FF}
.style9 {color: #FF3300}
.style10 {color: #99CC33}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
  
    <div class="header_resize">
	 <div class="logo">
    
      </div>
      <div class="menu_nav">
	  <%String user=(String)application.getAttribute("user");
	  String grp=(String)application.getAttribute("grp");
	  %>
        <ul>
          <li><a href="usermain.jsp"><span>Home</span></a></li>
          <li><a href="#"><span><%=user%></span></a></li>
          <li><a href="userlogin.jsp"><span>Logout</span></a></li>
         
        </ul>
      </div>
         <h1 class="style2">Tag Based Image Search by Social Re-ranking</h1>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="934" height="307" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="934" height="307" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="934" height="307" alt="" /> </a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <p class="infopost style3 style7">Recommended Images  </p>
          <div class="clr"></div>
          <p>
	     <table >
		 <%@ page	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
        <%@ include file="connect.jsp" %>
	<%@ page import="java.util.Date,java.lang.*" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date"%>
		<%
	
    
						String s1,s2,s3,s4,tname,des,imgid,s5,s6;
						int i=0;
					
						try 
						{	
							ArrayList al=new ArrayList();
						
							ArrayList frnd=new ArrayList();
							ArrayList gp=new ArrayList();
							String query3="select distinct imgid,username,ugrp from recommends where fname='"+user+"' and fgrp='"+grp+"'"; 
							Statement st3=connection.createStatement();
							ResultSet rs3=st3.executeQuery(query3);
							while(rs3.next())
							{
								imgid=rs3.getString(1);
								s5=rs3.getString(2);
								s6=rs3.getString(3);
							
							String query1="select id,imgname,tagname,description from images where id='"+imgid+"'"; 
							Statement st1=connection.createStatement();
							ResultSet rs1=st1.executeQuery(query1);
							if( rs1.next())
							{
								i=rs1.getInt(1);
								s1=rs1.getString(2);
								tname=rs1.getString(3);
								des=rs1.getString(4);
								
								String keys = "ef50a0ef2c3e3a5f";
								byte[] keyValue1 = keys.getBytes();
								Key key1 = new SecretKeySpec(keyValue1, "AES");
								Cipher c1 = Cipher.getInstance("AES");
								c1.init(Cipher.DECRYPT_MODE, key1);
								String dtname = new String(Base64.decode(tname.getBytes())); 
								String ddes = new String(Base64.decode(des.getBytes()));
								
						  
					
					al.add(s1);
					%>
					
					 <figure>
				<img height="100" width="100" src="profile_pic.jsp?id=<%=i%>&type=<%="image"%>" />	
				
				 <div id="container">
				
				 <figcaption>
				  <span class="style9">Username: <%=s5%></span><br />
				   <span class="style10">Group: <%=s6%></span><br />
				 <span class="style8">Name: <%=s1%></span><br />
				<a href="updaterank1.jsp?id=<%=i%>&itype=<%="view"%>">View Details</a><br />
				<form action="recommends.jsp?id=<%=i%>&gp=<%=grp%>&type1=<%="recmd"%>" method="post">
				 <%
				String sql="select rfrom,fromgrp from friends where (rto='"+user+"' and status='Accepted')";
				 Statement st=connection.createStatement();
			     ResultSet rs=st.executeQuery(sql);
				 while( rs.next())
				 {
				 	String rfrom=rs.getString(1);
					String fromgrp=rs.getString(2);
					frnd.add(rfrom);
					gp.add(fromgrp);
				 }
				 String sql2="select rto,togrp from friends where (rfrom='"+user+"' and status='Accepted')";
				 Statement st2=connection.createStatement();
			     ResultSet rs2=st2.executeQuery(sql2);
				 while( rs2.next())
				 {
				 	String rto=rs2.getString(1);
					String togrp=rs2.getString(2);
					frnd.add(rto);
					gp.add(togrp);
				 }
				 %><select name="sel" style="width:130px;">
				  <option>Select Option</option>
				 <%for(int k=0;k<frnd.size();k++){%>
				 <option><%=frnd.get(k)%>(<%=gp.get(k)%>)</option>
				 
				 <%}%>
				 </select><br />
					<input type="submit" name="button" value="Recommend" />
				 </figcaption>
				 </div>	
		    </figure>  </form>
		
					
          
		
            <%
			frnd.clear();
				gp.clear();	
			}
			}		
			if(al.isEmpty())
			{
				%>
				<h2 class="style9">No Results Found</h2>
				<%
			}
			
	   String msg=(String)application.getAttribute("msg");
		 if(msg!=null)
		   {
		   		%>
	  <h2 class="style25" ><%=msg%></h2>
		  <%
			application.removeAttribute("msg");
		   }
		  
					
					connection.close();
					
					}
					catch(Exception e)
					{
						out.println(e.getMessage());
					}
					%>
	 </table>
		  </p>
          <div class="img"></div>
		
        </div>
        <div class="article">
          <p align="right"><a href="usermain.jsp">Back</a></p>
          <div class="clr"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">

          <form id="formsearch" name="formsearch" method="post" action="#">
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            </span>
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="gadget">
          <h2 class="star"><span>Sidebar</span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="usermain.jsp">Home</a></li>
            <li><a href="userlogin.jsp">Logout</a></li>
          </ul>
        </div>
        <div class="gadget">
          <h2 class="star">&nbsp;</h2>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2><span>Image</span> Gallery</h2>
        <a href="#"><img src="images/gal1.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal2.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal3.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal4.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal5.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal6.jpg" width="75" height="75" alt="" class="gal" /></a> </div>
      <div class="col c2">
        <h2>&nbsp;</h2>
        <p>&nbsp;</p>
        <ul class="fbg_ul"><li></li>
          <li></li>
          <li></li>
        </ul>
      </div>
      <div class="col c3">
        <h2>&nbsp;</h2>
        <p>&nbsp;</p>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <p class="rf">&nbsp;</p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>
