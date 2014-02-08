<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<html>

<%
    String thisPath=request.getContextPath();
	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
	String user_loc=bform.locationId;
	String usercode=bform.user_code;
	String v_content=(String)request.getSession().getAttribute("v_content");
	//System.out.println(v_content);
%>

<head>
  <title> ”∆µπ€ø¥</title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/casemanageBean.js"></script>
  <script language="javascript" type="text/javascript" src="<%=thisPath%>/modules/base/scripts/My97DatePicker/WdatePicker.js"></script>
  <style type="text/css">
  	.ttr{background-color:#9DD1E7;boder:1px;}
  	.ttd{background-color:#E8F2FE;boder:1px;}
  	.tts{background-color:#2259D7;boder:1px;};
  	.no{background-color:white;};
  </style>
</head>
<script language="javascript">
    var args = window.dialogArguments;
</script>
<body>
<div class=cardbody style=text-align:center >
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
</div>
<table id="mark_data" width="100%" cellspacing='1'>
	<tr id="operate_tr">
		<td colspan="5" align="left" >
			<span id="bt2"><a href='javascript:forModify()'><bean:message key="button.modify" bundle="${language}"/> </a>  <a href='javascript:forDelete()'><bean:message key="button.delete" bundle="${language}"/></a></span>
		</td>
		<td align="right">
			<span id="bt1" style="display:none" ><a href='javascript:forSure()'><bean:message key="button.submit" bundle="${language}"/> </a> <a href='javascript:forCancel()'><bean:message key="button.cancel" bundle="${language}"/></a></span>
			<span id="bt3" style="display:none" ><a href='javascript:for_m_sure()'><bean:message key="button.submit" bundle="${language}"/> </a> <a href='javascript:for_m_cancel()'><bean:message key="button.cancel" bundle="${language}"/></a></span>		
		</td>
	</tr>
	<tr>
		<td class="ttr" width=55><bean:message key="casemgr.view.label.caseid" bundle="${language}"/></td>
		<td class="ttr" width=55><bean:message key="casemgr.view.label.videoid" bundle="${language}"/></td>
		<td class="ttr" width=73><bean:message key="casemgr.view.label.videotime" bundle="${language}"/></td>
		<td class="ttr" width=50><bean:message key="casemgr.view.label.updater" bundle="${language}"/></td>
		<td class="ttr" width=100><bean:message key="casemgr.view.label.updatetime" bundle="${language}"/></td>
		<td class="ttr" width=180><bean:message key="casemgr.view.label.comment" bundle="${language}"/></td>
	</tr>
	<%=v_content %>
</table>
<input id="mark_id" type="button" value="<bean:message key="casemgr.view.button.mark" bundle="${language}"/>" style="position:absolute;z-index:999;top:276px;left:400px;" onclick="mark();" />
<input type="button" value="<bean:message key="button.close" bundle="${language}"/>" style="position:absolute;z-index:999;top:276px;left:450px;" onclick="window.close();" />
<script language="JavaScript">
	var wmp = document.getElementById("WMP");
	var mark_judge=1;
	var selected_id=0;
	var selected_content="";
	
	if(args.split("</C>")[1]==""){
		$("#mark_id").hide();
		$("#mark_data").hide();
	}
	if(args.split("</C>")[2]=="detail"){
		$("#mark_id").hide();
		$("#operate_tr").hide();
	}
	dwr.engine.setAsync(false);
		casemanageBean.videoDetail(args.split("</C>")[0],
		{
			callback:function(data){
				if(data!=null && data!=""){
					wmp.url=data;
				}else {
					alert("<bean:message key="msg.error.dataEmputy" bundle="${language}"/>");
				}
			},
			exceptionHandler : function(err_info) {

				stop_scrollbar(timer, "");

				if (err_info != "") {
					alert(err_info);
					if (err_info.indexOf("<bean:message key="msg.error.error" bundle="${language}"/>") < 0) {
						window.open(thispath + "/logoffAction.do?"
										+ new Date(), "_parent");
					}
				} else {
					alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
					window.open(
							thispath + "/logoffAction.do?" + new Date(),
							"_parent");
				}
			}
		});
    dwr.engine.setAsync(true);
	
    function mark(){
    	wmp.controls.pause();
    	$("#bt1").show();
    	$("#bt2").hide();
    	if(mark_judge==0){
    		alert("<bean:message key="casemgr.view.commitbefor" bundle="${language}"/>");
    		return;
    	}
    	
    	//alert("video_time:"+wmp.controls.currentPosition);
    	//alert("video_id:"+args.split("</C>")[0]);
    	//alert("case_id:"+args.split("</C>")[1]);
    	
    	var tbl=document.getElementById("mark_data");
    	var nextRow = tbl.insertRow(2);
    	//nextRow.onclick=function(){("alert(123)");};
    	nextRow.setAttribute("id","0");
    	nextRow.onclick=function(){jump(this);};  
    	
    	var newCell = nextRow.insertCell(0);
    	newCell.setAttribute("className","ttd");
    	newCell.innerHTML = args.split("</C>")[1];
    	
    	var newCell = nextRow.insertCell(1);
    	newCell.setAttribute("className","ttd");
    	newCell.innerHTML = args.split("</C>")[0];
    	
    	var newCell = nextRow.insertCell(2);
    	newCell.setAttribute("className","ttd");
    	newCell.innerHTML=wmp.controls.currentPosition;
    	
    	var newCell = nextRow.insertCell(3);
    	newCell.setAttribute("className","ttd");
    	newCell.innerHTML="<%=usercode %>";
    	
    	var newCell = nextRow.insertCell(4);
    	newCell.setAttribute("className","ttd");
    	newCell.innerHTML=new Date().getFullYear()+"-"+(new Date().getMonth()+1)+"-"+new Date().getDate()+"-"+new Date().toLocaleTimeString();
    	
    	var newCell = nextRow.insertCell(5);
    	newCell.setAttribute("className","ttd");
    	newCell.innerHTML="<textarea id='comment'></textarea>";
    	
    	if(selected_id!=0){
			var tr=document.getElementById(selected_id);
			for(i=0;i<tr.cells.length;i++){
				tr.cells[i].setAttribute("className","ttd");
			}
		}
		
		selected_id=0;
    	
    	mark_judge=0;
    }
    
	function forSure(){	
		var tbl=document.getElementById("mark_data");
		
		var sqlString="insert into t_m_videocomment (videoId,caseId,content,videoTime,user,ctTime) values (" +
		"'"+tbl.rows[2].cells[1].innerHTML+"','"+tbl.rows[2].cells[0].innerHTML+"'," +
		"'"+$("#comment").val()+"','"+tbl.rows[2].cells[2].innerHTML+"'," +
		"'"+tbl.rows[2].cells[3].innerHTML+"','"+tbl.rows[2].cells[4].innerHTML+"');";
		
		dwr.engine.setAsync(false);
		casemanageBean.addVideoComment(sqlString,tbl.rows[2].cells[4].innerHTML,
		{
			callback:function(data){
				if(data!=0){
					tbl.rows[2].setAttribute("id",data)
					
					tbl.rows[2].cells[5].innerHTML=$("#comment").val();
					mark_judge=1;
					wmp.controls.play();
					$("#bt2").show();
			    	$("#bt1").hide();
				}else {
					alert("<bean:message key="button.insert" bundle="${language}"/><bean:message key="msg.modify.failed" bundle="${language}"/>");
				}
			},
			exceptionHandler : function(err_info) {

				stop_scrollbar(timer, "");

				if (err_info != "") {
					alert(err_info);
					if (err_info.indexOf("<bean:message key="msg.error.error" bundle="${language}"/>") < 0) {
						window.open(thispath + "/logoffAction.do?"
										+ new Date(), "_parent");
					}
				} else {
					alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
					window.open(
							thispath + "/logoffAction.do?" + new Date(),
							"_parent");
				}
			}
		});
    	dwr.engine.setAsync(true);
	}
	function forCancel(){	
		var tbl=document.getElementById("mark_data");
		tbl.deleteRow(2);
		mark_judge=1;
		wmp.controls.play();
		$("#bt2").show();
    	$("#bt1").hide();
	}
	
	function forModify(){
		if(selected_id==0){
			alert("<bean:message key="msg.pleaseSelect" bundle="${language}"/>");
			return;
		} 
		
		$("#bt3").show();
    	$("#bt2").hide();
		
		var tr=document.getElementById(selected_id);
		selected_content=tr.cells[5].innerHTML;
		tr.cells[3].innerHTML="<%=usercode %>";
		tr.cells[4].innerHTML=new Date().getFullYear()+"-"+(new Date().getMonth()+1)+"-"+new Date().getDate()+"-"+new Date().toLocaleTimeString();
		tr.cells[5].innerHTML="<textarea id='comment'></textarea>";
	}
	function forDelete(){
		if(selected_id==0){
			alert("<bean:message key="msg.pleaseSelect" bundle="${language}"/>");
			return;
		}
		if(confirm("<bean:message key="msg.areYouSure" bundle="${language}"/><bean:message key="msg.delete" bundle="${language}"/>?")){
			var sqlString="update t_m_videocomment set status=0 where id="+selected_id;
			dwr.engine.setAsync(false);
			casemanageBean.deleteVideoComment(sqlString,
			{
				callback:function(data){
					if(data>0){
						var tr=document.getElementById(selected_id);
						for(i=0;i<tr.cells.length;i++){
							tr.cells[i].setAttribute("className","no");
							tr.cells[i].innerHTML="";
						}
						selected_id=0;
					}else {
						alert("<bean:message key="button.insert" bundle="${language}"/><bean:message key="msg.modify.failed" bundle="${language}"/>");
					}
				},
				exceptionHandler : function(err_info) {
	
					stop_scrollbar(timer, "");
	
					if (err_info != "") {
						alert(err_info);
						if (err_info.indexOf("<bean:message key="msg.error.error" bundle="${language}"/>") < 0) {
							window.open(thispath + "/logoffAction.do?"
											+ new Date(), "_parent");
						}
					} else {
						alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
						window.open(
								thispath + "/logoffAction.do?" + new Date(),
								"_parent");
					}
				}
			});
	    	dwr.engine.setAsync(true);
	
			//var tbl=document.getElementById("mark_data");
			//tbl.deleteRow(tr.rowIndex); 
		}
	}
	function for_m_sure(){
		var tr=document.getElementById(selected_id);
		
		var sqlString="update t_m_videocomment set " +
		"content='"+$("#comment").val()+"', " +
		"user='"+tr.cells[3].innerHTML+"', "+
		"ctTime='"+tr.cells[4].innerHTML+"' " +
		"where id='"+tr.id+"'";

		dwr.engine.setAsync(false);
		casemanageBean.updateVideoComment(sqlString,
		{
			callback:function(data){
				if(data>0){
					tr.cells[5].innerHTML=$("#comment").val();
					$("#bt2").show();
			    	$("#bt3").hide();
				}else {
					alert("<bean:message key="button.insert" bundle="${language}"/><bean:message key="msg.modify.failed" bundle="${language}"/>");
				}
			},
			exceptionHandler : function(err_info) {

				stop_scrollbar(timer, "");

				if (err_info != "") {
					alert(err_info);
					if (err_info.indexOf("<bean:message key="msg.error.error" bundle="${language}"/>") < 0) {
						window.open(thispath + "/logoffAction.do?"
										+ new Date(), "_parent");
					}
				} else {
					alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
					window.open(
							thispath + "/logoffAction.do?" + new Date(),
							"_parent");
				}
			}
		});
    	dwr.engine.setAsync(true);
	}
	function for_m_cancel(){
		var tr=document.getElementById(selected_id);
		tr.cells[5].innerHTML=selected_content;
		$("#bt2").show();
    	$("#bt3").hide();
	}
	
	function jump(t){
		//alert(t.id)
		if(t.id==0) return;
		if(selected_id!=0){
			var tr=document.getElementById(selected_id);
			for(i=0;i<tr.cells.length;i++){
				tr.cells[i].setAttribute("className","ttd");
			}
		}
		for(i=0;i<t.cells.length;i++){
			t.cells[i].setAttribute("className","tts");
		}
		selected_id=t.id;
		wmp.controls.currentPosition=t.cells[2].innerHTML;
	}
</script> 
</body>

</html>
