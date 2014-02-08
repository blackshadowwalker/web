<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>role query</title>
    <base href="<%=basePath%>/">
	<link rel="stylesheet" href="css/common.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="css/main.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="scripts/Tree/css/demo.css" type="text/css">
	<link rel="stylesheet" href="scripts/Tree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script src="scripts/jquery/jquery-1.7.min.js" type="text/javascript"></script>
	<script src="scripts/Tree/jquery.ztree.core-3.5.js" type="text/javascript" ></script>
	<script src="scripts/Tree/jquery.ztree.excheck-3.5.js" type="text/javascript" ></script>
	
	<script src="scripts/jquery/jquery-ui/js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
	<script src="scripts/common.js" type="text/javascript"></script>
	<script src="scripts/validateForm.js" type="text/javascript"></script>
	<script src="scripts/Calendar.js" type="text/javascript"></script>
	<script type="text/javascript" src="scripts/prompt/ymPrompt.js"></script>
	<script type="text/javascript" src="scripts/frame/main.js"></script>
	<script type="text/javascript">

		var array=eval("(${str})");
		
		var setting = {
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick: zTreeOnClick,
				onCheck: zTreeOnCheck
			}
		};
		function zTreeOnCheck(event, treeId, treeNode){
			if(treeNode.checked)
				zTreeOnClick(event, treeId, treeNode);
		}
		function zTreeOnClick(event, treeId, treeNode) {
			var treeObj = $.fn.zTree.getZTreeObj("rulerTree");
			treeObj.setting.callback.onClick=null; 
			treeObj.setting.callback.onCheck=null; 
		    var rt=window.showModalDialog("modules/role/iuvd.jsp",treeNode.rulerWord,"dialogHeight:50px;dialogWidth:300px;help:no;status:no")
		    
		    if(rt && rt!="no"){
		    	treeNode.rulerWord=rt;
				var nodes = treeObj.getNodesByParam("pId", treeNode.id, null);
		    	for(var i=0;i<nodes.length;i++){
		    		nodes[i].rulerWord=rt;
		    	}
		    }
		    
		    treeObj.setting.callback.onClick=zTreeOnClick; 
			treeObj.setting.callback.onCheck=zTreeOnCheck; 
		};
		
		var zNodes =array.array;
		
		$(document).ready(function(){
			$.fn.zTree.init($("#rulerTree"), setting, zNodes);
		});
		
		function sub(){
			if($("#rname").val()==null || trim($("#rname").val())==""){
				alert("角色名称不能为空 ！");
				return;
			}

			if(confirm("确定提交吗？")){
				
				var treeObj = $.fn.zTree.getZTreeObj("rulerTree");
				var nodes = treeObj.getCheckedNodes(true);
				var str="";
				for(var i=0;i<nodes.length;i++){
					
					str+=nodes[i].id+",";
					str+=nodes[i].rulerWord+";";
				}
				
				$("#str").val(str);
				
				document.forms[0].submit();
			}
		}
	</script>
  </head>
  
  <body>
  	<s:form action="RoleAction?method=add" method="post" theme="simple">
		<div id="con" style="width:500px;">
			<input type="hidden" id="rulerId" name="rulerId"  value="${r_id}"/>
			
			<input type="hidden" id="str" name="str" />
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="1">
							<tr id="tr-menu-path"><td colspan="2">当前位置:&nbsp;组织管理 &gt; 角色管理</td></tr>
							<tr id="tr-title"><td colspan="2">添加角色</td></tr>
							<tr>
								<td width="10%" class="field-title">角色名称:</td>
								<td width="30%" class="field-content"><s:textfield id="rname" name="roleInfo.roleName"></s:textfield></td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="content_wrap">
										<div class="zTreeDemoBackground right">
											<ul id="rulerTree" class="ztree"></ul>
										</div>
									</div>
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="2" >
									<input type="button" value="确定" onclick="sub();" />
									<input type="button" value="取消" onclick="javascript:history.back();" />
								</td>
							</tr>
						</table>		
					</td>
				</tr>
			</table>
		</div>
	</s:form>
  </body>
</html>
