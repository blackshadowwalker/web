<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>


<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>


<% 
	//得到系统路径；
    String thisPath=request.getContextPath();
    String qx=request.getParameter("qx"); 
    
    baseForm bform=(baseForm)request.getSession().getAttribute("baseuser");
    String language = bform.language;
    String user = bform.user_code;
    
    String pagePath = (String)request.getAttribute("pagePath"); 
    
    String serverPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>


<html>
<head>
  <title><bean:message key="db.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <link href="<%=thisPath%>/modules/base/hx_table/css/hx_table.css" rel="stylesheet" type="text/css" />
  
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_wait_plugin/hx_wait_plugin.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/jquery.hx_table.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/tools.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/xtgl/dataMgr/scripts/dataMgrObject.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/xtgl/dataMgr/scripts/dataMgrScript.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/dataMgrBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modulse/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("modules/base/css/calendar-blue.css"); </style>
</head>

<body onLoad="" topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">

<div class=tip>
    <table>
        <tr>
          <td width="20"><img src="<%=thisPath%>/modules/jcxx/ruler/image/icon1.gif" width="18" height="16"></td>
          <td width="915"><div id="path_name">
          <bean:message key="label.pagepath" bundle="${language}"/>:
         <%=pagePath %>
          </div></td>
        </tr>
    </table>
</div>

<div class=padindex>
  <table>
    <tr>
      <td id=padindex0 class=activeindex onClick="switch_index(this, 0)"><div align="center">
      <bean:message key="db.title" bundle="${language}"/></div></td>
    </tr>
  </table>
</div>

<div class=padcontent>

<div id=padcontent0 class=activecontent>

<form>

<!-- 选择<bean:message key="button.query" bundle="${language}"/>方式 -->

<table class=cardname>
<tbody>
  <tr>
    <td class=cardnameleft>
    	<bean:message key="db.title" bundle="${language}"/><bean:message key="button.query" bundle="${language}"/>
    	</td>
  </tr>
</tbody>
</table>


<div class=scrollarea style="width:100%;height:60px">
<table class=tableinput>
<tbody>  
<tr>
    <td class=TDLeft>
      <input type="text" id="wjm_sql" name="event_code" size=20 maxlength=20 style="color:red" 
      value="<bean:message key="db.msg.pleaseInputFileName" bundle="${language}"/>"  
      onKeyDown="setTab()">
      <input type="hidden" id="my_user"  align="center"  value="<%=user%>"/>
    </td>   
  </tr>
</tbody>
</table>

</div>

<span id=scrollbar><bean:message key="msg.inProgress" bundle="${language}"/></span>

</form>

<!-- 显示query结果 -->

<div id="hx_table_div" class="queryresult"></div>

</div>

<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<input id="qx_id" type="hidden" value="<%=qx%>"/>
<script type="text/javascript">
 $(function(){
    //文件名输入框获取焦点
    $('#wjm_sql').focus(function(){
        var txt1_value=$('#wjm_sql').val();
        if(txt1_value=="<bean:message key="db.msg.pleaseInputFileName" bundle="${language}"/>"){
        $(this).val('');
        }
    })

//文件名输入框失去焦点
    $('#wjm_sql').blur(function(){
        var txt1_value=$('#wjm_sql').val();
        if(txt1_value==""){
        $(this).val('<bean:message key="db.msg.pleaseInputFileName" bundle="${language}"/>')
        }
    })
 });

 var serverPath = '<%=serverPath%>';

//query等待中...
 var waitObj=new hx_wait($("#this_path_id").val()+"/modules/base/hx_wait_plugin");
 var height = document.body.clientHeight;
 $("#hx_table_div").height(height - 173);
</script>

</div>

</body>
</html>