<%@ page language="java" contentType="text/html;charset=GBK" %>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>

<%
	String thisPath = request.getContextPath();
	String qx = request.getParameter("qx");

	List videoID = (List) request.getAttribute("videoID");
	List videoName = (List) request.getAttribute("videoName");
	List videoUrl = (List) request.getAttribute("videoUrl");

	baseForm bform = (baseForm) (request.getSession())
			.getAttribute("baseuser");
	String pagePath = "云计算分析中心";

	String user_dept = bform.dept_code;
	String role_code = bform.role_code;
	String user_code = bform.user_code;
//	System.out.println(role_code);

	Date nowTime = new Date();
	long videoTime = nowTime.getTime();
//	System.out.println("videoTime=" + videoTime);
	
	String locationId=bform.locationId; 
%>

<html>

<head>
  <title>Cloud</title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
  <link href="<%=thisPath%>/modules/base/hx_table/css/hx_table.css" rel="stylesheet" type="text/css" />
  
	<link rel="stylesheet" href="<%=thisPath%>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=thisPath%>/css/jquery.fileupload-ui.css">
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/jquery.hx_table.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/tools.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/Medianate.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
  <script language="javascript" type="text/javascript" src="<%=thisPath%>/modules/base/scripts/My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/scripts/jquery.progressbar.min.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/scripts/dragImg.js"></script>
<style type="text/css">
.TrColor
{
    background-color:#D9EBF7;

}
.tdHeader
{
	color: black;
    margin-right:4px;
}


</style>
</head>

<body onLoad="" topmargin="0" leftmargin="0" >
<div title="单击左键关闭" id='originalPic' style='width:100%;height:100%;z-index:999;display:none;'></div>

<div id="total">
<div class=tip>
    <table>
        <tr>
          <td width="20"><img src="<%=thisPath%>/images/main/icon1.gif" width="18" height="16"></td>
          <td width="915"><div id="path_name"><bean:message key="label.pagepath" bundle="${language}"/>：<%=pagePath%></div></td>
        </tr>
    </table>
</div>

