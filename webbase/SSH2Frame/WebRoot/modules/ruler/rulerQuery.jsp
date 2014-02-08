<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>菜单查询</title>
    <base href="<%=basePath%>/">
	<link rel="stylesheet" href="css/common.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="css/main.css" type="text/css" media="all"/>
	<script src="scripts/jquery/jquery-1.7.min.js" type="text/javascript"></script>
	<script src="scripts/jquery/jquery-ui/js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
	<script src="scripts/common.js" type="text/javascript"></script>
	<script src="scripts/validateForm.js" type="text/javascript"></script>
	<script src="scripts/Calendar.js" type="text/javascript"></script>
	<script type="text/javascript" src="scripts/frame/main.js"></script>
	<script type="text/javascript">
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
			location.href="<%= basePath%>/modules/ruler/rulerAdd.jsp";
		}
		
		function upd(id){
			location.href="<%= basePath%>/RulerAction?method=beforeUpdate&rulerId=${r_id}&rulerInfo.rulerId="+id;
		}
		function del(id){
			if(confirm("确定删除吗？"))
				location.href="<%= basePath%>/RulerAction?method=delete&rulerId=${r_id}&rulerInfo.rulerId="+id;
		}
	</script>
  </head>
  
  <body>
  	
	<div>
		<form id="opForm" name="opForm" method="post" action="<%= basePath%>/RulerAction?method=query">
			<input type="hidden" id="rulerId" name="rulerId"  value="${r_id}"/>
			
			<table id="table-data-outter">
				<tr>
					<td>
						<table id="table-data-inner" cellspacing="0">
							<tr id="tr-menu-path">
								<td colspan="2" nowrap="nowrap">
									<fieldset id="f-menu-path">当前位置:&nbsp;系统管理 &gt; 菜单管理</fieldset>
									<fieldset id="f-condition-display">
										<img src="images/main/display_on.gif" onclick="displayCondition(this,'tr-menu-path')" 
											align="bottom" width="17" height="15" alt="隐藏查询条件" />
									</fieldset>
								</td>
							</tr>
							<tr>
								<td>
								菜单名称：
									<input type="text" name="rulerInfo.rulerName" id="rulerName" value="" />
									<input  type="submit" value="查询" class="btns_mouseout" onmouseover="this.className='btns_mouseover'" 
									onmouseout="this.className='btns_mouseout'" />                              
								</td>
								<td align="right">
									<s:property value='#request.insert'/>
									<s:if test="#request.i>=0">
										<input id="button1"  type="button" value="添加" class="btns_mouseout" onmouseover="this.className='btns_mouseover'" 
											onmouseout="this.className='btns_mouseout'" onclick="add();"/>
									</s:if>
								</td>									
							</tr>
						</table>
						<div id="div-button" align="center">
						</div>
						<div id="div-message"></div>
						
						<div id="car_use">
						<table id="table-view" cellpadding="0" cellspacing="1">
							<tr class="row-header">
								<td width="">序号</td>
								<td  style="cursor:pointer;" >菜单名称</td>
								<td  style="cursor:pointer;" >菜单级别</td>
								<td  style="cursor:pointer;" >上级菜单</td>
								<td  style="cursor:pointer;" >最后更新时间</td>
	                            <td colspan="2" align="center">操作</td> 
	                        </tr>
                            <s:iterator id="l"  value="list" status="index">  
	                           <s:if test='#index.odd == true'>
									<s:set name="var_class" value="'row-odd'" />
								</s:if>
								<s:else>
									<s:set name="var_class" value="'row-even'" />
								</s:else>
								
								<tr class="<s:property value='var_class' />" onmouseover="this.className='row-over'" 
									onmouseout="this.className='<s:property value='var_class' />'">
									<td align="center"><s:property value="#l.rulerId" /></td>
									<td align="center"><s:property value="#l.rulerName" /></td>
									<td align="center"><s:property value="#l.rulerLevel" /></td>
									<td align="center"><s:property value="#l.rulerManager" /></td>
									<%--<s:if test="#l.rulerLevel==1">
										<td align="center"><s:property value="#l.rulerName" /></td>
									</s:if>
									<s:else>
										<s:iterator id="l2"  value="list" status="index"> 
											<s:if test="#l2.rulerLevel==1 && #l2.rulerManager==#l.rulerManager">
												<td align="center"><s:property value="#l2.rulerName" /></td>
											</s:if>
										</s:iterator> 
									</s:else>
									--%><td align="center"><s:date name="#l.lastUpdate" format="yyyy-MM-dd hh:mm:ss" /></td>
									<td align="center">
	                                   	<s:if test="#request.u>=0"><a onclick="javaScript:upd(<s:property value='#l.rulerId' />);"><img src="images/button/pen.png" title="修改" border="0" style="cursor:pointer "></img></a></s:if>	
										<s:if test="#request.d>=0"><a onclick="javaScript:del(<s:property value='#l.rulerId' />);"><img src="images/button/delete.png" title="删除" style="cursor:pointer "></img></a></s:if>
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
						  页
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
