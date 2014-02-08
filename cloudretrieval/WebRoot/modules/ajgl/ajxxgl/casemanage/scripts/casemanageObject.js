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
var gd = document.body.clientHeight-242;
	tObject.init({
				reportTitle : '案件数据汇总表',
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
						{

							alt : '<bean:message key="button.detail" bundle="${language}"/>',
							title : '<bean:message key="button.detail" bundle="${language}"/>',
							iconCss : 'detail',
							select_trigger_mode : 'single',
							handle : forDetail
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
										name : '<bean:message key="casemgr.label.caseName" bundle="${language}"/>',
										alias : 'caseName',
										width : 100
									},{
										name : '<bean:message key="casemgr.label.caseType" bundle="${language}"/>',
										alias : 'caseType',
										width : 100
									}, {
										name : '<bean:message key="casemgr.label.caseNo" bundle="${language}"/>',
										alias : 'caseNo',
										width : 100
									}, {
										name : '<bean:message key="casemgr.label.receiptNo" bundle="${language}"/>',
										alias : 'receiptNo',
										width : 100
									}, {
										name : '<bean:message key="casemgr.label.creator" bundle="${language}"/>',
										alias : 'auser',
										width : 100
									}, {
										name : '<bean:message key="casemgr.label.department" bundle="${language}"/>',
										alias : 'department',
										width : 100
									}, {
										name : '<bean:message key="casemgr.label.caseTime" bundle="${language}"/>',
										alias : 'caseTime',
										width : 150
									}, {
										name : '<bean:message key="casemgr.label.caseStatus" bundle="${language}"/>',
										alias : 'caseStatus',
										width : 100
									}, {
										name : '<bean:message key="casemgr.label.area" bundle="${language}"/>',
										alias : 'area',
										width : 100
									}, {
										name : '<bean:message key="casemgr.label.location" bundle="${language}"/>',
										alias : 'location',
										width : 100
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