<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<html>

<%
    String thisPath=request.getContextPath();
	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
	String user_loc=bform.locationId;
%>

<head>
  <title>视频选择</title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/casemanageBean.js"></script>
  <script language="javascript" type="text/javascript" src="<%=thisPath%>/modules/base/scripts/My97DatePicker/WdatePicker.js"></script>
  
  <style type="text/css">
  	.ttr{background-color:#9DD1E7;boder:1px;}
  	.ttd{background-color:#E8F2FE;boder:1px;}
  </style>
</head>
<script language="javascript">
    var args = window.dialogArguments;
</script>
<body>
<div class=cardbody >
	<bean:message key="filemgr.columns.id" bundle="${language}"/>：<input type="text" id="id" name="id" value="" /> <bean:message key="filemgr.columns.fileName" bundle="${language}"/>：<input type="text" id="name" name="name" value="" />
	<bean:message key="filemgr.columns.uploader" bundle="${language}"/>：<input type="text" id="uploader" name="uploader" value="" /> <br/><bean:message key="filemgr.columns.absTime" bundle="${language}"/>：<input type="text" id="absTime" name="absTime" value="" class="Wdate" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" style=width:152px; readonly />
	<bean:message key="filemgr.columns.location" bundle="${language}"/>：<input type="text" id="_locationName" name="_locationName" value="" style="width:152px;" readonly onclick="forLocationTree_query(locationId)">
      	<input type="hidden" id="locationId" name="locationId" size=20 maxlength=20 value="" disabled ><input type="button" value="<bean:message key="button.query" bundle="${language}"/>" onclick="createTable();" />
	<table id="tab" width=100% cellSpacing=1 cellPadding=0 >
		<tr>
			<td class=ttr ></td>
			<td class=ttr ><bean:message key="filemgr.columns.id" bundle="${language}"/></td>
			<td class=ttr ><bean:message key="filemgr.columns.fileName" bundle="${language}"/></td>
			<td class=ttr ><bean:message key="filemgr.columns.uploader" bundle="${language}"/></td>
			<td class=ttr ><bean:message key="filemgr.columns.location" bundle="${language}"/></td>
			<td class=ttr ><bean:message key="filemgr.columns.absTime" bundle="${language}"/></td>
			<td class=ttr ><bean:message key="casemgr.label.operate" bundle="${language}"/></td>
		</tr>
	</table>
	<input type="button" onclick="forSure()" value="<bean:message key="button.label.submit" bundle="${language}"/>" /> 
	<button name="button" onClick="forAbort()" class="button"><bean:message key="button.label.close" bundle="${language}"/></button>
</div>
<script language="JavaScript"> 
$(document).ready(function(){
	createTable();
	heartbeat();
})
function createTable(){
	var table=document.getElementById("tab");
	for(var n=table.rows.length;n>1;n--){
		table.deleteRow(n-1);
	}

	var index = 1;

	var s="";
	var id=$("#id").val();
	if(id!=""){
		s+=" AND v.id like '%"+id+"%'";
	}
	var name=$("#name").val();
	if(name!=""){
		s+=" AND v.name like '%"+name+"%'";
	}
	var absTime=$("#absTime").val();
	if(absTime!=""){
		s+=" AND v.absTime like '%"+absTime+"%'";
	}
	var uploader=$("#uploader").val();
	if(uploader!=""){
		s+=" AND v.uploader like '%"+uploader+"%'";
	}
	var locationId=$("#locationId").val();
	if(locationId!=""){
		s+=" AND v.locationId like '%"+locationId+"%'";
	}
	dwr.engine.setAsync(false);
	   casemanageBean.getVideos(s,
	  	{
	       callback:function(data)
	       {
	           rowElements=data.split("</R>"); 
	           for(i=0;i<rowElements.length-1;i++){
		           	colElements=rowElements[i].split("</C>");
		           	var nextRow = table.insertRow(index);
	          		for(j=0;j<7;j++){
	          			var newCell = nextRow.insertCell(j);
	          			newCell.setAttribute("className","ttd");
	          			if(j==0){
	          				newCell.innerHTML ="<input type='checkbox' name='choise' value="+colElements[0]+" />";
	          			}else if(j==6){
	          				newCell.innerHTML ="<a style=color:#6CA2D6 href='javascript:show_video("+colElements[0]+");'><bean:message key="casemgr.label.view" bundle="${language}"/></a>";
	          			}else{
	          				newCell.innerHTML =colElements[j-1];
	          			}
	          		}
	          		index++;
	           }
	       }
	  	})
	  	if(args!="" && args!=null){
		   var defaut_sel=args.split("</C>")[0].split(",");
		   //alert(args.split("</C>")[1]);
		   for(num=0;num<defaut_sel.length;num++){
			   $("input[type=checkbox][value="+defaut_sel[num]+"]").attr("checked","checked");
		   }
	   }
	dwr.engine.setAsync(true);
	   
}
</script>
<script language="JavaScript">    

function forAbort()    
{         
    window.close();    
} 

function forSure(){
	var v=$("[name='checkbox'],[checked]");
	//var v=$($("input[name=choise],[checked]");
	//var v= $('input:checkbox:checked');
	var s=new Array();
	var str="";
	for(m=0;m<v.length;m++){
		//alert(v[m].value);
		s[m]=v[m].value;
	}
	if(confirm("您共选中"+v.length+"个视频,确定此操作吗？ ")){
		if(s.length>0)
			str=s.toString();
		window.returnValue=str;
		window.close();
	}
}

function forLocationTree_query(_locationId)
	{
	   // var dept = "37015oooo";
		
	    var srcFile = '<%=thisPath%>'+"/modules/base/jsp/locationtree.jsp?jgbm="+'<%=user_loc%>'+"&type="+"radio";
	
	    var winFeatures = "dialogHeight:600px;dialogWidth:450px;help:no;status:no";
	
	   	var inArray = window.showModalDialog(srcFile, "", winFeatures);
		
		if (typeof(inArray) == "undefined"||inArray == "")
		{
	     	//test.value = "";
	     }
	     else
	     {
			_locationId.value = inArray.split("</C>")[1];	
			$("#_locationName").val(inArray.split("</C>")[2]);
		}
	}
		var lastScrollY = 0;
		window.onscroll = function(){
			heartbeat();
		}
        function heartbeat()
        {
            var diffY;
            if (document.documentElement && document.documentElement.scrollTop)
            {
                diffY = document.documentElement.scrollTop;
            }
            else if (document.body)
            {
                diffY = document.body.scrollTop
            }
            var percent = 1 * (diffY-lastScrollY);
            if (percent > 0)
            {
                percent = Math.ceil(percent);
            }
            else 
            { 
                percent = Math.floor(percent);
            }
    
            document.getElementById("full").style.bottom = 
            parseInt(document.getElementById("full").style.bottom) - percent + "px";
 
            lastScrollY = lastScrollY + percent;
        }
        suspendcode = "<div id='full' style='background-color: #3354e6;color:black;right:1px;POSITION:absolute;BOTTOM:10px;z-index:100'><a style='cursor: pointer;' onclick='forSure();'>"+"<bean:message key="button.label.submit" bundle="${language}"/>"+"</a><br></div>"
        document.write(suspendcode);
        
        
        function show_video(id){
			var srcFile = "viewvideo.jsp";
			var winFeatures = "dialogHeight:600px;dialogWidth:580px;help:no;status:no";
			var para;
			if(args!=null && args!=""){
				para=id+"</C>"+args.split("</C>")[1];
				dwr.engine.setAsync(false);
				casemanageBean.videoSession(id,args.split("</C>")[1],
				{
					
				});
			    dwr.engine.setAsync(true);
			}else{
				para=id+"</C>";
				winFeatures = "dialogHeight:330px;dialogWidth:580px;help:no;status:no";
			}
			//alert(args)
			
			var winFeatures = window.showModalDialog(srcFile, para, winFeatures);
		}
</script> 
</body>

</html>
