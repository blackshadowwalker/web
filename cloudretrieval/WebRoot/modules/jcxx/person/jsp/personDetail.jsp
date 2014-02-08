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
    baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
	String language = bform.language;
%>

<head>
  <title><bean:message key="person.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/personBean.js"></script>
</head>

<body>

<div class=cardbody>

  <table width=100% cellSpacing=1 cellPadding=0 class="tablestyle">

<script>
    var rowID = window.dialogArguments;

    dwr.engine.setAsync(false);

    personBean.detailTUPerson(rowID,
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
            colElements=rowElements[0].split("</C>");
			var i=0;
            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="person.columns.userID" bundle="${language}"/></td>");//用户ID
            document.write("<td class=tablebody>"+colElements[i]+"</td> <td class=tablebody rowspan=11 width=200 height=200><img src='<%=thisPath%>/images/mjzp/"+colElements[i++]+".jpg' width=200 height=200  align=middle></td></tr>");
            i++;
            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="person.columns.userName" bundle="${language}"/></td>");//姓名
            document.write("<td class=tablebody>"+colElements[i++]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="person.columns.department" bundle="${language}"/></td>");//所属部门
            document.write("<td class=tablebody>"+colElements[i++]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="person.columns.sex" bundle="${language}"/></td>");//性别
            document.write("<td class=tablebody>"+colElements[i++]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="person.columns.birthday" bundle="${language}"/></td>");//出生日期
            document.write("<td class=tablebody>"+colElements[i++]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="person.columns.role" bundle="${language}"/></td>");// 角色
            document.write("<td class=tablebody>"+colElements[i++]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="person.columns.cellphone" bundle="${language}"/></td>");//手机
            document.write("<td class=tablebody >"+colElements[i++]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="person.columns.telephone" bundle="${language}"/></td>");//办公电话
            document.write("<td class=tablebody >"+colElements[i++]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="person.columns.email" bundle="${language}"/></td>");//电子邮箱
            document.write("<td class=tablebody >"+colElements[i++]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="person.columns.language" bundle="${language}"/></td>");//language
            document.write("<td class=tablebody colspan=2>"+colElements[i++]+"</td></tr>");
 
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

<button name="button" onClick="forAbort()" class="button">
	<bean:message key="button.label.close" bundle="${language}"/>
</button>
</div>

<script language="JavaScript">    

function forAbort()    
{         
    window.close();
} 

</script> 

</body>

</html>
