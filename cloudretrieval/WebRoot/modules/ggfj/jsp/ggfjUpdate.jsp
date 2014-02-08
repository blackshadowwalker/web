<%@ page language="java" contentType="text/html;charset=GBK"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<%@ page import="javax.sql.DataSource"%>

<html>

<%
    String thisPath=request.getContextPath();
%>

<script language="javascript">
    var args = window.dialogArguments;
</script>

<head>
  <title><bean:message key="button.modify" bundle="${language}"/>公共附件</title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">  
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/ggfjBean.js"></script>
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
    <td class=tablebodyhead>文件名称</td>
    <td class=tablebody>
      <input type="text" id="i_value" name="value"  size=20 maxlength=20 readonly>
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead>文件路径</td>
    <td class=tablebody>
      <input type="text" id="i_path" name="path"  size=20 maxlength=20 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead>上传用户</td>
    <td class=tablebody>
      <select size="1" id="i_person" name="person" value="">
<script language="javascript">
      for (var i=0;i<args.PersonIDs.length;i++) 
          document.write("<option value='"+args.PersonIDs[i]+"'>"+args.PersonNames[i]+"</option>");
</script>
      </select>
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead>状态</td>
    <td class=tablebody>
      <select size="1" id="i_status" name="status" value="">
<script language="javascript">
      for (var i=0;i<args.StatusIDs.length;i++) 
          document.write("<option value='"+args.StatusIDs[i]+"'>"+args.StatusNames[i]+"</option>");
</script>
      </select>
    </td>
  </tr>
</table>

<script language="javascript">

    DWREngine.setAsync(false);

    ggfjBean.beforeUpdateTSGgfj(parseInt(args.rowID),
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
        
            colElements=rowElements[0].split("</C>");

            document.forms[0].value.value = colElements[0];
            document.forms[0].path.value = colElements[1];
            document.forms[0].person.value = colElements[2];
            document.forms[0].status.value = colElements[3];
        },
        exceptionHandler:function(err_info)
        {
            if (err_info!="")
            {
                alert(err_info);
                window.open("<%=thisPath%>/logof<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>+new Date(),"_parent");
            }
            else
            {
                alert("连接超时，系统自动退出。");
                window.open("<%=thisPath%>/logoffAction.do?"+new Date(),"_parent");
            }
        }
    });
    DWREngine.setAsync(true);
</script>

</form>

<button name="button" onClick="forSure()" class="button">提交</button>
<button name="button" onClick="forAbort()" class="button">取消</button>

</div>

<script language="JavaScript">    

function forSure()    
{
    var i = 0;
    var updateString = new Array();
    var tmp = "|"+args.rowID+"</C>";

    tmp += document.forms[0].id.value+"</C>";
    tmp += document.forms[0].value.value+"</C>";
    updateString[i++] = "path='"+document.forms[0].path.value+"'";
    tmp += document.forms[0].i_sc_rq.value+"</C>";
    tmp +=  document.forms[0].person.options[document.forms[0].person.selectedIndex].text+"</C>";
    updateString[i++] = "person='"+document.forms[0].person.value+"'";
    tmp +=  document.forms[0].status.options[document.forms[0].status.selectedIndex].text+"</C>";

	if (!confirm("确定要<bean:message key="button.modify" bundle="${language}"/>吗？"))
        return false;
        
    window.returnValue = updateString.toString()+tmp;
    window.close();    
} 

function forAbort()    
{         
    window.close();    
} 

</script> 

</body>

</html>
