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
  <title><bean:message key="button.modify" bundle="${language}"/><bean:message key="basedata.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/codeBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
</head>

<body>

<div class=cardbody>

<form>

<table width=100% cellSpacing=1 cellPadding=0 class="tablestyle">

  <tr>
    <td class=tablebodyhead width=150px><bean:message key="basedata.label.codetype" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_type" name="type"  size=20 maxlength=40 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="basedata.label.codevalue" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_code" name="code"  size=20 maxlength=40 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="basedata.label.codetext" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_value" name="value"  size=20 maxlength=80 >
    </td>
  </tr>
  
  <tr>
    <td class=tablebodyhead><bean:message key="basedata.label.comment" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_content" name="content" size=20 maxlength=40 value="">
    </td>
  </tr>

</table>

<script language="javascript">

    dwr.engine.setAsync(false);

    codeBean.beforeUpdateTSCode(parseInt(args.rowID),
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
        
            colElements=rowElements[0].split("</C>");

            //document.forms[0].id.value = colElements[0];
            document.forms[0].type.value = colElements[1];
            document.forms[0].code.value = colElements[2];
            document.forms[0].value.value = colElements[3];
            document.forms[0].content.value = colElements[4];

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
<button name="button" onClick="forAbort()" class="button"><bean:message key="button.label.cancel" bundle="${language}"/></button>

</div>

<script language="JavaScript">    

function forSure()    
{
    var i = 0;
    var updateString = new Array();
    
    var type=document.forms[0].type.value;
    
    var code=document.forms[0].code.value;
    
    var value=document.forms[0].value.value;    

    updateString[i++] = "type='"+document.forms[0].type.value+"'";
    updateString[i++] = "code='"+document.forms[0].code.value+"'";
    updateString[i++] = "value='"+document.forms[0].value.value+"'";
    updateString[i++] = "content='"+document.forms[0].content.value+"'";
	
	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/><bean:message key="button.modify" bundle="${language}"/>?"))
        return false;
	
    window.returnValue = updateString.toString()+"|no</C>"+type+"</C>"+code+"</C>"+value+"</C>";
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
