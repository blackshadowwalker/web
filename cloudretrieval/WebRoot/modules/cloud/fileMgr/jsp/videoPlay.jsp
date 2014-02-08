<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>

<%
    String thisPath=request.getContextPath();
%>

<head>
  <title><bean:message key="filemgr.videoPlayback" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">  
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/fileMgrBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
</head>

<body style=overflow:scroll >
<div align="center">
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
	</OBJECT><br>
</div>
     <button  name="button" onClick="forAbort()" class="button"><bean:message key="casemgr.closevideo" bundle="${language}"/></button>
<script>

    var rowID = window.dialogArguments;
    var wmp = "";
    dwr.engine.setAsync(false);

    fileMgrBean.getUrl(rowID,
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
            
            colElements=rowElements[0].split("</C>");
            wmp = document.getElementById("WMP");
            if(colElements.length>4){
            	 wmp.url=colElements[0]+"/"+colElements[1]+"/"+colElements[2]+"/"+colElements[3];
            }else{
            	wmp.url=colElements[0]+"/"+colElements[1]+"/"+colElements[2];
            }
            
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
            	alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");//连接超时，系统自动退出
                window.open("<%=thisPath%>/logoffAction.do?"+new Date(),"_parent");
            }
        }
    });
    dwr.engine.setAsync(true);
</script>



<script language="JavaScript"> 

function forAbort()    
{         
    window.close();
} 
</script> 

</body>

</html>
