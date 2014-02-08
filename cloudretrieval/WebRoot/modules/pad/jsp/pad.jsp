<%@ page language="java" contentType="text/html;charset=GBK" isErrorPage="false"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%@ page import="modules.base.*"%>
<HTML>
<% 
    String thisPath=request.getContextPath();
    String qx=request.getParameter("qx");
	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
	String role_code = bform.role_code;
	System.out.println(role_code);
%>



 	<HEAD>
  <title>pad PAGE</title>
    <base target="_self"/>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="css/base.css" type="text/css">
  <LINK href="<%=thisPath%>/modules/pad/css/base.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="Skin.css">
	
	 <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/tools.js"></script>

  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/padBean.js"></script>
    <script type="text/javascript" src="<%=thisPath%>/dwr/interface/rwglxxBean.js"></script>
  <SCRIPT src="<%=thisPath%>/table_view/jquery.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/jquery-ui-1.7.2.custom.min.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/SortView.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/PagerView.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/TableView.js" type=text/javascript></SCRIPT>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_wait_plugin/hx_wait_plugin.js"></script>
  <SCRIPT src="<%=thisPath%>/table_view/SelectorView.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/common.js" type=text/javascript></SCRIPT>
  <script language="javascript" src="<%=thisPath%>/modules/pad/script/padScript.js"></script>
  
</HEAD>

<body topmargin="0" leftmargin="0" bgcolor="#EEF5F2">

<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<input id="role_code_id" type="hidden" value="<%=bform.role_code%>"/>

<table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td  background="<%=thisPath%>/modules/pad/image/bg_top.gif">
    	<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
	        <tr>
	          <td width="20"><img src="<%=thisPath%>/modules/pad/image/icon1.gif" width="18" height="16"></td>
	          <td width="915">欢迎使用</td>
	        </tr>
      	</table></td>
  </tr>
</table>

<!-- 右侧栏目 -->
<div>
<table width="100%"  height="90%"  align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td rowspan="8" width="85%"  ><div align="center"  id="xxxs" style="border-right:1px dashed #000;height:100%;">sadfasdfaadf</div></td>
    <td><div align="center"><a href="javascript:forxtts()"><img src='<%=thisPath%>/modules/pad/image/png133_084.bmp'  width="80" height="80"></a></div></td>
  </tr>
  
  <tr> 
    <td><div align="center"><a href="javascript:forxtts()">系统信息提示</a></div></td>
  </tr>
  <tr> 
    <td><div align="center"><a href="javascript:forxj()"><img src='<%=thisPath%>/modules/pad/image/png133_023.bmp'  width="80" height="80"></a></div></td>
  </tr>
  <tr> 
     <td><div align="center"><a href="javascript:forxj()">其他情况</a></div></td>
  </tr>
  
  
</table>
</div>

<script type="text/javascript">
forxtts();

</script>

</body>

</HTML>
