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
    String qx=request.getParameter("qx");

    baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
    String locationId=bform.locationId; 
    String language = bform.language;
    
    String pagePath = (String)request.getAttribute("pagePath");
    String uploadServer = (String)request.getAttribute("uploadServer");
    String uploadroot 	= (String)request.getAttribute("uploadroot");
    String uploadurl 	= (String)request.getAttribute("uploadurl");
    String uploadflash 	= (String)request.getAttribute("uploadflash");
    String uplodpath = bform.user_code;// (String)request.getAttribute("defaultuploadpath");
	
//	String uploadServer = "http://10.168.1.250:8888";
    
    String user_dept=bform.dept_code;
    String role_code = bform.role_code;
    
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
		border:1px #0aa solid;
	}
	.MainTable td{ 
		border:1px #0aa solid;
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
      <td id=padindex1 class=hiddenindex onClick="switch_index(this, 1)" style="display:none">
		<div align="center">ForMoreInfo</div>
	  </td>
    </tr>
  </table>
</div>

<div class=padcontent>

	<div id=padcontent0 class=activecontent style="height:800px;">	
		<!-- 输入Query条件 -->
		<div id=uploaFilleDiv class=scrollarea style="height:120px;">
		<form>
				<table class=MainTable width="505" height="88" style="align:left">
				  <tr>
					<td style="width:160px;">
						<div>
							<input style="width:60px;" type="button"  id="swfu_placeholder"  value="..." >
						</div>
					</td>
					<td style="width:250px;" width="50px">
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
					
					<div id=bAutoProcess style="display:none">
					<!-- 自动处理 -->
						<span style="width:90px;">
						<bean:message key="button.autoProcess" bundle="${language}"/>
						:</span><input type="checkbox" id = i_autoProcess />
					</div>
					</td>
					<td style="width:400px;">
						<div class=progress style="width:300px;">
							<div id="progress-bar"  class="bar" style="width:0%"></div>
						</div>
						<div>
							<span id="swfu-upload-progress">0%</span>
						</div>
					</td>
					<td valign="top">
						<div id="fileListOut" style="border:0px solid #0f0;width:200px;"></div>
					</td>
				  </tr>
				</table>
		</form>
		</div>
		<div id="hx_table_div" class="queryresult" ></div>
	</div>
<!-- 上传 -->

	<div id=padcontent1 class=hiddencontent >

	<table class=cardname>
	  <tr>
		<td class=cardnameleft></td>
		<td class=cardnameright>a</td>
	  </tr>
	</table>

<!-- 输入 -->

	<form>
	
	<div class=inputarea style="height:450px;">
		<br>
		<script>
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
		<div>
			<select id="fileList" size="10" style="width:200px;">
			</select>
			<select id="fileIds" size="10" style="width:200px;">
			</select>
		</div>
		<span id="swfu-upload-status">	</span>
		<input type="hidden" id="i_videoSum" value="0">
		<div style="display:"  >
			<textarea id="debug_info" cols="150" rows="22" >
			</textarea>
		</div>

		<script>
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
			
			var progressE = document.getElementById('swfu-upload-progress');//文件上传进度节点
			var statusE = document.getElementById('swfu-upload-status');//文件上传进度节点
			var debuginfo = document.getElementById('debug_info');
			var fileList = document.getElementById('fileList');
			var fileIds = document.getElementById('fileIds');
			
			var startUploadTime = null;
			var endUploadTime = null;
			
			var usercode = "<%=bform.user_code%>";
			var bProcessing = false;

			function btStartUpload(){
				if($("#i_LocationId").val()==""){
					alert("<bean:message key="filemgr.error.selectLocation" bundle="${language}"/>!");//请选择地点
					$("#i_LocationId").focus();
					return ;
				}else{
					swfu.stopped = false;
					startUploadTime = new Date();
					//alert(startUploadTime.toLocaleString());
					swfu.startUpload();//开始上传
					swfu.setButtonDisabled(true);//禁用上传按钮
					
				}
			}

			//文件选择窗口关闭事件处理
			//如果有文件成功选择并添加到上传队列，则自动上传
			var forUploadFileNum = 0;
			var fileSum = 0;
			function fileDialogComplete(selectedNum, queuedNum) {
				forUploadFileNum = selectedNum;
				fileSum = selectedNum;
				if (queuedNum > 0) {//选择并添加到上传队列的文件数大于0
					$("#fileListOut").html("");
					$("#i_videoSum").val("0");
					statusE.innerHTML = "";
					btStartUpload();
				}
			}
			function fileDialogStart(){
				fileList.options.length=0;
				fileIds.options.length=0;
			}
			function setSelect(fileName){
				for(var i=0; i<fileList.options.length; i++){
					if(fileName==fileList.options[i].text)
						fileList.options[i].selected = true;
					else
						fileList.options[i].selected = false;
				}
			}
			var lselectFiles = '<center><span class="btn-txt"><bean:message key="button.selectFiles" bundle="${language}"/></span></center>';
			var swfuOption = {//swfupload选项
					//	http://10.168.1.160:8080/fileUpload/upload.jsp?savePath=test
					upload_url:"<%=uploadServer%>/<%=uploadurl%>", //接收上传的服务端url
					//	http://10.168.1.160:8080/fileUpload/swfupload/swfupload.swf
					flash_url:"<%=uploadServer%>/<%=uploadflash%>",//swfupload压缩包解压后swfupload.swf的url
					
					file_types : "*.mp4;*.avi",//允许上传的文件类型
					file_types_description: "Video Files",//文件类型描述
					file_upload_limit:10,
					file_size_limit : "0", 	
					
					post_params : {
					"uploadroot" : "<%=uploadroot%>",
					"savePath" : "videos",
					"fileTypes" : "mp4,avi",
					"fileNum" : "0",
					use_query_string : true
					},
					
					button_text_top_padding: 6,//文字距按钮顶部距离
					button_text_left_padding: 50,//文字距离按钮左边距离
					button_width: 150, //按钮宽度
					button_height: 45, //按钮高度
					
					button_image_url:"<%=thisPath%>/swfupload/images/swfu_bgimg.jpg",
					button_text: lselectFiles,//按钮文字
					button_placeholder_id:"swfu_placeholder",

					debug: true,//开启调试模式
					debug_handler : debug_function,
					
					file_dialog_complete_handler: fileDialogComplete,//文件选择对话框关闭
					upload_progress_handler: uploadProgress,//文件上传中
					upload_error_handler: uploadError,//文件上传出错
					upload_success_handler: uploadSuccess,//文件上传成功
					upload_complete_handler: uploadComplete,
					swfupload_loaded_handler: flashReady,
					file_queued_handler: fileQueued,//当文件选择对话框关闭消失时，如果选择的文件成功加入上传队列，那么针对每个成功加入的文件都会触发一次该事件（N个文件成功加入队列，就触发N次此事件）。
					file_dialog_start_handler: fileDialogStart,
					upload_start_handler: uploadStart
				}
			var swfu=null;
			window.onload = function(){
				 swfu = new SWFUpload(swfuOption);
				// swfu.stopped = false;
			}
			function uploadStart(file){
				var uploadpath = usercode; 
				if ($("#i_autoProcess").attr("checked")==true )
					uploadpath  = usercode; 
				else
					uploadpath = "videos";
				var postobj = { "uploadroot" : "<%=uploadroot%>",
								"savePath" : uploadpath,
								"fileTypes" : "mp4,avi",
								"fileNum" : fileSum-forUploadFileNum
								};
				swfu.setPostParams(postobj);
				
				swfu.setUseQueryString(true);
				setSelect(file.name);
			}
			//上传过程事件处理
			//用来动态显示文件上传进度
			function uploadProgress(file, curBytes, totalBytes) {
				var tb = totalBytes*1.0/1024/1024;
				var cb = curBytes*1.0/1024/1024;
			//	progressE.innerHTML = ['正在上传：', file.name, '<br />总尺寸：', tb.toFixed(3), 'M<br />已上传：', cb.toFixed(3), 'M<br />进度：', parseInt((curBytes/totalBytes)*100), '%'].join('');
				var beUploading = '<bean:message key="filemgr.label.uploading" bundle="${language}"/>';
				var TotalSize = '<bean:message key="filemgr.label.totalSize" bundle="${language}"/>';
				var CurSize = '<bean:message key="filemgr.label.curSize" bundle="${language}"/>';
				var Percent = '<bean:message key="filemgr.label.percent" bundle="${language}"/>';
				var percentInt =parseInt((curBytes/totalBytes)*100);
				progressE.innerHTML = [beUploading,':', file.name, '<br />',TotalSize,':', tb.toFixed(3), 'M<br />',CurSize,':', cb.toFixed(3), 'M<br />',Percent,':',percentInt , '%'].join('');
				
				$("#progress-bar").width(percentInt+"%");
				$("#progress-bar").html(percentInt+"%");
			}
			
			//上传过程中出错
			function uploadError(file, errCode, msg) {
			//	progressE.innerHTML = ['<br />文件[', file.name, ']上传出错，出错代码：[', errCode, ']，出错原因：', msg].join('');
				progressE.innerHTML = ['<br />文件[', file.name, ']上传出错，出错代码：[', errCode, ']，出错原因：', msg].join('');
			}
			
			//上传成功
			function uploadSuccess(file, data) {
				var ret = 0;
				
			//	statusE.innerHTML += ['<br />文件[', file.name, ']结束上传'].join('');
				var fileListOut = document.getElementById('fileListOut');
				var datas = data.split(",");
				if(datas[1]>0){
					var luploadsuccess = '<bean:message key="filemgr.upload.success" bundle="${language}"/>';
					fileListOut.innerHTML += [luploadsuccess,'[',file.name,',',data,']'].join('') +"<br>";
					//write to database
					var videodatetime = $("#i_videodatetime").val();
					var  str = videodatetime.toString();
			       	str =  str.replace(/-/g,"/");
			   		var strDate = new Date(str);
			   		
					var fileNumOfUpload = parseInt($("#i_videoSum").val());
					var timespan = parseInt($("#i_timespan").val());
					if(timespan=="")
						timespan = 0;
					var timeLong = fileNumOfUpload * timespan * 1000 + strDate.getTime();
					
					var usercode = "<%=uplodpath%>";
					if ($("#i_autoProcess").attr("checked")==true )
						uploadpath  = usercode; 
					else
						uploadpath = "videos";
					fileMgrBean.uploadFile(file.name, uploadpath, timeLong, $("#i_LocationId").val(), datas[2], {
						callback : function(retdata) {
							ret = retdata;
							if(retdata<1){
								fileListOut.innerHTML += ['上传失败[',file.name,',',data,']'].join('') +"<br>";
								return;
							}
							else{
								fileSum = parseInt($("#i_videoSum").val());
								fileSum ++;
								$("#i_videoSum").val(fileSum);
								fileIds.options.add(new Option(ret, ret));
								var lfile='<bean:message key="filemgr.upload.file" bundle="${language}"/>'; 
								var lfileUploadSuccess='<bean:message key="filemgr.upload.fileUploadSuccess" bundle="${language}"/>'; 
								var lreturns='<bean:message key="filemgr.upload.returns" bundle="${language}"/>'; 
								statusE.innerHTML += ['<br />',lfile,'[', file.name, '-',ret, '-]',lfileUploadSuccess,',',lreturns,':', data].join('');
							}
							if(forUploadFileNum<1)
								startProcess();
						},
						exceptionHandler : function(err_info) { alert(err_info);}
					});
				}
				else
					fileListOut.innerHTML += ['上传失败[',file.name,',',data,']'].join('') +"<br>";
									
				
				//alert(file.name);
			}
			function pageArgs() {
				var title = "";
				var data = "";
			}
			function getReport(retdata){ 
				var args = new pageArgs();
				args.title="任务管理-报表";
			    //显示等待条
			    /*
			    waitObj.show({
			    	left:"25%",
			    	bottom:"50%",
			    	width:"280px",
			    	height:"50px",
			    	text_align:"center",
			    	msg:"<span style=\"font-weight:bold;\">系统数据正在<bean:message key="button.query" bundle="${language}"/>，请等待...</span>"
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
						if (data != "" && data != "no" &&data != null) {
							data="序号</C>车牌号码</C>发生时间</C>地点</T>"+data;
							args.data=data;
							var srcFile = "modules/cloud/taskMgr/jsp/taskMgrReport.jsp";
							var winFeatures = "dialogHeight:"+screen.height+"px;dialogWidth:"+screen.width+"px;help:no;status:no";
							window.showModalDialog(srcFile, args,winFeatures);
						}else {
							alert("<bean:message key="msg.error.dataEmputy" bundle="${language}"/>");
						}
				       // waitObj.hide();
			       },
			       exceptionHandler : function(err_info) {
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
						var p = processing+ " "+ percent +"%";
						progressE.innerHTML = p;
						if(parseInt(percent)==100){
							bProcessing = false;
							clearInterval(timeHandle);
							getReport();
						}
					},
					exceptionHandler : function(err_info) { alert(err_info);}
				});
			}
			
			function startProcess(){
				//启动处理
				if ($("#i_autoProcess").attr("checked")==false ){
			//		alert("对不起,你无权限处理!");
					return ;
				}
				
				if(forUploadFileNum<1){
					var fileIdList = "";
					for(var i=0; i<fileIds.options.length; i++){
						fileIdList += fileIds.options[i].value;
						fileIdList +="</C>"; 
					}
					endUploadTime = new Date();
				//	alert("启动处理["+fileIdList+"]");
					timeHandle = setInterval(getPercent, 2000);
					bProcessing = true;
					realAnalyBean.startProcessW(startUploadTime, endUploadTime, $("#i_LocationId").val(), $("#i_videoSum").val(),
					{
						callback : function(retdata) {
							getReport(retdata);
						},
						exceptionHandler : function(err_info) { alert(err_info);}
					});
				}
			}
			
			//上传完成，无论上传过程中出错还是上传成功，都会触发该事件，并且在那两个事件后被触发
			function uploadComplete(file) {
				this.setButtonDisabled(false);//恢复上传按钮
				forUploadFileNum--;
				if(forUploadFileNum>0){
					this.stopped = false;
					this.startUpload();//开始上传
				}else{
					
				}
			}
			function debug_function(info){
				debuginfo.value += info + "\r\n";
			}
			
			
			function flashReady(){
				//alert("Flash Ready");
				//swfu.selectFiles();
			}
			function fileQueued(fileName){	
				fileList.options.add(new Option(fileName.name,fileName.name));
			}
			
			
			</script>
	</div>

	<!-- 插入操作按钮 -->
		<input type="button" onclick="btStartUpload();" value="上传" />
		<input type="button" onclick="swfu.stopUpload();" value="停止上传" />
		<input type="button" onclick="debuginfo.innerHTML = '';" value="清空Debug" />
	</form>
	</div>

<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<input id="qx_id" type="hidden" value="<%=qx%>"/>
</div>

<iframe name="downloadframe" style="display:none" ></iframe>



<script>
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
</script>
</body>