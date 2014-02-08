<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<%
	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
	String language = bform.language;
	System.out.println(language);
	//得到系统路径；
    String thisPath=request.getContextPath();

    String qx=request.getParameter("qx");
  	String pagePath = (String)request.getAttribute("pagePath"); 
   
    String user_dept=bform.locationId;   
      
%>


<html>
<head>
  <title><bean:message key="person.title" bundle="${language}"/></title>
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
  <script language="javascript" src="<%=thisPath%>/modules/location/scripts/locationObject.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/location/scripts/locationScript.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/locationBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/scripts/validateForm.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modulse/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modulse/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modulse/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("modules/base/css/calendar-blue.css"); </style>
</head>

<body onLoad="" topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">

<div class=tip>
    <table>
        <tr>
          <td width="20"><img src="<%=thisPath%>/modules/jcxx/ruler/image/icon1.gif" width="18" height="16"></td>
          <td width="915"><div id="path_name">
          <bean:message key="label.pagepath" bundle="${language}"/>:<%=pagePath %></div></td>
        </tr>
    </table>
</div>

<div class=padindex>
  <table>
    <tr>
      <td id=padindex0 class=activeindex onClick="switch_index(this, 0)"><div align="center">
      	<bean:message key="location.title" bundle="${language}"/></div></td>
      <td id=padindex1 class=hiddenindex onClick="switch_index(this, 1)" style="display:none"><div align="center">
		<bean:message key="location.insert" bundle="${language}"/>
	</div></td>
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
		<bean:message key="location.title" bundle="${language}"/>
	</td>
  </tr>
</tbody>
</table>

<!-- 输入条件 -->

<div class=scrollarea style="height:60px;">
<table class=tableinput>
<tbody>  
<tr>
    <td class=TDLeft>
    	<bean:message key="location.columns.name" bundle="${language}"/>:
      <input type="text" name="locationName" size=20 maxlength=40 value="" onKeyDown="setTab()">
    </td>
  </tr>
</tbody>
</table>

</div>


<span id=scrollbar>操作正在进行，请等待...</span>

</form>

<!-- 显示query结果 -->

<div id="hx_table_div" class="queryresult"></div>

</div>

<!-- 增加权限信息 -->

<div id=padcontent1 class=hiddencontent>

<table class=cardname>
  <tr>
    <td class=cardnameleft><bean:message key="location.insert" bundle="${language}"/></td>
    <td class=cardnameright><bean:message key="label.note.requiredField" bundle="${language}"/></td>
  </tr>
</table>

<!-- 输入 -->

<form id="nvr_form">

<div class=""s  style="height:220px;">

<table class="" height="50">
  <tr>
    <td class=TDTitle style="text-align:right;" ><span style="font-weight:normal;">*</span>
		<bean:message key="location.label.parentLocation" bundle="${language}"/> ： <!-- 上级地理位置 -->
	</td>
    <td class=TDLeft>
     <input type="text" id="i_plocationName" name="plocationName" size=20 maxlength=9 value="" readonly="true">
     <input type="hidden" id="i_dept_manager" name="parentLocationId" size=20 maxlength=9 value="" >
      <input type="hidden" name="parentLocationId_value" value="">
      <html:button property="button" onclick="forLocationTree(parentLocationId,'radio',parentLocationId_value)" styleClass="deptbutton">…</html:button>
    </td>
  </tr>
   <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>
    	<bean:message key="location.columns.code" bundle="${language}"/> ： <!-- 地域编号 -->
    </td>
    <td class=TDLeft>
      <input type="text" id="i_id" name="locationId" size=20 maxlength=40 readonly="ture" disabled value="" onblur="pd_only('locationId',document.getElementById('i_id'),'t_s_location')">
    </td>
  </tr>
  
  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>
    	<bean:message key="location.columns.name" bundle="${language}"/> ： <!-- 地域名称 -->
    	</td>
    <td class=TDLeft>
      <input type="text" id="i_type" name="locationName" size=20 maxlength=40 value="" isValidate="true" notEmpty="true" >
 
    </td>
  </tr>
 <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>
    	<bean:message key="location.columns.longitude" bundle="${language}"/> ： <!-- 地域经度 --></td>
    <td class=TDLeft>
      <input type="text" id="i_code" name="longitude" size=20 maxlength=40 value="" onClick="forMap();" readonly="true">
 
    </td>
  </tr>
  
   <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>
    	<bean:message key="location.columns.latitude" bundle="${language}"/> ： <!-- 地域纬度： --></td>
    <td class=TDLeft>
      <input type="text" id="i_value" name="latiTude" size=20 maxlength=40 value="" onClick="forMap();" readonly="true">
 
    </td>
  </tr>
  
   <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>
    	<bean:message key="location.columns.mapScaling" bundle="${language}"/> ： <!-- 地图缩放比例--></td>
    <td class=TDLeft>
      <input type="text" id="i_content" name="mapScaling" size=20 maxlength=40 value="" readonly="true" >
   </td>
  </tr>
