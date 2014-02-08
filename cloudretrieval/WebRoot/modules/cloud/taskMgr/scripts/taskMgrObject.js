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
						}, new ToolSeparatorObject(),// �ָ�������
						{
							alt : '<bean:message key="button.modify" bundle="${language}"/>',
							title : '<bean:message key="button.modify" bundle="${language}"/>',
							iconCss : 'add',
							select_trigger_mode : 'multi',
							handle : forUpdate
						}
						, new ToolSeparatorObject(),// �ָ�������
						{
							alt : '<bean:message key="task.report" bundle="${language}"/>',
							title : '<bean:message key="task.report" bundle="${language}"/>',
							iconCss : 'delete',
							select_trigger_mode : 'multi',
							handle : forReport
						}, new ToolSeparatorObject(),// �ָ�������
						{

							alt : '<bean:message key="button.detail" bundle="${language}"/>',
							title : '<bean:message key="button.detail" bundle="${language}"/>',
							iconCss : 'detail',
							select_trigger_mode : 'none',
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
										name : '<bean:message key="task.columns.id" bundle="${language}"/>',                      //�ڲ����
										alias : 'id',
										width : 100,
										hide : true
									}, {
										name : '<bean:message key="task.columns.options" bundle="${language}"/>',                  //ѡ��
										alias : 'check',
										width : 80
									}, {
										name : '<bean:message key="task.columns.taskNumbe" bundle="${language}"/>',                //������
										alias : 'event_code',
										width : 100
									}, {
										name : '<bean:message key="task.columns.taskName" bundle="${language}"/>',                 //��������
										alias : 'event_name',
										width : 100
									}, {
										name : '<bean:message key="task.columns.taskStatus" bundle="${language}"/>',               //����״̬
										alias : 'desp',
										width : 100
									}, {
										name : '<bean:message key="task.columns.locationName" bundle="${language}"/>',             //��������
										alias : 'masrows',
										width : 170
									}, {
										name : '<bean:message key="task.columns.input" bundle="${language}"/>',             		//����
										alias : 'masrows',
										width : 150
									}, {
										name : '<bean:message key="task.columns.id" bundle="${language}"/>',             			//���
										alias : 'masrows',
										width : 150,
										hide : true
									}, {
										name : '<bean:message key="task.columns.founder" bundle="${language}"/>',             		//������
										alias : 'masrows',
										width : 70
									}, {
										name : '<bean:message key="task.columns.creationTime" bundle="${language}"/>',              //����ʱ��
										alias : 'masrows',
										width : 150
									}, {
										name : '<bean:message key="task.columns.lastUpdateTime" bundle="${language}"/>',             //������ʱ��
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
						optMark : "S",// ֹͣ����
						elemId : "hx_toolbar_event4",
						type : "disabled",
						objSource : "tableObj"
					}, {
						optMark : "G",// �������
						elemId : "hx_toolbar_event6",
						type : "disabled",
						objSource : "tableObj"
					}, {
						optMark : "V",// <bean:message key="button.detail" bundle="${language}"/>����
						elemId : "hx_toolbar_event8",
						type : "disabled",
						objSource : "tableObj"
					}]);
});