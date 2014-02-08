<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  
  	<h2>File Uplaod Server</h2>
	<h3>Usage:</h3>
	RFC 1867 'form based file upload in HTML'.<br />
	 
	Content type of the POST request must be set to multipart/form-data <br />
	upload action url : upload/upload.do? <br /> 
	
	<strong>Query parameter: </strong>
	<br />
	<br />
	<li>
	dir = destination directory of the file relative to uploadroot. 
		If dir startwith '/'(e.g: upload?dir=/upload), the file directory relative to tomcat webapps. 
		Default is 'tempdir' sub webapp directory. <br />
		</li>
	<li>
	uploadroot = destination root directory, default is webapp directory. </li>
	
	<li>
	fileTypes = the files types to upload, format: mp4,avi,txt etc. </li>
	
	<li>
	fileNum = the order of cur file to upload at onece submit. </li>
	
	<li>
	saveName = If you want to replace the file with the same name, this parameter will be work. The upload server will save the
	uploaded file with this name. </li>
	
	<li>
	backup = If you setted saveName, the old file while be backup or not. value: true/false. See the Demo for detail. </li>
	
	<br />
	<strong>Returns</strong>: Formated to json<br /> 
	<strong>e.g:</strong><br />
	Format: {"error":error code,"msg":"error description.","data":[file json list]}
	<li>
		{"error":0,"msg":"Uploaded 1 files","data":[{"error":0,"filename":"android.131005190538.sql","uploadroot":"E:/WebServer/Tomcat 6.0/webapps","savePath":"/upload","savename":"20131006141123882_0_0.sql"}]}
	</li>
	<li>
		{"error":0,"msg":"Uploaded 2 files","data":[{"error":0,"filename":"Android开发教程(完全免费版).pdf","msg":"File[Android开发教程(完全免费版).pdf] upload success @2013-10-17 17:24:40.006","uploadroot":"E:/WebServer/Tomcat 6.0/webapps","savePath":"/download-center/apk","savename":"its_sps.apk"},{"error":0,"filename":"chizi2.doc","msg":"File[chizi2.doc] upload success @2013-10-17 17:24:40.077","uploadroot":"E:/WebServer/Tomcat 6.0/webapps","savePath":"/download-center/apk","savename":"its_sps.apk"}]}
	</li>

	<br />
	error=0 means there's no error.
	<br />

	<br />
	<strong>Demo</strong>: <br />
	<a href="inputfile.jsp" >input type=file</a> <br />
	<a href="index.html" >SWFUpload.flash</a> <br />
	<a href="inputfile.html" >input type=File</a> <br />
	<a href="#" onclick="dialogUpload()" >SWFUpload.flash Dialog</a> <br />

<script>
	function dialogUpload() {

		var postString ="usercode=admin</C>timespan=300</C>";
		var dir = "vidoes";
		var dirroot = "d:/videosroot"
		var returnURL ="<%=path%>/save.jsp";
		var srcFile = "upload.jsp?"+"dir="+dir+"&dirroot="+dirroot+"&filetype=*.avi&returnURL="+returnURL+"&postString="+postString;
	
		var uploadwindow = window.open(srcFile, "uploadwindow");
		uploadwindow.title="File Upload";
		
		/*
		var args = new  Object();
		args.dir = "videos";
		args.dirroot = "d:/videosroot";
		args.filetype= "*.avi";
		args.returnURL = "<%=path%>/save.jsp";
		
		var srcFile = "upload.jsp?";
		var winFeatures = "dialogHeight:450px;dialogWidth:700px;help:no;status:no";
		window.open(srcFile,"", winFeatures);
		var inArray = window.showModalDialog(srcFile, args, winFeatures);
		alert(inArray);
		*/
	}

	function callback(data) {
		alert("callback=" + data);
	}

	function get_cookie(Name)
	{
		var search = Name + "="
		var returnvalue = "";
		if (document.cookie.length > 0) {
			offset = document.cookie.indexOf(search)
			if (offset != -1) {
				offset += search.length
				end = document.cookie.indexOf(";", offset);
				if (end == -1)
					end = document.cookie.length;
				returnvalue = unescape(document.cookie.substring(offset, end))
			}
		}
		return returnvalue;
	}
	
	
	
</script>

		<br />
  	
</html>
