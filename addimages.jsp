<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>add images</title>
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
.style8 {color: #FF0033}
.style9 {
	color: #0066FF;
	font-weight: bold;
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
          <p class="infopost style3 style7">Add Images  </p>
          <div class="clr"></div>
          <p>
	      <form action="insertimage.jsp" method="post" enctype="multipart/form-data">
					  <p>(<span class="style5 style8">* = Required</span>)</p>
					  <table width="420">
					    <tr>
                          <td width="182" height="43"><span class="style9">Image title</span><span class="style8">*</span></td>
                          <td width="226"><input id="imgname" name="imgname" class="text" style="width:175px;" /></td>
                        </tr>
                        <tr>
                          <td height="43"><span class="style9">Tag name</span>(<span class="style8">Min 15 words</span>)<span class="style8">*</span> </td>
                          <td><input id="tname" name="tname" class="text" style="width:175px;" /></td>
                        </tr>
                        <tr>
                          <td height="43"><span class="style9">Image uses</span><span class="style8">*</span></td>
                          <td><input id="use" name="use" class="text" style="width:175px;" /></td>
                        </tr>
                        <tr>
                          <td height="43"><span class="style9">Image Color</span> <span class="style8">*</span> </td>
                          <td><input id="color" name="color" class="text" style="width:175px;"/></td>
                        </tr>
                        <tr>
                          <td height="43"><span class="style9">Description</span><span class="style8">*</span></td>
                          <td><textarea name="des" rows="3" cols="23"></textarea></td>
                        </tr>
                        <tr>
                          <td height="43"><span class="style9">Select Image</span><span class="style8">*</span></td>
                          <td><input type="file" id="img" name="img" class="text" /></td>
                        </tr>
                        <tr>
                          <td height="124" rowspan="3">
                            <p>&nbsp;</p></td>
                        <td align="left" valign="middle"><p>
                              <input name="submit" type="submit" value="ADD IMAGE" />
                            </p>                          </td>
                        </tr>
        </table>
      </form>
	  <%
	   String msg=(String)application.getAttribute("msg");
		 if(msg!=null)
		   {
		   		%>
		  <h2 class="style6"><%=msg%></h2>
		  <%
			application.removeAttribute("msg");
		   }
		   %>
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
