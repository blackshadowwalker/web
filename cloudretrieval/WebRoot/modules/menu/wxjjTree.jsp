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
    String thisPath=request.getContextPath();
	baseForm user = (baseForm)session.getAttribute("baseuser");
	String language=bform.language;
	 String dept_name = user.dept_name;
	    
	 String user_name = user.user_name;
	 
	 String role_name = user.role_name;
	 
	 String user_code = user.user_code;
	
%>
<HTML>

<HEAD>
 <title>menu PAGE</title>
  <base target="_self"/>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <SCRIPT language=JavaScript type="text/javascript" SRC="<%=thisPath%>/modules/menu/jcl/System.js"></SCRIPT>
  <script language=JavaScript type="text/javascript" src="<%=thisPath%>/modules/menu/jcl/Control.js"></script>
  <SCRIPT language=JavaScript type="text/javascript" SRC="<%=thisPath%>/modules/menu/wxjjTree.js"></SCRIPT>
  <SCRIPT language=JavaScript type="text/javascript" SRC="<%=thisPath%>/modules/menu/jcl/menu.js"></SCRIPT>
  <SCRIPT language=JavaScript type="text/javascript" SRC="<%=thisPath%>/modules/menu/jcl/NavBar.js"></SCRIPT>
  <script language=JavaScript type="text/javascript" src="<%=thisPath%>/modules/menu/jcl/MenuTool.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/navBean.js"></script>

  <script src="<%=thisPath%>/modules/base/tree/alai_tree.js"></script>
  <script src="<%=thisPath%>/modules/base/tree/alai_tree_wxjj.js"></script>
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css">
  <link href="<%=thisPath%>/modules/menu/css/STYLE.CSS" rel="stylesheet" type="text/css">
<style>

a
{
font: Verdana, Arial;
font-weight: normal;
font-size: 11;
text-decoration: none;
color: #000000;
}

a:hover
{
    color: #000000;
    cursor:hand;
    font-weight: normal;
    text-decoration: none
}

a:link
{
   color: #000000;
    text-decoration: none
}

a:visited
{
    text-decoration: none
}

a:active
{
   color: #000000;
    text-decoration: none
}


</style>
</HEAD>
<BODY id = "zoom">

<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>

<script language="javascript">
/**
 var s = "";
    s += " 网页可见区域宽："+ document.body.clientWidth;
    s += " 网页可见区域高："+ document.body.clientHeight;
    s += " 网页可见区域宽："+ document.body.offsetWidth + " (包括边线和滚动条的宽)";
    s += " 网页可见区域高："+ document.body.offsetHeight + " (包括边线的宽)";
    s += " 网页正文全文宽："+ document.body.scrollWidth;
    s += " 网页正文全文高："+ document.body.scrollHeight;
    s += " 网页被卷去的高(ff)："+ document.body.scrollTop;
    s += " 网页被卷去的高(ie)："+ document.documentElement.scrollTop;
    s += " 网页被卷去的左："+ document.body.scrollLeft;
    s += " 网页正文部分上："+ window.screenTop;
    s += " 网页正文部分左："+ window.screenLeft;
    s += " 屏幕分辨率的高："+ window.screen.height;
    s += " 屏幕分辨率的宽："+ window.screen.width;
    s += " 屏幕可用工作区高度："+ window.screen.availHeight;
    s += " 屏幕可用工作区宽度："+ window.screen.availWidth;
    s += " 你的屏幕设置是 "+ window.screen.colorDepth +" 位彩色";
    s += " 你的屏幕设置 "+ window.screen.deviceXDPI +" 像素/英寸";
    alert (s);
**/
var pmkd = window.screen.width; //屏幕宽度
if(pmkd<=1024)
{
	parent.document.all("second").cols="0,10,*";
}

var myNavBar = showNavBar();
var myNavBarItem = new Array();

function forInformation()
{
    myNavBarItem[0] = myNavBar.Add("<bean:message key="userBasicInfo" bundle="${language}"/>");//用户基本信息
	myNavBarItem[0].Icon.src='<%=thisPath%>/modules/menu/image/q.gif';
	myNavBarItem[0].number=0;
    var Div1=showDiv();
    showText(Div1, 1, "<bean:message key="userCode" bundle="${language}"/>：<%=user.user_code%>","<%=thisPath%>");//登录名
    showText(Div1, 2, "<bean:message key="userName" bundle="${language}"/>：<%=user_name%>","<%=thisPath%>");//用户姓名
    showText(Div1,3, "<bean:message key="roleName" bundle="${language}"/>：<%=user.role_name%>","<%=thisPath%>");//登陆岗位
    showText(Div1,4, "<bean:message key="modifyPassword" bundle="${language}"/>：<span style=\"cursor:hand;font-size:13px;font-weight:bold;margin-right:4px;\" onclick=\"xgmm()\"><bean:message key="modifyPassword" bundle="${language}"/></span>","<%=thisPath%>");
    //公共文件下载
    showText(Div1,5, "<bean:message key="publicDocuments" bundle="${language}"/>：<span style=\"cursor:hand;font-size:13px;font-weight:bold;margin-right:4px;\" onclick=\"ggxz()\"><bean:message key="publicDocumentsDownload" bundle="${language}"/></span>","<%=thisPath%>");
    myNavBarItem[0].Add(Div1);
    document.write("");
    
}

forInformation();
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

 <div>
 <br><br><br><br><br><br><br><br><br><br><br><br><br>
 </div>
 <div style="border-top:1px dashed #000;height:100%;">


</div>

</BODY>
</HTML>
