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
  <title>����˵������</title>
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


<!-- ���Ӵ�����Ϣ -->

<div id=padcontent1 >




<form>

<div>

<table class=tablestyle width="100%" height='100%'>

  <tr>
    <td class=tablebody>����˵����</td>
    <td class=tablebody>
     <a href='<%=thisPath %>/download?fileName=�������н��������������ϵͳ�û��ֲ�.doc&dir=xtxz' target='_blank'>�������н��������������ϵͳ�û��ֲ�.doc</a>
    </td>
  </tr>
  

</table>
</div>

<!-- ���������ť -->


</form>

</div>
</div>

<script language="javascript">
  /**  
    getQX('<%=qx%>','<%=thisPath%>',[
    	{
    		optMark:"S",//�ύ����
    		elemId:"submit_id",//����������Ԫ��ID
    		type:"disabled",//Ԫ����������(hide��disabled)
    		objSource:"page"//Ԫ��������Χ(Ŀǰ��page--ҳ���tableObj--���ؼ�)
    	},
    	{
    		optMark:"R",//���ò���
    		elemId:"reset_id",//����������Ԫ��ID
    		type:"disabled",//Ԫ����������(hide��disabled)
    		objSource:"page"//Ԫ��������Χ(Ŀǰ��page--ҳ���tableObj--���ؼ�)
    	}
    ]);
**/    
</script>
</body>
</html>
