<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<%
String thisPath=request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title><bean:message key="report.chart" bundle="${language}"/></title>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
  
  <script src="<%=thisPath%>/scripts/Highcharts-3.0.1/js/highcharts.js"></script>
  <script src="<%=thisPath%>/scripts/Highcharts-3.0.1/js/modules/exporting.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_wait_plugin/hx_wait_plugin.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/statisticBean.js"></script>
  
</head>
<body>
<script type="text/javascript">
var thispath="<%=thisPath %>";
var waitObj=new hx_wait($("#this_path_id").val()+"/modules/base/hx_wait_plugin");	
    waitObj.show({
    	
    	left:"25%",
    	bottom:"50%",
    	width:"280px",
    	height:"50px",
    	text_align:"center",
    	msg:"<span style=\"font-weight:bold;\"><bean:message key="msg.inProgress" bundle="${language}"/>...</span>"
    });

	<%
	String time_1=request.getParameter("time_1");
	String time_2=request.getParameter("time_2");
	String location=request.getParameter("location");
	%>
	//alert("<%=time_1%>"+"<%=time_2%>"+"<%=location%>");
	
	statisticBean.chartReport("<%=time_1%>","<%=time_2%>","<%=location%>",
	{
		callback:function(data){
		if(data!=null && data!=""){
			//alert(data);
			var array=data.split("</R>");
			//alert(array[0]+"\n"+array[1]+"\n"+array[2]+"\n"+array[3])
			var array_time_x=array[1].split("</C>");
			var array_time_y=array[0].split("</C>");
			for(i=0;i<array_time_y.length;i++){
				array_time_y[i]=parseInt(array_time_y[i]);
			}
			var array_loca_x=array[3].split("</C>");
			var array_loca_y=array[2].split("</C>");
			for(j=0;j<array_loca_y.length;j++){
				array_loca_y[j]=parseInt(array_loca_y[j]);
			}
			//alert(array_time_x+" "+array_time_y)
			$('#container1').highcharts({
		            chart: {
		                type: 'spline'
		            },
		            title: {
		                text: '<bean:message key="report.chart.accordtime" bundle="${language}"/>'
		            },
		            xAxis: {
		                tickInterval :array_time_x.length/6>1?parseInt(array_time_x.length/6):1,
		                categories: array_time_x
		            },
		            yAxis: {
		            	min: 0,
		                title: {
		                    text: ''
		                },
		                labels: {
		                    formatter: function() {
		                        return this.value
		                    }
		                }
		            },
		            tooltip: {
		                crosshairs: true,
		                shared: true
		            },
		            plotOptions: {
		                spline: {
		                    marker: {
		                        radius: 4,
		                        lineColor: '#666666',
		                        lineWidth: 1
		                    }
		                }
		            },
		            series: [
		 		        {
		                name: '<bean:message key="report.chart.flow" bundle="${language}"/>',
		                marker: {
		                    symbol: 'diamond'
		                },
		                data: array_time_y
		            	}
			        ],credits: {
				    	enabled: false,
				    	href: "http://www.teleframe.cn/",
					    text: "信帧科技"
					}
		        }); 
			

			$('#container2').highcharts({
	            chart: {
	                type: 'column'
	            },
	            title: {
	                text: '<bean:message key="report.chart.accordlocation" bundle="${language}"/>'
	            },
	            subtitle: {
	                text: ''
	            },
	            xAxis: {
	            	tickInterval :array_loca_x.length/6>1?parseInt(array_loca_x.length/6):1,
	                categories: array_loca_x
	            },
	            yAxis: {
	                min: 0,
	                title: {
	                    text: ''
	                }
	            },
	            tooltip: {
	                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	                pointFormat: '<tr><td style="color:{series.color};padding:0;border:none">{series.name}: </td>' +
	                    '<td style="padding:0;border:none"><b>{point.y:.0f} 次</b></td></tr>',
	                footerFormat: '</table>',
	                shared: true,
	                useHTML: true
	            },
	            plotOptions: {
	                column: {
	                    pointPadding: 0.2,
	                    borderWidth: 0
	                }
	            },
	            series: [{
	                name: '<bean:message key="report.chart.flow" bundle="${language}"/>',
	                data: array_loca_y
	    
	            }],credits: {
			    	enabled: false,
			    	href: "http://www.teleframe.cn/",
				    text: "信帧科技"
				}
	 		});	        
			
			
			waitObj.hide();
		}else{
			alert("<bean:message key="report.chart.nodata" bundle="${language}"/>");
			waitObj.hide();
		}
		},
		exceptionHandler : function(err_info) {
			if (err_info != "") {
				alert(err_info);
				window.open(
						thispath + "/logoffAction.do?" + new Date(),
						"_parent");
			} else {
				alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
				window.open(
						thispath + "/logoffAction.do?" + new Date(),
						"_parent");
			}
		}	
	});
</script>
<center>
<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<div style="border:1px solid black;width:1000px; height:400px;margin-top:100px">
	<div id="container1" style="min-width: 499px; height: 400px; float:left"></div>
	<div  style="min-width: 1px; height: 400px; float:left; background-color:black"></div>
	<div id="container2" style="min-width: 490px; height: 400px; float:left"></div>
</div>
</center>
</body>
</html>