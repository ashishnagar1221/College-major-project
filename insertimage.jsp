<title>Insert Data</title>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*" %>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>
<%@page
	import="java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%
					String user=(String)application.getAttribute("user");
					String grp=(String)application.getAttribute("grp");
					ArrayList list = new ArrayList();
					ServletContext context = getServletContext();
					String dirName =context.getRealPath("Gallery\\");
					String paramname=null;
					String file=null;
					String a=null,b=null,d=null,image=null;
					String ee[]=null;
					String checkBok=" ";
					int ff=0;
					String bin = "";
					String tname=null;
					String imgname=null;
					String use=null;
					String color=null;
					String des=null;   
					int rank=0;  
        			
					FileInputStream fs=null;
					File file1 = null;	
					
					try {
						MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB
						Enumeration params = multi.getParameterNames();
						while (params.hasMoreElements()) 
						{
							paramname = (String) params.nextElement();
							
							
							if(paramname.equalsIgnoreCase("imgname"))
							{
								imgname=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("tname"))
							{
								tname=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("use"))
							{
								use=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("color"))
							{
								color=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("des"))
							{
								des=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("img"))
							{
								image=multi.getParameter(paramname);
							}
						
						}
							
						int f = 0;
						Enumeration files = multi.getFileNames();	
						while (files.hasMoreElements()) 
						{
							paramname = (String) files.nextElement();
							
							if(paramname != null)
							{
								f = 1;
								image = multi.getFilesystemName(paramname);
								String fPath = context.getRealPath("Gallery\\"+image);
								file1 = new File(fPath);
								fs = new FileInputStream(file1);
								list.add(fs);
							
								String ss=fPath;
								FileInputStream fis = new FileInputStream(ss);
								StringBuffer sb1=new StringBuffer();
								int i = 0;
								while ((i = fis.read()) != -1)
								 {
									if (i != -1) 
									{
										//System.out.println(i);
										String hex = Integer.toHexString(i);
										// session.put("hex",hex);
										sb1.append(hex);
										// sb1.append(",");
									
										String binFragment = "";
										int iHex;
			 
										for(int i1= 0; i1 < hex.length(); i1++)
										{
											iHex = Integer.parseInt(""+hex.charAt(i1),16);
											binFragment = Integer.toBinaryString(iHex);
			
											while(binFragment.length() < 4)
											{
												binFragment = "0" + binFragment;
											}
											bin += binFragment;
											//System.out.print(bin);
										}
									}	
								}
							}		
						}
						FileInputStream fs1 = null;
						//name=dirName+"\\Gallery\\"+image;
						int lyke=0;
						//String as="0";
						//image = image.replace(".", "_b.");
						SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
						SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

						Date now = new Date();
						
						String strDate = sdfDate.format(now);
						String strTime = sdfTime.format(now);
						String dt=strDate+" "+strTime;
						
						String keys = "ef50a0ef2c3e3a5f"; 
					    byte[] keyValue = keys.getBytes();
						Key key = new SecretKeySpec(keyValue, "AES");
						Cipher c = Cipher.getInstance("AES");
						c.init(Cipher.ENCRYPT_MODE, key);
						String etname = new String(Base64.encode(tname.getBytes()));
						String euse = new String(Base64.encode(use.getBytes()));
						String ecolor = new String(Base64.encode(color.getBytes()));
						String edes = new String(Base64.encode(des.getBytes()));
			 			
						PreparedStatement ps=connection.prepareStatement("insert into images(username,grp,imgname,tagname,uses,color,description,dt,image,rank) values(?,?,?,?,?,?,?,?,?,?)");
						
						ps.setString(1,user);
						ps.setString(2,grp);
						ps.setString(3,imgname);
						ps.setString(4,etname);
						ps.setString(5,euse);
						ps.setString(6,ecolor);
						ps.setString(7,edes);
						ps.setString(8,dt);
						ps.setBinaryStream(9, (InputStream)fs, (int)(file1.length()));	
						ps.setInt(10,rank);
						int x=ps.executeUpdate();
						if(x>0)
						{
							
							String msg="Image added Successfully";
							application.setAttribute("msg",msg);
							response.sendRedirect("addimages.jsp");
							
					   }
		}
					catch (Exception e) 
					{
						out.println(e.getMessage());
						e.printStackTrace();
					}
				%>
