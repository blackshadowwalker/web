<%@ page language="java" import="java.util.*" import="com.bean.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//UserInfo userInfo=(UserInfo)request.getSession().getAttribute("user");
//if(userInfo!=null) System.out.println("1234567890-="+userInfo.getUserName());
//String name=userInfo.getUserName();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title></title>
  <meta http-equiv="refresh" content="3;url=<%=basePath %>" />   
</head>



<body>
	<h1>出错了</h1>	
</body>

</html>
