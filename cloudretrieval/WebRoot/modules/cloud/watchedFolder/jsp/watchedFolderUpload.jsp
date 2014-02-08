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
    baseForm bform = (baseForm) (request.getSession()).getAttribute("baseuser");
    String user_loc=bform.locationId; 
    
   
%>
<html>
<head>
  <title><bean:message key="watchedfolder.upload" bundle="${language}"/></title>
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

  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/watchedFolderBean.js"></script>
  
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
<body>
  <form>

	<div class=inputarea style="height:450px;">
		<br>

		<div><input type="button"  id="swfu_placeholder"  value="<bean:message key="watchedfolder.upload.filebutton" bundle="${language}"/>" ></div>
		<bean:message key="watchedfolder.upload.starttime" bundle="${language}"/>：<input style="width:150px" class="" type="text" id="i_videodatetime" value="" onFocus="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm:ss'})" readonly><br/>
		<bean:message key="watchedfolder.upload.interval" bundle="${language}"/>：<input style="width:150px;color:gray;" class="" type="text" value="<bean:message key="watchedfolder.upload.inputinterval" bundle="${language}"/>" id="timeInterval" onfocus="this.value='';this.style.color='black';" onblur="if(this.value==''){this.value='<bean:message key="watchedfolder.upload.inputinterval" bundle="${language}"/>';this.style.color='gray';}"/><br/>
		<bean:message key="watchedfolder.upload.location" bundle="${language}"/>：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="_locationName" name="_locationName" value="" style="width:118px;" disabled>
      	<input type="hidden" id="_locationId" name="_locationId" size=20 maxlength=20 value="" disabled >&nbsp;&nbsp;
      	<html:button property="button" onclick="forLocationTree_query(_locationId)" styleClass="deptbutton">…</html:button>
		<div>
			<select id="fileList" size="10" style="width:200px;">
			</select>
		</div>
		<div id="swfu-upload-progress">progress</div>

		<div id="fileListOut" style="border:1px solid #0f0;width:600px;"></div>
		<div id="swfu-upload-status">	</div>
		
		<div style="display:none">
			<textarea id="debug_info" cols="150" rows="22" ></textarea>
		</div>

		<script>
		var fileCounts=0;
		var fileSuccess=0;
			watchedFolderBean.addFolder({
				callback : function(retdata) {
					if(retdata!=0){
						
					}else{
						alert("<bean:message key="wathcedfolder.upload.initializefailed" bundle="${language}"/>");
						window.close();
					}	
				},
				exceptionHandler : function() { 
					alert("<bean:message key="wathcedfolder.upload.initializefailed" bundle="${language}"/>");
					window.close();
				}
			});
			//alert(window.dialogArguments.uplodpath);
			document.getElementById('i_videodatetime').value=window.dialogArguments.videodatetimeString;
			var progressE = document.getElementById('swfu-upload-progress');//文件上传进度节点
			var statusE = document.getElementById('swfu-upload-status');//文件上传进度节点
			var debuginfo = document.getElementById('debug_info');
			var fileList = document.getElementById('fileList');

			//文件选择窗口关闭事件处理
			//如果有文件成功选择并添加到上传队列，则自动上传
			var forUploadFileNum = 0;
			var fileSum = 0;
			function fileDialogComplete(selectedNum, queuedNum) {
				if($("#_locationId").val()==null || $("#_locationId").val()=="" || isNaN($("#timeInterval").val())){
					alert("<bean:message key="watchedfolder.upload.choosetimeandlocation" bundle="${language}"/> ");
					return;
				}
				forUploadFileNum = selectedNum;
				fileSum = selectedNum;
				if (queuedNum > 0) {//选择并添加到上传队列的文件数大于0
					this.stopped = false;
					this.startUpload();//开始上传
					this.setButtonDisabled(true);//禁用上传按钮
				}
			}
			function fileDialogStart(){
				fileList.options.length=0;
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
				var postobj = { "dirroot" :window.dialogArguments.uploadroot,
								"dir" : window.dialogArguments.uplodpath,
								"fileTypes" : "mp4,avi,txt",
								"fileNum" : fileSum-forUploadFileNum
								};
				//alert(window.dialogArguments.uploadroot+"/"+window.dialogArguments.uplodpath);
				swfu.setPostParams(postobj);
				swfu.setUseQueryString(true);
				setSelect(file.name);
			}	
			//上传过程事件处理
			//用来动态显示文件上传进度
			function uploadProgress(file, curBytes, totalBytes) {
				progressE.innerHTML = ['<bean:message key="watchedfolder.upload.fileuploading" bundle="${language}"/>：', file.name, '<br /><bean:message key="watchedfolder.upload.filesize" bundle="${language}"/>：', totalBytes, 'B<br /><bean:message key="watchedfolder.upload.fileuploaded" bundle="${language}"/>：', curBytes, 'B<br /><bean:message key="watchedfolder.upload.rateofprogress" bundle="${language}"/>：', parseInt((curBytes/totalBytes)*100), '%'].join('');
			}
			
			//上传过程中出错
			function uploadError(file, errCode, msg) {
				progressE.innerHTML = ['<br /><bean:message key="watchedfolder.upload.file" bundle="${language}"/>[', file.name, ']<bean:message key="watchedfolder.upload.uploadfailed" bundle="${language}"/>，<bean:message key="watchedfolder.upload.failecode" bundle="${language}"/>：[', errCode, ']，<bean:message key="watchedfolder.upload.reason" bundle="${language}"/>：', msg].join('');
			//	statusE.innerHTML += ['<br />文件[', file.name, ']上传出错，出错代码：[', errCode, ']，出错原因：', msg].join('');
			}
			
			//上传成功
			function uploadSuccess(file, data) {
				fileCounts++;
				if(fileCounts==1){
					watchedFolderBean.setMinTime({
						callback : function(retdata) {
							if(retdata!=1)
								alert("<bean:message key="watchedfolder.upload.uploadfailed" bundle="${language}"/>!");
						},
						exceptionHandler : function(err_info) { alert(err_info);}
					});
				}
				statusE.innerHTML += ['<br /><bean:message key="watchedfolder.upload.file" bundle="${language}"/>[', file.name, ']<bean:message key="watchedfolder.upload.uploadsuccess" bundle="${language}"/>，<bean:message key="watchedfolder.upload.backdata" bundle="${language}"/>：', data].join('');
			//	statusE.innerHTML += ['<br />文件[', file.name, ']结束上传'].join('');
				var fileListOut = document.getElementById('fileListOut');
				var datas = data.split(',');
				if(datas[1]>0){
					fileSuccess++;
					fileListOut.innerHTML += ['<bean:message key="watchedfolder.upload.uploadsuccess" bundle="${language}"/>[',file.name,',',data,']'].join('') +"<br>";
					//write to database
					var videodatetime = $("#i_videodatetime").val();
					var locationId=$("#_locationId").val();
					var timeInterval=$("#timeInterval").val();
					//alert(locationId)
					var path = window.dialogArguments.uplodpath;
					//alert(videodatetime)
					watchedFolderBean.uploadFile(file.name, path, videodatetime, datas[2],locationId, timeInterval, fileSuccess, {
						callback : function(retdata) {
							if(retdata!=1)
								alert("<bean:message key="watchedfolder.upload.uploadfailed" bundle="${language}"/>!");
						},
						exceptionHandler : function(err_info) { alert(err_info);}
					});
				}
				else
					fileListOut.innerHTML += ['<bean:message key="watchedfolder.upload.uploadfailed" bundle="${language}"/>[',file.name,',',data,']'].join('') +"<br>";
				//alert(file.name);
			}
			
			//上传完成，无论上传过程中出错还是上传成功，都会触发该事件，并且在那两个事件后被触发
			function uploadComplete(file) {
				this.setButtonDisabled(false);//恢复上传按钮
				forUploadFileNum--;
				if(forUploadFileNum>0){
					this.stopped = false;
					this.startUpload();//开始上传
				}else{
					if(fileSuccess!=0){
						watchedFolderBean.setMaxTime(fileSuccess,{
							exceptionHandler : function(err_info) { alert(err_info);}
						});
						alert("<bean:message key="watchedfolder.upload.progressing" bundle="${language}"/> ...");
					}
					fileCounts=0;
					fileSuccess=0;
				}
			}
			
			function debug_function(info){
				//debuginfo.innerHTML += info + '\n';
			}
			
			var swfuOption = {//swfupload选项
					//	http://10.168.1.160:8080/fileUpload/upload.jsp?savePath=test
					upload_url:window.dialogArguments.uploadServer+"/"+window.dialogArguments.uploadurl, //接收上传的服务端url
					//	http://10.168.1.160:8080/fileUpload/swfupload/swfupload.swf
					flash_url:window.dialogArguments.uploadServer+"/"+window.dialogArguments.uploadflash,//swfupload压缩包解压后swfupload.swf的url
					
					file_types : "*.mp4;*.avi;*.txt",//允许上传的文件类型
					file_types_description: "Video Files",//文件类型描述
					file_upload_limit:10,
					file_size_limit : "0", 	
					
					post_params : {
					"dirroot" : window.dialogArguments.uploadroot,
					"dir" : "HOME_admin/videos",
					"fileTypes" : "mp4,avi,txt",
					"fileNum" : "0",
					use_query_string : true
					},
					
				//	button_text_top_padding: 6,//文字距按钮顶部距离
				//	button_text_left_padding: 20,//文字距离按钮左边距离
					button_image_url:"<%=thisPath%>/swfupload/images/swfu_bgimg.jpg",
					button_width:80,
					button_height:25,
					button_text: '<center><span class="btn-txt"><bean:message key="watchedfolder.upload.filebutton" bundle="${language}"/></span></center>',//按钮文字
					button_placeholder_id:"swfu_placeholder",

					debug: true,//开启调试模式
				//	debug_handler : debug_function,
					
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


			function forLocationTree_query(_locationId)
			{
			   // var dept = "37015oooo";
				
			    var srcFile = '<%=thisPath%>'+"/modules/base/jsp/locationtree.jsp?jgbm="+'<%=user_loc%>'+"&type="+"radio";

			    var winFeatures = "dialogHeight:600px;dialogWidth:450px;help:no;status:no";

			   	var inArray = window.showModalDialog(srcFile, "", winFeatures);
				
				if (typeof(inArray) == "undefined"||inArray == "")
				{
			     	//test.value = "";
			     }
			     else
			     {
					_locationId.value = inArray.split("</C>")[1];	
					$("#_locationName").val(inArray.split("</C>")[2]);
				}
				//alert(inArray.split("</C>")[1])
				//alert($("#_locationId").val())
			}
			</script>
	</div>

	<!-- 插入操作按钮 -->
		<input type="button" onclick="swfu.stopUpload();" value="停止上传" />
		<input type="button" onclick="debuginfo.innerHTML = '';" value="清空Debug" />
	</form>
  </body>
  
  
  </html>