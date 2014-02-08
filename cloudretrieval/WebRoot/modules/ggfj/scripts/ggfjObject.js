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
var gd = document.body.clientHeight-250;
	tObject.init({
		reportTitle:'公共附件',
		tableDivId:'hx_table_div',
		tableWidth:"100%",
		tableHeight:gd,
		tableBorderCss:"#ACA899 solid 1px",
		toolbar:new ToolBarObject(
			{
				alt:'<bean:message key="button.query" bundle="${language}"/>',
				title:'<bean:message key="button.query" bundle="${language}"/>',
				iconCss:'query',
				handle:forQuery
			},
			new ToolSeparatorObject(),//分割条对象
			{
				alt:'上传附件',
				title:'上传',
				iconCss:'add',
				handle:UploadImage
			},
			new ToolSeparatorObject(),//分割条对象
			{
				alt:'<bean:message key="button.delete" bundle="${language}"/>',
				title:'<bean:message key="button.delete" bundle="${language}"/>',
				iconCss:'delete',
				select_trigger_mode:'muti',
				handle:forDelete
			},
			new ToolSeparatorObject(),//分割条对象
			{
			
				alt:'<bean:message key="button.detail" bundle="${language}"/>',
				title:'<bean:message key="button.detail" bundle="${language}"/>所有附件',
				iconCss:'detail',
				handle:forDetail
			},
			new ToolSeparatorObject()/**,//分割条对象
			new DefaultDataToXlsBtnObject({
			
				url:$("#this_path_id").val()+'/modules/base/hx_table/xls_template.jsp'
			})**/
		),
		cols:new ColsObject({
			
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
					, alias:'value'
					, width:160
                },
                {
					name:'文件路径'
					, alias:'path'
					, width:460
                },
                {
					name:'上传日期'
					, alias:'sc_rq'
					, width:140
                },
                {
					name:'上传用户'
					, alias:'person'
					, width:100
                },
                {
					name:'状态'
					, alias:'status'
					, width:60
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
