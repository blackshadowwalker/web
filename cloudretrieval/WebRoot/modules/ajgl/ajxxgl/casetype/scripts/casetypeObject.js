<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<%
	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
	String language = bform.language;
	System.out.println(language);
%>

var tObject = new TableObject();
$(function() {
var gd = document.body.clientHeight-139;
	tObject.init({
				reportTitle : '案件状态数据汇总表',
				tableDivId : 'hx_table_div',
				tableWidth : "100%",
				tableHeight : gd,
				tableBorderCss : "#ACA899 solid 1px",
				toolbar : new ToolBarObject({
							alt : '<bean:message key="button.query" bundle="${language}"/>',
							title : '<bean:message key="button.query" bundle="${language}"/>',
							iconCss : 'query',
							handle : forQuery
						}, new ToolSeparatorObject(),// 分割条对象
						{
							alt : '<bean:message key="button.modify" bundle="${language}"/>',
							title : '<bean:message key="button.modify" bundle="${language}"/>',
							iconCss : 'add',
							select_trigger_mode : 'single',
							handle : forUpdate
						}, new ToolSeparatorObject(),// 分割条对象
						{
							alt : '<bean:message key="button.delete" bundle="${language}"/>',
							title : '<bean:message key="button.delete" bundle="${language}"/>',
							iconCss : 'delete',
							select_trigger_mode : 'single',
							handle : forDelete
						}, new ToolSeparatorObject(),// 分割条对象
						new DefaultDataToXlsBtnObject({

									url : $("#this_path_id").val()
											+ '/modules/base/hx_table/xls_template.jsp'
								})),
				cols : new ColsObject({

							viewLineNum : true,
							viewTotalRow : 100,
							cols : [{
										name : '内部编号',
										alias : 'id',
										width : 100,
										hide : true
									}, {
										name : '<bean:message key="casetype.label.name" bundle="${language}"/>',
										alias : 'name',
										width : 150
									}]
						}),
				page : new PageObject({

							perPage : 30,
							sep : new PageSeparatorObject(),
							viewJumpWidget : true,
							viewPageInfoWidget : true,
							handle : getPage
						})
			});

	getQX($("#qx_id").val(), $("#this_path_id").val(), [{
						optMark : "I",// 增加操作
						elemId : "padindex1",// 操作所关联元素ID
						type : "hide",// 元素屏蔽类型(hide或disabled)
						objSource : "page"// 元素所属范围(目前：page--页面或tableObj--表格控件)
					}, {
						optMark : "Q",// 查询操作
						elemId : "hx_toolbar_event0",
						type : "disabled",
						objSource : "tableObj"
					}, {
						optMark : "U",// 修改操作
						elemId : "hx_toolbar_event2",
						type : "disabled",
						objSource : "tableObj"
					}, {
						optMark : "D",// 删除操作
						elemId : "hx_toolbar_event4",
						type : "disabled",
						objSource : "tableObj"
					}, {
						optMark : "V",// 查看操作
						elemId : "hx_toolbar_event6",
						type : "disabled",
						objSource : "tableObj"
					}]);
});