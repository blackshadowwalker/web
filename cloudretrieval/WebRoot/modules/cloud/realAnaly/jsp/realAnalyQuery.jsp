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
    
    String pagePath = "�Ʒ���>���ݷ���";
    String uploadServer = (String)request.getAttribute("uploadServer");
    String uploadroot 	= (String)request.getAttribute("uploadroot");
    String uploadurl 	= (String)request.getAttribute("uploadurl");
    String uploadflash 	= (String)request.getAttribute("uploadflash");
    String uplodpath = bform.user_code;// (String)request.getAttribute("defaultuploadpath");
	
//	String uploadServer = "http://10.168.1.250:8888";
    
    String user_dept=bform.dept_code;
    String role_code = bform.role_code;
    
    Date nowTime = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//���Է����<bean:message key="button.modify" bundle="${language}"/>���ڸ�ʽ 
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
          <td width="915"><div id="path_name"><bean:message key="label.pagepath" bundle="${language}"/>��<%=pagePath %></div></td>
        </tr>
    </table>
</div>
<div class=padindex>
  <table>
    <tr>
      <td id=padindex0 class=activeindex onClick="switch_index(this, 0)"><div align="center">���ݷ���<div></td>
      <td id=padindex1 class=hiddenindex onClick="switch_index(this, 1)" style="display:none"><div align="center">ForMoreInfo<div></td>
    </tr>
  </table>
</div>

<div class=padcontent>

	<div id=padcontent0 class=activecontent style="height:600px;">

		<form>
		<!-- ѡ��<bean:message key="button.query" bundle="${language}"/>��ʽ -->
		<!-- ����<bean:message key="button.query" bundle="${language}"/>���� -->
		<div class=scrollarea style="height:85px;">
			<table border="0" width="505" height="54" style="align:left">
			  <tr>
			    <td style="width:160px;">
					<div><input type="button"  id="swfu_placeholder"  value="����ļ�" ></div>
			    </td>
			    <td style="width:200px;">
				ʱ��:<input style="width:150px" class="" type="text" id="i_videodatetime" value="<%=videodatetimeString%>" 
				onFocus="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm:ss'})" readonly>
				<br>
				<input type="hidden" id="i_LocationId" name="LocationId" size=20 maxlength=9 value="" >
				<input type="hidden" name="LocationId_values" value="">
				�ص�:<input style="width:150px" class="input-mini"  type="text" id="i_locationName" 
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
<!-- �ϴ� -->

	<div id=padcontent1 class=hiddencontent >

	<table class=cardname>
	  <tr>
		<td class=cardnameleft></td>
		<td class=cardnameright></td>
	  </tr>
	</table>

