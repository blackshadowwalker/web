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
var gd = document.body.clientHeight-230;
	tObject.init({
				reportTitle : '<bean:message key="clgl.title" bundle="${language}"/>',
				tableDivId : 'hx_table_div',
				tableWidth : "100%",
				tableHeight : gd,
				tableBorderCss : "#ACA899 solid 1px",
				toolbar : new ToolBarObject({
							alt:'<bean:message key="button.query" bundle="${language}"/>',
							title:'<bean:message key="button.query" bundle="${language}"/>',
							iconCss : 'query',
							handle : forQuery
						}, new ToolSeparatorObject(),// �ָ�������
						{
							alt:'<bean:message key="button.modify" bundle="${language}"/>',
							title:'<bean:message key="button.modify" bundle="${language}"/>',
							iconCss : 'add',
							select_trigger_mode : 'single',
							handle : forUpdate
						}, new ToolSeparatorObject(),// �ָ�������
						{
							alt:'<bean:message key="button.delete" bundle="${language}"/>',
							title:'<bean:message key="button.delete" bundle="${language}"/>',
							iconCss : 'delete',
							select_trigger_mode : 'single',
							handle : forDelete
						}, new ToolSeparatorObject(),// �ָ�������
						{

							alt:'<bean:message key="button.detail" bundle="${language}"/>',
							title:'<bean:message key="button.detail" bundle="${language}"/>',
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
										name : '<bean:message key="clgl.columns.id" bundle="${language}"/>', //�ڲ����
										alias : 'id',
										width : 100,
										hide : true
									}, {
										name : '<bean:message key="clgl.columns.lpNumber" bundle="${language}"/>',//���ƺ�
										alias : 'locationId',
										width : 150
									},{
										name : '<bean:message key="clgl.columns.time" bundle="${language}"/>',//ʱ��
										alias : 'locationName',
										width : 250
									}, {
										name : '<bean:message key="clgl.columns.location" bundle="${language}"/>',//�ص�
										alias : 'longitude',
										width : 160
									}, {
										name : '<bean:message key="clgl.columns.xycd" bundle="${language}"/>',//���ɳ̶�
										alias : 'latiTude',
										width : 140
									}, {
										name : '<bean:message key="clgl.columns.comment" bundle="${language}"/>',//��ע
										alias : 'mapScaling',
										width : 300
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
						optMark : "I",// ���Ӳ���
						elemId : "padindex1",// ����������Ԫ��ID
						type : "hide",// Ԫ����������(hide��disabled)
						objSource : "page"// Ԫ��������Χ(Ŀǰ��page--ҳ���tableObj--����ؼ�)
					}, {
						optMark : "Q",//<bean:message key="button.query" bundle="${language}"/>����
						elemId : "hx_toolbar_event0",
						type : "disabled",
						objSource : "tableObj"
					}, {
						optMark : "U",//<bean:message key="button.modify" bundle="${language}"/>����
						elemId : "hx_toolbar_event2",
						type : "disabled",
						objSource : "tableObj"
					}, {
						optMark : "D",//<bean:message key="button.delete" bundle="${language}"/>����
						elemId : "hx_toolbar_event4",
						type : "disabled",
						objSource : "tableObj"
					}, {
						optMark : "V",//<bean:message key="button.detail" bundle="${language}"/>����
						elemId : "hx_toolbar_event6",
						type : "disabled",
						objSource : "tableObj"
					}]);
});