<div class=padindex>
	
	<div align="left" style="width:1200px; height:100%;">
		<table style="border: 1px solid #95CDE6; width:1200px; height:100%;background-color:white">
			<tr>
				<td valign="top" align="left" style="width:210px; border: 1px solid #95CDE6">
					<table style="background-color:white">
						<tr>
							<td>
							 <form id="fileupload" method="POST" target="hidden_frame" action="http://10.168.1.160:8080/api/upload" enctype="multipart/form-data">
								
								<div class="btn  btn-success" style=margin-left:1px;background-color:#72BFEB >
									<i class="icon-plus icon-white"></i>	
									<span>添加文件...</span>
									<input id="i_videoFiles" accept="video/*" onchange="fileChanged(this)" type="file" name="videoFiles"  multiple />
								</div >
								<button onclick="fileUpload()" style="width:70px;" >
									<span >上传</span>
								</button >
								<span class="uploadProgressBar" id="i_uploadProgressBar">
										<img id="pb1_pbImage" title="0%" alt=" 0%" src="images/progressbar/progressbar.gif" width="120" style="width: 120px; height: 12px; background-image: url(/images/progressbar/progressbg_yellow.gif); padding: 0px; margin: 0px; background-position: -72px 50%;"><span id="pb1_pbText"> 0%</span>
								</span>
								<div style="display:none">
								<button onclick="test()" >
									<span>test</span>
								</button >
								</div>
							</form>
							</td>
						</tr>
						<tr>
							<td>
								<div >
									<select  style="width:150px;" class="search"  onchange="getDetailInformation(this.value)" id="i_videoSelect" >
										<option value="" selected>Select Video...</option>
											<%
												for (int i = 0; i < videoID.size(); i++) {
											%>
													<option value='<%=videoID.get(i)%>' title='<%=videoName.get(i)%>' ><%=videoName.get(i)%></option>
											<%
												}
											%>
									</select>
								</div>
								<div >
									<input style="width:150px" class="" type="text" id="i_wdate" value="时间设定" onFocus="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm:ss'})" readonly>
									<input class="input-mini" type="text" id="i_videoTime" name="videoTime" value="<%=videoTime%>" length=10/>
									<select style="display:none;" id="i_videoTimeSelect" name="videoTimeSelect" onchange="vidoeTimeChanged(this)">
										<option value="0">时间选择...</option>
										<option value="1" >此时此刻</option>
										<option value="2" selected>手动选择</option>
									</select >
								</div>
								
								<div >
									<input style="width:150px" class="input-mini"  type="text" id="i_locationName" 
										name="locationName" value="设定地点" onfocus="selectLocation(LocationId,'radio',LocationId_values);" />
									<input type="hidden" id="i_LocationId" name="LocationId" size=20 maxlength=9 value="" >
									<input type="hidden" name="LocationId_values" value="">
									<button style="display:none;" class="btn btn-small btn-warning" onclick="selectLocation(LocationId,'radio',LocationId_values);">
										<span >...</span>
									</button>
								</div>
								
								<div >
									<button  style="width:70px"  onclick="startTask()">
										<span>分析</span>
									</button>
									<button  style="width:70px"  onclick="cancelTask()">
										<span>取消</span>
									</button>
								</div>
								<div >
									<span>&nbsp;</span>
								</div >
								<div >
									<span class="progressBar" id="i_progressbar">
										<img id="pb1_pbImage" title="0%" alt=" 0%" src="images/progressbar/progressbar.gif" width="120" style="width: 120px; height: 12px; background-image: url(/images/progressbar/progressbg_yellow.gif); padding: 0px; margin: 0px; background-position: -72px 50%;"><span id="pb1_pbText"> 0%</span>
									</span>
								</div>
							</td>
						</tr>
					</table>
				</td>
				
				<td  valign="top" align="center"  colspan="3">
					<div class="">
						<span id="i_message" class=""><h3>ITS Report </h3> </span>
					</div>
					<div id="i_report" name="report" style="width:900;height:500;" >
						<!-- Here's the report! -->
						<table id="reportTable" cellSpacing=1 cellPadding=0   width=100% style="background-color:white">
							<tr style='background-color:#72BFEB'>
							<td class=tdHeader  align="center">ID</td>
							<td class=tdHeader >车牌</td>
							<td class=tdHeader >时间</td>
							<td class=tdHeader >地点</td>
							<td class=tdHeader width=80px><span>图片</span>
								<!-- <input class="checkbox" style="width:30px" onclick="checkChanged(this)" type="checkbox" id="" value="弹出" > -->
							</td>
							</tr>
						</table>
					</div>					
				</td>
				<!--<td onclick="closelisetSpace()" >
			         <DIV id="pagespantext" title="关闭右侧预览">8</DIV>    
			     </td>
				
				<td valign="middle" style="border:1px solid #95CDE6;">
						<div id="ListSpaces" style="border:1px #95CDE6 dashed;width:600;height:500;vertical-align:middle;" >
							<img onmouseover="mouseOver(this.src)" width="100%" id=showPicImg src="">
						</div>
				</td>
			--></tr>
		</table>
		<iframe name="hidden_frame" style="display:none;"  src="" id="i_hidden_frame" width=90% height=200 
			onReadyStateChange="frameStateChanged()"  >
		</iframe>
	</div>
</div>

<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<input id="qx_id" type="hidden" value="<%=qx%>"/>
<input id="taskId" type="hidden" value=""/>

<script type="text/javascript">

var timeHandle = null;
var iframeTimer = null;
var analysised = 'no';
var preTaskId = '0';


function showPicOnframe(img)
{
	$("#showPicImg").attr("src",img);
}

