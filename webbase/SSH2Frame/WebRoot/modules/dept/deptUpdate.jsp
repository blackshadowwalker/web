<%@ page language="java" import="java.util.*" import="com.bean.UserInfo" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
UserInfo user = (UserInfo)request.getSession().getAttribute("user");
System.out.println("---------------"+user.getUserName()+" "+user.getUserId());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改部门信息</title>
<link rel="stylesheet" href="css/common.css" type="text/css" media="all"/>
<link rel="stylesheet" href="css/main.css" type="text/css" media="all"/>
<script src="scripts/jquery/jquery-1.7.min.js" type="text/javascript"></script>
<script src="scripts/jquery/jquery-ui/js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
<script src="scripts/common.js" type="text/javascript"></script>
<script src="scripts/validateForm.js" type="text/javascript"></script>
<script src="scripts/Calendar.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="scripts/prompt/skin/qq/ymPrompt.css" /> 
<script type="text/javascript" src="scripts/prompt/ymPrompt.js"></script>
<script type="text/javascript" src="scripts/frame/main.js"></script>

<script language="javascript">
	function cancle(){
		location.href="<%= basePath%>/DeptAction?method=query&rulerId=${r_id}";
	}
</script>
</head>
<body>
	<div>
	<s:iterator value="listDeptBean" id="deptBean"> 
		<form action="DeptAction?method=deptUpdate&id=<s:property value='#dept.deptId' />" id="opForm" name="opForm" method="post" >
			<input type="hidden" id="rulerId" name="rulerId"  value="${r_id}"/>
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="0">
							<tr id="tr-menu-path" >
								<td  nowrap="nowrap">
								<fieldset id="f-menu-path">当前位置:&nbsp;部门管理 &gt; 部门信息修改</fieldset>
								</td>
							</tr>
							<input name="deptBean.deptId" type="hidden" id="deptBean.deptId" value="<s:property value='#deptBean.deptId' />"> 
							<tr>
								<td> 部门名称：
									<input type="text" name="deptBean.deptName" id="deptBean.deptName" value="<s:property value='#deptBean.deptName' />"  /> 		
								</td>
							</tr>
							<tr>
								<td> 上级部门：
									<input type="hidden" name="deptBean.pid" id="deptBean.pid" value="<s:property value='#deptBean.pid' />"  /> 
									<input type="text" name="deptBean.deptManager" id="deptBean.deptManager" value="<s:property value='#deptBean.deptManager' />" /> 		
								</td>
							</tr>
							<tr>
								<td> 
									<input type="hidden" name="deptBean.status" id="status" value="1" /> 		
								</td>
							</tr>
							
							<tr >
								<td>
									<input id="button"  type="submit" value="修改" class="btns_mouseout" onmouseover="this.className='btns_mouseover'" 
											onmouseout="this.className='btns_mouseout'" />
								
									<input id="button"  type="reset" value="取消" class="btns_mouseout" onmouseover="this.className='btns_mouseover'" 
											onmouseout="this.className='btns_mouseout'" onclick="cancle()"/>
								</td>
							</tr>
						</table>
						<div id="div-button" align="center">
						</div>
					</td>
				</tr>
			</table>		
		</form>
		</s:iterator>
		</div>
	</body>
</html>