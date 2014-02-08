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
//	System.out.println(basePathExt);
    String language = bform.language;
//	System.out.println("mainTitle: " + mainTitle);
    String user_code = bform.user_code; 
%>
<html>
<head>
  <title><bean:message key="modifyPhoto"  bundle="${language}" /></title>
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/userBean.js"></script>
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
 	<tr id="logo_tr2">
 		<td class=tablebodyhead><bean:message key="txxg.photo" bundle="${language}"/></td>
	 	<td id=uplaod_td>
	 	  <span id=photo_td style="width:30px;height:30px;float:left;" >&nbsp;</span>
	 		<span>
				<form id="logoForm" name="logoForm" enctype="multipart/form-data" target="hidden_frame" ACTION="" method="post"> 
					<iframe name='hidden_frame' id="hidden_frame"style="display: none"></iframe>
				    	<input type="file" id="photo" name="photo" size=1 maxlength=255 value="..." style=width:162px;height:25px; onchange="forUpdate();">
				</form>
			</span>
 		</td>
 	</tr>
 	<tr>
 		<td class=tablebodyhead><bean:message key="txxg.username" bundle="${language}"/></td>
 		<td><input id=username type=text style="width:150px;"></td>
 	</tr>
 	<tr>
 		<td class=tablebodyhead><bean:message key="txxg.password" bundle="${language}"/></td>
 		<td><input id=password type=text style="width:150px;"></td>
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
 var id ="";
 dwr.engine.setAsync(false);
 var code = "<%= user_code %>";
 userBean.beforeUser(code, {
		callback : function(data) {
			var rowElements=data.split("</R>");
			var colElements=rowElements[0].split("</C>");
			if (data!=""&&data!=null) {
				id=colElements[0];
				file_name=colElements[3];
				document.getElementById("photo_td").innerHTML="<img id='img' src=<%=basePath%>${basePathExtName}/"+file_name+" width='30' height='30'>";
				$("#username").val(colElements[1]);
				$("#password").val(colElements[2]);
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
 dwr.engine.setAsync(true);
 
 window.setTimeout(seterror,200);
	
	function seterror(){//判断图片是否存在  

		var imgurl=document.getElementById("img").src;
		var ImgObj = new Image(); 
		ImgObj.src = imgurl;  
		if (ImgObj.width > 28 && ImgObj.height > 30) { 
			
		} else {  
			document.getElementById("img").src="<%=thisPath%>/modules/menu/image/touxiangIcon.gif";
		}  
	}
	
	
	function _confirm(){
		var username = $("#username").val();
		var passwd = $("#password").val();
		userBean.updateUser(id,username,passwd,file_name,
				{
					callback : function(data) {
						
					if (data > 0) {
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
		
		
	}
	
	
	
 	function _concel(){
		window.returnValue=0;
		window.close();
	}
 
 	function forUpdate(){
 		
 		var files = document.getElementsByName("photo");
	     
	    if (files[0].value == null || files[0].value == "")
	    {
	        alert("<bean:message key="baseinfo.error.attachFiles" bundle="${language}"/>");//请选择附件!
	        return false;
	    }
	    var fm1 = document.getElementById("logoForm");
	    var fileTypes = "*.jpg;*.bmp;*.gif,*.png,*.ico,*.jpeg";
	    var savepath = "photo";
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
	    file_name="${uploadPath}/photo/"+filename[0];
	    document.getElementById("photo_td").innerHTML="<img id='img' src=<%=basePath%>/${basePathExtName}/"+file_name+" width='30' height='30'>";
		
	}
 	
 </script>
</body>
</html>