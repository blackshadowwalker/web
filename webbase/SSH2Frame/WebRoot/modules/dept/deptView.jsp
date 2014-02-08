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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>条件查询部门信息列表</title>
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
	function query(id,val,text){
		if(val==text){
			document.getElementById(id).value="";
			document.getElementById(id).style.color="black";
		}
	}
	function query0(id,val,text){
		if(val==""||val==text){
			document.getElementById(id).value=text;
			document.getElementById(id).style.color="#999999";
		}
	}
	
	function add(){
		location.href="<%= basePath%>/modules/dept/deptAdd.jsp";
	}
	
	function del(id){
		if(confirm("确定删除吗？")){
			location.href="<%= basePath%>/DeptAction?method=deptDel&rulerId=${r_id}&id="+id;
		}
	}
	
</script>
</head>
<body>
	<div>
		<form id="opForm" name="opForm" method="post" action="DeptAction?method=getDeptView">
			<input type="hidden" id="rulerId" name="rulerId"  value="${request.r_id}"/>
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="0">
							<tr id="tr-menu-path">
								<td colspan="2" nowrap="nowrap">
									<fieldset id="f-menu-path">当前位置:&nbsp;终端信息 &gt; 终端信息一览</fieldset>
									<fieldset id="f-condition-display">
										<img src="images/main/display_on.gif" onclick="displayCondition(this,'tr-menu-path')" 
											align="bottom" width="17" height="15" alt="隐藏查询条件" />
									</fieldset>
								</td>
							</tr>
							<tr>
								<td>
								部门名称：
									<input type="text" name="DeptName" id="dept_name" value="部门名称" style="color:#999999" onblur="query0(this.id,this.value,'部门名称');" onfocus="query(this.id,this.value,'部门名称');"/> 
								上级部门:
									<input type="text" name="dept.deptManager" id="dept_manager" value="上级部门" style="color:#999999" onblur="query0(this.id,this.value,'上级部门');" onfocus="query(this.id,this.value,'上级部门');"/> 
									
                                    <input  type="submit" value="查询" class="btns_mouseout" onmouseover="this.className='btns_mouseover'" 
									onmouseout="this.className='btns_mouseout'" />                              
								</td>
								<td align="right">
									<input id="button1"  type="button" value="添加" class="btns_mouseout" onmouseover="this.className='btns_mouseover'" 
											onmouseout="this.className='btns_mouseout'" onclick="add();"/>
								</td>									
							</tr>
						</table>
						<div id="div-button" align="center">
						</div>
						<div id="div-message"></div>
						
						<div id="car_use">
						<table id="table-view" cellpadding="0" cellspacing="1">
							<tr class="row-header">
								<td width="">部门ID</td>
								<td ondblclick="return sortQuery('carNumber')" style="cursor:pointer;" >部门名称</td>
								<td ondblclick="return sortQuery('carName')" style="cursor:pointer;" >上级部门</td>
								<td ondblclick="return sortQuery('terminalModel')" style="cursor:pointer;" >时间</td>
                              	<td colspan="2" align="center">操作</td> 
                              </tr>
                         <s:iterator value="list" id="dept">
                            <tr>
                            	<td align="center">  <s:property value="#dept.deptId" /> </td>
                            	<td align="center">  <s:property value="#dept.deptName" /> </td>
                            	<td align="center">  <s:property value="#dept.deptManager" /> </td>
                            	<td align="center">  <s:property value="#dept.lastUpdate" /> </td>
                            	<td align="center">	
								<s:if test="#request.u>=0"><a href="DeptAction?method=deptBeforUpdate&id=<s:property value='#dept.deptId' />&rulerId=${r_id}"><img src="images/button/pen.png" title="修改" border="0" style="cursor:pointer "></img></a></s:if>	
								<s:if test="#request.d>=0"><a href="javascript:del(<s:property value='#dept.deptId' />)"><img src="images/button/delete.png" title="删除" style="cursor:pointer "></img></a></s:if>
                                </td>
                            </tr>
               			 </s:iterator>
						</table>
						</div>
						
						<div style=" font-size:13px font-family:'宋体'"  align="center">
						  共&nbsp;2&nbsp;条记录,共&nbsp;1&nbsp;页,每页15条记录&nbsp;
						  
						  <a href="#"><img  src="images/page/PaginStartInactive.gif" border="0"/></a>&nbsp;
						  <a href="#"><img src="images/page/PaginLeftInactive.gif" border="0"/></a>&nbsp;当前页:1
						  <a href="#"><img src="images/page/PaginRightInactive.gif" border="0"/></a>&nbsp;
						  <a href="#"><img src="images/page/PaginEndInactive.gif" border="0"/></a>
						  第:
						  <select name="page">
						   <option  title="1" value="1">1</option>
						   <option title="2" value="2">2</option>
						  </select>
						  页&nbsp;每页显示
						  <select name="count">
						   <option title="1" value="15">15</option>
						   <option title="2" value="30">30</option>
						  </select>
						  条
						 </div>
						<div>
                        	<script language="javascript">
                            	//initSelect("100","15");
								
                            </script>	
						</div>
					</td>
				</tr>
			</table>		
		</form>
		</div>
	</body>
</html>