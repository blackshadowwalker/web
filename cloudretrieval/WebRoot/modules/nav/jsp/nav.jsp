<%@ page contentType="text/html;charset=GBK" isErrorPage="false"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="modules.dbsx.dbsxBean,modules.base.baseForm"%>
<%
    String thisPath=request.getContextPath();
	String addr=dbsxBean.substr(request.getRequestURL().toString(),thisPath);
	baseForm bf=(baseForm)request.getSession().getAttribute("baseuser");
%>
<HTML>
	<HEAD>
	 <base target="_self"/>
		<title>nav PAGE</title>
		<meta http-equiv="Expires" CONTENT="0">
		<meta http-equiv="Cache-Control" CONTENT="no-cache">
		<meta http-equiv="Pragma" CONTENT="no-cache">
		<script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
		<script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
		
		<SCRIPT language=JavaScript type="text/javascript" SRC="<%=thisPath%>/modules/nav/scripts/nav.js"></SCRIPT>
		<script type="text/javascript"src="<%=thisPath%>/dwr/interface/navBean.js"></script>
		<script type="text/javascript"src="<%=thisPath%>/dwr/interface/dbsxBean.js"></script>
		<script type="text/javascript"src="<%=thisPath%>/modules/base/scripts/Tip.js"></script>
		<style>


.menuitem {
	font-size: 12px;
	text-align: center;
	background-image: url(../nav/image/menu_bg.jpg);
	background-repeat: repeat-x;
	height: 28px;
}

.menuend {
	font-size: 14px;
	text-align: center;
	background-image: url(../nav/image/menu_bg.jpg);
	background-repeat: repeat-x;
	height: 30px;
}

A.link_bai14b:link {COLOR:#ffffff; text-decoration:none; font-family:Tahoma, Verdana; font-size:14px;font-weight:bold}
A.link_bai14b:visited {COLOR:#ffffff; text-decoration:none;font-family:Tahoma, Verdana; font-size:14px;font-weight:bold}
A.link_bai14b:hover {COLOR:#000; text-decoration:none;font-family:Tahoma, Verdana; font-size:14px;font-weight:bold}
</style>

<script language="javascript">

var msg = new Dbsx_Message(500, 70, "备忘中心：", 1, 1000, '<%=thisPath%>','<%=addr%>');

msg.showInfo(1);
//setInterval("showzx()","50000");
function showzx()
{
var now= new Date();   
var minute=now.getMinutes();   
  //每30分钟执行一次
  if(minute=="30"||minute=="0")
  {
		msg.showInfo(1);
	}
}
function dd(bz)
{	
var srcFile = "<%=thisPath%>/modules/oa/grbw/jsp/grbwDetail.jsp";
    var winFeatures = "dialogHeight:200px;dialogWidth:600px;help:no;status:no";

    window.showModalDialog(srcFile, bz, winFeatures);
/**
	if(bz==0)
	{
		window.open("<%=thisPath%>/rwzxAction.do?qx=rwzx","pad");
	}
	if(bz==1)
	{
		window.open("<%=thisPath%>/qjspAction.do?qx=qjsp","pad");
	}
	if(bz==2)
	{
		window.open("<%=thisPath%>/gwlzAction.do?qx=gwlz","pad");
	}
	
	**/
}

/**
function tmpView(){
	
	viewTip(msg,'<%=thisPath%>');
}
 **/

function logout(path) {

	if (top.nav.msg.timer) {
		window.clearInterval(top.nav.msg.timer);
		msg = null;
	}
	window.open(path + "/logoffAction.do?nt=" + new Date(), "_top");

}

function viewFirst(thispath) {
	 window.open("<%=thisPath%>/logonAction.do?"+new Date().toString(),"_parent");
}

function unload() {

	if (msg != null && msg.pop != null) {
		msg.hide('all')
	}
}
</script>
	</HEAD>
	<BODY>
		<table height="28px" width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="80px" class="menuend">
					<a class="link_bai14b" href="javascript:top.nav.viewFirst('<%=thisPath%>')" >
						<bean:message key="label.desktop" bundle="${language}"/>
					</a>
				</td>
				<script type="text/javascript">
					writeData('<%=thisPath%>', '<%=bf.user_code%>');
				</script>
				<td width="80px" class="menuend" align="right">
					<a class="link_bai14b" href="javascript:top.nav.logout('<%=thisPath%>');" target="_top">
						<bean:message key="button.exit" bundle="${language}"/>
					</a>
				</td>
			</tr>
		</table>

	</BODY>

</HTML>