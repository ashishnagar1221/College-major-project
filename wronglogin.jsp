<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>wrong login page</title>
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
.style7 {color: #FF0033}
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
        <ul>
          <li><a href="index.html"><span>Home </span></a></li>
         
         
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
          <p class="infopost style3 style7"> Login Failed..!!! </p>
          <div class="clr"></div>
          <p>&nbsp;</p>
          <div class="img"></div>
		
          <div class="post_content">
            <p align="justify"> </p>
           
          </div>
        
        </div>
        <div class="article">
         <p>
		 <table width=405 height="267" border=0 align="center" cellpadding=0 cellspacing=0>
<tr>
<td width="405" height="189" align=center valign="middle"><div align="center"><span class="style8"><span class="style9"><span class="style8"><font class=sb4>Sorry.</font><BR>
        <BR>
        <font class=sb3>
          Your login failed.<BR>
            </font></span></span></span>
  <TABLE cellSpacing=0 cellPadding=0 border=0 height="7">
    <TR><TD height=7 class="style9 style8"></TD></TR>
    </TABLE>
  <span class="style9 style8"><font class="sb3">This happens due to - Incorrect Username / Incorrect password<BR>
    </font> </span>
  <TABLE cellSpacing=0 cellPadding=0 border=0 width="10">
    <TR>
      <TD width="10" height=9 class="style9 style8"></TD></TR>
    </TABLE>
  <span class="style9 style8"><font class="sb3">In case you have forgotten your password,<BR>
    </font> </span>
  <TABLE cellSpacing=0 cellPadding=0 border=0>
    <TR><TD height=9 class="style9 style8"></TD></TR>
    </TABLE>
  <span class="style9 style8"><font class="sb3">click&nbsp; here to re enter correct&nbsp; username or password on homepage.</font></span><span class="style9"><font class="sb3"></font><font class="sb3"><BR>
    </font></span><font class="sb3"></font><font class="sb3"><BR>
      <%
String type=(String)application.getAttribute("type");
if(type.equalsIgnoreCase("user")){
%>
      <a href="userlogin.jsp">Click here to go back</a>	<br />	
        <a href="index.html"><span class="">Home Page</span></a>
      </BR>
      <%}
else{
%>
      <a href="adminlogin.jsp">Click here to go back</a><BR>
      <a href="index.html"><span>Home Page</span></a>
      <%}%>
    </font></div></td>
</tr>
</table>
		 </p>
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
            <li><a href="index.html">Home</a></li>
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
