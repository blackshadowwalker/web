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

<head>
  <title><bean:message key="parameters.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseInformationBean.js"></script>

</head>

<body>

<div class=cardbody>

  <table width=100% cellSpacing=1 cellPadding=0 class="tablestyle">

<script>
	var img="";
    var rowID = window.dialogArguments;

    dwr.engine.setAsync(false);

    baseInformationBean.detailTSBaseInfo(rowID,
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
        
            colElements=rowElements[0].split("</C>");
            document.write("<tr><td class=tablebodyhead width=70px><bean:message key="parameters.columns.userName" bundle="${language}"/></td>");
            document.write("<td class=tablebody>"+colElements[1]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=70px><bean:message key="parameters.columns.password" bundle="${language}"/></td>");
            document.write("<td class=tablebody>"+colElements[2]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=70px><bean:message key="parameters.columns.soapPath" bundle="${language}"/></td>");
            document.write("<td class=tablebody>"+colElements[3]+"</td></tr>");
           	document.write("<tr><td class=tablebodyhead width=70px><bean:message key="parameters.columns.priority" bundle="${language}"/></td>");
            document.write("<td class=tablebody>"+colElements[4]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="parameters.columns.uploadPath" bundle="${language}"/></td>");
            document.write("<td class=tablebody>"+colElements[5]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="parameters.columns.uploadFlash" bundle="${language}"/>FLASH</td>");
            document.write("<td class=tablebody>"+colElements[6]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=70px><bean:message key="parameters.columns.uploadServer" bundle="${language}"/></td>");
            document.write("<td class=tablebody>"+colElements[7]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="parameters.columns.uploadRootDirectory" bundle="${language}"/></td>");
            document.write("<td class=tablebody>"+colElements[8]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="parameters.columns.uploadDefaultPath" bundle="${language}"/></td>");
            document.write("<td class=tablebody>"+colElements[9]+"</td></tr>");
        //    document.write("<tr><td class=tablebodyhead width=150px>ʹ��</td>");
        //    document.write("<td class=tablebody>"+colElements[10]+"</td></tr>");

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

  </table>

<button name="button" onClick="forAbort()" class="button"><bean:message key="button.label.close" bundle="${language}"/></button>

</div>
<script language="JavaScript">  
function forAbort()    
{         
    window.close(); 
} 

</script> 

</body>

</html>
