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
			new ToolSeparatorObject(),//分割条对象
			{
				alt:'Auto Upload',
				title:'<bean:message key="button.autoProcess" bundle="${language}"/>',//自动处理
				iconCss:'rydd',
				handle:forAutoUpload
			},
			new ToolSeparatorObject(),//分割条对象
			{
				alt:'Delete',
				title:'<bean:message key="button.delete" bundle="${language}"/>',//<bean:message key="button.delete" bundle="${language}"/>
				iconCss:'delete',
				select_trigger_mode:'single',
				handle:forDelete
			},
			new ToolSeparatorObject(),//分割条对象
			{
				alt:'Process',
				title:'<bean:message key="button.process" bundle="${language}"/>',//处理
				iconCss:'dept_update',
				select_trigger_mode:'multi',
				handle:forProcess
			},
			new ToolSeparatorObject(),//分割条对象
			{
			
				alt:'Download',
				title:'<bean:message key="button.download" bundle="${language}"/>',//下载
				iconCss:'download',
				select_trigger_mode:'single',
				handle:forDownload
			},
			new ToolSeparatorObject(),//分割条对象
			{
				alt:'Modefy',
				title:'<bean:message key="button.modify" bundle="${language}"/>',
				iconCss:'update',
				select_trigger_mode:'single',
				handle:forUpdate
			},
			new ToolSeparatorObject(),//分割条对象
			{
			
				alt:'Case distribution',
				title:'<bean:message key="button.distribution" bundle="${language}"/>',
				iconCss:'detail',
				handle:forDistribution
			},
			new ToolSeparatorObject(),//分割条对象
			{
			
				alt:'Video playback',
				title:'<bean:message key="button.video" bundle="${language}"/>',
				iconCss:'detail',
				handle:forPlayback
			},
			new ToolSeparatorObject(),//分割条对象
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
			//ID 文件名称 物理名称 路径 网络地址 绝对时间 上传人 是否已分析 分析者 分析时间 上传时间
			viewLineNum:true,
			viewTotalRow:100,
			cols:[
                {
					name:'内部编号'
					, alias:'id'
					, width:60
                    , hide:true
                },
                {
                	name:'<bean:message key="filemgr.columns.options" bundle="${language}"/>'//选项
					, alias:'id'
					, width:60
			    },
                {
					name:'<bean:message key="filemgr.columns.fileName" bundle="${language}"/>' //文件名称
					, alias:'user_code'
					, width:150
                },
                {
					name:'<bean:message key="filemgr.columns.phyName" bundle="${language}"/>' //物理名称
					, alias:'user_pass'
					, width:250
                },
                {
					name:'<bean:message key="filemgr.columns.directory" bundle="${language}"/>'//目录'
					, alias:'user_name'
					, width:100
                },
                {
					name:'<bean:message key="filemgr.columns.server" bundle="${language}"/>'//服务器地址'
					, alias:'dept_code'
					, width:250
					, hide:true
                },
                {
					name:'<bean:message key="filemgr.columns.absTime" bundle="${language}"/>'//绝对时间'
					, alias:'xb'
					, width:150
                },
                {
					name:'<bean:message key="filemgr.columns.location" bundle="${language}"/>'//地点'
					, alias:'xb'
					, width:150
                },
                {
					name:'<bean:message key="filemgr.columns.uploader" bundle="${language}"/>'//上传人'
					, alias:'csrq'
					, width:80
                },
                {
					name:'<bean:message key="filemgr.columns.uploadTime" bundle="${language}"/>'//上传时间'
					, alias:'tel'
					, width:150
                },
                {
					name:'<bean:message key="filemgr.columns.beAnalyed" bundle="${language}"/>'//是否已分析'
					, alias:'zc'
					, width:70
                },
                {
					name:'<bean:message key="filemgr.columns.analyer" bundle="${language}"/>'//分析者'
					, alias:'zw'
					, width:100
                },
                {
					name:'<bean:message key="filemgr.columns.analyTime" bundle="${language}"/>'//分析时间'
					, alias:'sj'
					, width:150
                },
                {
					name:'<bean:message key="filemgr.columns.status" bundle="${language}"/>'//状态'
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
    		optMark:"I",//上传操作
    		elemId:"uploaFilleDiv",//操作所关联元素ID
    		type:"hide",//元素屏蔽类型(hide或disabled)
    		objSource:"page"//元素所属范围(目前：page--页面或tableObj--表格控件)
    	},
    	{
    		optMark:"Q",//<bean:message key="button.query" bundle="${language}"/>操作
    		elemId:"hx_toolbar_event0",
    		type:"disabled",
    		objSource:"tableObj"
    	},
    	{
    		optMark:"A",//自动上传操作
    		elemId:"hx_toolbar_event2",
    		type:"disabled",
    		objSource:"tableObj"
    	},
    	{
    		optMark:"D",//<bean:message key="button.delete" bundle="${language}"/>操作
    		elemId:"hx_toolbar_event4",
    		type:"hide",
    		objSource:"tableObj"
    	},
    	{
    		optMark:"P",//处理操作
    		elemId:"hx_toolbar_event6",
    		type:"disabled",
    		objSource:"tableObj"
    	},
    	{
    		optMark:"L",//下载操作
    		elemId:"hx_toolbar_event8",
    		type:"disabled",
    		objSource:"tableObj"
    	},
    	{
    		optMark:"U",//<bean:message key="button.modify" bundle="${language}"/>操作
    		elemId:"hx_toolbar_event10",
    		type:"disabled",
    		objSource:"tableObj"
    	},
    	{
    		optMark:"C",//案件分发
    		elemId:"hx_toolbar_event12",
    		type:"disabled",
    		objSource:"tableObj"
    	},
    	{
    		optMark:"M",//视频播放
    		elemId:"hx_toolbar_event14",
    		type:"disabled",
    		objSource:"tableObj"
    	}
    ]);
});
