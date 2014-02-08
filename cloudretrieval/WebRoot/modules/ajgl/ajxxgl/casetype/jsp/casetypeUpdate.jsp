<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page import="modules.base.*"%>
<%
    String thisPath=request.getContextPath();
	baseForm bform=(baseForm)request.getSession().getAttribute("baseuser");
	
	String user_dept=bform.locationId;
	String type = (String)request.getSession().getAttribute("case_type");
%>
<html>
<script language="javascript">
    var args = window.dialogArguments;
</script>
<head>
  <title><bean:message key="casetype.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/casetypeBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar.js"></script>
   <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
  <script type="text/javascript" src="<%=thisPath%>/scripts/validateForm.js"></script>
  
</head>

<body>

<div class=cardbody >

<form id="case_form">

<table width=100% cellSpacing=1 cellPadding=0 class="tablestyle">

  <tr>
    <td class=tablebodyhead width=150px><bean:message key="casetype.label.name" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="name" name="name"  size=20 maxlength=40  isValidate="true" notEmpty="true" />
    </td>
  </tr>
  
</table>

<script language="javascript">

    dwr.engine.setAsync(false);

    casetypeBean.beforUpdateCasetype(parseInt(args.rowID),
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
        
            colElements=rowElements[0].split("</C>");

          	document.forms[0].name.value = colElements[0];
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
                alert("连接超时，系统自动退出。");
                window.open("<%=thisPath%>/logoffAction.do?"+new Date(),"_parent");
            }
        }
    });
    dwr.engine.setAsync(true);
</script>
</form>

<button name="button" onClick="forSure()" class="button"><bean:message key="button.label.submit" bundle="${language}"/></button>
<button name="button" onClick="forAbort()" class="button"><bean:message key="button.label.cancel" bundle="${language}"/></button>

</div>
<script language="JavaScript">    

function forSure()    
{
   if(!$("#case_form").validateForm()){
		return;
   }
    var i = 0;
    var updateString = new Array();
    
    var name=document.forms[0].name.value;
    
    updateString[i++] = "name='"+document.forms[0].name.value+"'";
    
	
	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/><bean:message key="button.modify" bundle="${language}"/>?"))	
        return false;
	
    window.returnValue = updateString.toString()+"|no</C>"+name+"</C>";
    window.close();    
} 



function forAbort()    
{         
    window.close();    
} 
</script> 

</body>

</html>