$(document).ready(function() {
	$("#i_progressbar").progressBar({ barImage: 'images/progressbar/progressbg_green.gif'} );
	$("#i_progressbar").progressBar(0);
	$("#i_uploadProgressBar").progressBar({ barImage: 'images/progressbar/progressbg_green.gif'} );
	$("#i_uploadProgressBar").progressBar(0);
	
	$("#i_videoTime").hide();
	$("#i_wdate").show();
/*
	Medianate.createMediante({
		callback:function(taskid){
			$("#taskId").val(taskid);
		},exceptionHandler : function(err_info) {
			alert(err_info);
		}
	});
	*/

});

function test()
{
	getReport();
}
function fileChanged(fileObj)
{
	$("#i_uploadProgressBar").progressBar(0);
}

var bUpload = false;
function frameStateChanged()
{
//	var html = $("#i_hidden_frame").html();
	if(bUpload)
	{
		bUpload = false;
		var pic = document.getElementById("i_videoFiles");
		var name = pic.value.split('\\');
		if(name.length<2){
			name = pic.value.split('/');
		}
		if(name.length<2){
			alert("文件路径错误!");
			return;
		}
		var fileName = name[name.length-1];
		Medianate.addUploadFile(fileName,{
			callback:function(rep){
				if(parseInt(rep)>0)
					bUpload = false;
			}
		});
		clearInterval(uploadTimer);
		var option = new Option(fileName, fileName);
		var select = document.getElementById("i_videoSelect");
		select.add(option,1);
		$("#i_uploadProgressBar").progressBar(100);
		setTimeout(function(){
				alert("上传完成！");
			},1000);
		
	}
	
}
var uploadPercent = 0;
function setUploadProgress()
{
	$("#i_uploadProgressBar").progressBar(uploadPercent++);
	if(uploadPercent>90)
		clearInterval(uploadTimer);
}

var uploadTimer = null;
function fileUpload()
{
	var pic = document.getElementById("i_videoFiles");
	var name = pic.value.split('\\');
	if(name.length<2){
		name = pic.value.split('/');
	}
	if(name.length<2){
		alert("文件路径错误!");
		return;
	}
	var fileName = name[name.length-1];
	if(fileName.split(" ").length>1)
	{
		alert("文件名不能有空格，请<bean:message key="button.modify" bundle="${language}"/>!");
		return;
	}
	Medianate.checkFileName(fileName,{
		callback:function(data){
			//alert(data);
			 if(data==1){
				alert("视频名已存在，请检查是否已上传过此视频，如没有，请<bean:message key="button.modify" bundle="${language}"/>名称后再上传！");
				return;
			}else{
				bUpload = true;
				$("#fileupload").submit();
				$("#i_uploadProgressBar").progressBar(0);
				uploadPercent = 0;
				uploadTimer = setInterval(setUploadProgress, 500);
			}
		},
		exceptionHandler:function(err_info)
        {
            if (err_info!="")
            {
                alert(err_info);
                window.open("<%=thisPath%>/logoffAction.do?"+new Date(),"_parent");
            }
            else
            {
                alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
                window.open("<%=thisPath%>/logoffAction.do?"+new Date(),"_parent");
            }
        }
	})
}

function vidoeTimeChanged(obj)
{
	switch(obj.selectedIndex)
	{
		case 0:
			$("#i_videoTime").hide();
			$("#i_wdate").hide();
			break;
		case 1:
		{
			var d = new　Date();
			$("#i_videoTime").val(d.getTime());
			$("#i_videoTime").hide();
			$("#i_wdate").hide();
			break;
		}
		default:
		{
		//	$("#i_videoTime").show();
			$("#i_wdate").show();
		}
	}
}
function selectLocation(locationID,type,hiddenValues)
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

