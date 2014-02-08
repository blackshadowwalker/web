<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<%
    String thisPath=request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
    String language = bform.language;
	
%>
<html>
<head>
  <title><bean:message key="baseinfo.title"  bundle="${language}" /></title>
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseInfoBean.js"></script>
  
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
  <LINK href="<%=thisPath%>/modules/pad/css/base.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" type="text/css" href="Skin.css">
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/tools.js"></script>

  <SCRIPT src="<%=thisPath%>/table_view/jquery.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/jquery-ui-1.7.2.custom.min.js" type=text/javascript></SCRIPT>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_wait_plugin/hx_wait_plugin.js"></script>
</head>
<body>	

<div class=cardbody>

  <table width=100% cellSpacing=1 cellPadding=0 class="tablestyle">

<script>
    var rowID = window.dialogArguments;

    dwr.engine.setAsync(false);

    baseInfoBean.queryBaseInfo(
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
            document.write("<tr><td class=tablebodyhead style=width:5%><bean:message key="baseinfo.columns.id"  bundle="${language}" /></td>");//编号
            document.write("<td class=tablebodyhead style=width:10%><bean:message key="baseinfo.columns.logo"  bundle="${language}" /></td>");//LOGO
            document.write("<td class=tablebodyhead style=width:20%><bean:message key="baseinfo.columns.title"  bundle="${language}" /></td>");//主题
            document.write("<td class=tablebodyhead style=width:20%><bean:message key="baseinfo.columns.booter"  bundle="${language}" /></td>");//页脚 
            document.write("<td class=tablebodyhead style=width:10%><bean:message key="baseinfo.columns.enable"  bundle="${language}" /></td>");//使能状态 
            document.write("<td class=tablebodyhead style=width:10%><bean:message key="baseinfo.columns.ctTime"  bundle="${language}" /></td>");//创建时间  
            document.write("<td class=tablebodyhead style=width:10%><bean:message key="baseinfo.columns.version"  bundle="${language}" /></td>");//版本号 
            document.write("<td class=tablebodyhead style=width:10%><bean:message key="baseinfo.columns.operation"  bundle="${language}" /></td></tr>");//操作        
            for(i=0;i<rowElements.length-1;i++){
            	colElements=rowElements[i].split("</C>");
	            document.write("<tr><td class=tablebody style=text-align:center>"+colElements[0]+"</td>");
	            document.write("<td class=tablebody style=text-align:center> <img src=<%=basePath%>${basePathExtName}/"+colElements[5]+" width='30' height='30'></td>");
	            document.write("<td class=tablebody style=text-align:center>"+colElements[1]+"</td>");
	            document.write("<td class=tablebody style=text-align:center>"+colElements[2]+"</td>");
	            document.write("<td class=tablebody style=text-align:center><input type='radio' id=work_"+colElements[0]+" name=work onclick='javascript:_work(this.id)'></td>");
	            if(colElements[3]==1||colElements[3]=="1"){
	            	$("input[name=work]:eq("+i+")").attr("checked",'checked');
	            }
	            //document.write("<td class=tablebody style=text-align:center>"+colElements[4]+"</td>");
	            document.write("<td class=tablebody style=text-align:center>"+colElements[4]+"</td>");

	            document.write("<td class=tablebody style=text-align:center>"+colElements[6]+"</td>");
	            
	            document.write("<td class=tablebody style=text-align:center>"+"<a id="+colElements[0]+" href='#' onclick='javascript:_modify(this.id)'>"+
	            		"<bean:message key="button.modify" bundle="${language}"/></a>&nbsp;&nbsp;<a id="+colElements[0]+" href='#' onclick='javascript:_delete(this.id)'>"+
	            		"<bean:message key="button.delete" bundle="${language}"/></a>"+"</td></tr>");
			}
			document.write("<tr><td style=text-align:right;padding-right:80px;background-color:white colspan=8><a href='#' onclick='javascript:_modify(0)'>"+
						"<bean:message key="button.insert" bundle="${language}"/></a></td></tr>");
			
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
    
    function _delete(id){
    if($('#work_'+id).is(':checked')){
    	alert("<bean:message key="baseinfo.msg.beUsing"  bundle="${language}" />");//当前信息正使用中，不能删除
    	return;
    }
    if (!confirm("<bean:message key="baseinfo.msg.deleteWarn"  bundle="${language}" />"))//真的要删除选中的记录吗？此操作不能恢复！
		return false;
		
		baseInfoBean.deleteBaseInfo(id, {
				callback : function(data) {

					if (data>0) {
						//alert("删除成功。");
						alert("<bean:message key="button.delete" bundle="${language}"/> <bean:message key="msg.success" bundle="${language}"/>!");
					
						//tObject.delRowValue(lineNum);
					} else {
						alert("<bean:message key="button.delete" bundle="${language}"/> <bean:message key="msg.failed" bundle="${language}"/>!");
					
					}

					// 隐藏信息条
					// hidden_scrollbar();
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
			location.href="<%=thisPath%>/baseInfoAction.do";
    }
    
    function _work(w_id){
    	var id=w_id.split("_");
    	//alert(id[1])
    	
		baseInfoBean.updateBaseInfoWork(id[1],
				{
					callback : function(data) {

					if (data == 1||data=="1") {
						window.parent.frames["topic"].location.reload();
						window.parent.frames["bottomFrame"].location.reload();
						//alert("<bean:message key="button.modify" bundle="${language}"/>成功。");							
					} else {

						alert("<bean:message key="button.modify" bundle="${language}"/><bean:message key="msg.failed" bundle="${language}"/>!");
						window.close();
					}

					// 隐藏信息条
					// hidden_scrollbar();
				},
				exceptionHandler : function(err_info) {

					if (err_info != "") {

						alert(err_info);

						window.open(thispath + "/logoffAction.do?"
										+ new Date(), "_parent");
					} else {

						alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");

						window.open(thispath + "/logoffAction.do?"
										+ new Date(), "_parent");
					}
				}
			});
    }
    function _modify(id){
		var k = window.showModalDialog("<%=thisPath%>/modules/baseInfo/jsp/baseInfoAddorUpdate.jsp?id="+id,window,"dialogHeight=270px") ;
		//alert(k);
		if(k==1) { 
			window.parent.frames["topic"].location.reload();
			window.parent.frames["bottomFrame"].location.reload();
			window.location.reload();
		}
    }
    
    dwr.engine.setAsync(true);
    
</script>

</table>

</div>


</body>


</html>
