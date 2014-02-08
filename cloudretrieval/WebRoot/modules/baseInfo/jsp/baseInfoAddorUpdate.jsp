<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<%
    String thisPath=request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
    
	 baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
	String basePathExt = (String)application.getInitParameter("basePathExt");
	basePathExt = basePathExt.replaceAll("\\\\","/");
	System.out.println(basePathExt);
    String language = bform.language;
//	System.out.println("mainTitle: " + mainTitle);
%>
<html>
<head>
  <title><bean:message key="baseinfo.title"  bundle="${language}" /></title>
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseInfoBean.js"></script>
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/tools.js"></script>
  <SCRIPT src="<%=thisPath%>/table_view/jquery.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/jquery-ui-1.7.2.custom.min.js" type=text/javascript></SCRIPT>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_wait_plugin/hx_wait_plugin.js"></script>
  <style>
	.file{  
	    height: 34px;
	    width: 78px;
	    position:absolute ;  
	    filter: alpha(opacity = 0);  
	    -moz-opacity:0;  
	    opacity: 0;  
	    z-index: 110;  
	    cursor: pointer;
	    float: left;
	    margin-top: -32px;
	    position: relative;
	}  
  </style>
</head>
<body>	
<div class=cardbody>
  <table border=1 class="tablebox" style=border-color:gray>
  <tbody>
 	<tr id="tr_1">
 		<td class=tablebodyhead width=100px><bean:message key="baseinfo.columns.id"  bundle="${language}" /></td>
 		<td id="id"></td>
 	</tr>
 	
 	<tr id="logo_tr2">
 		<td class=tablebodyhead><bean:message key="baseinfo.columns.logo"  bundle="${language}" /></td>
	 	<td id=uplaod_td>
	 		<span id=logo_td style="width:30px;height:30px;float:left;" >&nbsp;</span>
	 		<span>
				<form id="logoForm" name="logoForm" enctype="multipart/form-data" target="hidden_frame" ACTION="" method="post"> 
					<iframe name='hidden_frame' id="hidden_frame"style="display: none"></iframe>
				    	<input type="file" id="logo" name="logo" size=1 maxlength=255 value="..." style=width:152px; onchange="forPlsc();">
				</form>
			</span>
 		</td>
 	</tr>
 	<tr>
 		<td class=tablebodyhead><bean:message key="baseinfo.columns.title"  bundle="${language}" /></td>
 		<td><input id=title type=text style="width:300px;"></td>
 	</tr>
 	<tr>
 		<td class=tablebodyhead><bean:message key="baseinfo.columns.booter"  bundle="${language}" /></td>
 		<td><textarea id=foot type=text style="width:300px;height:100px;" ></textarea></td>
 	</tr>
 	<tr>
 		<td class=tablebodyhead><bean:message key="baseinfo.columns.version"  bundle="${language}" /></td>
 		<td><input id=versionnumber type=text style="width:300px;"></td>
 	</tr>
 	</tbody>
 </table>

<div align=center>
	<input type=button value="<bean:message key="button.label.submit"  bundle="${language}" />" onclick="_confirm()">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type=button value="<bean:message key="button.label.close"  bundle="${language}" />" onclick="_concel()">
</div>
 <input id=work type=text style="display:none">
