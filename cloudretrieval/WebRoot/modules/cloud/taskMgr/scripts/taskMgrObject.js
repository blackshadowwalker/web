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
//	System.out.println(language);
%>

var tObject=new TableObject();



$(function() {
var gd = document.body.clientHeight-230;
	tObject.init({
				reportTitle : '<bean:message key="task.title" bundle="${language}"/>',
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
							select_trigger_mode : 'multi',
							handle : forUpdate
						}
						, new ToolSeparatorObject(),// 分割条对象
						{
							alt : '<bean:message key="task.report" bundle="${language}"/>',
							title : '<bean:message key="task.report" bundle="${language}"/>',
							iconCss : 'delete',
							select_trigger_mode : 'multi',
							handle : forReport
						}, new ToolSeparatorObject(),// 分割条对象
						{

							alt : '<bean:message key="button.detail" bundle="${language}"/>',
							title : '<bean:message key="button.detail" bundle="${language}"/>',
							iconCss : 'detail',
							select_trigger_mode : 'none',
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
										name : '<bean:message key="task.columns.id" bundle="${language}"/>',                      //内部编号
										alias : 'id',
										width : 100,
										hide : true
									}, {
										name : '<bean:message key="task.columns.options" bundle="${language}"/>',                  //选项
										alias : 'check',
										width : 80
									}, {
										name : '<bean:message key="task.columns.taskNumbe" bundle="${language}"/>',                //任务编号
										alias : 'event_code',
										width : 100
									}, {
										name : '<bean:message key="task.columns.taskName" bundle="${language}"/>',                 //任务名称
										alias : 'event_name',
										width : 100
									}, {
										name : '<bean:message key="task.columns.taskStatus" bundle="${language}"/>',               //任务状态
										alias : 'desp',
										width : 100
									}, {
										name : '<bean:message key="task.columns.locationName" bundle="${language}"/>',             //地域名称
										alias : 'masrows',
										width : 170
									}, {
										name : '<bean:message key="task.columns.input" bundle="${language}"/>',             		//输入
										alias : 'masrows',
										width : 150
									}, {
										name : '<bean:message key="task.columns.id" bundle="${language}"/>',             			//输出
										alias : 'masrows',
										width : 150,
										hide : true
									}, {
										name : '<bean:message key="task.columns.founder" bundle="${language}"/>',             		//创建人
										alias : 'masrows',
										width : 70
									}, {
										name : '<bean:message key="task.columns.creationTime" bundle="${language}"/>',              //创建时间
										alias : 'masrows',
										width : 150
									}, {
										name : '<bean:message key="task.columns.lastUpdateTime" bundle="${language}"/>',             //最后更新时间
										alias : 'masrows',
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
						optMark : "S",// 停止操作
						elemId : "hx_toolbar_event4",
						type : "disabled",
						objSource : "tableObj"
					}, {
						optMark : "G",// 报表操作
						elemId : "hx_toolbar_event6",
						type : "disabled",
						objSource : "tableObj"
					}, {
						optMark : "V",// <bean:message key="button.detail" bundle="${language}"/>操作
						elemId : "hx_toolbar_event8",
						type : "disabled",
						objSource : "tableObj"
					}]);
});