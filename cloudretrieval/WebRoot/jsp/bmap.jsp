<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;}
		#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
		#r-result{height:100%;width:20%;float:left;}
		</style>
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script>
		<title>bmap</title>
</head>
<body>
		<div id="allmap"></div>
<script type="text/javascript">
	alert("请在地图上点击择地点")
	var map = new BMap.Map("allmap");
	map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
	
	map.enableScrollWheelZoom();   
	map.enableContinuousZoom(); 

	function myFun(result){
	    var cityName = result.name;
		map.setCenter(cityName);
	    //alert(cityName);
	}
	var myCity = new BMap.LocalCity();
	myCity.get(myFun);   
	
	function showInfo(e){
	// alert(e.point.lng + ", " + e.point.lat);  //经度，纬度
	//alert(map.getZoom());  //缩放级别 
	//map.centerAndZoom(new BMap.Point(116.4035,39.915),15);  //初始化时，即可设置中心点和地图缩放级别。

	window.returnValue=e.point.lng + ", " + e.point.lat + ", " + map.getZoom();
	window.close();
	 
	 var point = new BMap.Point(e.point.lng,e.point.lat);
	 map.centerAndZoom(point,12);
	 var gc = new BMap.Geocoder();   
	 var pt = e.point;
	    gc.getLocation(pt, function(rs){
	        var addComp = rs.addressComponents;
	       // alert(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber);
	  });   
	}
	map.addEventListener("click", showInfo);

</script>
</body>
</html>