function getReport()
{
	var portHtml="";
	$("#i_message").html("");
	Medianate.getReport($("#taskId").val(),preTaskId,
	{
		callback:function(rep){
			var port1 = rep.split("<R>");
			if(port1.length<1)
			{
				$("#i_report").html(rep);
				return;
			}
			portHtml += "<table cellSpacing=1 cellPadding=0  width=100% style=background-color:white>";
			portHtml += "<tr style='background-color:#72BFEB'>";
			portHtml += "<td class=tdHeader align='center' >ID</td>";
			portHtml += "<td class=tdHeader>车牌</td>";
			portHtml += "<td class=tdHeader>时间</td>";
			portHtml += "<td class=tdHeader>地点</td>";
			portHtml += "<td class=tdHeader width=80px><span>图片</span>";
			//portHtml += "<input class=\"checkbox\" style=\"width:30px\" onclick=\"checkChanged(this)\" type=\"checkbox\"  value=\"弹出\" >";
			portHtml += "</td>";
			portHtml += "</tr>";
			for(var i=0; i<port1.length-1; i++)
			{
				if(i%2==0) color = "TrColor";
				else color="tablebody";
				
				var port2 = port1[i].split("<C>");
				portHtml += "<tr>";
				for(var j=0; j<port2.length-2; j++)
				{
					portHtml += "<td class=' "+color+"'>";
					portHtml += port2[j];
					portHtml += "</td>";
					
				}
//<img src="db1.jpg" width=100 height=100 onmouseover="setShowSpace(this,'db1.jpg')" onmouseout="closelisetSpace()" >
				var picsrc = port2[port2.length-2];
				//portHtml += "<td><img   width=80 height=60 onclick=\"showPicOnframe(this.src)\" onmouseover=\"setShowSpace(this,this.src);\" src=\""+picsrc+"\" /></td>";
				portHtml += "<td><img   width=80 height=60 onclick=\"showPicOnframe(this.src)\" src=\""+picsrc+"\" /></td>";
				portHtml += "</tr>";
			}
			portHtml += "</table>";
			$("#i_report").html(portHtml);
			clearInterval(timeHandle);
		}
	});
	
}

var timed = 0;
function getPercent()
{
	Medianate.getPercent( $("#taskId").val(),
	{
		callback : function(percent){
			$("#i_progressbar").progressBar(percent);
			var percentInt = parseInt(percent);
			Medianate.getFinished($("#taskId").val(),
			{
				callback:function(bFinished)
				{
					timed ++;
					if(bFinished != true)
					{
						$("#i_report").html("已耗时: " + timed*2 + "s");
					}
					else
					{
						getReport();
					}
				}
			});
		}
	});	
	Medianate.getState($("#taskId").val(),
	{
		callback : function(state){
			if(state==null || state=="")
			{
				if(timeOutTimes>10)
				{
					clearInterval(timeHandle);
					alert("state is null");
				}
				timeOutTimes++;
			}
			$("#i_message").html("运行状态:"+state);
			if(state=="Failed")
			{
				clearInterval(timeHandle);
				$("#i_message").html("<h2><font color=red>运行失败,请检测视频文件是否正确!</font></h2>");
			}
		}
	});
}

var timeOutTimes = 0;

function startTask()
{
	if($("#i_videoTimeSelect").get(0).selectedIndex==2)
	{
		var ds = $("#i_wdate").val();
		var d2 = new Date(ds);
		$("#i_videoTime").val(d2.getTime());
		if(d2=="NaN")
		{
			alert("请选择时间");
			$("#i_wdate").focus();
			return ;
		}
	}
	var videoTime = $("#i_videoTime").val();
	var location = $("#i_locationName").val();
	var locationId = $("#i_LocationId").val();
	if(locationId=="")
	{
		alert("请设定地点");
		return;
	}
	var videoName ="";
	var videoIds ="";
	if($("#i_videoSelect ").get(0).selectedIndex<1)
	{
		$("#i_videoSelect ").focus();
		alert("请选择视频文件");
		return ;
	}
	else
	{
		videoName = $("#i_videoSelect").find("option:selected").text();
		videoIds = $("#i_videoSelect").find("option:selected").val();
	}
	if(analysised=="yes"){
		if(!confirm("本视频已分析过，再次分析分析所得数据将覆盖原来的数据，确定要再次分析吗？")){return;}
	}
	timeOutTimes = 0;
	$("#i_progressbar").progressBar(0);
	timed = 0;
	/*
	startTaskEx(String authName, String authPwd, 
						String taskName,
						String sources, String sourcesIds,
						String locationName,String locationId,
						long videoTime, String userCode,
	*/
//	alert("videoName="+videoName+"  videoTime="+videoTime +" location="+location);	return;
	Medianate.startTaskEx("admin", "resonate","task Test by karl",
			videoName, videoIds, 
			location, locationId, videoTime, "<%=user_code%>",
	{
		callback : function(data) {
			if(data != "")
			{
				$("#i_message").html(data);
				clearInterval(timeHandle);
			}else{
				Medianate.getTaskID({
					callback:function(taskid){
						if(taskid>0)
						{
							$("#taskId").val(taskid);
							timeHandle = setInterval(getPercent, 2000);
						}else
							alert("get task id failed!");
					},exceptionHandler : function(err_info) {
						alert(err_info);
					}
				});
				
			}
		},
		exceptionHandler : function(err_info) {
			if (err_info != "") {
				alert(err_info);
			} else {
				window.open(
						thispath + "/logoffAction.do?" + new Date(),
						"_parent");
				alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
			}
		}
	});
}

