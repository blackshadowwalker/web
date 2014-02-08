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

var tObject=new TableObject();

$(function() {
var gd = document.body.clientHeight-200;
	tObject.init({
				reportTitle : '<bean:message key="db.export.title" bundle="${language}"/>',
				tableDivId : 'hx_table_div',
				tableWidth : "100%",
				tableHeight : gd,
				tableBorderCss : "#ACA899 solid 1px",
				toolbar : new ToolBarObject({
							alt : '<bean:message key="button.query" bundle="${language}"/>',
							title : '<bean:message key="button.query" bundle="${language}"/>',
							iconCss : 'query',
							handle : forQuery
						}, new ToolSeparatorObject(),// �ָ�������
						{
							alt : '<bean:message key="db.button.backup" bundle="${language}"/>',//������Ϣ',
							title : '<bean:message key="db.button.backup" bundle="${language}"/>',//����',
							iconCss : 'add',
							handle : forBackUp
						}, new ToolSeparatorObject(),// �ָ�������
						{
							alt : '<bean:message key="db.button.recover" bundle="${language}"/>',//�ָ���Ϣ',
							title : '<bean:message key="db.button.recover" bundle="${language}"/>',//�ָ�',
							iconCss : 'delete',
							select_trigger_mode : 'single',
							handle : forRecover
						}, new ToolSeparatorObject(),// �ָ�������
						{
							alt : '<bean:message key="db.button.download" bundle="${language}"/>',//������Ϣ',
							title : '<bean:message key="db.button.download" bundle="${language}"/>',//����',
							iconCss : 'detail', 
							select_trigger_mode : 'single',
							handle : forDownload
						}, new ToolSeparatorObject(),// �ָ�������
						new DefaultDataToXlsBtnObject({
									url : $("#this_path_id").val()
											+ '/modules/base/hx_table/xls_template.jsp'
								})),
				cols : new ColsObject({

							viewLineNum : true,
							viewTotalRow : 100,
							cols : [{
										name : '<bean:message key="db.columns.id" bundle="${language}"/>',
										alias : 'id',
										width : 100,
										hide : true
									}, {
										name : '<bean:message key="db.columns.backupBy" bundle="${language}"/>',//������',
										alias : 'createBy',
										width : 80
									},{
										name : '<bean:message key="db.columns.filename" bundle="${language}"/>',//�ļ�����',
										alias : 'value',
										width : 160
									},{
										name : '<bean:message key="db.columns.filevalue" bundle="${language}"/>',//�ļ���',
										alias : 'name',
										width : 160
									},{
										name : '<bean:message key="db.columns.filepath" bundle="${language}"/>',//�ļ�·��',
										alias : 'url',
										width : 190 ,
										hide : true
									},{
										name : '<bean:message key="db.columns.filesize" bundle="${language}"/>',//��С(KB)',
										alias : 'size',
										width : 80
									}, {
										name : '<bean:message key="db.columns.ctTime" bundle="${language}"/>',//����ʱ�� ',
										alias : 'ctTime',
										width : 180
									}, {
										name : '<bean:message key="db.columns.recoverTime" bundle="${language}"/>',//�ָ�ʱ�� ',
										alias : 'recoverTime',
										width : 180
									}, {
										name : '<bean:message key="db.columns.recoverBy" bundle="${language}"/>',//�ָ��� ',
										alias : 'recoverBy',
										width : 80
									}, {
										name : '<bean:message key="db.columns.recoverNumber" bundle="${language}"/>',//�ָ����� ',
										alias : 'recoverNumber',
										width : 80
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
					}]);
});