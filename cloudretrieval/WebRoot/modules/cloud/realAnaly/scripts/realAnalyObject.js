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
		reportTitle:'视频文件信息',
		tableDivId:'hx_table_div',
		tableWidth:"100%",
		tableHeight:gd,
		tableBorderCss:"#ACA899 solid 1px",
		toolbar:new ToolBarObject(
			{
				alt:'<bean:message key="button.query" bundle="${language}"/>',
				title:'&nbsp;&nbsp;<bean:message key="button.query" bundle="${language}"/>',
				iconCss:'query',
				handle:forQuery
			},
			new ToolSeparatorObject(),//分割条对象
			{
				alt:'<bean:message key="button.modify" bundle="${language}"/>',
				title:'&nbsp;&nbsp;<bean:message key="button.modify" bundle="${language}"/>',
				iconCss:'add',
				select_trigger_mode:'single',
				handle:forUpdate
			},
			new ToolSeparatorObject(),//分割条对象
			{
				alt:'<bean:message key="button.delete" bundle="${language}"/>',
				title:'&nbsp;&nbsp;<bean:message key="button.delete" bundle="${language}"/>',
				iconCss:'delete',
				select_trigger_mode:'single',
				handle:forDelete
			},
			new ToolSeparatorObject(),//分割条对象
			{
			
				alt:'<bean:message key="button.detail" bundle="${language}"/>',
				title:'&nbsp;&nbsp;<bean:message key="button.detail" bundle="${language}"/>',
				iconCss:'detail',
				select_trigger_mode:'multi',
				handle:forDetail
			},
			new ToolSeparatorObject()/**,//分割条对象
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
					name:'文件名称'
					, alias:'user_code'
					, width:150
                },
                {
					name:'物理名称'
					, alias:'user_pass'
					, width:160
					, hide:true
                },
                {
					name:'路径'
					, alias:'user_name'
					, width:200
					, hide:true
                },
                {
					name:'服务器地址'
					, alias:'dept_code'
					, width:160
					, hide:true
                },
                {
					name:'绝对时间'
					, alias:'xb'
					, width:150
                },
                {
					name:'地点'
					, alias:'xb'
					, width:150
                },
                {
					name:'上传人'
					, alias:'csrq'
					, width:80
                },
                {
					name:'是否已分析'
					, alias:'zc'
					, width:100
                },
                {
					name:'分析者'
					, alias:'zw'
					, width:100
                },
                {
					name:'分析时间'
					, alias:'sj'
					, width:150
                },
                {
					name:'上传时间'
					, alias:'tel'
					, width:150
                },
                {
					name:'状态'
					, alias:'status'
					, width:50
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
    		optMark:"I",//增加操作
    		elemId:"padindex1",//操作所关联元素ID
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
    		optMark:"U",//<bean:message key="button.modify" bundle="${language}"/>操作
    		elemId:"hx_toolbar_event2",
    		type:"disabled",
    		objSource:"tableObj"
    	},
    	{
    		optMark:"D",//<bean:message key="button.delete" bundle="${language}"/>操作
    		elemId:"hx_toolbar_event4",
    		type:"disabled",
    		objSource:"tableObj"
    	},
    	{
    		optMark:"V",//<bean:message key="button.detail" bundle="${language}"/>操作
    		elemId:"hx_toolbar_event6",
    		type:"disabled",
    		objSource:"tableObj"
    	}
    ]);
});
