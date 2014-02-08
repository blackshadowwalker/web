<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ page language="java" contentType="text/html;charset=GBK" %>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>


<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<%
    String thisPath=request.getContextPath();
	String picture = (String)request.getSession().getAttribute("picture");

	List XycdIDs = (List)request.getSession().getAttribute("XycdIDs");
	List XycdNames = (List)request.getSession().getAttribute("XycdNames");
%>
<html>
<script language="javascript">
    var args = window.dialogArguments;
</script>
<head>
  <title><bean:message key="clgl.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/clglBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar.js"></script>
   <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
  <script type="text/javascript" src="<%=thisPath%>/scripts/validateForm.js"></script>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>

<div class=cardbody>

<form id="nvr_form">

<div class=tablebody style="width:200px; height:300px;float:left;">
	<img  style="width:500px; height:400px;" id=i_image name=image src="" />
	<input type="hidden" id="imagePath" name="imagePath" value="" />
	<input type="hidden" id="originImagePath" name="originImagePath" value="" />
</div>
<div style="float:left;">
<table width=400px height=400px; cellSpacing=1 cellPadding=0 class="tablestyle">

  <tr>
    <td class=tablebodyhead width=150px><bean:message key="clgl.columns.lpNumber" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_id" name="LPnumber"  readonly="true" disabled size=40  >
    </td>
  </tr>
  
  <tr>
    <td class=tablebodyhead width=150px><bean:message key="clgl.columns.time" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_type" name="time"  readonly="true" disabled size=40>
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="clgl.columns.location" bundle="${language}"/></td>
    <td class=tablebody>
      <input type="text" id="i_code" name="location"  readonly="true" disabled   size=40 maxlength=40 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="clgl.columns.xycd" bundle="${language}"/></td>
    <td class=tablebody>
      <select size="1"  name="xycd" value=""  >
	      <option value=''><bean:message key="clgl.label.xycdSelect" bundle="${language}"/></option>
			<%
			    for (int i = 0; i < XycdIDs.size(); i ++){
			%>
			        <option value='<%=XycdIDs.get(i)%>'><%=XycdNames.get(i)%></option>
			<%
			    }
			%>
		</select> 
    </td>
  </tr>
  
  <tr>
    <td class=tablebodyhead><bean:message key="clgl.columns.comment" bundle="${language}"/></td>
    <td class=tablebody>
      <textarea cols="25" rows="5" d="i_content" name="comment"  value="" >
      </textarea>
    </td>
  </tr>
  <tr style="height:100%;" r>
  	<td colspan="2" class=tablebody>
  		<!-- 
  			clgl.img.originImage=原图
			clgl.img.Retinex=综合处理
			clgl.img.FogRemove=去雾
			clgl.img.LowLight=低照度
			clgl.img.TooBright=过亮
			clgl.img.Deblur=去模糊
  		 -->
  		<select id="i_ImageEnhancement"  onclick="ImageEnhancement();" size=8  >
  			<option value=""><bean:message key="clgl.img.originImage" bundle="${language}"/></option>
  			<option value="Retinex"><bean:message key="clgl.img.Retinex" bundle="${language}"/> </option>
  			<option value="FogRemove"><bean:message key="clgl.img.FogRemove" bundle="${language}"/></option>
  			<option value="LowLight"><bean:message key="clgl.img.LowLight" bundle="${language}"/></option>
  			<option value="TooBright"><bean:message key="clgl.img.TooBright" bundle="${language}"/></option>
  			<option value="Deblur"><bean:message key="clgl.img.Deblur" bundle="${language}"/></option>
  		</select>
  		<input id="i_used" type="checkbox" />
  			<bean:message key="clgl.checkbox.sequential" bundle="${language}"/>
  	</td>
 </tr>
 <tr align=right>
 	<td class=tablebody colspan="2" >
		<button name="button" onClick="forSure()" class="button">
			<bean:message key="button.label.submit" bundle="${language}"/>
		</button>
		<button name="button" onClick="forAbort()" class="button">
			<bean:message key="button.label.close" bundle="${language}"/>
		</button>
 	</td>
 </tr>
</table>
</div>


