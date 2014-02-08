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

$(function(){
var gd = document.body.clientHeight-0;
	tObject.init({
		reportTitle:'<bean:message key="filemgr.title" bundle="${language}"/>',
		tableDivId:'hx_table_div',
		tableWidth:"100%",
		tableHeight:gd,
		tableBorderCss:"#ACA899 solid 1px",
		toolbar:new ToolBarObject(
			{
				alt:'Query',
				title:'<bean:message key="button.query" bundle="${language}"/>',//<bean:message key="button.query" bundle="${language}"/>
				iconCss:'query',
				handle:forQuery
			},
			new ToolSeparatorObject(),//�ָ�������
			{
				alt:'Auto Upload',
				title:'<bean:message key="button.autoProcess" bundle="${language}"/>',//�Զ�����
				iconCss:'rydd',
				handle:forAutoUpload
			},
			new ToolSeparatorObject(),//�ָ�������
			{
				alt:'Delete',
				title:'<bean:message key="button.delete" bundle="${language}"/>',//<bean:message key="button.delete" bundle="${language}"/>
				iconCss:'delete',
				select_trigger_mode:'single',
				handle:forDelete
			},
			new ToolSeparatorObject(),//�ָ�������
			{
				alt:'Process',
				title:'<bean:message key="button.process" bundle="${language}"/>',//����
				iconCss:'dept_update',
				select_trigger_mode:'multi',
				handle:forProcess
			},
			new ToolSeparatorObject(),//�ָ�������
			{
			
				alt:'Download',
				title:'<bean:message key="button.download" bundle="${language}"/>',//����
				iconCss:'download',
				select_trigger_mode:'single',
				handle:forDownload
			},
			new ToolSeparatorObject(),//�ָ�������
			{
				alt:'Modefy',
				title:'<bean:message key="button.modify" bundle="${language}"/>',
				iconCss:'update',
				select_trigger_mode:'single',
				handle:forUpdate
			},
			new ToolSeparatorObject(),//�ָ�������
			{
			
				alt:'Case distribution',
				title:'<bean:message key="button.distribution" bundle="${language}"/>',
				iconCss:'detail',
				handle:forDistribution
			},
			new ToolSeparatorObject(),//�ָ�������
			{
			
				alt:'Video playback',
				title:'<bean:message key="button.video" bundle="${language}"/>',
				iconCss:'detail',
				handle:forPlayback
			},
			new ToolSeparatorObject(),//�ָ�������
			{
			
				alt:'Show in new window',
				title:'<bean:message key="button.showInNewWindow" bundle="${language}"/>',
				iconCss:'detail',
				handle:forShowInNewWindow
			}
			/*
			new DefaultDataToXlsBtnObject({
			
				url:$("#this_path_id").val()+'/modules/base/hx_table/xls_template.jsp'
			})**/
		),
		cols:new ColsObject({
			//ID �ļ����� �������� ·�� �����ַ ����ʱ�� �ϴ��� �Ƿ��ѷ��� ������ ����ʱ�� �ϴ�ʱ��
			viewLineNum:true,
			viewTotalRow:100,
			cols:[
                {
					name:'�ڲ����'
					, alias:'id'
					, width:60
                    , hide:true
                },
                {
                	name:'<bean:message key="filemgr.columns.options" bundle="${language}"/>'//ѡ��
					, alias:'id'
					, width:60
			    },
                {
					name:'<bean:message key="filemgr.columns.fileName" bundle="${language}"/>' //�ļ�����
					, alias:'user_code'
					, width:150
                },
                {
					name:'<bean:message key="filemgr.columns.phyName" bundle="${language}"/>' //��������
					, alias:'user_pass'
					, width:250
                },
                {
					name:'<bean:message key="filemgr.columns.directory" bundle="${language}"/>'//Ŀ¼'
					, alias:'user_name'
					, width:100
                },
                {
					name:'<bean:message key="filemgr.columns.server" bundle="${language}"/>'//��������ַ'
					, alias:'dept_code'
					, width:250
					, hide:true
                },
                {
					name:'<bean:message key="filemgr.columns.absTime" bundle="${language}"/>'//����ʱ��'
					, alias:'xb'
					, width:150
                },
                {
					name:'<bean:message key="filemgr.columns.location" bundle="${language}"/>'//�ص�'
					, alias:'xb'
					, width:150
                },
                {
					name:'<bean:message key="filemgr.columns.uploader" bundle="${language}"/>'//�ϴ���'
					, alias:'csrq'
					, width:80
                },
                {
					name:'<bean:message key="filemgr.columns.uploadTime" bundle="${language}"/>'//�ϴ�ʱ��'
					, alias:'tel'
					, width:150
                },
                {
					name:'<bean:message key="filemgr.columns.beAnalyed" bundle="${language}"/>'//�Ƿ��ѷ���'
					, alias:'zc'
					, width:70
                },
                {
					name:'<bean:message key="filemgr.columns.analyer" bundle="${language}"/>'//������'
					, alias:'zw'
					, width:100
                },
                {
					name:'<bean:message key="filemgr.columns.analyTime" bundle="${language}"/>'//����ʱ��'
					, alias:'sj'
					, width:150
                },
                {
					name:'<bean:message key="filemgr.columns.status" bundle="${language}"/>'//״̬'
					, alias:'status'
					, width:50
					, hide:true
                }
			]
		}),
		page:new PageObject({
		
			perPage:30,
			sep:new PageSeparatorObject(),
			viewJumpWidget:true,
			viewPageInfoWidget:true,
			handle:getPage
		})
	});
	
	getQX($("#qx_id").val(),$("#this_path_id").val(),[
    	{
    		optMark:"I",//�ϴ�����
    		elemId:"uploaFilleDiv",//����������Ԫ��ID
    		type:"hide",//Ԫ����������(hide��disabled)
    		objSource:"page"//Ԫ��������Χ(Ŀǰ��page--ҳ���tableObj--���ؼ�)
    	},
    	{
    		optMark:"Q",//<bean:message key="button.query" bundle="${language}"/>����
    		elemId:"hx_toolbar_event0",
    		type:"disabled",
    		objSource:"tableObj"
    	},
    	{
    		optMark:"A",//�Զ��ϴ�����
    		elemId:"hx_toolbar_event2",
    		type:"disabled",
    		objSource:"tableObj"
    	},
    	{
    		optMark:"D",//<bean:message key="button.delete" bundle="${language}"/>����
    		elemId:"hx_toolbar_event4",
    		type:"hide",
    		objSource:"tableObj"
    	},
    	{
    		optMark:"P",//�������
    		elemId:"hx_toolbar_event6",
    		type:"disabled",
    		objSource:"tableObj"
    	},
    	{
    		optMark:"L",//���ز���
    		elemId:"hx_toolbar_event8",
    		type:"disabled",
    		objSource:"tableObj"
    	},
    	{
    		optMark:"U",//<bean:message key="button.modify" bundle="${language}"/>����
    		elemId:"hx_toolbar_event10",
    		type:"disabled",
    		objSource:"tableObj"
    	},
    	{
    		optMark:"C",//�����ַ�
    		elemId:"hx_toolbar_event12",
    		type:"disabled",
    		objSource:"tableObj"
    	},
    	{
    		optMark:"M",//��Ƶ����
    		elemId:"hx_toolbar_event14",
    		type:"disabled",
    		objSource:"tableObj"
    	}
    ]);
});
