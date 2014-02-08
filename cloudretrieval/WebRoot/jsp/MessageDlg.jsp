<%@ page contentType="text/html;charset=GBK" isErrorPage="false" %>
<%
	String msg= request.getParameter("msg");
%>
<html>
<head>
	<title></title>
</head>
</html>
<body onload="out()">

<script>
function out()
{
 	document.getElementById("d_msg").innerHTML = "<%=msg%>";

}
</script>

<%--=msg--%>
<div id="d_msg" name="d_msg">d</div>
</body>