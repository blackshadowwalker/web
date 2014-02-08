<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<%
    baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
    String language = bform.language;
    System.out.println(language);
    String thisPath = request.getContextPath();
	String pagePath = (String)request.getAttribute("pagePath");	
%>
<html>
<head>
  <title><bean:message key="gis.title" bundle="${language}"/></title>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_wait_plugin/hx_wait_plugin.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/cloudVehicleTrackBean.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <SCRIPT src="<%=thisPath%>/table_view/jquery.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/modules/cloud/vehicleTrack/scripts/vehicleTrack.js" type=text/javascript></SCRIPT>
  <script language="javascript" type="text/javascript" src="<%=thisPath%>/modules/base/scripts/My97DatePicker/WdatePicker.js"></script>
  
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<style type="text/css">
	body, html,#allmap {width: 100%;height: 100%;overflow: hidden;hidden;margin:0;}
	#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
	#r-result{height:100%;width:20%;float:left;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script>
</head>
<body>


<div style="height:35px;background-color:#D1E9E9;padding-left:10px;padding-top:3px;" class=scrollarea>
    <span> <bean:message key="gis.carPlate" bundle="${language}"/>:</span>
    <input type="text" value=" " name="pltnum" id="i_pltnum"  >&nbsp;
   	<span>  <bean:message key="gis.timeSpan" bundle="${language}"/>:</span>
     <input type="text" value=" " name="" id="i_startTime"  class="Wdate"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" readonly>
     <span>--</span>
     <input type="text" value=" " name="" id="i_endTime" style=width:120px;height:22px; class="Wdate"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" readonly>
   <input type="button" value="<bean:message key="gis.button.search" bundle="${language}"/>" 
   		id="_reset" onclick="forQuery();"  style=height:22px;font-size:15px;>
   <input type="button" 
   		value="<bean:message key="button.cancel" bundle="${language}"/>" 
   		id="_cancel" onclick="cancel();"  style=height:22px;font-size:15px;>
