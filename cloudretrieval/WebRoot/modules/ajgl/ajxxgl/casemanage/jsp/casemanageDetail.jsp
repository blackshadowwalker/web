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
  <title><bean:message key="casemgr.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/casemanageBean.js"></script>
</head>

<body>

<div class=cardbody >

  <table width=100% cellSpacing=1 cellPadding=0 class="tablestyle">

<script>
    var rowID = window.dialogArguments;

    dwr.engine.setAsync(false);

    casemanageBean.detailCase(rowID,
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
        
            colElements=rowElements[0].split("</C>");

            document.write("<tr><td class=tablebodyhead width=150px>"+"<bean:message key="casemgr.label.caseName" bundle="${language}"/>"+"</td>");
            document.write("<td class=tablebody>"+colElements[0]+"</td></tr>")
            document.write("<tr><td class=tablebodyhead width=150px>"+"<bean:message key="casemgr.label.caseType" bundle="${language}"/>"+"</td>");
            document.write("<td class=tablebody>"+colElements[1]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead>"+"<bean:message key="casemgr.label.caseNo" bundle="${language}"/>"+"</td>");
            document.write("<td class=tablebody>"+colElements[2]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead>"+"<bean:message key="casemgr.label.receiptNo" bundle="${language}"/>"+"</td>");
            document.write("<td class=tablebody>"+colElements[3]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead>"+"<bean:message key="casemgr.label.creator" bundle="${language}"/>"+"</td>");
            document.write("<td class=tablebody>"+colElements[4]+"</td></tr>");
            
            document.write("<tr><td class=tablebodyhead>"+"<bean:message key="casemgr.label.department" bundle="${language}"/>"+"</td>");
            document.write("<td class=tablebody>"+colElements[5]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead>"+"<bean:message key="casemgr.label.caseTime" bundle="${language}"/>"+"</td>");
            document.write("<td class=tablebody>"+colElements[6]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead>"+"<bean:message key="casemgr.label.caseStatus" bundle="${language}"/>"+"</td>");
            document.write("<td class=tablebody>"+colElements[7]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead>"+"<bean:message key="casemgr.label.area" bundle="${language}"/>"+"</td>");
            document.write("<td class=tablebody>"+colElements[8]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead>"+"<bean:message key="casemgr.label.location" bundle="${language}"/>"+"</td>");
            document.write("<td class=tablebody>"+colElements[9]+"</td></tr>");
            document.write("<tr><td class=tablebodyhead>"+"<bean:message key="casemgr.label.videos" bundle="${language}"/>"+"</td>");
            document.write("<td class=tablebody><select id='sel' onchange='showvideo(this.value);'></select></td>");
            rowElements=data.split("|");
            colElements=rowElements[1].split("</C>");
            
           	sel_o=colElements[0].split(",");
            sel_v=colElements[1].split(",");
            sel_u=colElements[2].split(",");
            sel_p=colElements[3].split(",");
            sel_i=colElements[4].split(",");
         	if(sel_i!="" && sel_i!=null && sel_i!="null"){
	            var select=document.getElementById("sel");
	            
	            select.options[0]=new Option("请选择...","");
	            for(i=0;i<sel_o.length;i++){
	            	//select.options[i+1]=new Option(sel_o[i],sel_u[i]+"/"+sel_p[i]+"/"+sel_v[i]);
	            	select.options[i+1]=new Option(sel_o[i],sel_i[i]);
	            }
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
                alert("连接超时，系统自动退出。");
                window.open("<%=thisPath%>/logoffAction.do?"+new Date(),"_parent");
            }
        }
    });
    dwr.engine.setAsync(true);
    
   /* function showvideo(v){
		var wmp = document.getElementById("WMP");
		wmp.url=v;
		document.getElementById("v_d").style.display="";
    }*/
    
    function showvideo(id){
    	if(id==null || id=="" || id=="null" || id=="请选择..."){
    		//alert("选择错误，或无此视频！");
    		return;
    	}
   		var srcFile = "viewvideo.jsp";
		var winFeatures = "dialogHeight:600px;dialogWidth:580px;help:no;status:no";
		var para;
		para=id+"</C>"+rowID+"</C>detail";
		dwr.engine.setAsync(false);
		casemanageBean.videoSession(id,rowID,
		{
			
		});
	    dwr.engine.setAsync(true);
		
		window.showModalDialog(srcFile, para, winFeatures);
			
	}
</script>

  </table>

<button name="button" onClick="forAbort()" class="button"><bean:message key="button.label.close" bundle="${language}"/></button>

</div>

<%--<div id="v_d" style=display:none;position:absolute;top:1px;left:5px;>
		<OBJECT id=WMP height=300 width=500 standby=Loading... 
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
	<input type="button" value="<bean:message key="casemgr.closevideo" bundle="${language}"/>" onclick="document.getElementById('v_d').style.display='none'" />
	
</div>

--%><script language="JavaScript">    

function forAbort()    
{         
    window.close();    
} 

</script> 
</body>

</html>
