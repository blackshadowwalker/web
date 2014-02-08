<%@ page language="java" contentType="text/html;charset=GBK" isErrorPage="false"%>

<HTML>
<% 
    String thisPath=request.getContextPath();
    String qx=request.getParameter("qx");  
%>


<base target="_self"> 
 	<HEAD>
  <title>警员在位情况</title>
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
<br>
<br>
 <div align="center"><font color="#0000FF" size="5"><strong>警员在位情况统计</strong></font></div>
<hr>
<table width="100%" border="1" bordercolor="#000000" align="center" cellpadding="0" cellspacing="0" >
  <tr bgcolor="#EEF5F2"> 
    <td > <div align="center"><font color="#0000FF"><strong>单位名称</strong></font></div></td>
    <td > <div align="center"><font color="#0000FF"><strong>在位人数</strong></font></div></td>
    <td > <div align="center"><font color="#0000FF"><strong>缺勤人数</strong></font></div></td>
    <td > <div align="center"><font color="#0000FF"><strong>休班人数</strong></font></div></td>
    <td > <div align="center"><font color="#0000FF"><strong>探亲假人数</strong></font></div></td>
    <td > <div align="center"><font color="#0000FF"><strong>公休假人数</strong></font></div></td>
    <td > <div align="center"><font color="#0000FF"><strong>请假人数</strong></font></div></td>
 
  </tr>
 <script type="text/javascript">
 dwr.engine.setAsync(false);
  padBean.getpadxx('20110301',{
            
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
 function ckqjjh(dept_code,bz)
 {
 	
	var srcFile = "<%=thisPath%>/modules/pad/jsp/ryzw.jsp";
	var winFeatures = "dialogHeight:500px;dialogWidth:400px;help:no;status:no";

	window.showModalDialog(srcFile, dept_code+"</C>"+bz, winFeatures);
 }
 </script>


</body>


</HTML>
