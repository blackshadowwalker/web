<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>

<%
    String thisPath=request.getContextPath();
    String rowID = request.getParameter("rowID");
%>

<head>
  <title><bean:message key="user.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/userlogBean.js"></script>

</head>

<body>

<div class=cardbody>

  <table width=100% cellSpacing=1 cellPadding=0 class="tablestyle">

<script>
    var rowID = window.dialogArguments;
    if(rowID==null )
    	rowID = "<%=rowID%>";

    dwr.engine.setAsync(false);

    userlogBean.detailTSUserlog(rowID,
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
        
            colElements=rowElements[0].split("</C>");

            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="user.columns.userCode" bundle="${language}"/></td>");
            document.write("<td class=tablebody>"+colElements[1]+"</span></tr>")
            document.write("<tr><td class=tablebodyhead><bean:message key="user.columns.userName" bundle="${language}"/></td>");
            document.write("<td class=tablebody>"+colElements[2]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead><bean:message key="user.columns.userIP" bundle="${language}"/></td>");
            document.write("<td class=tablebody>"+colElements[3]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead><bean:message key="user.columns.time" bundle="${language}"/></td>");
            document.write("<td class=tablebody>"+colElements[4]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead><bean:message key="user.columns.content" bundle="${language}"/></td>");
            document.write("<td class=tablebody>"+colElements[5]+"</td></tr>");
       
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
