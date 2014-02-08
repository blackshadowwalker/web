<%@ page language="java" contentType="text/html;charset=GBK" isErrorPage="false"%>

<HTML>
<% 
    String thisPath=request.getContextPath();
    String qx=request.getParameter("qx");  
%>


<base target="_self"> 
 	<HEAD>
  <title>任务执行</title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="css/base.css" type="text/css">
  <LINK href="<%=thisPath%>/modules/pad/css/base.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="Skin.css">
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/tools.js"></script>

  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/padBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <SCRIPT src="<%=thisPath%>/table_view/jquery.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/jquery-ui-1.7.2.custom.min.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/SortView.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/PagerView.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/TableView.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/SelectorView.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/common.js" type=text/javascript></SCRIPT>
  <script language="javascript" src="<%=thisPath%>/modules/pad/script/padScript.js"></script>
<style>
  	
  	a:link {
	   color:#0000FF;
	   text-decoration:none;
	   }
	   a:visited {
	   color:#0000FF;
	   text-decoration:none;
	   }
	   a:hover {
	   color:#FF6600;
	   text-decoration:underline;
	   }
    
  </style>

</HEAD>

<body topmargin="0" leftmargin="0" bgcolor="#EEF5F2">

<table width="100%"  border="1" bordercolor="#000000" align="center" cellpadding="0" cellspacing="0" >
  <tr bgcolor="#EEF5F2"> 
    <td > <div align="center"><font color="#0000FF"><strong>任务发布单位</strong></font></div></td>
    <td > <div align="center"><font color="#0000FF"><strong>任务名称</strong></font></div></td>
  
  </tr>
 <script type="text/javascript">
  var rowID = window.dialogArguments;
  

 dwr.engine.setAsync(false);
  padBean.getryzx(rowID.split("</C>")[0],rowID.split("</C>")[1],{
            
            callback:function(data){
             	
                document.write(data);
                document.write("</table>");
            },
            
            exceptionHandler:function(err_info){
                alert(err_info);
                if(err_info!=""){
                        
                    alert(err_info);
                    
                    
                }
            }
        });
        dwr.engine.setAsync(true);
        
 //查看人员在位情况       
 function ckrw(id)
 {
	 var srcFile = "<%=thisPath%>/modules/oa/rwzx/jsp/rwglDetail.jsp";
    var winFeatures = "dialogHeight:400px;dialogWidth:800px;help:no;status:no";

    window.showModalDialog(srcFile, id, winFeatures); 	
}

 function ckrw2(id)
 {
	 var srcFile = "<%=thisPath%>/modules/oa/rwpj/jsp/rwpjDetail.jsp";
    var winFeatures = "dialogHeight:500px;dialogWidth:800px;help:no;status:no";

    window.showModalDialog(srcFile, id, winFeatures); 	
}


function ckxb(id)
 {

    
     var srcFile = "<%=thisPath%>/modules/oa/xbry/jsp/xbryDetail.jsp";
    var winFeatures = "dialogHeight:200px;dialogWidth:600px;help:no;status:no";
    window.showModalDialog(srcFile, id, winFeatures); 	
}

function ckxj(id,jq_bz)
 {

    
     if(jq_bz=="1")
 	{   
	    var srcFile = "<%=thisPath%>/modules/oa/jqgl/jsp/jqglDetail.jsp";
	    
    }
    if(jq_bz=="2")
 	{   
	    var srcFile = "<%=thisPath%>/modules/oa/jqgl/jsp/jqgl_njDetail.jsp";
	   
    }
    if(jq_bz=="3")
 	{   
	    var srcFile = "<%=thisPath%>/modules/oa/jqgl/jsp/jqgl_sjDetail.jsp";
	    
    }
    var winFeatures = "dialogHeight:450px;dialogWidth:600px;help:no;status:no";
	
	window.showModalDialog(srcFile, id, winFeatures); 	
}
 </script>
</div>

</body>


</HTML>
