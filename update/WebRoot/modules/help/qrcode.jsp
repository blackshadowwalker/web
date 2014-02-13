<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>QRCode Help</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<h1> QR Code Help</h1>
    <pre>
 * Input :  text logo
 * Output : QR Coded Image Stream
 * e.g:
 *  <a href ="<%=basePath%>qrservlet?text=http://www.baidu.com"><%=basePath%>qrservlet?text=http://www.baidu.com</a>
 *  <a href ="<%=basePath%>qrservlet?text=http://www.baidu.com&logo=http://www.baidu.com/img/bdlogo.gif"><%=basePath%>qrservlet?text=http://www.baidu.com&logo=http://www.baidu.com/img/bdlogo.gif</a>

    </pre>
  </body>
</html>