function cancelTask()
{
	var taskID = $("#taskId").val();
	if(taskID=="" || taskID<1){
		return;
	}
	Medianate.cancelTask(taskID,
	{
		callback:function(rep){
			$("#i_progressbar").progressBar(0);
			$("#i_message").html("任务已取消");
			if(rep!="")
				alert(rep);
			clearInterval(timeHandle);
		},exceptionHandler : function(err_info) {
			alert(err_info);
		}
	});
	
}

function getDetailInformation(v){
	analysised = 'no';
	var portHtml="";
	Medianate.getDetailInformation(v,
	{
		callback:function(rep){
			var port1 = rep.split("<R>");
			if(port1.length<2)
			{
				//$("#i_report").html("<table cellSpacing=1 cellPadding=0 class=tablestyle><tr>"
						//+"<td class=tdHeader width=50px align='center' >ID</td>"
						//+"<td class=tdHeader width=100px>车牌</td>"
						//+"<td class=tdHeader width=300px>时间</td>"
						//+"<td class=tdHeader width=100px>地点</td>"
						//+"<td class=tdHeader width=200px><span>图片</span></td>"
						//+"</tr></table>");
				$("#i_report").html("未找到分析结果，请点击分析按钮进行分析后获取分析结果 ");
				return;
			}
			if(port1.length>1){
				analysised = 'yes';
				preTaskId=rep.split("|")[1];
				//alert(rep.split("|")[1])
			}
			
			portHtml += "<table cellSpacing=1 cellPadding=0 width=100% style=background-color:white>";
			portHtml += "<tr style='background-color:#72BFEB'>";
			portHtml += "<td class=tdHeader  align='center' >ID</td>";
			portHtml += "<td class=tdHeader >车牌</td>";
			portHtml += "<td class=tdHeader >时间</td>";
			portHtml += "<td class=tdHeader >地点</td>";
			portHtml += "<td class=tdHeader width=80px><span>图片</span>";
			portHtml += "</td>";
			portHtml += "</tr>";
			for(var i=0; i<port1.length-1; i++)
			{
				if(i%2==0) color = "TrColor";
				else color="tablebody";
				
				var port2 = port1[i].split("<C>");
				portHtml += "<tr>";
				for(var j=0; j<port2.length-2; j++)
				{
					portHtml += "<td class=' "+color+"'>";
					portHtml += port2[j];
					portHtml += "</td>";
					
				}
				var picsrc = port2[port2.length-2];
				portHtml += "<td><img   width=80 height=60 onclick=\"showPicOnframe(this.src)\" src=\""+picsrc+"\" /></td>";
				portHtml += "</tr>";
			}
			portHtml += "</table>";
			$("#i_report").html(portHtml);
		}
	});
}


function showPicOnframe(s){
	//alert(s)
	$("#originalPic").show();
	$("#total").hide();
	$("#originalPic").html("<img src="+s+"  onclick=\"$('#originalPic').hide();$('#total').show();\" />");
	
}
</script>

</div>
</body>
</html>
