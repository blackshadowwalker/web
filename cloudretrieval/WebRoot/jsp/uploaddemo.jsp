<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String thisPath=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>

<form action="<%=thisPath %>/upload.do?dir=userphotos" method="post" ENCTYPE="multipart/form-data" >

			<input name="myfile" type="file"><br>
			<input name="myfile" type="file"><br>
			<input type="submit"><br>
</form>
<hr size=3>
<form action="<%=thisPath %>/upload.do?callback=callback" method="post" target="hidden_frame" ENCTYPE="multipart/form-data" >

			<input name="myfile" type="file"><br>
			<input name="myfile" type="file"><br>
			<input name="myfile" type="file"><br>
			<input type="submit"><br>
</form>
<iframe name="hidden_frame" width=500 height=200></iframe>
<script>
function callback(sign, cnt, files){
	alert(files);
}
</script>

</body>
</html>