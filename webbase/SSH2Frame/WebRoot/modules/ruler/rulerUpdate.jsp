<%@ page language="java" import="java.util.*" import="com.bean.UserInfo" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>菜单修改</title>
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
</head>
<body>
	<div>
	<s:iterator id="ruler"  value="list"  status="index">
		<form action="RulerAction?method=update&rulerInfo.rulerId=<s:property  value='rulerId' />" id="opForm" name="opForm" method="post" >
			<input type="hidden" id="rulerId" name="rulerId"  value="${r_id}"/>
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="0">
							<tr id="tr-menu-path" >
								<td  nowrap="nowrap">
								<fieldset id="f-menu-path">当前位置:&nbsp;菜单管理 &gt; 菜单修改</fieldset>
								</td>
							</tr>
						 
							<tr>
								<td> 菜单名称：
									<input type="text" name="rulerInfo.rulerName" id="ruler_name"  value="<s:property value="rulerName"  />" /> 		
								</td>
							</tr>
							<tr>
								<td> 上级菜单：
									<input type="text" name="rulerInfo.rulerManager" id="ruler_manager" value="<s:property value="rulerManager"  />"  /> 		
								</td>
							</tr>
						  </s:iterator>
							<tr >
								<td>
									<input id="button"  type=submit value="修改" class="btns_mouseout" onmouseover="this.className='btns_mouseover'" 
											onmouseout="this.className='btns_mouseout'"  />
								
									<input id="button"  type="reset" value="重置" class="btns_mouseout" onmouseover="this.className='btns_mouseover'" 
											onmouseout="this.className='btns_mouseout'" />
								</td>
							</tr>
						</table>
						<div id="div-button" align="center">
						</div>
					</td>
				</tr>
			</table>		
		</form>
		</div>
	</body>
</html>