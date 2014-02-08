<%@ page language="java" contentType="text/html;charset=GBK"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>

<%
    String thisPath=request.getContextPath();
%>

<head>
  <title>用户信息</title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
   
 <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/userBean.js"></script>
</head>

<body>

<div class=cardbody>

  <table width=100% cellSpacing=1 cellPadding=0 class="tablestyle" style=\"border-bottom:0px\">

<script>
    var rowCode = window.dialogArguments;

    dwr.engine.setAsync(false);

    userBean.detailTSUser(rowCode,
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
        
            colElements=rowElements[0].split("</C>");

            document.write("<tr><td class=tablebodyhead width=150px>用户代码</td>");
            document.write("<td class=tablebody>"+colElements[0]+"</td></tr>");

            document.write("<tr><td class=tablebodyhead>用户姓名</td>");
            document.write("<td class=tablebody>"+colElements[1]+"</td></tr>");

            document.write("</table>");
            document.write("<table width=100% cellSpacing=1 cellPadding=0 class=tablestyle style=\"border-top:0px\" >");
            document.write("<tr>");
            document.write("<td width=200px class=tablebodyhead>机构名称</td>");
            document.write("<td class=tablebodyhead>用户角色</td>");
            document.write("</tr>");

            for (var i=1; i<rowElements.length-1; ++i)
            {
                colElements=rowElements[i].split("</C>");
                document.write("<tr><td class=tablebody>"+colElements[0]+"</td>");
                document.write("<td class=tablebody>"+colElements[1]+"</td></tr>");
            }
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

<button name="button" onClick="forAbort()" class="button">关闭</button>

</div>

<script language="JavaScript">    

function forAbort()    
{         
    window.close();    
} 

</script> 

</body>

</html>
