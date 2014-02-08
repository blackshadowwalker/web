<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<%@ page import="javax.sql.DataSource"%>

<html>
<%
    String thisPath=request.getContextPath();
	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
	String language = bform.language;
	String user_dept=bform.dept_code;
	String role_code = bform.role_code;
%>

<script language="javascript">
    var args = window.dialogArguments;
</script>

<head>
  <title><bean:message key="button.modify" bundle="${language}"/><bean:message key="filemgr.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">  
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/fileMgrBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
  <script language="javascript" type="text/javascript" src="<%=thisPath%>/modules/base/scripts/My97DatePicker/WdatePicker.js"></script>
</head>

<body>

<div class=cardbody>

<form>

<table width=100% cellSpacing=1 cellPadding=0 class="tablestyle">
  <tr>
    <td class=tablebodyhead><bean:message key="filemgr.columns.id" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_id" name="id"  size=20 maxlength=100  disabled="disabled" >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="filemgr.columns.fileName" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_name" name="name"  size=20 maxlength=100  >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="filemgr.columns.phyName" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_valueName" name="valueName"  size=20 maxlength=20 disabled="disabled" >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="filemgr.columns.directory" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_path" name="path"  size=20 maxlength=20 disabled="disabled" >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="filemgr.columns.server" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_urlpath" name="urlpath"  size=20 maxlength=200 disabled="disabled" >
    </td>
  </tr>
  <tr>
  	<!-- 绝对时间 -->
    <td class=tablebodyhead><bean:message key="filemgr.columns.absTime" bundle="${language}"/></td>
    <td class=tablebody>
    	<input type="text" id="i_abstime" name="abstime"  size=20 maxlength=20 class="Wdate" onClick="WdatePicker()" disabled="disabled" >
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="filemgr.columns.location" bundle="${language}"/></td>
    <td class=tablebody>
       <input type="text" id="i_location" name="location"  size=20 maxlength=50 disabled="disabled"  >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="filemgr.columns.uploader" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_uploader" name="uploader"  size=20 maxlength=20 disabled="disabled" >
    </td>
  </tr>
   <tr>
    <td class=tablebodyhead><bean:message key="filemgr.columns.uploadTime" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_cttime" name="cttime"  size=20 maxlength=20 class="Wdate" onClick="WdatePicker()" disabled="disabled" >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="filemgr.columns.beAnalyed" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_banalyzed" name="banalyzed"  size=20 maxlength=20 disabled="disabled" >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="filemgr.columns.analyer" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_analyzer" name="analyzer"  size=20 maxlength=20 disabled="disabled" >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="filemgr.columns.analyTime" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_analyzetime" name="analyzetime"  size=20 maxlength=20 disabled="disabled" >
    </td>
  </tr>
  
</table>

<script language="javascript">

    dwr.engine.setAsync(false);

    fileMgrBean.beforeUpdateFile(parseInt(args.rowID),
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
        
            colElements=rowElements[0].split("</C>");

            document.forms[0].id.value = colElements[0];
            document.forms[0].name.value = colElements[1];
            document.forms[0].valueName.value = colElements[2];
            document.forms[0].path.value= colElements[3]
            document.forms[0].urlpath.value = colElements[4];
            document.forms[0].abstime.value = colElements[5];
            document.forms[0].location.value = colElements[6];
            document.forms[0].uploader.value = colElements[7];
            document.forms[0].cttime.value = colElements[8];
            document.forms[0].banalyzed.value = colElements[9];
            document.forms[0].analyzer.value = colElements[10];
            document.forms[0].analyzetime.value = colElements[11];
        },
        exceptionHandler:function(err_info)
        {
            if (err_info!="")
            {
                alert(err_info);
                window.open("<%=thisPath%>/logoffAction.do?"+new Date(),"_parent");
            }
            else
            {
                alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
                window.open("<%=thisPath%>/logoffAction.do?"+new Date(),"_parent");
            }
        }
    });
    dwr.engine.setAsync(true);
</script>

</form>

<button name="button" onClick="forSure()" class="button"><bean:message key="button.submit" bundle="${language}"/></button>
<button name="button" onClick="forAbort()" class="button"><bean:message key="button.cancel" bundle="${language}"/></button>

</div>

<script language="JavaScript">    

function forSure()    
{
    var i = 0;
    var updateString = new Array();
    var tmp = "|"+args.rowID+"</C>";

    tmp += document.forms[0].name.value+"</C>";
    updateString[i++] = "name='"+document.forms[0].name.value+"'";
    
	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/> <bean:message key="button.modify" bundle="${language}"/>?"))
        return false;
        
    window.returnValue = updateString.toString()+tmp;
    window.close();    
} 

function forAbort()    
{         
    window.close();    
} 
function forDeptTree(test,type,hidden)
{
    var dept = "37015oooo";
	
    var srcFile = '<%=thisPath%>'+"/modules/base/jsp/deptree.jsp?jgbm="+'<%=user_dept%>'+"&type="+type;
    


    var winFeatures = "dialogHeight:600px;dialogWidth:450px;help:no;status:no";

    inArray = window.showModalDialog(srcFile, hidden.value, winFeatures);
	
	if (typeof(inArray) == "undefined"||inArray == "")
	{
     	//test.value = "";
     }
	else //如果另外指定了机构则下拉列表显示该机构的人员姓名
	{
		hidden.value=inArray+"</R>";
		test.value = inArray.split("</C>")[1];
		document.forms[0].dept_name.value = inArray.split("</C>")[2];
		
	}
}
   
</script> 

</body>

</html>
