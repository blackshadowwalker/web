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
  <title><bean:message key="casemgr.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/casemanageBean.js"></script>
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
    <td class=tablebodyhead width=150px><bean:message key="casemgr.label.caseName" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="caseName" name="caseName"  size=20 maxlength=40  isValidate="true" notEmpty="true" />
    </td>
  </tr>
  
  <tr>
    <td class=tablebodyhead width=150px><bean:message key="casemgr.label.caseType" bundle="${language}"/></td>
    <td class=tablebody>
      <select  id="caseType" name="caseType" style=width:152px;  isValidate="true" notEmpty="true" >
      		<option value="">请选择...</option>
      </select>
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="casemgr.label.caseNo" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="caseNo" name="caseNo"  size=20 maxlength=40  disabled />
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="casemgr.label.receiptNo" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="receiptNo" name="receiptNo"  size=20 maxlength=80  isValidate="true" notEmpty="true" />
    </td>
  </tr>
  
  <tr>
    <td class=tablebodyhead><bean:message key="casemgr.label.creator" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="auser" name="auser" size=20 maxlength=40 value="" disabled />
    </td>
  </tr>
 
 <tr>
    <td class=tablebodyhead><bean:message key="casemgr.label.department" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="department" name="department" size=20 maxlength=40 value=""  isValidate="true" notEmpty="true" />
    </td>
  </tr>
  
  <tr>
    <td class=tablebodyhead><bean:message key="casemgr.label.caseTime" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="caseTime" name="caseTime" size=20 maxlength=40 value=""  isValidate="true" notEmpty="true" disabled />
    </td>
  </tr>
  
  <tr>
    <td class=tablebodyhead><bean:message key="casemgr.label.caseStatus" bundle="${language}"/></td>
    <td class=tablebody>
      <select  id="caseStatus" name="caseStatus" style="width:152px;"  isValidate="true" notEmpty="true" >
      		<option value="">请选择</option>
      		<option value="0">未侦破</option>
      		<option value="1">已侦破</option>
      </select>
    </td>
  </tr>
  
  <tr>
    <td class=tablebodyhead><bean:message key="casemgr.label.area" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="area" name="area" size=20 maxlength=40 value=""  isValidate="true" notEmpty="true" />
    </td>
  </tr>
  
  <tr>
    <td class=tablebodyhead><bean:message key="casemgr.label.location" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="location" name="location" size=20 maxlength=40 value=""  isValidate="true" notEmpty="true" />
    </td>
  </tr>
  
  <tr>
    <td class=tablebodyhead><bean:message key="casemgr.label.videos" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="video" name="video" size=20 maxlength=40 value=""  isValidate="true" readonly onclick="add_video();" />
    </td>
  </tr>
 
</table>

<script language="javascript">




	var type="<%=type %>";
	var select = document.getElementById("caseType");
	var ctype=type.split("</R>");
	for(var m=0;m<ctype.length-1;m++){
		select.options[m+1]=new Option(ctype[m].split("</C>")[1],ctype[m].split("</C>")[0]);
	}


    dwr.engine.setAsync(false);

    casemanageBean.beforUpdateCase(parseInt(args.rowID),
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
        
            colElements=rowElements[0].split("</C>");

          	document.forms[0].caseName.value = colElements[0];
            document.forms[0].caseType.value = colElements[1];
            document.forms[0].caseNo.value = colElements[2];
            document.forms[0].receiptNo.value = colElements[3];
            document.forms[0].auser.value = colElements[4];
            document.forms[0].department.value = colElements[5];
            document.forms[0].caseTime.value = colElements[6];
            document.forms[0].caseStatus.value = colElements[7];
            document.forms[0].area.value = colElements[8];
            document.forms[0].location.value = colElements[9];
            document.forms[0].video.value = colElements[10];
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
    
    function add_video(){
		var srcFile = "videochoose.jsp";
		var winFeatures = "dialogHeight:325px;dialogWidth:700px;help:no;status:no";
		var videos=$("#video").val()+"</C>"+args.rowID;
		var backdata = window.showModalDialog(srcFile, videos , winFeatures);
		if (backdata != null) {
			$("#video").val(backdata);
		}
	}
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
    
    var caseName=document.forms[0].caseName.value;
    
    var caseType=document.forms[0].caseType.options[document.forms[0].caseType.selectedIndex].text;
    
    var caseNo=document.forms[0].caseNo.value;
    
    var receiptNo=document.forms[0].receiptNo.value;
    
    var auser=document.forms[0].auser.value;

    var department=document.forms[0].department.value;
    
    var caseTime=document.forms[0].caseTime.value;
    
    var caseStatus=document.forms[0].caseStatus.options[document.forms[0].caseStatus.selectedIndex].text;
    
    var area=document.forms[0].area.value;

    var location=document.forms[0].location.value;
    
    var video=document.forms[0].video.value;
    
    updateString[i++] = "caseName='"+document.forms[0].caseName.value+"'";
    updateString[i++] = "caseType='"+document.forms[0].caseType.value+"'";
    
    updateString[i++] = "caseNo='"+document.forms[0].caseNo.value+"'";
    updateString[i++] = "receiptNo='"+document.forms[0].receiptNo.value+"'";
    updateString[i++] = "auser='"+document.forms[0].auser.value+"'";
    updateString[i++] = "department='"+document.forms[0].department.value+"'";
    updateString[i++] = "caseTime='"+document.forms[0].caseTime.value+"'";
    updateString[i++] = "caseStatus='"+document.forms[0].caseStatus.value+"'";
    
    updateString[i++] = "area='"+document.forms[0].area.value+"'";
    updateString[i++] = "location='"+document.forms[0].location.value+"'";
	
	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/><bean:message key="button.modify" bundle="${language}"/>?"))	
        return false;
	
    window.returnValue = updateString.toString()+"</C>"+video+"</C>"+caseNo+"|no</C>"+caseName+"</C>"+caseType+"</C>"+caseNo+"</C>"+receiptNo+"</C>"+auser+"</C>"+department+"</C>"
    +caseTime+"</C>"+caseStatus+"</C>"+area+"</C>"+location+"</C>";
    window.close();    
} 



function forAbort()    
{         
    window.close();    
} 
</script> 

</body>

</html>
