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
  <title>帮助信息</title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css">
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
</head>

<body>

<script language="javascript">
dwr.engine.setAsync(false);

 var qx = window.dialogArguments;
 //alert("权限："+qx);
    baseBean.queryHelpText(qx,
    {
        callback:function(data)
        {
	         if(data=="")
	         {
	         	document.write("<table class=cardname>");
	            document.write("<tr>");
	            document.write("<td class=cardnameleft>无帮助信息</td>");
	            document.write("<td class=cardnameright>");
	            document.write("<button name=\"button\" onClick=\"forAbort()\" class=\"button\"><img src=\"<%=thisPath%>/modules/base/image/close.gif\">关闭窗口</button>");
	            document.write("<td>");
	            document.write("</tr>");
	            document.write("</table>");
	            document.write("<div class=cardbody>");
	            document.write("暂无帮助信息！");
	         }
	         else
	         {
	         	array=data.split("</C>");
	            
	            document.write("<table class=cardname>");
	            document.write("<tr>");
	            document.write("<td class=cardnameleft>"+array[0]+"帮助信息</td>");
	            document.write("<td class=cardnameright>");
	            document.write("<button name=\"button\" onClick=\"forAbort()\" class=\"button\"><img src=\"<%=thisPath%>/modules/base/image/close.gif\">关闭窗口</button>");
	            document.write("<td>");
	            document.write("</tr>");
	            document.write("</table>");
	            document.write("<div class=cardbody>");
	            document.write(array[1]);
	            document.write("<br>");
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


<button name="button" onClick="forAbort()" class="button"><img src="<%=thisPath%>/modules/base//image/close.gif">关闭窗口</button>

</div>

<script language="JavaScript">    

function forAbort()    
{         
    window.close();    
} 

</script> 

</body>

</html>
