<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="java.sql.*,modules.base.basePublic,modules.base.baseForm"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<% 
    baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
    String thisPath=request.getContextPath();
	baseForm user = (baseForm)session.getAttribute("baseuser");
	String language=bform.language;
	 String dept_name = user.dept_name;
	    
	 String user_name = user.user_name;
	 
	 String role_name = user.role_name;
	 
	 String user_code = user.user_code;
	 
	 String photopath = user.photo_path;
	 
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<HEAD>
 <title>menu PAGE</title>
  <base target="_self"/>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <SCRIPT language=JavaScript type="text/javascript" SRC="<%=thisPath%>/modules/menu/wxjjTree.js"></SCRIPT>
  <SCRIPT language=JavaScript type="text/javascript" SRC="<%=thisPath%>/modules/menu/jcl/menu.js"></SCRIPT>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/navBean.js"></script>
	
  <script language=JavaScript type="text/javascript" src="<%=thisPath%>/modules/menu/jcl/MenuTool.js"></script>	
  <script src="<%=thisPath%>/modules/menu/jcl/prototype.lite.js" type="text/javascript"></script>
  <script src="<%=thisPath%>/modules/menu/jcl/moo.fx.js" type="text/javascript"></script>
  <script src="<%=thisPath%>/modules/menu/jcl/moo.fx.pack.js" type="text/javascript"></script>

  <script src="<%=thisPath%>/modules/base/tree/alai_tree.js"></script>
  <script src="<%=thisPath%>/modules/base/tree/alai_tree_wxjj.js"></script>
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css">
  <link href="<%=thisPath%>/modules/menu/css/STYLE.CSS" rel="stylesheet" type="text/css">
<style>
body {
	text-align: center;
	font:12px Arial, Helvetica, sans-serif;
	color: #000;
	background-color: #EEF2FB;
	margin: 0px;
}
#container {
	width: 182px;
}
H1 {
	font-size: 12px;
	margin: 0px;
	width: 182px;
	cursor: pointer;
	height: 30px;
	line-height: 20px;	
}
H1 a {
	display: block;
	width: 182px;
	color: #000;
	height: 30px;
	text-decoration: none;
	moz-outline-style: none;
	background-image: url(<%=thisPath%>/modules/menu/image/menu_bgS.gif);
	background-repeat: no-repeat;
	line-height: 30px;
	text-align: center;
	margin: 0px;
	padding: 0px;
}
.content{
	width: 182px;
	height: 26px;
	
}
.MM ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	display: block;
}
.MM li {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	list-style-type: none;
	display: block;
	text-decoration: none;
	height: 26px;
	width: 182px;
	padding-left: 0px;
}
.MM {
	width: 182px;
	margin: 0px;
	padding: 0px;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;
	clip: rect(0px,0px,0px,0px);
}
.MM a:link {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(<%=thisPath%>/modules/menu/image/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:visited {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(<%=thisPath%>/modules/menu/image/menu_bg1.gif);
	background-repeat: no-repeat;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
.MM a:active {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(<%=thisPath%>/modules/menu/image/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	font-weight: bold;
	color: #006600;
	background-image: url(<%=thisPath%>/modules/menu/image/menu_bg2.gif);
	background-repeat: no-repeat;
	text-align: center;
	display: block;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}

</style>
<script language="javascript">

function xgmm()
{
	var thispath='<%=thisPath%>';

	var srcFile = thispath+"/modules/jcxx/mmxg/jsp/mmxgQuery.jsp";
	var winFeatures = "dialogHeight:320px;dialogWidth:600px;help:no;status:no";

	 window.showModalDialog(srcFile, "", winFeatures);
}

function ggxz()
{
    var height=screen.height;
    var srcFile = "<%=thisPath%>/modules/ggfj/jsp/ggfjDetail.jsp";
    var winFeatures = "dialogHeight:"+height+"px;dialogWidth:800px;help:no;status:no";

    window.showModalDialog(srcFile, "", winFeatures);
//	window.open(srcFile);
}


</script>
</head>
</HEAD>
<body>

<table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
  <tr>
    <td width="182" valign="top">
    <div id="container">
          <h1 class="type"><a href="javascript:void(0)"><bean:message key="userBasicInfo" bundle="${language}" /></a></h1><!-- 用户基本信息 -->
	      <div class="content">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td><img src="<%=thisPath%>/modules/menu/image/menu_topline.gif" width="182" height="5" /></td>
	          </tr>
	        </table>
	        <table name="photo_image" width="100%" >
	            <tr>
	               <td>
	               	<img id="img_" src="<%=basePath %>${basePathExtName}/<%=photopath %>" width="150" height="150" />
	               	</td>
	             </tr>
	        </table>
	         <ul class="MM">
	          	<li><bean:message key="modifyPhoto" bundle="${language}"/>：<span style="cursor:pointer;font-size:13px;font-weight:bold;margin-right:4px;" onclick="photo()" ><bean:message key="modifyPhoto" bundle="${language}"/> </span></li>
	        </ul>
	        <ul class="MM">
	          <li><bean:message key="userCode" bundle="${language}"/>：<%=user.user_code%></li>
	        </ul>
            
            <ul class="MM">
	          <li><bean:message key="userName" bundle="${language}"/>：<%=user_name%></li>
	        </ul>
            
            <ul class="MM">
	          <li><bean:message key="roleName" bundle="${language}"/>：<%=user.role_name%></li>
	        </ul>
            
            <ul class="MM">
	          <li><bean:message key="modifyPassword" bundle="${language}"/>：<span style="cursor:pointer;font-size:13px;font-weight:bold;margin-right:4px;" onclick="xgmm()"><bean:message key="modifyPassword" bundle="${language}"/></span></li>
	        </ul>
	        
	        <ul class="MM">
	          <li><bean:message key="publicDocuments" bundle="${language}"/>：<span style="cursor:pointer;font-size:13px;font-weight:bold;margin-right:4px;" onclick="ggxz()"><bean:message key="publicDocumentsDownload" bundle="${language}"/></span></li>
	        </ul>
	      </div>
     </div>
     </td>
  </tr>
</table>
		<script type="text/javascript">
	      abc();
     	  function abc(){
			var contents = document.getElementsByClassName('content');
			var toggles = document.getElementsByClassName('type');
		
			var myAccordion = new fx.Accordion(
				toggles, contents, {opacity: true, duration: 400} 
			);
			myAccordion.showThisHideOpen(contents[0]);	 
		  }
     	  
    	 document.getElementById("img_").src="<%=basePath %>${basePathExtName}/<%=photopath%>";
    	 
     	  function photo(){
     		 var ret = window.showModalDialog("<%=thisPath%>/modules/menu/update.jsp",window,"dialogHeight=400px;dialogWidth:400px") ;
     		 window.location.reload();
     	  }
		 </script>
<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>

</body>
</html>
