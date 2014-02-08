<%@ page language="java" contentType="text/html;charset=GBK" %>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page import="modules.base.*"%>

<% 
    String thisPath=request.getContextPath();
    String qx=request.getParameter("qx");
    baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
%>

<html>

<head><base target="_self"/> 
  <title><bean:message key="button.modify" bundle="${language}"/>个人信息</title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
  
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/jcxx/mmxg/script/mmxgScript.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/mmxgBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
</head>

<body onload="" topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">

<div >


<!-- 增加代码信息 -->

<div id=padcontent1 >

<table class=cardname>
  <tr>
    <td class=cardnameleft><bean:message key="button.modify" bundle="${language}"/>密码</td>
    <td class=cardnameright><bean:message key="label.note.requiredField" bundle="${language}"/></td>
  </tr>
</table>

<!-- 输入 -->

<form>

<div class=inputarea2>

<table class=tableinput>

  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>账号：</td>
    <td class=TDLeft>
      <input type="text" id="i_jh" name="jh" size=20 maxlength=40 value="" readonly>

    </td>
	
  </tr>
  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>姓名：</td>
    <td class=TDLeft>
      <input type="text" id="i_user_name" name="user_name" size=20 maxlength=40 value="" readonly>
 <input type="hidden" id="i_tupian" name="tupian" size=20 maxlength=80 value="">
    </td>
  </tr>
 

 
<script language="javascript">


  
  //先找出人员的具体信息
 
 dwr.engine.setAsync(false);

    mmxgBean.bforup(
    {
        callback:function(data)
        {
            var rowElements=data.split("</R>"); 
        
            var colElements=rowElements[0].split("</C>");

            document.forms[0].jh.value = colElements[0];
            document.forms[0].user_name.value = colElements[1];
            
            
            document.write("<tr><td class=TDTitle>qq头像</td>");
            document.write("<td class=TDLeft> <div id='sdf'><img src='<%=thisPath%>/modules/zxjl/qqface/"+colElements[2]+"-1.bmp'></div>");
          
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
    <tr>
    <td>
    </td>
    <td>
   
</td>
</tr>
    <script>
    function xztx()
{	
	var srcFile = "xgtx.jsp";
	var winFeatures = "dialogHeight:400px;dialogWidth:400px;help:no;status:no";

	var fanhui = window.showModalDialog(srcFile, "", winFeatures);
	
	document.forms[0].tupian.value = fanhui;
	
   xx="<img src='<%=thisPath%>/modules/zxjl/qqface/"+fanhui+"-1.bmp'>";

  
   document.all('sdf').innerHTML=xx;
}
</script>

</table>
</div>

<!-- 插入操作按钮 -->
<button id='submit2_id' name='submit2' onClick='xztx()' class='button'>选择头像</button>

<button id="submit_id" name="submit" onClick="fortj('<%=thisPath%>','<%=bform.user_code%>')" class="button">保存<bean:message key="button.modify" bundle="${language}"/></button>
<button id="reset_id" name="clear" onClick="forClear()" class="button">关闭窗口</button>

</form>

</div>
</div>

<script language="javascript">


function fortj()
{
	 var i = 0;
    var updateString = new Array();
	
	updateString[i++] = "tupian='"+document.forms[0].tupian.value+"'";
	
	 mmxgBean.forup(updateString.toString(),
    {
        callback:function(data)
        {
            alert("<bean:message key="button.modify" bundle="${language}"/>完成！");
            window.close();
           
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
    
}

</script>
</body>
</html>
