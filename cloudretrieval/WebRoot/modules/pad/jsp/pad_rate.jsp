<%@ page language="java" contentType="text/html;charset=GBK" isErrorPage="false"%>

<HTML>

<%
    String thisPath=request.getContextPath();
	
	String dept_code=request.getParameter("dept");
	
	String type=request.getParameter("type");
%>


<HEAD>
  <title>检查问题率</title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="css/base.css" type="text/css">
  <LINK href="<%=thisPath%>/modules/base/css/base.css" rel=stylesheet type=text/css>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/tools.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/swfobject.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/pad/script/padScript.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/padBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  
  <style>
  	
  	a:link {
	   color:#0000FF;
	   text-decoration:none;
	   }
	   a:visited {
	   color:#0000FF;
	   text-decoration:none;
	   }
	   a:hover {
	   color:#FF6600;
	   text-decoration:underline;
	   }
    
  </style>
</HEAD>

<body topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">

<br>
<br>
<table><tr>
<td align="left">&nbsp;&nbsp;<a href="javascript:history.back();"><b>返回</b></a></td>
</tr></table>

<div id="mon_div">
	<table id='mon_t_id' style='width:100%;border: #ACA899 solid 1px;cellspacing:0px;cellpadding:0px;'></table>
</div>

</body>

<script>
	getJKZB_mon('<%=dept_code%>','<%=type%>','<%=thisPath%>');
</script>

</HTML>
