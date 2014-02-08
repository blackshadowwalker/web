<%@ page language="java" contentType="text/html;charset=GBK" isErrorPage="false"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%@ page import="modules.base.*"%>
<HTML>
<% 
    String 	thisPath=request.getContextPath();
    String 	qx=request.getParameter("ip");
	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
	String 	role_code = bform.role_code;
	String 	serverIP = request.getServerName();
	int 	serverPort = request.getServerPort();
	String 	curPage = request.getServletPath();
	String 	serverPath = "http://"+serverIP+":"+serverPort;
	String 	serverURL = serverPath + thisPath;
//	System.out.println(serverURL);
	
%>



 	<HEAD>
  <title>showMonitor PAGE</title>
    <base target="_self"/>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="css/base.css" type="text/css">
  <LINK href="<%=thisPath%>/modules/pad/css/base.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="Skin.css">
	
 <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
   <SCRIPT src="<%=thisPath%>/table_view/jquery.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/jquery-ui-1.7.2.custom.min.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/scripts/getBrowserType.js" type=text/javascript></SCRIPT>
</HEAD>

<body topmargin="0" leftmargin="0" bgcolor="#EEF5F2">

<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<input id="role_code_id" type="hidden" value="<%=bform.role_code%>"/>

<table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td  background="<%=thisPath%>/modules/pad/image/bg_top.gif">
    	<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
	        <tr>
	          <td width="20"><img src="<%=thisPath%>/modules/pad/image/icon1.gif" width="18" height="16"></td>
	          <td width="915">Monitor</td>
	        </tr>
      	</table></td>
  </tr>
</table>

<!-- 右侧栏目 -->
<div>

<table width="100%"  height="90%"  align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td rowspan="8" width="85%"  >
    	<div align="center"  id="mainPanel" style="border-right:1px dashed #000;height:100%;">
    	
    		show Minitor
    	
    	</div>
    </td>
    <td>
    	<div align="center"><a href="javascript:forxtts()">
    		<img src='<%=thisPath%>/modules/pad/image/png133_084.bmp'  width="80" height="80"></a>
    	</div>
    </td>
  </tr>
  
  <tr> 
    <td><div align="center"><a href="javascript:forxtts()">系统信息提示</a></div></td>
  </tr>
  <tr> 
    <td><div align="center"><a href="javascript:forxj()"><img src='<%=thisPath%>/modules/pad/image/png133_023.bmp'  width="80" height="80"></a></div></td>
  </tr>
  <tr> 
     <td><div align="center"><a href="javascript:forxj()">其他情况</a></div></td>
  </tr>
  
  
</table>
</div>

<script type="text/javascript">

var rows = 2;
var cols = 3;
var cameraList = new Array();
var minWH = 0;

function init()
{
	if(getBrowserOs()!="IE")
	{
		$("#mainPanel").html("<br><h1>Sorry your browser don't support the ActiveX Object!</h1>");
		return ;
	}	
	var h =	$("#mainPanel").height();
	var w = $("#mainPanel").width();
	var wh = w > h ? h/2:w;
	minWH = wh;
	var showWall="";
	showWall += "<table border=2 cellspacing=3 width="+cols*(wh)+" height="+rows*(wh)+">";
	
	for(var i=0; i<rows; i++)
	{
		showWall += "<tr>";
		for(var j=0; j<cols; j++)
		{
			var num = parseInt(i*cols + j);
			var winWH = wh>310? 310:wh;
			var objText = "";
			objText += " <OBJECT name='ocxPlay' ID=ocx_"+num.toString();
			objText += " WIDTH="+(winWH)+" HEIGHT="+(winWH);
			objText += " CODEBASE='<%=serverURL%>/activex/ocx/RBPlayOcx.cab#version=1,0,0,1'";
			objText += " CLASSID='CLSID:71494FD4-6A91-4474-A144-06466A6C955B'>";
			objText += " </OBJECT>";
			
			showWall += "<td>"
			showWall += objText;
			showWall += "</td>"
		}
		showWall += "</tr>";
	}
	showWall += "</table>";
	$("#mainPanel").html(showWall);
		
}


$(document).ready(function(){
	init();
	cameraList.push("10.168.1.220");
	cameraList.push("10.168.1.212");
	cameraList.push("10.168.1.111");
	cameraList.push("10.168.1.112");
	cameraList.push("10.168.1.113");
	cameraList.push("10.168.1.115");
//	setTimeout(play,1000);
});


function play()
{
	var ip = ""; // document.getElementById("i_ip");
	var port = "37777"; //document.getElementById("i_port");
	var userName = "admin"; // document.getElementById("i_userName");
	var passWord = "admin"; // document.getElementById("i_passWord");
	var ocxList = document.getElementsByName("ocxPlay");
	for(var i=0; i< ocxList.length; i++)
	{
		var width = minWH + 5;
		var height = minWH + 20;
		ip = cameraList[i];
		var ocxweb =ocxList[i];
		ocxweb.KMoveWindow(0,0, width, height);
		ocxweb.showControls(0);
		ocxweb.width = width;
		ocxweb.height = height;
		ocxweb.Login(ip,port,userName,passWord,0);
		var hr = ocxweb.RBStartRealPlay("", 0, 0);
	}
}

</script>

</body>

</HTML>
