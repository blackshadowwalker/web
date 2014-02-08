<%@ page language="java" contentType="text/html;charset=GBK" %>
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
    
    String pagePath = "云分析>数据分析";
    String uploadServer = (String)request.getAttribute("uploadServer");
    String uploadroot 	= (String)request.getAttribute("uploadroot");
    String uploadurl 	= (String)request.getAttribute("uploadurl");
    String uploadflash 	= (String)request.getAttribute("uploadflash");
    String uplodpath = bform.user_code;// (String)request.getAttribute("defaultuploadpath");
	
//	String uploadServer = "http://10.168.1.250:8888";
    
    String user_dept=bform.dept_code;
    String role_code = bform.role_code;
    
    Date nowTime = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地<bean:message key="button.modify" bundle="${language}"/>日期格式 
	long curDateTime = nowTime.getTime();
	String videodatetimeString = dateFormat.format(curDateTime);
  //  System.out.println(role_code);
   
%>
<head>
	<title>fileMgr</title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
<link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
  <link href="<%=thisPath%>/modules/base/hx_table/css/hx_table.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  
   <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/jquery.hx_table.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/tools.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  
  <script language="javascript" src="<%=thisPath%>/modules/cloud/realAnaly/scripts/realAnalyScript.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/cloud/realAnaly/scripts/realAnalyObject.js"></script>

  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/fileMgrBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/realAnalyBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/taskMgrBean.js"></script>
  
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
  </style>
 </head>
<body onLoad="" topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">

<div class=tip>
    <table>
        <tr>
          <td width="20"><img src="<%=thisPath%>/images/main/icon1.gif" width="18" height="16"></td>
          <td width="915"><div id="path_name"><bean:message key="label.pagepath" bundle="${language}"/>：<%=pagePath %></div></td>
        </tr>
    </table>
</div>
<div class=padindex>
  <table>
    <tr>
      <td id=padindex0 class=activeindex onClick="switch_index(this, 0)"><div align="center">数据分析<div></td>
      <td id=padindex1 class=hiddenindex onClick="switch_index(this, 1)" style="display:none"><div align="center">ForMoreInfo<div></td>
    </tr>
  </table>
</div>

<div class=padcontent>

	<div id=padcontent0 class=activecontent style="height:600px;">

		<form>
		<!-- 选择<bean:message key="button.query" bundle="${language}"/>方式 -->
		<!-- 输入<bean:message key="button.query" bundle="${language}"/>条件 -->
		<div class=scrollarea style="height:85px;">
			<table border="0" width="505" height="54" style="align:left">
			  <tr>
			    <td style="width:160px;">
					<div><input type="button"  id="swfu_placeholder"  value="添加文件" ></div>
			    </td>
			    <td style="width:200px;">
				时间:<input style="width:150px" class="" type="text" id="i_videodatetime" value="<%=videodatetimeString%>" 
				onFocus="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm:ss'})" readonly>
				<br>
				<input type="hidden" id="i_LocationId" name="LocationId" size=20 maxlength=9 value="" >
				<input type="hidden" name="LocationId_values" value="">
				地点:<input style="width:150px" class="input-mini"  type="text" id="i_locationName" 
					name="locationName" value="" onFocus="selectLocation(LocationId,'radio', LocationId_values);" readonly />
				</div>
				
				</td>
				<td style="width:200px;">
					<div>
						<span id="swfu-upload-progress">0%</span>
					</div>
				</td>
				<td>
					<div id="fileListOut" style="border:1px solid #0f0;width:600px;"></div>
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
		<td class=cardnameright></td>
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
			var progressE = document.getElementById('swfu-upload-progress');//文件上传进度节点
			var statusE = document.getElementById('swfu-upload-status');//文件上传进度节点
			var debuginfo = document.getElementById('debug_info');
			var fileList = document.getElementById('fileList');
			var fileIds = document.getElementById('fileIds');
			
			var startUploadTime = null;
			var endUploadTime = null;

			function btStartUpload(){
				if($("#i_LocationId").val()==""){
					alert("请选择地点!");
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
			function uploadStart(file){
				var postobj = { "uploadroot" : "<%=uploadroot%>",
								"savePath" : "<%=uplodpath%>",
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
				progressE.innerHTML = ['正在上传：', file.name, '<br />总尺寸：', tb.toFixed(3), 'M<br />已上传：', cb.toFixed(3), 'M<br />进度：', parseInt((curBytes/totalBytes)*100), '%'].join('');
			}
			
			//上传过程中出错
			function uploadError(file, errCode, msg) {
				progressE.innerHTML = ['<br />文件[', file.name, ']上传出错，出错代码：[', errCode, ']，出错原因：', msg].join('');
			//	statusE.innerHTML += ['<br />文件[', file.name, ']上传出错，出错代码：[', errCode, ']，出错原因：', msg].join('');
			}
			
			//上传成功
			function uploadSuccess(file, data) {
				var ret = 0;
				
			//	statusE.innerHTML += ['<br />文件[', file.name, ']结束上传'].join('');
				var fileListOut = document.getElementById('fileListOut');
				var datas = data.split(',');
				if(datas[1]>0){
					fileListOut.innerHTML += ['上传成功[',file.name,',',data,']'].join('') +"<br>";
					//write to database
					var videodatetime = $("#i_videodatetime").val();
					var path = "<%=uplodpath%>";
					fileMgrBean.uploadFile(file.name, path, videodatetime, $("#i_LocationId").val(), datas[2], {
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
								statusE.innerHTML += ['<br />文件[', file.name, '-',ret, '-]上传成功，服务器返回信息：', data].join('');
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
						var p = "已完成  "+ percent +"%";
						progressE.innerHTML = p;
						if(parseInt(percent)==100){
							clearInterval(timeHandle);
							alert("percent==100");
							getReport();
						}
					},
					exceptionHandler : function(err_info) { alert(err_info);}
				});
			}
			
			function startProcess(){
				//启动处理
				
				if(forUploadFileNum<1){
					var fileIdList = "";
					for(var i=0; i<fileIds.options.length; i++){
						fileIdList += fileIds.options[i].value;
						fileIdList +="</C>"; 
					}
					endUploadTime = new Date();
				//	alert("启动处理["+fileIdList+"]");
					timeHandle = setInterval(getPercent, 2000);
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
					"savePath" : "<%=uplodpath%>",
					"fileTypes" : "mp4,avi",
					"fileNum" : "0",
					use_query_string : true
					},
					
					button_text_top_padding: 6,//文字距按钮顶部距离
					button_text_left_padding: 50,//文字距离按钮左边距离
					button_width: 150, //按钮宽度
					button_height: 45, //按钮高度
					
					button_image_url:"<%=thisPath%>/swfupload/images/swfu_bgimg.jpg",
					button_text: '<center><span class="btn-txt">添加文件</span></center>',//按钮文字
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
</body>