<script language="javascript">


    dwr.engine.setAsync(false);

    clglBean.beforeUpdateTSClgl(parseInt(args.rowID),
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
        
            colElements=rowElements[0].split("</C>");

         // document.forms[0].id.locationId = colElements[0];
          
            document.forms[0].LPnumber.value = colElements[0];
            document.forms[0].time.value = colElements[1];
            document.forms[0].location.value = colElements[2];
            document.forms[0].xycd.value = colElements[3];
            document.forms[0].comment.value = colElements[4];
            document.forms[0].image.src = colElements[5];
            document.forms[0].imagePath.value = colElements[5];

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
    });
    clglBean.downloadImageToLocal(parseInt(args.rowID),
    {
        callback:function(ret)
        {
        	$("#i_ImageEnhancement").removeAttr("disabled");
			if(ret==null || ret=="")
				return ;
			$("#originImagePath").val(ret);
			$("#imagePath").val(ret);
			var url =  "<%=thisPath%>/"+ ret+"?time="+new Date();
			document.forms[0].image.src =url;
        },
        exceptionHandler : function(err_info){
			$("#i_ImageEnhancement").removeAttr("disabled");
			alert(err_info);
		}
	});
        
    dwr.engine.setAsync(true);
    
    window.setTimeout(seterror,300);
	
    function seterror(){//判断图片是否存在  

   	var imgurl=document.getElementById("img_").src;
   	var ImgObj = new Image(); 
   	ImgObj.src = imgurl;  
   	
   	if (ImgObj.width > 30 && ImgObj.height > 30) { 
   		
   	} else {  
   		document.getElementById("img_").src="<%=thisPath%>/images/base/404largerversion.png";
   	}  
  }
</script>
</form>
	

</div>

<script language="JavaScript">    
var id = args.rowID;

function ImageEnhancement(){
	var functionName= $("#i_ImageEnhancement").val();
	if(functionName==""){
		$("#imagePath").val($("#originImagePath").val());
		var url =  "<%=thisPath%>/"+ $("#originImagePath").val()+"?time="+new Date();
		document.forms[0].image.src =url;
		return;
	}
	$("#i_ImageEnhancement").attr("disabled","disabled");
	
	var filepath ="";
	if($("#i_used").attr("checked"))
		filepath = $("#imagePath").val();
	else
		filepath = $("#originImagePath").val();
	clglBean.ImageEnhancement(id, functionName, filepath,{
		callback : function(ret){
			$("#i_ImageEnhancement").removeAttr("disabled");
			if(ret==null || ret=="")
				return ;
			$("#imagePath").val(ret);
			var url =  "<%=thisPath%>/"+ ret+"?time="+new Date();
			document.forms[0].image.src =url;
		},
		exceptionHandler : function(err_info){
			$("#i_ImageEnhancement").removeAttr("disabled");
			alert(err_info);
		}
	});
}


function forSure()    
{
   if(!$("#nvr_form").validateForm()){
		return;
   }
    var i = 0;
    var updateString = new Array();
    var LPNumber=document.forms[0].LPnumber.value;
    var absTime=document.forms[0].time.value;
    var location=document.forms[0].location.value;
    var xycd=document.forms[0].xycd.value;
    var index = document.forms[0].xycd.selectedIndex;
    var xycd_name="";
    if(index>0)
	   xycd_name =document.forms[0].xycd.options[index].text;
    var comment=document.forms[0].comment.value;

    updateString[i++] = "LPNumber='"+document.forms[0].LPnumber.value+"'";
    updateString[i++] = "absTime='"+document.forms[0].time.value+"'";
    if(document.forms[0].xycd.value!="")
	    updateString[i++] = "xycd='"+document.forms[0].xycd.value+"'";
    updateString[i++] = "comment='"+document.forms[0].comment.value+"'";
	
    if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/> <bean:message key="button.modify" bundle="${language}"/>？"))	
        return false;
        
    clglBean.updateImageUrl(id,$("#imagePath").val(),{
    	callback : function(ret){
    		$("#imagePath").val(ret);
    		updateString[i++] = "picUrl='"+$("#imagePath").val()+"'";
		    window.returnValue = updateString.toString()+"|no</C>"+LPNumber+"</C>"+absTime+"</C>"+location+"</C>"+xycd_name+"</C>"+comment+"</C>";
		    window.close();    
    	},
    	exceptionHandler : function(err_info){
			alert(err_info);
		}
    });
   
} 



function forAbort()    
{         
    window.close();    
} 

function forPrint()    
{         
    window.print();
} 

</script> 

</body>

</html>