</table>
</div>

<!-- 插入操作按钮 -->
<button name="submit" onClick="forInsert('<%=thisPath%>')" class="button">
	<bean:message key="button.label.submit" bundle="${language}"/>
</button>
<button name="clear" onClick="forClear()" class="button">
	<bean:message key="button.label.reset" bundle="${language}"/>
</button>

</form>
<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<input id="qx_id" type="hidden" value="<%=qx%>"/>
<script type="text/javascript">

//<bean:message key="button.query" bundle="${language}"/>等待中...
var waitObj=new hx_wait($("#this_path_id").val()+"/modules/base/hx_wait_plugin");
var height = document.body.clientHeight;
$("#hx_table_div").height(height - 173);
</script>
</div>
</div>
<script type="text/javascript">

function forLocationTree(parentLocationId,type,parentLocationId_value)
{
   // var dept = "37015oooo";
	
    var srcFile = '<%=thisPath%>'+"/modules/base/jsp/locationtree.jsp?jgbm="+'<%=user_dept%>'+"&type="+type;

    var winFeatures = "dialogHeight:600px;dialogWidth:450px;help:no;status:no";

   	var inArray = window.showModalDialog(srcFile, parentLocationId_value.value, winFeatures);
	
	if (typeof(inArray) == "undefined"||inArray == "")
	{
     	//test.value = "";
     }
     else
     {
		parentLocationId_value.value=inArray+"</R>";
		parentLocationId.value = inArray.split("</C>")[1];
		$("#i_plocationName").val(inArray.split("</C>")[2]);
		getId();
	}
}

 
 function getId(){
	   var str = $("#i_dept_manager").val();
	   locationBean.getLocationID(str,{
	 		callback:function(data){
		      $("#i_id").val(data);
	 		},
			exceptionHandler : function(err_info) {
				if (err_info != "") {
					alert(err_info);
					if (err_info.indexOf("<bean:message key="msg.error.error" bundle="${language}"/>") < 0) {
						window.open(thispath + "/logoffAction.do?"
										+ new Date(), "_parent");
					}
				} else {
					alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
					window.open(
							thispath + "/logoffAction.do?" + new Date(),
							"_parent");
				}
			}
	 	});   
  }

 
 function forMap(){
		var srcFile = "<%=thisPath%>/jsp/bmap.jsp";
	    var winFeatures = "dialogHeight:500px;dialogWidth:500px;help:no;status:no";
		var tt = window.showModalDialog(srcFile,window,winFeatures);
		if(tt==""||tt==null) {alert("<bean:message key="location.msg.setPosAtMap" bundle="${language}"/>") ;return;}
		
		var ll=tt.split(",");
		//alert(ll[0]+"　"+ll[1])
		$("#i_code").val(ll[0]);
		$("#i_value").val(ll[1]);
		$("#i_content").val(ll[2]);
	}
</script>

</body>
</html>