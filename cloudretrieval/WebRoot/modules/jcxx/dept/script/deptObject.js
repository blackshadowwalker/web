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
					label : '��ʾ��Ϣ'
				}),
				tableBorderCss : "#ACA899 solid 1px",
				toolbar : new ToolBarObject({
							alt : '<bean:message key="button.query" bundle="${language}"/>',
							title : '<bean:message key="button.query" bundle="${language}"/>',
							iconCss : 'query',
							handle : forQuery
						}, new ToolSeparatorObject(),// �ָ�������
						{
							alt : '<bean:message key="button.modify" bundle="${language}"/>',
							title : '<bean:message key="button.modify" bundle="${language}"/>',
							iconCss : 'add',
							select_trigger_mode : 'single',
							handle : forUpdate
						}, new ToolSeparatorObject(),// �ָ�������
						{
							alt : '<bean:message key="button.delete" bundle="${language}"/>',
							title : '<bean:message key="button.delete" bundle="${language}"/>',
							iconCss : 'delete',
							select_trigger_mode : 'single',
							handle : forDelete
						}, new ToolSeparatorObject(),// �ָ�������
						{

							alt : '<bean:message key="button.detail" bundle="${language}"/>',
							title : '<bean:message key="button.detail" bundle="${language}"/>',
							iconCss : 'detail',
							select_trigger_mode : 'single',
							handle : forDetail
						}, new ToolSeparatorObject(),// �ָ�������
						new DefaultDataToXlsBtnObject({

									url : $("#this_path_id").val()
											+ '/modules/base/hx_table/xls_template.jsp'
								})),
				cols : new ColsObject({

							viewLineNum : true,
							viewTotalRow : 100,
							cols : [{
										name : '�ڲ����',
										alias : 'id',
										width : 100,
										hide : true
									}, {
										name : '<bean:message key="dept.columns.deptCode" bundle="${language}"/>',//�������',
										alias : 'dept_code',
										width : 90
									}, {
										name : '<bean:message key="dept.columns.deptName" bundle="${language}"/>',//��������',
										alias : 'dept_name',
										width : 250
									},  {
										name : '<bean:message key="dept.columns.deptLeader" bundle="${language}"/>',//�ֹ��쵼',
										alias : 'level_name',
										width : 120
									}
									, {
										name : '<bean:message key="dept.columns.status" bundle="${language}"/>',//����״̬',
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
						optMark : "I",// ���Ӳ���
						elemId : "padindex1",// ����������Ԫ��ID
						type : "hide",// Ԫ����������(hide��disabled)
						objSource : "page"// Ԫ��������Χ(Ŀǰ��page--ҳ���tableObj--���ؼ�)
					}, {
						optMark : "Q",// <bean:message key="button.query" bundle="${language}"/>����
						elemId : "hx_toolbar_event0",
						type : "disabled",
						objSource : "tableObj"
					}, {
						optMark : "U",// <bean:message key="button.modify" bundle="${language}"/>����
						elemId : "hx_toolbar_event2",
						type : "disabled",
						objSource : "tableObj"
					}, {
						optMark : "D",// <bean:message key="button.delete" bundle="${language}"/>����
						elemId : "hx_toolbar_event4",
						type : "disabled",
						objSource : "tableObj"
					}, {
						optMark : "V",// <bean:message key="button.detail" bundle="${language}"/>����
						elemId : "hx_toolbar_event6",
						type : "disabled",
						objSource : "tableObj"
					}/*
						 * , { optMark:"xls",//����Excel����
						 * elemId:"hx_toolbar_event8", type:"disabled",
						 * objSource:"tableObj" }
						 */
			]);
});