<!-- ���� -->

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
			var progressE = document.getElementById('swfu-upload-progress');//�ļ��ϴ����Ƚڵ�
			var statusE = document.getElementById('swfu-upload-status');//�ļ��ϴ����Ƚڵ�
			var debuginfo = document.getElementById('debug_info');
			var fileList = document.getElementById('fileList');
			var fileIds = document.getElementById('fileIds');
			
			var startUploadTime = null;
			var endUploadTime = null;

			function btStartUpload(){
				if($("#i_LocationId").val()==""){
					alert("��ѡ��ص�!");
					$("#i_LocationId").focus();
					return ;
				}else{
					swfu.stopped = false;
					startUploadTime = new Date();
					//alert(startUploadTime.toLocaleString());
					swfu.startUpload();//��ʼ�ϴ�
					swfu.setButtonDisabled(true);//�����ϴ���ť
				}
			}

			//�ļ�ѡ�񴰿ڹر��¼�����
			//������ļ��ɹ�ѡ����ӵ��ϴ����У����Զ��ϴ�
			var forUploadFileNum = 0;
			var fileSum = 0;
			function fileDialogComplete(selectedNum, queuedNum) {
				forUploadFileNum = selectedNum;
				fileSum = selectedNum;
				if (queuedNum > 0) {//ѡ����ӵ��ϴ����е��ļ�������0
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
			//�ϴ������¼�����
			//������̬��ʾ�ļ��ϴ�����
			function uploadProgress(file, curBytes, totalBytes) {
				var tb = totalBytes*1.0/1024/1024;
				var cb = curBytes*1.0/1024/1024;
				progressE.innerHTML = ['�����ϴ���', file.name, '<br />�ܳߴ磺', tb.toFixed(3), 'M<br />���ϴ���', cb.toFixed(3), 'M<br />���ȣ�', parseInt((curBytes/totalBytes)*100), '%'].join('');
			}
			
			//�ϴ������г���
			function uploadError(file, errCode, msg) {
				progressE.innerHTML = ['<br />�ļ�[', file.name, ']�ϴ�����������룺[', errCode, ']������ԭ��', msg].join('');
			//	statusE.innerHTML += ['<br />�ļ�[', file.name, ']�ϴ�����������룺[', errCode, ']������ԭ��', msg].join('');
			}
			
			//�ϴ��ɹ�
			function uploadSuccess(file, data) {
				var ret = 0;
				
			//	statusE.innerHTML += ['<br />�ļ�[', file.name, ']�����ϴ�'].join('');
				var fileListOut = document.getElementById('fileListOut');
				var datas = data.split(',');
				if(datas[1]>0){
					fileListOut.innerHTML += ['�ϴ��ɹ�[',file.name,',',data,']'].join('') +"<br>";
					//write to database
					var videodatetime = $("#i_videodatetime").val();
					var path = "<%=uplodpath%>";
					fileMgrBean.uploadFile(file.name, path, videodatetime, $("#i_LocationId").val(), datas[2], {
						callback : function(retdata) {
							ret = retdata;
							if(retdata<1){
								fileListOut.innerHTML += ['�ϴ�ʧ��[',file.name,',',data,']'].join('') +"<br>";
								return;
							}
							else{
								fileSum = parseInt($("#i_videoSum").val());
								fileSum ++;
								$("#i_videoSum").val(fileSum);
								fileIds.options.add(new Option(ret, ret));
								statusE.innerHTML += ['<br />�ļ�[', file.name, '-',ret, '-]�ϴ��ɹ���������������Ϣ��', data].join('');
							}
							if(forUploadFileNum<1)
								startProcess();
						},
						exceptionHandler : function(err_info) { alert(err_info);}
					});
				}
				else
					fileListOut.innerHTML += ['�ϴ�ʧ��[',file.name,',',data,']'].join('') +"<br>";
									
				
				//alert(file.name);
			}
			function pageArgs() {
				var title = "";
				var data = "";
			}
			function getReport(retdata){ 
				var args = new pageArgs();
				args.title="�������-����";
			    //��ʾ�ȴ���
			    /*
			    waitObj.show({
			    	left:"25%",
			    	bottom:"50%",
			    	width:"280px",
			    	height:"50px",
			    	text_align:"center",
			    	msg:"<span style=\"font-weight:bold;\">ϵͳ��������<bean:message key="button.query" bundle="${language}"/>����ȴ�...</span>"
			    });
			    */
				var idsList = new Array();
				var taskIds = retdata.split("</C>");
				for(var j=0; j<taskIds.length-1; j++)
					idsList.push(taskIds[j]);
				taskMgrBean.taskReport(idsList, {
					callback : function(data) {
						if (data != "" && data != "no" &&data != null) {
							data="���</C>���ƺ���</C>����ʱ��</C>�ص�</T>"+data;
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
						var p = "�����  "+ percent +"%";
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
				//��������
				
				if(forUploadFileNum<1){
					var fileIdList = "";
					for(var i=0; i<fileIds.options.length; i++){
						fileIdList += fileIds.options[i].value;
						fileIdList +="</C>"; 
					}
					endUploadTime = new Date();
				//	alert("��������["+fileIdList+"]");
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
			
			//�ϴ���ɣ������ϴ������г������ϴ��ɹ������ᴥ�����¼����������������¼��󱻴���
			function uploadComplete(file) {
				this.setButtonDisabled(false);//�ָ��ϴ���ť
				forUploadFileNum--;
				if(forUploadFileNum>0){
					this.stopped = false;
					this.startUpload();//��ʼ�ϴ�
				}else{
					
				}
			}
			function debug_function(info){
				debuginfo.value += info + "\r\n";
			}
			
			var swfuOption = {//swfuploadѡ��
					//	http://10.168.1.160:8080/fileUpload/upload.jsp?savePath=test
					upload_url:"<%=uploadServer%>/<%=uploadurl%>", //�����ϴ��ķ����url
					//	http://10.168.1.160:8080/fileUpload/swfupload/swfupload.swf
					flash_url:"<%=uploadServer%>/<%=uploadflash%>",//swfuploadѹ������ѹ��swfupload.swf��url
					
					file_types : "*.mp4;*.avi",//�����ϴ����ļ�����
					file_types_description: "Video Files",//�ļ���������
					file_upload_limit:10,
					file_size_limit : "0", 	
					
					post_params : {
					"uploadroot" : "<%=uploadroot%>",
					"savePath" : "<%=uplodpath%>",
					"fileTypes" : "mp4,avi",
					"fileNum" : "0",
					use_query_string : true
					},
					
					button_text_top_padding: 6,//���־ఴť��������
					button_text_left_padding: 50,//���־��밴ť��߾���
					button_width: 150, //��ť���
					button_height: 45, //��ť�߶�
					
					button_image_url:"<%=thisPath%>/swfupload/images/swfu_bgimg.jpg",
					button_text: '<center><span class="btn-txt">����ļ�</span></center>',//��ť����
					button_placeholder_id:"swfu_placeholder",

					debug: true,//��������ģʽ
					debug_handler : debug_function,
					
					file_dialog_complete_handler: fileDialogComplete,//�ļ�ѡ��Ի���ر�
					upload_progress_handler: uploadProgress,//�ļ��ϴ���
					upload_error_handler: uploadError,//�ļ��ϴ�����
					upload_success_handler: uploadSuccess,//�ļ��ϴ��ɹ�
					upload_complete_handler: uploadComplete,
					swfupload_loaded_handler: flashReady,
					file_queued_handler: fileQueued,//���ļ�ѡ��Ի���ر���ʧʱ�����ѡ����ļ��ɹ������ϴ����У���ô���ÿ���ɹ�������ļ����ᴥ��һ�θ��¼���N���ļ��ɹ�������У��ʹ���N�δ��¼�����
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

	<!-- ���������ť -->
		<input type="button" onclick="btStartUpload();" value="�ϴ�" />
		<input type="button" onclick="swfu.stopUpload();" value="ֹͣ�ϴ�" />
		<input type="button" onclick="debuginfo.innerHTML = '';" value="���Debug" />
	</form>
	</div>

<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<input id="qx_id" type="hidden" value="<%=qx%>"/>
</div>
</body>