</div> 
 <script type="text/javascript">
 	var file_name="";
 	if(<%= request.getParameter("id") %>==0){
 		
 	}else{
 	
		
 		baseInfoBean.queryBaseInfoById(<%= request.getParameter("id") %>, {
				callback : function(data) {
					var rowElements=data.split("</R>");
					var colElements=rowElements[0].split("</C>");
					if (data!=""&&data!=null) {
						$("#id").append(colElements[0]);
					// $("#logo").val(colElements[1]);
						file_name=colElements[5];
						document.getElementById("logo_td").innerHTML="<img id='img' src=<%=basePath%>${basePathExtName}/"+file_name+" width='30' height='30'>";
						$("#title").val(colElements[1]);
						$("#foot").val(colElements[2]);
						$("#work").val(colElements[4]);
						$("#versionnumber").val(colElements[6]);
					} else {
						alert("<bean:message key="msg.error.error" bundle="${language}"/>. <bean:message key="baseinfo.error.pleaseTryAgain" bundle="${language}"/>");
					}
				},
				exceptionHandler : function(err_info) {
					if (err_info != "") {
						alert(err_info);
						window.open(
								thispath + "/logoffAction.do?" + new Date(),
								"_parent");
					} else {
						alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>。");
						window.open(
								thispath + "/logoffAction.do?" + new Date(),
								"_parent");
					}
				}
			});
		
 	}
 	
 	function _confirm(){
 		var title=$("#title").val();
 		var foot=$("#foot").val();
 		var versionnumber=$("#versionnumber").val();
 		//if(logo==""||logo==null) {alert("logo不能为空"); return;}
 		if(title==""||title==null) {alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="baseinfo.columns.title" bundle="${language}"/>"); return;}//主题
 		if(foot==""||foot==null) {alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="baseinfo.columns.booter" bundle="${language}"/>"); return;}//叶脚不能为空
 		if(versionnumber==""||versionnumber==null) {alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="baseinfo.columns.version" bundle="${language}"/>"); return;}//版本号不能为空
	 	if(<%= request.getParameter("id") %>==0){
	 		baseInfoBean.addBaseInfo(<%= request.getParameter("id") %>,file_name,$("#title").val(),$("#foot").val(),versionnumber,
				{
					callback : function(data) {
					if (data == 1||data=="1") {
						alert("<bean:message key="button.insert" bundle="${language}"/> <bean:message key="msg.success" bundle="${language}"/>!");//alert("添加成功。");	
						window.returnValue=1;
	 					window.close();

					} else {
						alert("<bean:message key="button.insert" bundle="${language}"/> <bean:message key="msg.failed" bundle="${language}"/>!");//alert("添加失败。");
						window.close();
					}

					// 隐藏信息条
					// hidden_scrollbar();
				},
				exceptionHandler : function(err_info) {
					if (err_info != "") {
						alert(err_info);
						window.open(thispath + "/logoffAction.do?"
										+ new Date(), "_parent");
					} else {
						alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>。");
						window.open(thispath + "/logoffAction.do?"
										+ new Date(), "_parent");
					}
				}
			});
	 		
	 	}else{
	 		baseInfoBean.updateBaseInfoById(<%= request.getParameter("id") %>,file_name,$("#title").val(),$("#foot").val(),$("#work").val(),versionnumber,
				{
					callback : function(data) {

					if (data == 1||data=="1") {

						alert("<bean:message key="button.modify" bundle="${language}"/> <bean:message key="msg.success" bundle="${language}"/>!");							
						window.returnValue=1;
	 					window.close();

					} else {

						alert("<bean:message key="button.modify" bundle="${language}"/> <bean:message key="msg.failed" bundle="${language}"/>!");
						window.close();
					}

					// 隐藏信息条
					// hidden_scrollbar();
				},
				exceptionHandler : function(err_info) {

					if (err_info != "") {

						alert(err_info);

						window.open(thispath + "/logoffAction.do?"
										+ new Date(), "_parent");
					} else {

						alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>。");

						window.open(thispath + "/logoffAction.do?"
										+ new Date(), "_parent");
					}
				}
			});
	 	}
 	}
 	function _concel(){
 		window.returnValue=0;
 		window.close();
 	}
 	
 	function  forPlsc(){
		var files = document.getElementsByName("logo");
	     
	    if (files[0].value == null || files[0].value == "")
	    {
	        alert("<bean:message key="baseinfo.error.attachFiles" bundle="${language}"/>");//请选择附件!
	        return false;
	    }
	    var fm1 = document.getElementById("logoForm");
	    var fileTypes = "*.jpg,*.bmp,*.gif,*.png,*.ico,*.jpeg";
	    var savepath = "logo";
	    var callback = "UploadCallback";
	    var root="<%=basePathExt%>/${basePathExtName}/${uploadPath}";
	    fm1.action ="<%=thisPath%>/upload.do?callback="+callback+"&dir="+savepath+"&fileTypes="+fileTypes+"&dirroot="+root;
	    fm1.submit();
	}
	
	function UploadCallback(flag, cnt, files)
	{
		var thispath = "<%=thisPath%>";
		if (flag == false || cnt<1)
	    { 
	        alert("<bean:message key="baseinfo.error.attachFilesFailed" bundle="${language}"/>");//附件导入失败!
	        return false;
	    }
	    var filepath = files.split("</C>");
	    var filename = filepath[0].split(",");
	    file_name="${uploadPath}/logo/"+filename[0];
	    //document.getElementById("logo_td").innerHTML=filename[6];
	    document.getElementById("logo_td").innerHTML="<img id='img' src=<%=basePath%>/${basePathExtName}/"+file_name+" width='30' height='30'>";
		
	}
 	function _upload(){
 		document.getElementById("logo").click();
 	}
 </script>
</body>
</html>