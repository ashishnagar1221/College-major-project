<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>all group images list</title>
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
.style4 {
	color: #6666FF;
	font-weight: bold;
	font-size: 14px;
}
.style6 {color: #FF3333}
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
	  <%String admin=(String)application.getAttribute("admin");%>
        <ul>
          <li><a href="adminmain.jsp"><span>Home</span></a></li>
          <li><a href="#"><span><%=admin%></span></a></li>
          <li><a href="adminlogin.jsp"><span>Logout</span></a></li>
         
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
		<p class="infopost style3">Select Group Type </p>
		 <form action="allgrpimgs.jsp" method="post">
               <table width="513">
			   
            <tr>
              <td width="163" height="48"><span class="style4">Select User   </span></td>
                    <td width="200"><select id="select" name="gtype" class="text">
                            <option>--Select--</option>
                            <option>Inter</option>
							<option>Intra</option>
                            </select></td>
                    <td width="134"><input name="imageField" type="submit"  class="style6" id="imageField" value="Submit" /></td>
            </tr>
          </table>
		  </form>
		  <%
		  String gtype=request.getParameter("gtype");
		  if(gtype!=null)
		  {
		  %>
          
          <div class="clr"></div>
          <p>
		  <table width="614" border="3"  cellpadding="0" cellspacing="0"  style="border-collapse: collapse;  margin:10px 10px 10px 10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px;">
           
            <%@ include file="connect.jsp" %>
            <%
		 ArrayList al=new ArrayList();	
		String s1,s3,s4,s5,s6,s7,s8,s9;
		int i=0,m=0,s2=0;
		try 
		{
		if(gtype.equalsIgnoreCase("intra"))
		{
		String query="select grp from user group by grp"; 
		Statement st=connection.createStatement();
		ResultSet rs=st.executeQuery(query);
		while ( rs.next() )
		{
			String grp=rs.getString(1);
			
				%>
				<p class="infopost style3"><h2 align="center"><span class="style6"> <%=grp%></span> Group Images</h2> </p>
				<%
           
			String query1="select id,imgname,rank from images where grp='"+grp+"'"; 
			Statement st1=connection.createStatement();
			ResultSet rs1=st1.executeQuery(query1);
			while ( rs1.next() )
			{
				i=rs1.getInt(1);
				s1=rs1.getString(2);
				s2=rs1.getInt(3);
				al.add(s1);
				
					%>
					
					 <figure>
				<img height="100" width="100" src="profile_pic.jsp?id=<%=i%>&type=<%="image"%>" />	
				
				 <div id="container">
				
				 <figcaption>
				 <h3><span class="style10">Name:</span> <%=s1%></h3>
				 <h3><span class="style10">Rank:</span> <%=s2%></h3>
				  <a href="imgdetails.jsp?id=<%=i%>&vtype=<%="grp"%>&gtype=<%=gtype%>">View Details</a>
						
				 </figcaption>
				 </div>	
		    </figure>  
	
            <%
						
			}
			if(al.isEmpty())
			{
				%>
				<h3 class="style6">No Images in this group</h3>
				<%
			}
			al.clear();
			}
			}
						
		if(gtype.equalsIgnoreCase("inter"))
		{
		
			String query1="select id,imgname,rank from images"; 
			Statement st1=connection.createStatement();
			ResultSet rs1=st1.executeQuery(query1);
			while ( rs1.next() )
			{
				i=rs1.getInt(1);
				s1=rs1.getString(2);
				s2=rs1.getInt(3);
				al.add(s1);
				if(m==0){
				%>
						<p class="infopost style3"><h2 align="center"><span class="style6"> Inter</span> Group Images</h2> </p>	
						<%}m=1;%>	
					 <figure>
				<img height="100" width="130" src="profile_pic.jsp?id=<%=i%>&type=<%="image"%>" />	
				
				 <div id="container">
				
				 <figcaption>
				 <h3><span class="style10">Name:</span> <%=s1%></h3>
				 <h3><span class="style10">Rank:</span> <%=s2%></h3>
				  <a href="imgdetails.jsp?id=<%=i%>&vtype=<%="grp"%>&gtype=<%=gtype%>">View Details</a>
						
				 </figcaption>
				 </div>	
		    </figure>  
		
	
            <%
						
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
		  <%}%>
          <div class="img"></div>
          </div>
        <div class="article">
         <p align="right"><a href="adminmain.jsp">Back</a></p>
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
            <li><a href="adminmain.jsp">Home</a></li>
            <li><a href="adminlogin.jsp">Logout</a></li>
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
