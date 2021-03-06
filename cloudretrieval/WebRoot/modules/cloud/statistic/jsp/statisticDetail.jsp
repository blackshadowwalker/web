<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>

<%
    String thisPath=request.getContextPath();
    String picture = (String)request.getSession().getAttribute("picture");

%>

<head>
  <title><bean:message key="report.name" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/statisticBean.js"></script> 
</head>

<body style=overflow:scroll >

<div class=cardbody style=width:350px;float:left; >

  <table width=100% cellSpacing=1 cellPadding=0 class="tablestyle">

<script>

    var rowID = window.dialogArguments;

    dwr.engine.setAsync(false);

    statisticBean.statisticDetail(rowID,
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
        
            colElements=rowElements[0].split("</C>");
            
            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="report.label.id" bundle="${language}"/></td>");
            document.write("<td class=tablebody>"+colElements[0]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="report.label.plnumber" bundle="${language}"/></td>");
            document.write("<td class=tablebody>"+colElements[1]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="report.label.framects" bundle="${language}"/></td>");
            document.write("<td class=tablebody>"+colElements[2]+"</td></tr>");

            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="report.label.abstime" bundle="${language}"/></td>");
            document.write("<td class=tablebody>"+colElements[3]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead width=150px><bean:message key="report.label.location" bundle="${language}"/></td>");
            document.write("<td class=tablebody>"+colElements[6]+"</td></tr>");
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

  </table>

<br />
<p id="i_image" style="width:350px; height:180px;" >
 <img id="img_" alt="" src="" width=100%  onclick="v();" />
</p>
<br />


<button  onClick="this.style.display = 'none';  window.print();" class="button"><bean:message key="button.label.print" bundle="${language}"/></button>
<button onclick="showBigPic()"><bean:message key="button.label.showbigpic" bundle="${language}"/></button>
<button name="button" onClick="forAbort()" class="button"><bean:message key="button.label.close" bundle="${language}"/></button>

</div>

<div id="allmap" style=width:470px;float:left;padding-left:2px;padding-top:10px;  onmouseup="setTimeout('jump()',3);">
	<OBJECT id=WMP height=400 width=460 standby=Loading... 
		classid=clsid:6BF52A52-394A-11D3-B153-00C04F79FAA6>
		<PARAM NAME="URL" VALUE="">
		<PARAM NAME="rate" VALUE="1">
		<PARAM NAME="balance" VALUE="0">
		<PARAM NAME="currentPosition" VALUE="1">
		<PARAM NAME="playCount" VALUE="1">
		<PARAM NAME="autoStart" VALUE="1">
		<PARAM NAME="currentMarker" VALUE="1">
		<PARAM NAME="invokeURLs" VALUE="-1">
		<PARAM NAME="baseURL" VALUE="">
		<PARAM NAME="volume" VALUE="50">
		<PARAM NAME="defaultFrame" VALUE="">
		<PARAM NAME="mute" VALUE="0">
		<PARAM NAME="uiMode" VALUE="full">
		<PARAM NAME="stretchToFit" VALUE="0">
		<PARAM NAME="windowlessVideo" VALUE="0">
		<PARAM NAME="enabled" VALUE="-1">
		<PARAM NAME="enableContextMenu" VALUE="-1">
		<PARAM NAME="fullScreen" VALUE="0">
		<PARAM NAME="SAMIStyle" VALUE="">
		<PARAM NAME="SAMILang" VALUE="">
		<PARAM NAME="SAMIFilename" VALUE="">
		<PARAM NAME="captioningID" VALUE="">
	</OBJECT> 
</div>
<script language="JavaScript"> 

var wmp = document.getElementById("WMP");
//alert("http://10.168.1.160:81/_schlitterdevMediaRoot/HOME_admin/"+colElements[7])
wmp.url=colElements[5];
if(colElements[4].indexOf("://")>0)
	document.getElementById("img_").src=colElements[4];
else
	document.getElementById("img_").src="<%=thisPath%>/"+colElements[4];

	
	function jump(){
	if(wmp.playState==2 || wmp.playState==1 ){
		var time=wmp.controls.currentPosition;
		
		wmp.controls.currentPosition=time;
		wmp.controls.play();
		wmp.controls.pause();
		//alert(wmp.controls.currentPosition);
	}
}
function showBigPic(){
	window.open(colElements[4]);
}
function forAbort()    
{         
    window.close();
} 
function v(){
	if(wmp.playState==2 || wmp.playState==1 ){
		wmp.controls.currentPosition=colElements[2]/1000/1000;
		wmp.controls.play();
		wmp.controls.pause();
	}
	wmp.controls.currentPosition=colElements[2]/1000/1000;
}
</script> 

</body>

</html>
