<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function isNo(){
			var v=document.getElementById("nvrId").value;
			if(isNaN(v) || v=="" ||v==null){
				alert("please input a number!");
				return;
			}else{
				document.getElementById("myForm").submit();
			}
		}
	</script>
  </head>
  
  <body>
		<s:iterator value="list" id="l" status="st">
			<s:property value="#st.count"/>
			<s:property value="#l.id"/>
			<s:property value="#l.nvrName" />
		</s:iterator>
		<form id="myForm" action="TestAction?method=getById" method="post">
			<input id="nvrId" type="text" name="nvr.id">
			<input type="button" value="submit" onclick="isNo();"/>
			
		</form>
  </body>
</html>
