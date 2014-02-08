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
  <title>人员基本信息</title>
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

            document.write("<tr><td class=tablebodyhead width=150px>用户名</td>");
            document.write("<td class=tablebody>"+colElements[0]+"</td> <td class=tablebody rowspan=11 width=200 height=200><img src='<%=thisPath%>/images/mjzp/"+colElements[0]+".jpg' width=200 height=200  align=middle></td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px>姓名</td>");
            document.write("<td class=tablebody>"+colElements[1]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px>所属部门</td>");
            document.write("<td class=tablebody>"+colElements[2]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px>性别</td>");
            document.write("<td class=tablebody>"+colElements[3]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px>出生日期</td>");
            document.write("<td class=tablebody>"+colElements[4]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px>参加工作时间</td>");
            document.write("<td class=tablebody>"+colElements[5]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px>职级</td>");
            document.write("<td class=tablebody>"+colElements[6]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px>职位</td>");
            document.write("<td class=tablebody>"+colElements[7]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px>手机</td>");
            document.write("<td class=tablebody >"+colElements[8]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px>办公电话</td>");
            document.write("<td class=tablebody >"+colElements[9]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px>电子邮箱</td>");
            document.write("<td class=tablebody >"+colElements[10]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px>家庭住址</td>");
            document.write("<td class=tablebody colspan=2>"+colElements[11]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px>挂职职务</td>");
            document.write("<td class=tablebody colspan=2>"+colElements[12]+"</td></tr>");
 
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

<button name="button" onClick="forAbort()" class="button">关闭窗口</button>

</div>

<script language="JavaScript">    

function forAbort()    
{         
    window.close();
} 

</script> 

</body>

</html>
