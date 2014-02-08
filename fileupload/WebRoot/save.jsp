<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	request.setCharacterEncoding("UTF-8");
		
	String usercode = (String)request.getParameter("usercode");
	String timespan = (String)request.getParameter("timespan");
	String returnsData = (String)request.getParameter("serverData");
	String serverData = returnsData.replaceAll("</C>","<br>");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'save.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		#mytable {   
		    padding: 0;
		    margin: 0;   
		    border-collapse:collapse;
		}
		table{
			width:800px;
		}
		div{
			width:900px;
		}
		td {
		    border: 1px solid #C1DAD7;   
		    background: #fff;
		    font-size:11px;
		    padding: 6px 6px 6px 12px;
		    color: #4f6b72;
		}
		
		td.alt {
		    background: #F5FAFA;
		    color: #797268;
		}
		.selectClass{
			width:60px;
			height:15px;
			font-size:9;
		}
		</style>
  </head>
  
  <body>
    Save Data: <br>
    1. User defined post parameters.<br>
    usercode:<%=usercode %><br>
    timespan:<%=timespan %><br>
    <br>
    2. Server returns:<br>
    <%=serverData%><br>
    <br>
    3. Uploaded Files
    <div>
   <table  >
   <script>
   		var serverDate = "<%=returnsData%>";
   		var rows = 0;
   		var cols = 3;
   		var dataArray = new Array();
   		if(serverDate!=null && serverDate!="")
		{
			var datalist = serverDate.split("</C>");
			if(datalist.length<1)
				dataArray.push(serverDate);
			else{
				for(var i=0; i<datalist.length-1; i++){
					dataArray.push(datalist[i]);
				}
			}
			for(var j=0; j<dataArray.length; j++){
				document.write("<tr>");
				var colsdata = dataArray[j].split(",");
				for(var k=0; k<colsdata.length; k++)
					document.write("<td>"+colsdata[k]+"</td>");
				document.write("</tr>");
			}
		}
   </script>
   		</table>
   </div>
  </body>
</html>
