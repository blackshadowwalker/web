<%@ page language="java" contentType="text/html;charset=GBK" %>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page import="modules.base.*"%>

<% 
    String thisPath=request.getContextPath();
    String qx=request.getParameter("qx");
    baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
%>

<html>

<head>
  <title>操作说明下载</title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
  
    <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/jcxx/mmxg/script/mmxgScript.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/mmxgBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
</head>

<body onload="" topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">

<div >


<!-- 增加代码信息 -->

<div id=padcontent1 >




<form>

<div>

<table class=tablestyle width="100%" height='100%'>

  <tr>
    <td class=tablebody>操作说明：</td>
    <td class=tablebody>
     <a href='<%=thisPath %>/download?fileName=济南市中交警大队社区管理系统用户手册.doc&dir=xtxz' target='_blank'>济南市中交警大队社区管理系统用户手册.doc</a>
    </td>
  </tr>
  

</table>
</div>

<!-- 插入操作按钮 -->


</form>

</div>
</div>

<script language="javascript">
  /**  
    getQX('<%=qx%>','<%=thisPath%>',[
    	{
    		optMark:"S",//提交操作
    		elemId:"submit_id",//操作所关联元素ID
    		type:"disabled",//元素屏蔽类型(hide或disabled)
    		objSource:"page"//元素所属范围(目前：page--页面或tableObj--表格控件)
    	},
    	{
    		optMark:"R",//重置操作
    		elemId:"reset_id",//操作所关联元素ID
    		type:"disabled",//元素屏蔽类型(hide或disabled)
    		objSource:"page"//元素所属范围(目前：page--页面或tableObj--表格控件)
    	}
    ]);
**/    
</script>
</body>
</html>
