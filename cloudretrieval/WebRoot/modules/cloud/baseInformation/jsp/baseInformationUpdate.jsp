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
  <title><bean:message key="button.modify" bundle="${language}"/><bean:message key="parameters.title" bundle="${language}"/></title>
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
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseInformationBean.js"></script>
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
    <td class=tablebodyhead width=150px><bean:message key="parameters.columns.userName" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_defaultAuthName" name="defaultAuthName"  size=20 maxlength=40 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="parameters.columns.password" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_defaultAuthPwd" name="defaultAuthPwd"  size=20 maxlength=40 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="parameters.columns.soapPath" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_defaultSoapUrl" name="defaultSoapUrl"  size=45 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="parameters.columns.priority" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_defaultTaskpriority" name="defaultTaskpriority"  size=20 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="parameters.columns.uploadPath" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_uploadurl" name="uploadurl"  size=45 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="parameters.columns.uploadFlash" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_uploadflash" name="uploadflash"  size=45 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="parameters.columns.uploadServer" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_uploadServer" name="uploadServer"  size=45 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="parameters.columns.uploadRootDirectory" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_uploadroot" name="uploadroot"  size=45 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="parameters.columns.uploadDefaultPath" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_defaultuploadpath" name="defaultuploadpath"  size=45 maxlength=40 >
    </td>
  </tr>
  <!--<tr>
    <td class=tablebodyhead>Ê¹ÄÜ</td>
    <td class=tablebody>
      <input type="text" id="i_work" name="work"  size=45 maxlength=40 >
    </td>
  </tr> 
  
--></table>

<script language="javascript">

    dwr.engine.setAsync(false);

    baseInformationBean.beforeUpdateTSBaseInfo(parseInt(args.rowID),
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
        
            colElements=rowElements[0].split("</C>");

         // document.forms[0].id.locationId = colElements[0];
          
            document.forms[0].defaultAuthName.value = colElements[1];
            document.forms[0].defaultAuthPwd.value = colElements[2];
            document.forms[0].defaultSoapUrl.value = colElements[3];
            document.forms[0].defaultTaskpriority.value = colElements[4];
            document.forms[0].uploadurl.value = colElements[5];
            document.forms[0].uploadflash.value = colElements[6];
            document.forms[0].uploadServer.value = colElements[7];
            document.forms[0].uploadroot.value = colElements[8];
            document.forms[0].defaultuploadpath.value = colElements[9];
     //       document.forms[0].work.value = colElements[10];
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
    var updateString = new Array();
    var defaultAuthName=document.forms[0].defaultAuthName.value;
    var defaultAuthPwd=document.forms[0].defaultAuthPwd.value;
    var defaultSoapUrl=document.forms[0].defaultSoapUrl.value;
    var defaultTaskpriority=document.forms[0].defaultTaskpriority.value;
    var uploadurl=document.forms[0].uploadurl.value;
    var uploadflash=document.forms[0].uploadflash.value;
    var uploadServer=document.forms[0].uploadServer.value;
   
    var uploadroot=document.forms[0].uploadroot.value;
    var defaultuploadpath = document.forms[0].defaultuploadpath.value;
 //   var work = document.forms[0].work.value;
    
    updateString[i++] = "defaultAuthName='"+document.forms[0].defaultAuthName.value+"'";
    updateString[i++] = "defaultAuthPwd='"+document.forms[0].defaultAuthPwd.value+"'";
    updateString[i++] = "defaultSoapUrl='"+document.forms[0].defaultSoapUrl.value+"'";
    updateString[i++] = "defaultTaskpriority='"+document.forms[0].defaultTaskpriority.value+"'";
    updateString[i++] = "uploadurl='"+document.forms[0].uploadurl.value+"'";
    updateString[i++] = "uploadflash='"+document.forms[0].uploadflash.value+"'";
    updateString[i++] = "uploadServer='"+uploadServer+"'";
    updateString[i++] = "uploadroot='"+document.forms[0].uploadroot.value+"'";
    updateString[i++] = "defaultuploadpath='"+document.forms[0].defaultuploadpath.value+"'";
//    updateString[i++] = "work='"+document.forms[0].work.value+"'";
    
    

	

	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/> <bean:message key="button.modify" bundle="${language}"/>?"))
        return false;
	window.returnValue = updateString.toString()+"|no</C>"+defaultAuthName+"</C>"+defaultAuthPwd+"</C>"+defaultSoapUrl+"</C>"+defaultTaskpriority+"</C>"+uploadurl+"</C>"+uploadflash+"</C>"+uploadServer+"</C>"+uploadroot+"</C>"+defaultuploadpath+"</C>";
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
