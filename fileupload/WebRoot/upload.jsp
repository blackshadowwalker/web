<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String dir = (String) request.getParameter("dir");
	String dirroot = (String) request.getParameter("dirroot");
	String filetype = (String) request.getParameter("filetype");
	String returnURL = (String) request.getParameter("returnURL");
	String returnType = (String) request.getParameter("returnType");//_blank _top _parent _self

	String sessionid = (String) request.getParameter("sessionid");
	String postString = (String) request.getParameter("postString");
	if(postString!=null)
		postString = postString.replaceAll("</C>", "&");
	else
		postString = "";
	
	StringBuffer reqUrl = request.getRequestURL();
	String reqUri = (String) request.getRequestURI();
	String urlfrom = reqUrl.substring(0, reqUrl.length()- reqUri.length());
//	String actionUrl = urlfrom + "/" + returnURL;
	String actionUrl = returnURL;
	System.out.println("actionUrl=" + actionUrl);

	dir = (dir == null) ? "" : dir;
	dirroot = (dirroot == null) ? "" : dirroot;
	filetype = (filetype == null) ? "*.*" : filetype;
	returnURL = (returnURL == null) ? "" : returnURL;
	returnType = (returnType == null) ? "_blank" : returnType;
	sessionid = (sessionid == null) ? "_blank" : sessionid;

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'testp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<!-- bootstrap -->
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	
	<link href="base/hx_table/css/hx_table.css" rel="stylesheet" type="text/css" />
	
	<script language="javascript" src="jquery/jquery.min.js"></script>
	<script language="javascript" src="base/hx_table/js/jquery.hx_table.js"></script>
	<script language="javascript" src="base/hx_table/js/tools.js"></script>
	
	<script language="javascript" src="scripts/uploadObject.js"></script>
	<script language="javascript" src="scripts/uploadScript.js"></script>
	
	<script type="text/javascript" src="swfupload/swfupload.js"></script>
	<script type="text/javascript" src="swfupload/swfupload.queue.js"></script>
	<script type="text/javascript" src="swfupload/swfupload.speed.js"></script>
	<script type="text/javascript" src="swfupload/handlers.js"></script>
	
	<style>
		.progress{
			border:1px #000 solid;
		}
		.progress .bar {
			height: 18px;
			color: #000;
			text-align: right;
			background-color: #0a0 ;
		}
		.tableclass{
			background-repeat: repeat-x repeat-y;
			background-image: url(../images/toolbarbg.bmp);
		}
	</style>
  
  </head>
  
  <body style="font-size: 12px;">
  	 <div class=mainpannel >
	 	<div class=tableclass  id="tablediv" style="width:680px;height:350px;border:0px #f00 solid;"> 
			<div id="hx_table_div" class="queryresult" ></div>
	  	</div>
	  	
  	</div>
  	
  	<br>
  	<br>
  	<br>
  	<div align=center>
  		<span style="cursor:hand" onclick="showmore()">&gt;</span>
  	</div>
  	<div id=hiddendiv align=center style="display:none;">
  		<form id=i_returnForm action="<%=actionUrl%>?<%=postString%>&" target="<%=returnType%>" method=post >
		  	<!-- hidden data top -->
		  	<div>
			  	dir:<input type="text" id="i_dir" name=dir value="<%=dir%>"><br>
			  	dirroot:<input type="text" id="i_dirroot" name=dirroot value="<%=dirroot%>"><br>
			  	filetype:<input type="text" id="i_filetype" name=filetype value="<%=filetype%>"><br>
			  	returnURL:<input type="text" id="i_returnurl" name=returnurl value="<%=returnURL%>"><br>
			  	sessionid:<input type="text" id="i_sessionid" name=sessionid value="<%=sessionid%>"><br>
			  	postString:<input type="text" id="i_postString" name=postString value="<%=postString%>" size=100><br>
		  		serverData:<br>
		  			<input type="text" id=serverData name=serverData size=200></input><br>
		  	</div>
	  	</form>
		<!-- hidden data booter -->
	</div><!-- hiddendiv -->
	
	
	
<!-- scripts -->  
  <script type="text/javascript">
  	var args = window.dialogArguments; 

  	var dir = "<%=dir%>";
  	var dirroot ="<%=dirroot%>";
  	var filetype = "<%=filetype%>";
  	var returnURL = "<%=returnURL%>";
  	var returnType = "<%=returnType%>";
	
	var bStoped = true;
	
	// resize table to the center of parentDIV
	function resizeTable(){
		var pWidth = $("#tablediv").parent().width();
		var mleft = (pWidth - $("#tablediv").width()) / 2;
		if(mleft>0)
			$("#tablediv").css("margin-left", mleft + "px");
	}

	$(window).resize(resizeTable);
	
	function initParameters(){
		  	
		  	if(args!=null)
		  	{
			  	dir = (args.dir!=null)? args.dir : dir;
			  	dirroot = (args.dirroot!=null)? args.dirroot : dirroot;
			  	filetype = (args.filetype!=null)? args.filetype : filetype;
		  	}

			$("#i_dir").val(dir);
			$("#i_dirroot").val(dirroot);
			$("#i_filetype").val(filetype);
			
	}
	
	var swfu;
	$(document).ready(function() {
		//
		$("#serverData").val("");
		resizeTable();
		initParameters();
		//init swfUpload
		swfu = new SWFUpload(
				{
					upload_url : "upload.do?",
					// File Upload Settings
					file_size_limit : "5000 MB", // 1000MB
					file_types : "*.avi;*.mp4",//设置可上传的类型
					file_types_description : "Video Files",
					file_upload_limit : "50",

					file_queue_error_handler : fileQueueError,//选择文件后出错
					file_dialog_complete_handler : fileDialogComplete,//选择好文件后提交
					file_queued_handler : fileQueued,
					upload_progress_handler : uploadProgress,
					upload_error_handler : uploadError,
					upload_success_handler : uploadSuccess,
					upload_complete_handler : uploadComplete,
					upload_start_handler: uploadStart,
					
					post_params : {	
						"dir" : $("#i_dir").val(),
						"fileTypes" : $("#i_filetype").val(),
						"dirroot" : $("#i_dirroot").val(),
						"fileNum" : "0",
						use_query_string : true
					},

					// Button Settings
					button_image_url : "swfupload/images/SmallSpyGlassWithTransperancy_17x18.png",
					button_placeholder_id : "i_btaddfile",
					button_width : 100,
					button_height : 18,
					button_text : '<span class="button">Add Files</span>',
					button_text_style : '.button { font-family: Helvetica, Arial, sans-serif; font-size: 12pt; } .buttonSmall {  font-size: 10pt; }',
					button_text_top_padding : 0,
					button_text_left_padding : 18,
					button_window_mode : SWFUpload.WINDOW_MODE.TRANSPARENT,
					button_cursor : SWFUpload.CURSOR.HAND,

					// Flash Settings
					flash_url : "swfupload/swfupload.swf",

					custom_settings : {
						upload_target : "divFileProgressContainer",
						cancelButtonId : 'i_btcancel'
					},
					// Debug Settings
					debug : false
				//是否显示调试窗口
				});

	});
	
	function showmore(){
		if($("#hiddendiv").css("display")=="none"){
			$("#hiddendiv").show();
		}
		else{
			$("#hiddendiv").hide();
		}
	}
	

//	
</script>
  
	
  </body>
</html>