</div>
<div id="allmap">
</div>
<script type="text/javascript">

	var waitObj=new hx_wait($("#this_path_id").val()+"/modules/base/hx_wait_plugin");
	var judge=false;
	var str="";
	var changeNum=0;
	var player;
	var wmp="classid=clsid:6BF52A52-394A-11D3-B153-00C04F79FAA6>"+
			"<PARAM NAME='URL' VALUE=''>"+
			"<PARAM NAME='rate' VALUE='1'>"+
			"<PARAM NAME='balance' VALUE='0'>"+
			"<PARAM NAME='currentPosition' VALUE='1'>"+
			"<PARAM NAME='playCount' VALUE='1'>"+
			"<PARAM NAME='autoStart' VALUE='1'>"+
			"<PARAM NAME='currentMarker' VALUE='1'>"+
			"<PARAM NAME='invokeURLs' VALUE='-1'>"+
			"<PARAM NAME='baseURL' VALUE=''>"+
			"<PARAM NAME='volume' VALUE='50'>"+
			"<PARAM NAME='defaultFrame' VALUE=''>"+
			"<PARAM NAME='mute' VALUE='0'>"+
			"<PARAM NAME='uiMode' VALUE='full'>"+
			"<PARAM NAME='stretchToFit' VALUE='0'>"+
			"<PARAM NAME='windowlessVideo' VALUE='0'>"+
			"<PARAM NAME='enabled' VALUE='-1'>"+
			"<PARAM NAME='enableContextMenu' VALUE='-1'>"+
			"<PARAM NAME='fullScreen' VALUE='0'>"+
			"<PARAM NAME='SAMIStyle' VALUE=''>"+
			"<PARAM NAME='SAMILang' VALUE=''>"+
			"<PARAM NAME='SAMIFilename' VALUE=''>"+
			"<PARAM NAME='captioningID' VALUE=''>"+
			"</OBJECT>" ;
	var map = new BMap.Map("allmap");
	var pre_point = new BMap.Point(116.318912, 40.03708); //116.318912  40.037083
	map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
	map.centerAndZoom(pre_point, 11);	
	map.enableScrollWheelZoom();   
	map.enableContinuousZoom();
	
	map.addControl(new BMap.MapTypeControl());
	map.setCurrentCity("北京");
	
	function myFun(result){
	var cityName = result.name;
	map.setCenter(cityName);
	
	}
	var myCity = new BMap.LocalCity();
	myCity.get(myFun);
	
	// 编写自定义函数,创建标注
	function addMarker(point,infoWindow,id){
		if(judge){
			  var marker = new BMap.Marker(point);
			  map.addOverlay(marker);
			  marker.addEventListener("click", function(){
					this.openInfoWindow(infoWindow);
					document.getElementById("img_"+id).onload = function (){
					     infoWindow.redraw();   //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
					}
			  });
		}
		infoWindow.addEventListener("close",function(){
			changeNum=0;
		});
	}
	// 向地图添加个标注
	var bounds = map.getBounds();
	var sw = bounds.getSouthWest();
	var ne = bounds.getNorthEast();
	var lngSpan = Math.abs(sw.lng - ne.lng);
	var latSpan = Math.abs(ne.lat - sw.lat);

	function cancel(){
		judge=false;
		waitObj.hide();
		map.clearOverlays();
	}
	
	function forQuery()
	{
		judge=true;
	    var pltnum = $.trim($("#i_pltnum").val());
	    if(pltnum==""){
	    	$("#i_pltnum").val("");
			$("#i_pltnum").focus();
			alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="gis.carPlate" bundle="${language}"/>!");
			return;
		}
		var startTime = $.trim($("#i_startTime").val());
		 if(startTime=="" || startTime=="<bean:message key="gis.startTime" bundle="${language}"/>"){
		    	$("#i_startTime").val("");
				$("#i_startTime").focus();
				alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="gis.startTime" bundle="${language}"/>!");
				return;
			}
		var endTime = $.trim($("#i_endTime").val());
		 if(endTime=="" || endTime=="<bean:message key="gis.endTime" bundle="${language}"/>"){
		    	$("#i_endTime").val("");
				$("#i_endTime").focus();
				alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="gis.endTime" bundle="${language}"/>!");
				return;
			}
		 
		 
		waitObj.show({
	    	left:"25%",
	    	bottom:"50%",
	    	width:"280px",
	    	height:"50px",
	    	text_align:"center",
	    	msg:"<span style=\"font-weight:bold;\"><bean:message key="button.query" bundle="${language}"/>...</span>"
    	});
		
		cloudVehicleTrackBean.getCarTrack( pltnum, startTime, endTime,
	    {
	        callback:function(data)
	        {   
	            if(data=="-1")
	            {
	            	alert("Error!");
	            }
	            else
	            {
		           if(data==null || data==""){ 
		        	   alert("<bean:message key="msg.error.dataEmputy" bundle="${language}"/>！ ");
		        	   waitObj.hide();
					   map.clearOverlays();
		        	   return;
		           }
	            	map.clearOverlays();  
	            	rowElements=data.split("</R>");   
	         		var aray = new Array();     
	                 for(i=0;i<rowElements.length-1;i++){
	                	
	                 	colElements=rowElements[i].split("</C>");
	                 	var point = new BMap.Point(colElements[0], colElements[1]);
	                 	var infoWindow=new BMap.InfoWindow("<div><h4 style='margin:0 0 5px 0;'>"+colElements[2]+"</h4>" +
	                 	//切换(图片/视频)
	                 	"<a href='#' onclick='change("+colElements[5]+",\""+colElements[4]+"\",\""+colElements[6]+"\");' ><bean:message key="gis.swithcPicVideo" bundle="${language}"/></a>" + 
						"<img style='float:left;margin:4px' id='img_"+colElements[5]+"' src='"+colElements[3]+"' width='400' height='300' title=''/>" +
						"<OBJECT style='display:none;' id='v_"+colElements[5]+"' height=300 width=400 standby=Loading... "+wmp+
						"</div>");
	                 	addMarker(point,infoWindow,colElements[5]);
	                 	aray[i]= new BMap.Point(colElements[0], colElements[1]);
	     			}
	                 if(judge){
	                	 var polyline = new BMap.Polyline(aray, {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});
	               	 	 map.addOverlay(polyline);
	                 }
	               	 waitObj.hide();
	            }
	        },
	        exceptionHandler:function(err_info)
	        {
	            waitObj.hide();
	            //stop_scrollbar(timer,"");
	            if (err_info!="")
	            {
	                alert(err_info);
                	window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
	            }
	            else
	            {
	                alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
	                window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
	            }    
	        }
	    });
	    
	}
	  	function change(id,url,cts){
	  		if(changeNum==0){
	  			player = document.getElementById("v_"+id);
		  		player.url=url;
		  		$("#img_"+id).hide();
		  		$("#v_"+id).show();
		  		var ss=cts/1000/1000-1;
		  		window.setTimeout("player.controls.currentPosition="+ss,500);
	  		}
	  		else if(changeNum%2==0){
	  			player = document.getElementById("v_"+id);
		  		player.url=url;
		  		$("#img_"+id).hide();
		  		$("#v_"+id).show();
		  		player.controls.currentPosition=cts/1000/1000-1;
	  		}else{
	  			player = document.getElementById("v_"+id);
		  		player.url="";
		  		$("#img_"+id).show();
		  		$("#v_"+id).hide();
	  		}
	  		changeNum++;
	  	}
  </script>
</body>
</html>