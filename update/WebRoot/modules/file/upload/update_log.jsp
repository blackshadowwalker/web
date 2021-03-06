<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String thisPath = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+thisPath+"/";
%>


<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="Access-Control-Allow-Origin" content="*">
 	 <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1";/>
    <title>车牌识别用户检测更新日志</title>
    
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script>
	<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
	
	<style>
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;}
		
		td,th{
		    border: 1px solid #C1DAD7;   
		    background: #fff;
		    font-size:9px;
		    padding: 6px 6px 6px 12px;
		    color: #4f6b72;
		}
		.hover
		{
		  background-color: #f00;
		}
		.odd{ background-color: #bbf;}
		.even{ background-color:#ffc; }
		.booter{
			margin-right: 10px;
		}
		.ipclass{
			cursor: hand;
		}
		
		.form-div{
	      	max-width: 510px;
	        margin: 0 auto 20px;
	        background-color: #fff;
	        border: 1px solid #e5e5e5;
	        vertical-align:middle;
	        -webkit-border-radius: 5px;
	           -moz-border-radius: 5px;
	                border-radius: 5px;
	        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
	           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
	                box-shadow: 0 1px 2px rgba(0,0,0,.05);
	      }
	      .topbar span{
	   	  	color:#000;
	   	  	font-weight:bold;
		  }
		  .topbar:hover{
	   	  	cursor:move;		  
		  }
		  .result{  
		  	position:fixed;
			margin: auto auto 10px auto ;
		}
		 .hiddenclass{
		 	display:none;
		 }
		
	</style>

  </head>
  
  <body>

<table style="width:100%; height:100%;">
<tr >
<td  style="width:400px;" valign=top>
	<div id="topleft">
		<center>
			<a href="javascript:FreshData();" >刷新</a>
			<span id="status"></span>
			<br />
			<span id="locationdiv"></span>
		</center>
	</div>
	<hr>

	<!--		
	<div id="resultframe" class="form-div result" style="">
      	<div class=topbar >
			<span>&nbsp;</span>
		</div>
      	<div>
		<iframe name="location" style="width:500px;height:40px; border=0px;" 
			src="http:\/\/int.dpool.sina.com.cn\/iplookup\/iplookup.php?format=text&ip=" ></iframe>
		</div>
	</div>	
	-->
	<div>
		<span id="btlogmin" onclick="resizeLogdiv(this);" style="cursor:hand;" title="min" >&lt;&lt;</span>
		|
		<span onclick="showNullPhone(this);" style="cursor:hand;" >显示空号</span>
	</div>
	<div id="logdiv" style="width:400px;height:90%;border:0px #f00 solid; font-size:9px;float:left;overflow:scroll">
   	<center>
   		<P></P>
   		<table id="updateLogList" border =1>
   			<tr>
   				<th class=hiddenclass>ID</th>
   				<th>IP</th>
   				<th>PHONE</th>
   				<th class=hiddenclass>latitude</th>
   				<th class=hiddenclass>longitude</th>
   				<th >Time</th>
   				<th class=hiddenclass>ShowMap</th>
   			</tr>
   		</table>
   		
   		<br>
		
	
	
	<hr/>
   </center>
	</div>
</td>	

<td style="width:100%;">	
	<div id="allmap" >map</div>
</td>
</tr>
</table>
	
	<script src="<%=thisPath%>/jquery/jquery.min.js"></script>
	<script src="<%=thisPath%>/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=thisPath%>/jquery/jquery-ui.js"></script>
	
    <script type="text/javascript">
    
    	//地图初始化
		var bm = new BMap.Map("allmap");
		var pre_point = new BMap.Point(116.318912, 40.03708); //116.318912  40.037083
		bm.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
		bm.centerAndZoom(pre_point, 17);	
		bm.enableScrollWheelZoom(); 
		
		$(document).ready(function(){
    	//	$( "#resultframe" ).draggable();
    		$.get("iplookup?ip=", "", IpInfo, "text" );
			$.get("<%=thisPath%>/update/log", "", updateLog, "text" );
    	});
		
		function FreshData(){
			$.get("<%=thisPath%>/update/log", "", updateLog, "text" );
		}
		

		function resizeLogdiv(obj){
			if($("#logdiv").css("display")=="none"){
				$("#topleft").css("display","block");
				$("#logdiv").css("display","block");
				$(obj).html("<<");
			}else{
				$("#logdiv").css("display","none");
				$("#topleft").css("display","none");
				$(obj).html(">>");
			}
		}
		var bShowNull = false;
		
		function showNullPhone(obj){
			bShowNull = !bShowNull;
			if(bShowNull)
				$(obj).html("隐藏空号");
			else
				$(obj).html("显示空号");
			FreshData();
		}
		
		function updateLog(response,status,xhr){
			var ret = eval("("+response+")");
			var obj = ret.data;
   			$("#updateLogList tr:gt(0)").remove();
   			$(obj).each(function(index){
			
   				var log = obj[index];
				if(bShowNull || (log.phone!=undefined && log.phone!="") )
				{
					var newRow = "<tr>"
					newRow += "<td class=hiddenclass>"+log.id+"</td>";
					newRow += "<td class=ipclass onclick=\"getIp(this);\" title='Show Location ?'>"+log.ip+"</td>";
					newRow += "<td class=ipclass onclick=\"showMap('"+log.latitude+"', '"+log.longitude+"',\'"+log.phone+"\');\" title='showMap'>"+log.phone+"</td>";
					newRow += "<td class=hiddenclass>"+log.latitude+"</td>";
					newRow += "<td class=hiddenclass>"+log.longitude+"</td>";
					newRow += "<td class=ipclass onclick=\"alert('"+log.version+"')\" title=\""+log.version+"\">"+log.time+"</td>";
				//	newRow += "<td><a href=\"javascript:showMap(\'"+log.latitude+"\', \'"+log.longitude+"\');\">ShowMap</a></td>";
					newRow += "</tr>";
					$("#updateLogList tr:last").after(newRow);
				}
   			});
			$("#updateLogList tr:gt(0)").hover(
			    function () { $(this).addClass("hover") },
			    function () { $(this).removeClass("hover") });
    	};
		
		var mLabel = "这里哦";
		//坐标转换完之后的回调函数
		translateCallback = function (point){
		    var marker = new BMap.Marker(point);
		    var label = new BMap.Label(mLabel,{offset:new BMap.Size(20,-10)});
			bm.setCenter(point);
		    marker.setLabel(label); //添加百度label
			bm.addOverlay(marker);
		//	bm.centerAndZoom(point, 15);	
		}

    	function showMap(y, x, phone){
			if(x==0 && y==0)
			{
				$("#status").html("<font color=red>经纬度为空!</font>");
				return ;
			}
			$("#status").html("经度:"+x + "  纬度:"+y);
			mLabel = phone;
    		var xx = x;
			var yy = y;
			var gpsPoint = new BMap.Point(xx,yy);

			BMap.Convertor.translate(gpsPoint,0,translateCallback);     //真实经纬度转成百度坐标
    	}

		function IpInfo(response,status,xhr){
			var data = eval("("+response+")");
			if(data.ret==1)
				$("#locationdiv").html(data.ip + ":" + data.country + data.province + data.city + data.district + "["+data.isp+"]");
			else
				$("#locationdiv").html(ret.ip + ":查询失败");
		}
		function getIp(obj){
    		//var ipurl = "http:\/\/int.dpool.sina.com.cn\/iplookup\/iplookup.php?format=json&ip="+obj.innerHTML;
			//var ipurl = "http://whois.pconline.com.cn/jsFunction.jsp?callback=callbackIP&ip="+obj.innerHTML;
			var ipurl = "iplookup?ip="+obj.innerHTML;
			// 从后台用  httpclient查询
			//$.getJSON(ipurl, function(data){  
				//alert(data);  
			//}); 
			$.get(ipurl, "", IpInfo, "text" );
			//window.open(ipurl, "location");
    	}

	
    </script>

  </body>
</html>