<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>my images</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
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
.style6 {color: #FF3333}
.style7 {font-size: 30px}
.style8 {color: #FF3333; font-size: 16px; }
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
	  String grp=(String)application.getAttribute("grp");%>
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
          <p class="infopost style3 style7">My Images </p>
          <div class="clr"></div>
          <p>
	    <table width="840" align="left"  cellpadding="0" cellspacing="0"  >
 <%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*" %>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
	
		<%
	
    
	String s1,s2,s3,s4,s5,s6;
	int i=0,j=0,m=0,rank=0;
	try 
	{
	ArrayList al=new ArrayList();
	
	String sql2="select * from images where username='"+user+"' and grp='"+grp+"'"; 
	Statement st2=connection.createStatement();
	ResultSet rs2=st2.executeQuery(sql2);
	while(rs2.next())
	{
		i=rs2.getInt(1);
		s1=rs2.getString(4);
		s2=rs2.getString(5);
		s3=rs2.getString(6);
		s4=rs2.getString(7);
		s5=rs2.getString(8);
		s6=rs2.getString(9);
		rank=rs2.getInt(11);
		
			String keys = "ef50a0ef2c3e3a5f";
			byte[] keyValue1 = keys.getBytes();
			Key key1 = new SecretKeySpec(keyValue1, "AES");
			Cipher c1 = Cipher.getInstance("AES");
			c1.init(Cipher.DECRYPT_MODE, key1);
			String ds2 = new String(Base64.decode(s2.getBytes())); 
			String ds3 = new String(Base64.decode(s3.getBytes()));
			String ds4 = new String(Base64.decode(s4.getBytes()));
			String ds5 = new String(Base64.decode(s5.getBytes()));

		
		al.add(s1);
		
		if(m==0){
		%>
		
				<tr>
				  <td  width="101" valign="baseline" height="0" style="color: #2c83b0;"><div align="center"><strong> Image </strong></div></td>
				<td  width="93" valign="baseline" height="0" style="color: #2c83b0;"><div align="center"><strong>Image Name </strong></div></td>
				<td  width="115" valign="baseline" height="0" style="color: #2c83b0;"><div align="center"><strong>Tag Name </strong></div></td>
				  <td  width="96" valign="baseline" height="0" style="color: #2c83b0;"><div align="center"><b>Use</b></div></td>
				  <td  width="67" valign="baseline" height="0" style="color: #2c83b0;"><div align="center"><b>Color</b></div></td>
				  <td   width="152" valign="baseline" height="0" style="color: #2c83b0;"><div align="center"><strong>Description</strong></div></td>
				  <td  width="103" valign="baseline" style="color: #2c83b0;"><div align="center"><strong>Date</strong></div></td>
			      <td  width="82" valign="baseline" style="color: #2c83b0;"><div align="center"><strong>Rank</strong></div></td>
			      <td  width="29" valign="baseline" style="color: #2c83b0;"><div align="center"><strong>Update</strong></div></td>
				</tr>
					<%}%>
					 <form action="editimg.jsp?id=<%=i%>" method="post">
				<tr>
		<td width="101"><input  name="image" type="image" style="width:100px; height:100px;" src="profile_pic.jsp?id=<%=i%>&type=<%="image"%>"/></td>
			  <td  width="93" height="110" align="center" valign="middle"><div align="center"><%out.println(s1);%></div></td>
			    <td  width="115" height="110" align="center" valign="middle"><div align="center"><%out.println(ds2);%></div></td>
			  <td  width="96" height="110" align="center" valign="middle"><div align="center"><%out.println(ds3);%></div></td>	
			  <td  width="67" height="110" align="center" valign="middle"><div align="center"><%out.println(ds4);%></div></td>
			  <td  width="152" align="center" valign="middle"><div align="center"><%out.println(ds5);%></div></td>
			  <td  width="103" height="110" align="center" valign="middle"><div align="center"><%out.println(s6);%></div></td>
			    <td  width="82" align="center" valign="middle"><div align="center"><%out.println(rank);%></div></td>
			    <td  width="29" height="110" align="center" valign="middle"><div align="center">
				  <input type="submit" name="edit" value="Edit"/> <input id="submit" type="submit" name="delete" value="Delete"/></div></td>
		</tr>
					</form>
					<%m=2;
				}
			
					if(al.isEmpty())
					{
					%>
					<h2 class="style6">Sorry..!! Your are not Added any Images</h2>
					<%}
					 String msg=(String)application.getAttribute("msg");
					 if(msg!=null){
					 %><h3 class="style8"> <%=msg%></h3> 
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
