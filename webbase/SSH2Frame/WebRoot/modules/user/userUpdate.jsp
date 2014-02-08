<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
String str=(String)request.getAttribute("str");

String[] dept=str.split("#")[0].split(";");
String[] role=str.split("#")[1].split(";");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>role update</title>
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
	<script type="text/javascript" src="scripts/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		function sub(){
			if(confirm("确定修改吗？"))
				document.forms[0].submit();
		}
	</script>
  </head>
  
  <body>
  	<s:form action="UserAction?method=update" method="post" theme="simple">
		<div id="con" style="width:500px;">
			<input type="hidden" id="rulerId" name="rulerId"  value="${r_id}"/>
			<s:hidden id="rname" name="userInfo.userId"></s:hidden>
			<input type="hidden" id="str" name="str" />
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="1">
							<tr id="tr-menu-path"><td colspan="2">当前位置:&nbsp;组织管理 &gt; 人员管理</td></tr>
							<tr id="tr-title"><td colspan="2">用户修改</td></tr>
							<tr>
								<td width="10%" class="field-title">用户名称:</td>
								<td width="30%" class="field-content"><s:textfield id="rname" name="userInfo.userName"></s:textfield></td>
							</tr>
							<tr>
								<td width="10%" class="field-title">用户密码:</td>
								<td width="30%" class="field-content"><s:textfield id="rname" name="userInfo.userPasswd"></s:textfield></td>
							</tr>
							<tr>
								<td width="10%" class="field-title">用户生日:</td>
								<td width="30%" class="field-content">
									<input type="text" name="userInfo.userBirth" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="<s:date name="userInfo.userBirth" format="yyyy-MM-dd" />" class="Wdate" readonly />
									
								</td>
							</tr>
							<tr>
								<td width="10%" class="field-title">用户角色:</td>
								<td width="30%" class="field-content">
									<select id="userRole" name="userInfo.userRole" >
										<option value="0">请选择...</option>
									<%	
										String[] s=null;
										for(int i=0;i<role.length;i++){
											s=role[i].split(",");
									%>
										<option value="<%=s[0] %>"><%=s[1] %></option>
									<%		
										}
									%>	
									</select>
								</td>
							</tr>
							<tr>
								<td width="10%" class="field-title">用户部门:</td>
								<td width="30%" class="field-content">
									<select id="userDept" name="userInfo.userDepartment" >
										<option value="0">请选择...</option>
									<%	
										for(int i=0;i<dept.length;i++){
											s=dept[i].split(",");
									%>
										<option value="<%=s[0] %>"><%=s[1] %></option>
									<%		
										}
									%>	
									</select>
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
  <script type="text/javascript">
  		$("#userRole").val("${userInfo.userRole}");
  		$("#userDept").val("${userInfo.userDepartment}");
  </script>
</html>
