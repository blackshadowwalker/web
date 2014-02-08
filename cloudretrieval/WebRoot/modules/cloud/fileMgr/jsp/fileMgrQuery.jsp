<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<% 
    String thisPath=request.getContextPath();
    
   	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ thisPath + "/";
    
    String qx=request.getParameter("qx");
    String session_id=request.getParameter("session_id");
    if(session_id==null)
    	session_id = request.getSession().getId();

    baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
    String locationId=bform.locationId; 
    String language = bform.language;
    
    System.out.println("requestSession="+request.getSession().getId());
    System.out.println("userSession="+bform.sessionID);
    
    String pagePath = (String)request.getAttribute("pagePath");
    String uploadServer = (String)request.getAttribute("uploadServer");
    String uploadroot 	= (String)request.getAttribute("uploadroot");
    String uploadurl 	= (String)request.getAttribute("uploadurl");
    String uploadpage 	= (String)request.getAttribute("uploadpage");
    String uploadflash 	= (String)request.getAttribute("uploadflash");
    String uplodpath = bform.user_code;// (String)request.getAttribute("defaultuploadpath");
	
//	String uploadServer = "http://10.168.1.250:8888";
    
    String user_dept=bform.dept_code;
    String role_code = bform.role_code;
    String user_code = bform.user_code;
    
    Date nowTime = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地日期格式 
	long curDateTime = nowTime.getTime();
	String videodatetimeString = dateFormat.format(curDateTime);
  	
  	System.out.println(videodatetimeString+"  "+language);
  	
 
   
%>
<head>
	<title><bean:message key="filemgr.title" bundle="${requestScope.language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
<link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
  <link href="<%=thisPath%>/modules/base/hx_table/css/hx_table.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  
  
   <script language="javascript" src="<%=thisPath%>/jquery/jquery.min.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/jquery.hx_table.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/tools.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  

  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/fileMgrBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/realAnalyBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/taskMgrBean.js"></script>
  
  <script language="javascript" src="<%=thisPath%>/modules/cloud/fileMgr/scripts/fileMgrObject.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/cloud/fileMgr/scripts/fileMgrScript.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
  <script language="javascript" type="text/javascript" src="<%=thisPath%>/modules/base/scripts/My97DatePicker/WdatePicker.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/swfupload/swfupload.js"></script>
	<script type="text/javascript" src="<%=thisPath%>/swfupload/handlers.js"></script>
  <style>
	.bt-add:hover{
		color:#00 solid;
		cursor:hand;
	}
	.MainTable{ 
		border-collapse:collapse; 
		width:90%; 
		border:0px #0aa solid;
	}
	.MainTable td { 
		border:0px #0aa solid;
	}
	.notRight{ 
		border-right:0px #f00 solid;
	}
	.progress{
	border:1px #000 solid;
	}
	.progress .bar {
		height: 18px;
		color: #000;
		text-align: right;
		background-color: #0a0 ;
	}
  </style>
 </head>
<body onLoad="" topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">

<div class=tip>
    <table>
        <tr>
          <td width="20"><img src="<%=thisPath%>/images/main/icon1.gif" width="18" height="16"></td>
          <td width="915">
		  <div id="path_name">
          		<!-- <bean:message key="label.pagepath" bundle="${language}"/> -->
          		<bean:message key="label.pagepath" bundle="${language}"/>
          		：<%=pagePath %>  
          	</div></td>
        </tr>
    </table>
</div>
<div class=padindex>
  <table>
    <tr>
      <td id=padindex0 class=activeindex onClick="switch_index(this, 0)">
		  <div align="center">
	     	 <bean:message key="filemgr.title" bundle="${requestScope.language}"/>
	      </div>
	  </td>
    </tr>
  </table>
</div>

<div class=padcontent>

	<div id=padcontent0 class=activecontent style="height:800px;">	
		<!-- 输入Query条件 -->
		<div id=uploaFilleDiv class=scrollarea style="height:120px;">
		<form>
				<table class=MainTable height="88" style="align:left">
				  <tr>
				  	<td  style="width:1px" class=notRight>
				  		&nbsp;
				  	</td>
					<td  style="width:400px" class=notRight>
						<div>
						<!-- 绝对时间  -->
						<span style="width:60px;">
							<font style="width:60px">
								<bean:message key="filemgr.label.time" bundle="${language}"/>:
							</font>
						</span>
						<input style="width:150px" class="" type="text" id="i_videodatetime" value="<%=videodatetimeString%>" 
							onFocus="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm:ss'})" readonly>
						<br>
						<input type="hidden" id="i_LocationId" name="LocationId" size=20 maxlength=9 value="" >
						<input type="hidden" name="LocationId_values" value="">
						<!-- 所在地点  -->
						<span style="width:60px;">
						<bean:message key="filemgr.label.location" bundle="${language}"/>:
						</span>
						<input style="width:150px" class="input-mini"  type="text" id="i_locationName" 
						name="locationName" value="" onclick="selectLocation(LocationId,'radio', LocationId_values);" readonly />
						<br>
						<!-- 时间长度 -->
							<span style="width:60px;">
								<bean:message key="filemgr.label.timespan" bundle="${language}"/>:
							</span>
							<input style="width:150px" type="input" id="i_timespan" value="300" />
							<bean:message key="filemgr.label.timeUnit" bundle="${language}"/>
						</div>

						<div class=progress style="width:210px;">
							<div id="progress-bar"  class="bar" style="width:0%"></div>
						</div>
					</td>
				  </tr>
				</table>
		</form>
		</div>
		<div id="hx_table_div" class="queryresult" ></div>
	</div>

