<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>role query</title>
    <base href="<%=basePath%>/">
	<script src="scripts/jquery/jquery-1.7.min.js" type="text/javascript"></script>

	<script type="text/javascript">
		var args=window.dialogArguments;
	</script>
  </head>
  
  <body>
  	增：<input type="checkbox" id="i" />&nbsp;
  	改：<input type="checkbox" id="u" />&nbsp;
  	查：<input type="checkbox" id="v" />&nbsp;
  	删：<input type="checkbox" id="d" />
  	<br/><br/>
  	<input type="button" value="确定" onclick="yes();" /> <input type="button" value="取消" onclick="no();" />
  	
  	<script type="text/javascript">
  
  		if(args.toString().indexOf("i")>=0) $("#i").attr("checked",true);
  		if(args.toString().indexOf("u")>=0) $("#u").attr("checked",true);
  		if(args.toString().indexOf("v")>=0) $("#v").attr("checked",true);
  		if(args.toString().indexOf("d")>=0) $("#d").attr("checked",true);
  		function yes(){
  			var rt="";
			var v= $('input:checkbox:checked');
	  		for(var i=0;i<v.length;i++){
	  			rt+=v[i].id;
	  		}
  			window.returnValue=rt;
  			window.close();
  		}
  		function no(){
  			window.returnValue="no";
  			window.close();
  		}
  	</script>
  </body>
</html>
