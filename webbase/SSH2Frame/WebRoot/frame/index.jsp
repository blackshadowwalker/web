<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="shortcut icon" href="<%=basePath%>images/logo.ico" type="image/x-icon" />
    <title>电子警察综合管理平台</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <frameset rows="64,*"  frameborder="NO" border="0" framespacing="0">
	  <frame src="frame/admin_top.jsp" noresize="noresize" frameborder="0" name="topFrame" scrolling="no" marginwidth="0" marginheight="0" />
	  <frameset cols="182,*"  rows="560,*" id="frame">
		<frame src="frame/admin_left.jsp" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" />
		<frame src="frame/admin_right.jsp" name="main" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto" />
	  </frameset>
  </frameset>
  <noframes>
  <body></body>
    </noframes>
</html>
