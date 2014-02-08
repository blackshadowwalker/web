<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<html>

<%
    String thisPath=request.getContextPath();

%>

<script language="javascript">
    var args = window.dialogArguments;
</script>

<head>
  <title><bean:message key="filemgr.caseDistribution" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">  
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/fileMgrBean.js"></script>
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
    <td class=tablebodyhead><bean:message key="filemgr.caseDistribution" bundle="${language}"/></td>
    <td class=tablebody>
      <select id="i_case" name="caseName"  >
        <option value=' '>ÇëÑ¡Ôñ°¸¼þ......</option>
		
	</select>
    </td>
  </tr>
  
</table>



</form>

<button name="button" onClick="forSure()" class="button"><bean:message key="button.submit" bundle="${language}"/></button>
<button name="button" onClick="forAbort()" class="button"><bean:message key="button.cancel" bundle="${language}"/></button>

</div>

<script type="text/javascript">

dwr.engine.setAsync(false);

fileMgrBean.getCase(
		 {
		     callback:function(data)
		     {
		         if(data!="" && data!="no")
		         {
		         	var dataElems=data.split("</R>");
		         	var _server=$("#i_case")[0];
		         	for(var i=0;i<dataElems.length-1;i++){
		         		var colElems=dataElems[i].split("</C>");
		         		_server.options[i+1] = new Option(colElems[0], colElems[1]);
		         		
		         	}
		         }
		         else{
		         	
		        	 alert("<bean:message key="msg.error.dataEmputy" bundle="${language}"/>");
		         }
		     },
		     exceptionHandler:function(err_info)
		     {
		         
		         stop_scrollbar(timer,"");
		
		         if (err_info!="")
		         {
		             alert(err_info);
		             if(err_info.indexOf("<bean:message key="msg.error.error" bundle="${language}"/>")<0){
		             	window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
		             }
		         }
		         else
		         {
		        	 alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
		             window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
		         }    
		     }
		 });
 dwr.engine.setAsync(true);

</script>
<script type="text/javascript">    
 
function forSure()    
{
    var tmp = " ";
    

    tmp = document.forms[0].caseName.value;
    
    
	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/><bean:message key="msg.areYouSure" bundle="${language}"/>?"))
        return false;
        
    window.returnValue = tmp;
    window.close();    
} 

function forAbort()    
{         
    window.close();    
} 

</script> 

</body>

</html>
