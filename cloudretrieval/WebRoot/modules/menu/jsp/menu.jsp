<%@ page contentType="text/html;charset=GBK" isErrorPage="false" %>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page import="modules.base.*"%>

<HTML>

<%
    String thisPath=request.getContextPath();
    
    baseForm user = (baseForm)session.getAttribute("baseuser");
    String ruler_code = (String)session.getAttribute("basepage");
    session.removeAttribute("basepage");
    
    String dept_name = user.dept_name;
    
    String user_name = user.user_name;

%>

<HEAD>
  <title>menu PAGE</title>
  <html:base/>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link href="<%=thisPath%>/modules/menu/css/STYLE.CSS" rel="stylesheet" type="text/css">
    <SCRIPT language=JavaScript type="text/javascript" SRC="<%=thisPath%>/modules/menu/jcl/menu.js"></SCRIPT>
	<SCRIPT language=JavaScript type="text/javascript" SRC="<%=thisPath%>/modules/menu/jcl/System.js"></SCRIPT>
	<SCRIPT language=JavaScript type="text/javascript" SRC="<%=thisPath%>/modules/menu/jcl/Control.js"></SCRIPT>
	<SCRIPT language=JavaScript type="text/javascript" SRC="<%=thisPath%>/modules/menu/jcl/NavBar.js"></SCRIPT>
	<script language=JavaScript type="text/javascript" src="<%=thisPath%>/modules/menu/jcl/MenuTool.js"></script>
	<script type="text/javascript" src="<%=thisPath%>/dwr/interface/navBean.js"></script>
	<script type="text/javascript" src="<%=thisPath%>/dwr/interface/zxjlBean.js"></script>
	<script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
	<script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
</HEAD>
<BODY>
<script language="javascript">

var myNavBar = showNavBar();

var myNavBarItem = new Array();

function forInformation()
{
	
    myNavBarItem[0] = myNavBar.Add('用户基本信息');
	myNavBarItem[0].Icon.src='<%=thisPath%>/modules/menu/image/down.gif';
	myNavBarItem[0].number=0;
    var Div1=showDiv();
    showText(Div1, 1, "登录名：<%=(user.user_code==null?"":user.user_code)%>","<%=thisPath%>");
    showText(Div1, 2, "用户姓名：<%=user_name%>","<%=thisPath%>");
    showText(Div1, 3, "所属房管局：<%=dept_name%>","<%=thisPath%>");
    myNavBarItem[0].Add(Div1);
   
  
}

</script>
<%
    if (ruler_code == null || ruler_code.equals("") || ruler_code.equals("home")){

%>	

<script language="javascript">

 forInformation();

   
</script>
<%
    }
%>


</BODY>

</HTML>
