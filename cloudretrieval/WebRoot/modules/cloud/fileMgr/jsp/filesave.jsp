<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="modules.base.*"%>

<%
	String path = request.getContextPath();
	String thisPath=request.getContextPath();
	
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	request.setCharacterEncoding("UTF-8");
	
	String dir = (String)request.getParameter("dir");
	String locationId = (String)request.getParameter("locationId");
	String videodatetime = (String)request.getParameter("videodatetime");
	String timespan = (String)request.getParameter("timespan");
	
	String sessionid = (String)request.getParameter("sessionid");
	
	String postString = (String)request.getParameter("postString");
	String serverData = (String)request.getParameter("serverData");
//	serverData = serverData.replaceAll("</C>","<br>");
	
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
	
	<script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
	<script language="javascript" src="<%=thisPath%>/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
	<script type="text/javascript" src="<%=thisPath%>/dwr/interface/fileMgrBean.js"></script>

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
			width:220px;
		}
		div{
			width:250px;
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
    locationId：<%=locationId %></br>
    videodatetime：<%=videodatetime %></br>
    timespan：<%=timespan %></br>
    sessionid：<%=sessionid %></br>
    <br>
    <div>
    	<table  >
   <script>
   		var serverDate = "<%=serverData%>";
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
		
		//write to database
		fileMgrBean.uploadFiles("<%=serverData%>", "<%=dir%>", "<%=videodatetime %>", "<%=locationId %>","<%=timespan %>", "<%=sessionid%>",
		{
			callback : function(retdata) {
				ret = retdata;
				if(retdata<1){
					alert("上传失败");
					return;
				}
				else{
				}
			},
			exceptionHandler : function(err_info) { alert("Error:"+err_info);}
		});
		
   </script>
   		</table>
   </div>
  </body>
</html>
