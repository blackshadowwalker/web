<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>

<%
    String thisPath=request.getContextPath();
%>

<script language="javascript">
    var args = window.dialogArguments;
</script>

<head>
  <title><bean:message key="button.modify" bundle="${language}"/><bean:message key="task.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/jquery.hx_table.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/taskMgrBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/cn_utf8.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/scripts/validateForm.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
</head>

<body>

<div class=cardbody>

<form id="nvr_form">

<table width=100% cellSpacing=1 cellPadding=0 class="tablestyle">

  <tr>
    <td class=tablebodyhead width=150px><bean:message key="task.columns.taskNumbe" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_taskID" name="taskID" readonly="true" disabled size=20 maxlength=40 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="task.columns.taskName" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_taskName" name="taskName"   size=20 maxlength=40 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="task.columns.taskStatus" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_state" name="state" readonly="true" disabled  size=20 maxlength=40 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="task.columns.locationName" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_locationId" name="locationId" readonly="true"  disabled size=20 maxlength=40 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="task.columns.input" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_inputVideoId" name="inputVideoId" readonly="true" disabled size=20 maxlength=40 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="task.columns.founder" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_creator" name="creator" readonly="true"  disabled size=20 maxlength=40 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="task.columns.creationTime" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_ctTime" name="ctTime" readonly="true" disabled size=20 maxlength=40 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="task.columns.lastUpdateTime" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_lastUpdateTime" name="lastUpdateTime" readonly="true" disabled  size=20 maxlength=40 >
    </td>
  </tr>
</table>

<script language="javascript">

    dwr.engine.setAsync(false);

    taskMgrBean.beforeUpdateTask(parseInt(args.rowID),
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
        
            colElements=rowElements[0].split("</C>");

         // document.forms[0].id.locationId = colElements[0];
          
            document.forms[0].taskID.value = colElements[1];
            document.forms[0].taskName.value = colElements[2];
            document.forms[0].state.value = colElements[3];
            document.forms[0].locationId.value = colElements[4];
            document.forms[0].inputVideoId.value = colElements[5];
            document.forms[0].creator.value = colElements[6];
            document.forms[0].ctTime.value = colElements[7];
            document.forms[0].lastUpdateTime.value = colElements[8];
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

<button name="button" onClick="forSure()" class="button"><bean:message key="button.label.submit" bundle="${language}"/></button>
<button name="button" onClick="forAbort()" class="button"><bean:message key="button.label.close" bundle="${language}"/></button>

</div>

<script language="JavaScript">    

function forSure()    
{
    if(!$("#nvr_form").validateForm()){
		return;
   }
    
 
    var i = 0;
    var ps="<input type='checkbox' name='checkList'>";
    var updateString = new Array();
    var taskID=document.forms[0].taskID.value;
    var taskName=document.forms[0].taskName.value;
    var state=document.forms[0].state.value;
    var locationId=document.forms[0].locationId.value;
    var inputVideoId=document.forms[0].inputVideoId.value;
    var creator=document.forms[0].creator.value;
    var ctTime=document.forms[0].ctTime.value;
    var lastUpdateTime=document.forms[0].lastUpdateTime.value;
    
    
    updateString[i++] = "taskName='"+document.forms[0].taskName.value+"'";
    
    

	
    if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/> <bean:message key="button.modify" bundle="${language}"/>?"))
        return false;
	
    window.returnValue = updateString.toString()+"|no</C>"+ps+"</C>"+taskID+"</C>"+taskName+"</C>"+state+"</C>"+locationId+"</C>"+inputVideoId+"</C>"+creator+"</C>"+ctTime+"</C>"+lastUpdateTime+"</C>";
    window.close();    
} 

function forAbort()    
{         
    window.close();    
} 

function forPrint()    
{         
    window.print();
} 

</script> 

</body>

</html>