</div>

<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<input id="basePath" type="hidden" value="<%=basePath%>"/>
<input id="qx_id" type="hidden" value="<%=qx%>"/>
<input id="session_id" type="hidden" value="<%=session_id%>"/>
<input id="uploadroot" type="hidden" value="<%=uploadroot%>"/>
<input id="user_code" type="hidden" value="<%=user_code%>"/>
<input id="uploadServer" type="hidden" value="<%=uploadServer%>"/>
<input id="uploadpage" type="hidden" value="<%=uploadpage%>"/>

<iframe name="downloadframe" style="display:none" ></iframe>

<script>
var waitObj=new hx_wait("<%=thisPath%>/modules/base/hx_wait_plugin");

			var bar = null;
			var percent  = 0;
			function setbar(){
				$("#progress-bar").width(percent+"%");
				$("#progress-bar").html(percent+"%");
				if(percent>=100)
					clearInterval(bar);
				percent++;
			}
			$(document).ready(function(){
				$("#progress-bar").width("0%");
				$("#progress-bar").html("");
			//	bar = setInterval(setbar, 100);
			});
			
			var usercode = "<%=bform.user_code%>";
			var bProcessing = false;

			function pageArgs() {
				var title = "";
				var data = "";
			}
			function getReport(retdata){ 
				var args = new pageArgs();
				args.title="<bean:message key="filemgr.title" bundle="${language}"/>-<bean:message key="label.SummaryTable" bundle="${language}"/>";
			    //显示等待条
			    /*
			    waitObj.show({
			    	left:"25%",
			    	bottom:"50%",
			    	width:"280px",
			    	height:"50px",
			    	text_align:"center",
			    	msg:"<span style=\"font-weight:bold;\"><bean:message key="msg.inProgress" bundle="${language}"/></span>"
			    });
			    */
			    if(retdata==null || retdata=="" )
			    	return ;
				var idsList = new Array();
				var taskIds = retdata.split("</C>");
				for(var j=0; j<taskIds.length-1; j++)
					idsList.push(taskIds[j]);
				taskMgrBean.taskReport(idsList, {
					callback : function(data) {
						//waitObj.hide();
						if (data != "" && data != "no" &&data != null) {
							data="序号</C>车牌号码</C>发生时间</C>地点</T>"+data;
							args.data=data;
							var srcFile = "modules/cloud/taskMgr/jsp/taskMgrReport.jsp";
							var winFeatures = "dialogHeight:"+screen.height+"px;dialogWidth:"+screen.width+"px;help:no;status:no";
							window.showModalDialog(srcFile, args,winFeatures);
						}else {
							alert("<bean:message key="msg.error.dataEmputy" bundle="${language}"/>");
						}
				        
			       },
			       exceptionHandler : function(err_info) {
			       		//waitObj.hide();
			       		alert(err_info);
			       }
			      });
			}
			var timeHandle = null;
			function getPercent(){
				realAnalyBean.getCurPercent({
					callback : function(percent) {
						var lprocessing = '<bean:message key="filemgr.process.processing" bundle="${language}"/>';
						var lpercent = '<bean:message key="filemgr.process.percent" bundle="${language}"/>';
						//正在处理,已完成
						$("#progress-bar").width(percent +"%");
						/*
						var p = processing+ " "+ percent +"%";
						progressE.innerHTML = p;
						*/
						if(parseInt(percent)==100){
							bProcessing = false;
							clearInterval(timeHandle);
							getReport();
						}
					},
					exceptionHandler : function(err_info) { alert(err_info);}
				});
			}
			
	
	window.onbeforeunload = function(event) {
		if(forUploadFileNum>0){
			return window.returnValue = "文件还在上传，确定退出吗?";
		}
		else if(bProcessing)
			return window.returnValue = "正在分析视频，确定退出吗?";
		//window.opener = null;
	} 
	
	
	var index = new Array();
	var  s="";
	function forGet(){
	    s="";
		var checkList = $("input[name='checkList']:checkbox:checked");
		for(var i=0; i<checkList.length; i++){
			var cheId = checkList[i].id;
			var taskId = cheId.substring(6,cheId.length);
	        s += taskId+",";
		}
	}
	
	function selectLocation(locationID,type, hiddenValues) //
			{
				var thispath = "<%=thisPath%>";
				var locID = "<%=locationId%>";
				var srcFile = thispath+"/modules/base/jsp/locationtree.jsp?jgbm="+locID+"&type="+type;
				var winFeatures = "dialogHeight:600px;dialogWidth:450px;help:no;status:no";
				var inArray = window.showModalDialog(srcFile, hiddenValues.value, winFeatures);
				if (typeof(inArray) == "undefined"||inArray == "")
				{
				    //test.value = "";
				}
				else
				{
					hiddenValues.value=inArray+"</R>";
					var id = inArray.split("</C>")[1];
					var name = inArray.split("</C>")[2];
					locationID.value = id;
					$("#i_locationName").val(name);
					$("#i_LocationId").val(id);
				}
			}
</script>
</body>