<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>image details</title>
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
.style7 {font-weight: bold}
.style9 {color: #339933; font-weight: bold; }
.style10 {
	font-size: 18px;
	font-weight: bold;
	color: #FF3333;
}
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
          <p class="infopost style3">Image Details </p>
          <div class="clr"></div>
          <p>
		  <table width="620" border="1.5"  cellpadding="0" cellspacing="0"  >
    <%@ page	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>                    
                        <%@ include file="connect.jsp" %>
                        <%@ page import="org.bouncycastle.util.encoders.Base64"%>
                        
                        <%
						String id = request.getParameter("id");
						String gtype = request.getParameter("gtype");
						String key = request.getParameter("key");
						String s1,s2,s3,s4,s5,s6,s7,s8,s11;
						int i=0;
						try 
						{
						   	String query="select * from images where id='"+id+"'"; 
						   	Statement st=connection.createStatement();
						   	ResultSet rs=st.executeQuery(query);
					   		if ( rs.next() )
					   		{
								i=rs.getInt(1);
								s1=rs.getString(2);
								s2=rs.getString(3);
								s3=rs.getString(4);
								s4=rs.getString(5);
								s5=rs.getString(6);
								s6=rs.getString(7);
								s7=rs.getString(8);
								s8=rs.getString(9);
								int rank=rs.getInt(11);
								
								String query2="select status from searchrequest where username='"+user+"' and grp='"+grp+"'"; 
								Statement st2=connection.createStatement();
								ResultSet rs2=st2.executeQuery(query2);
								if( rs2.next())
								{
									s11=rs2.getString(1);
									
									if(s11.equalsIgnoreCase("Authorized"))
									{
								String keys = "ef50a0ef2c3e3a5f";
								byte[] keyValue1 = keys.getBytes();
								Key key1 = new SecretKeySpec(keyValue1, "AES");
								Cipher c1 = Cipher.getInstance("AES");
								c1.init(Cipher.DECRYPT_MODE, key1);
								String ds4 = new String(Base64.decode(s4.getBytes())); 
								String ds5 = new String(Base64.decode(s5.getBytes()));
								String ds6 = new String(Base64.decode(s6.getBytes()));
								String ds7 = new String(Base64.decode(s7.getBytes()));

					%>
					
                        <tr>
                        <td width="238" rowspan="11"><div class="style7" style="margin:10px 13px 10px 13px;" >
                    <input  name="image" type="image" src="profile_pic.jsp?id=<%=i%>&type=<%="image"%>" style="width:200px; height:200px;"/></div></td>
					    </tr>
                        <tr>
						  <td  width="179" height="48" align="center" valign="middle" style="color: #00CC99;"><div class="style9">Uploaded User</div></td>
						  <td  width="195" valign="middle" align="center" height="48" ><div><%out.println(s1);%></div></td>
					    </tr>
                        <tr>
					      <td  width="179" valign="middle" align="center" height="48" style="color: #00CC99;"><div class="style9">User Group</div></td>
					      <td  width="195" valign="middle" align="center" height="48" ><div><%out.println(s2);%></div></td>
					    </tr>
                        <tr>
						  <td  width="179" valign="middle" align="center" height="48" style="color: #00CC99;"><span class="style9">Image Name</span></td>
						  <td  width="195" valign="middle" align="center" height="48" ><%out.println(s3);%></td>
					    </tr>
                        <tr>
						  <td  width="179" valign="middle" align="center" height="51" style="color: #00CC99;"><span class="style9">Tag Name</span></td>
						  <td  width="195" valign="middle" align="center" height="51"><%out.println(ds4);%></td>
					    </tr>
						 <tr>
							  <td  width="179" valign="middle" align="center" height="51" style="color: #00CC99;"><span class="style9">Use</span></td>
						   <td  width="195" valign="middle" align="center" height="51"><%out.println(ds5);%></td>
					    </tr>
                        <tr>
						  <td  width="179" valign="middle" align="center" height="51" style="color: #00CC99;"><span class="style9">Color</span></td>
						  <td  width="195" valign="middle" align="center" height="51"><%out.println(ds6);%></td>
					    </tr>
						 <tr>
						  <td  width="179" valign="middle" align="center" height="51" style="color: #00CC99;"><span class="style9">Description</span></td>
						  <td  width="195" valign="middle" align="center" height="51"><%out.println(ds7);%></td>
					    </tr>
						 <tr>
						  <td  width="179" valign="middle" align="center" height="51" style="color: #00CC99;"><span class="style9">Date </span></td>
						  <td  width="195" valign="middle" align="center" height="51"><%out.println(s8);%></td>
					    </tr>
						 <tr>
						  <td  width="179" valign="middle" align="center" height="51" style="color: #00CC99;"><span class="style9">Rank </span></td>
						  <td  width="195" valign="middle" align="center" height="51"><%out.println(rank);%></td>
					    </tr>
						<%
						}
						
						else
						{
						
						
						%>
						 <tr>
                        <td width="238" rowspan="11"><div class="style7" style="margin:10px 13px 10px 13px;" >
                    <input  name="image" type="image" src="profile_pic.jsp?id=<%=i%>&type=<%="image"%>" style="width:200px; height:200px;"/></div></td>
					    </tr>
                        <tr>
						  <td  width="179" height="48" align="center" valign="middle" style="color: #00CC99;"><div class="style9">Uploaded User</div></td>
						  <td  width="195" valign="middle" align="center" height="48" ><div><%out.println(s1);%></div></td>
					    </tr>
                        <tr>
					      <td  width="179" valign="middle" align="center" height="48" style="color: #00CC99;"><div class="style9">User Group</div></td>
					      <td  width="195" valign="middle" align="center" height="48" ><div><%out.println(s2);%></div></td>
					    </tr>
                        <tr>
						  <td  width="179" valign="middle" align="center" height="48" style="color: #00CC99;"><span class="style9">Image Name</span></td>
						  <td  width="195" valign="middle" align="center" height="48" ><%out.println(s3);%></td>
					    </tr>
                        <tr>
						  <td  width="179" valign="middle" align="center" height="51" style="color: #00CC99;"><span class="style9">Tag Name</span></td>
						  <td  width="195" valign="middle" align="center" height="51"><textarea ><%out.println(s4);%></textarea></td>
					    </tr>
						 <tr>
							  <td  width="179" valign="middle" align="center" height="51" style="color: #00CC99;"><span class="style9">Use</span></td>
						   <td  width="195" valign="middle" align="center" height="51"><textarea ><%out.println(s5);%></textarea></td>
					    </tr>
                        <tr>
						  <td  width="179" valign="middle" align="center" height="51" style="color: #00CC99;"><span class="style9">Color</span></td>
						  <td  width="195" valign="middle" align="center" height="51"><textarea ><%out.println(s6);%></textarea></td>
					    </tr>
						 <tr>
						  <td  width="179" valign="middle" align="center" height="51" style="color: #00CC99;"><span class="style9">Description</span></td>
						  <td  width="195" valign="middle" align="center" height="51"><textarea rows="5" cols="26"><%out.println(s7);%></textarea></td>
					    </tr>
						 <tr>
						  <td  width="179" valign="middle" align="center" height="51" style="color: #00CC99;"><span class="style9">Date </span></td>
						  <td  width="195" valign="middle" align="center" height="51"><%out.println(s8);%></td>
					    </tr>
						 <tr>
						  <td  width="179" valign="middle" align="center" height="51" style="color: #00CC99;"><span class="style9">Rank </span></td>
						  <td  width="195" valign="middle" align="center" height="51"><%out.println(rank);%></td>
					    </tr>
						<%
						}
						
						 String dislike=request.getParameter("dislike");
		  if(dislike!=null)
		  {
		  %>
		  <form id="form1" name="form1" method="post" action="updaterank.jsp?id=<%=i%>&itype=<%="dislike"%>&itype1=<%="inter"%>&imgname=<%=s3%>&key=<%=key%>">
		  	<tr>
				  <td  width="282" align="left" valign="middle" height="59" style="color: #00CC99;"><div align="center"><strong>Reason</strong></div></td>
				  <td  width="318" align="left" valign="middle" height="59"><p>
			    <textarea name="reason"></textarea></p><div align="right"><input type="submit" name="Submit" value="Submit" /></div></p></td>
		</tr>
		</form>
		<%}%>
						</table>
					<p>&nbsp;</p>
					<table width="612" >
					 <%
					 int m=0;
					 String query1="select username,reason from dislike where imgid='"+id+"'"; 
					Statement st1=connection.createStatement();
					ResultSet rs1=st1.executeQuery(query1);
					while( rs1.next() )
					{
						String uname=rs1.getString(1);
						String res=rs1.getString(2);
						
						if(m==0)
						{
						%>
						<tr>
						<td colspan="3"><div align="center"><span class="style10">Dislike Details</span></div></td>
						</tr>
						<tr>
						  <td  width="235" align="left" valign="middle" height="26" style="color: #00CC99;"><div align="center"><strong>Username</strong></div></td>
							<td  width="365" align="left" valign="middle" height="26" style="color: #00CC99;"><strong>Reason</strong></td>					                        
						</tr>
						<%
						}m=1;
					%>
					<tr>
						  <td  width="235" align="left" valign="middle" height="36" style="color: #00CC99;"><div align="center"><strong><%=uname%></strong></div></td>
					  <td  width="365" align="left" valign="middle" height="36"><%=res%></td>
					</tr>
					<%
					
					
				
		 		}	
                     
					}
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
		    <table width="453">
		  <tr>
		 <h3>   <td width="330" align="center" valign="middle"> <div align="right"><a href="updaterank.jsp?id=<%=i%>&itype=<%="like"%>&itype1=<%="inter"%>&key=<%=key%>">Like</a></div></td>
	
	  <td width="162" align="center" valign="middle"><div align="center"><a href="u_imgdetails1.jsp?id=<%=id%>&dislike=<%="dislike"%>&key=<%=key%>"> Unlike</a></div></td></h3>

		  </tr>
</table>
          <div class="img"></div>
		
        </div>
        <div class="article">
          <div align="right"><a href="searchimgresults1.jsp?key=<%=key%>">Back</a>
          </div>
		
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
