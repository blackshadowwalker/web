<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

var tObject=new TableObject();

$(function() {
var gd = document.body.clientHeight-280;
	tObject.init({
				reportTitle : '<bean:message key="dept.name" bundle="${language}"/><bean:message key="label.SummaryTable" bundle="${language}"/>',
				tableDivId : 'hx_table_div',
				tableWidth : "100%",
				tableHeight : gd,
				infoTip : new InfoTipObject({
					label : '提示信息'
				}),
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
										name : '<bean:message key="dept.columns.deptCode" bundle="${language}"/>',//机构编号',
										alias : 'dept_code',
										width : 90
									}, {
										name : '<bean:message key="dept.columns.deptName" bundle="${language}"/>',//机构名称',
										alias : 'dept_name',
										width : 250
									},  {
										name : '<bean:message key="dept.columns.deptLeader" bundle="${language}"/>',//分管领导',
										alias : 'level_name',
										width : 120
									}
									, {
										name : '<bean:message key="dept.columns.status" bundle="${language}"/>',//机构状态',
										alias : 'level_name',
										width : 120
									}
									

							]
						}),
				// page:new PageObject()

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
						optMark : "Q",// <bean:message key="button.query" bundle="${language}"/>操作
						elemId : "hx_toolbar_event0",
						type : "disabled",
						objSource : "tableObj"
					}, {
						optMark : "U",// <bean:message key="button.modify" bundle="${language}"/>操作
						elemId : "hx_toolbar_event2",
						type : "disabled",
						objSource : "tableObj"
					}, {
						optMark : "D",// <bean:message key="button.delete" bundle="${language}"/>操作
						elemId : "hx_toolbar_event4",
						type : "disabled",
						objSource : "tableObj"
					}, {
						optMark : "V",// <bean:message key="button.detail" bundle="${language}"/>操作
						elemId : "hx_toolbar_event6",
						type : "disabled",
						objSource : "tableObj"
					}/*
						 * , { optMark:"xls",//导出Excel操作
						 * elemId:"hx_toolbar_event8", type:"disabled",
						 * objSource:"tableObj" }
						 */
			]);
});