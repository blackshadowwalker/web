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
		reportTitle:'<bean:message key="person.title" bundle="${language}"/>',
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
				//<bean:message key="button.modify" bundle="${language}"/>
				alt:'<bean:message key="button.modify" bundle="${language}"/>',
				title:'<bean:message key="button.modify" bundle="${language}"/>',
				iconCss:'add',
				select_trigger_mode:'single',
				handle:forUpdate
			},
			new ToolSeparatorObject(),//分割条对象
			{
				//<bean:message key="button.delete" bundle="${language}"/>
				alt:'<bean:message key="button.delete" bundle="${language}"/>',
				title:'<bean:message key="button.delete" bundle="${language}"/>',
				iconCss:'delete',
				select_trigger_mode:'single',
				handle:forDelete
			},
			new ToolSeparatorObject(),//分割条对象
			{
				//<bean:message key="button.detail" bundle="${language}"/>
				alt:'<bean:message key="button.detail" bundle="${language}"/>',
				title:'<bean:message key="button.detail" bundle="${language}"/>',
				iconCss:'detail',
				select_trigger_mode:'multi',
				handle:forDetail
			},
			new ToolSeparatorObject(),//分割条对象
			new DefaultDataToXlsBtnObject({
			
				url:$("#this_path_id").val()+'/modules/base/hx_table/xls_template.jsp'
			})
		),
		cols:new ColsObject({
			
			viewLineNum:true,
			viewTotalRow:100,
			cols:[
                {
					name:'<bean:message key="person.columns.id" bundle="${language}"/>'//内部编号'
					, alias:'id'
					, width:60
                    , hide:true
                },
                {
					name:'<bean:message key="person.columns.userID" bundle="${language}"/>'//用户名'
					, alias:'user_code'
					, width:60
                },
                {
					name:'<bean:message key="person.columns.passWord" bundle="${language}"/>'//密码'
					, alias:'user_pass'
					, width:60
					, hide:true
                },
                {
					name:'<bean:message key="person.columns.userName" bundle="${language}"/>'//姓名'
					, alias:'user_name'
					, width:100
                },
                {
					name:'<bean:message key="person.columns.department" bundle="${language}"/>'//所属部门'
					, alias:'dept_code'
					, width:100
                },
                {
					name:'<bean:message key="person.columns.role" bundle="${language}"/>'//角色'
					, alias:'zw'
					, width:100
                },
                {
					name:'<bean:message key="person.columns.sex" bundle="${language}"/>'//性别'
					, alias:'xb'
					, width:100
                },
                {
					name:'<bean:message key="person.columns.birthday" bundle="${language}"/>'//出生日期'
					, alias:'csrq'
					, width:100
                },
                {
					name:'<bean:message key="person.columns.cellphone" bundle="${language}"/>'//手机'
					, alias:'sj'
					, width:100
                },
                {
					name:'<bean:message key="person.columns.telephone" bundle="${language}"/>'//电话'
					, alias:'tel'
					, width:100
                },
                {
					name:'<bean:message key="person.columns.email" bundle="${language}"/>'//邮箱'
					, alias:'mail'
					, width:100
                },
                {
					name:'<bean:message key="person.columns.language" bundle="${language}"/>'//语言'
					, alias:'language'
					, width:100
                },
                {
					name:'<bean:message key="person.columns.satus" bundle="${language}"/>'//状态'
					, alias:'status'
					, width:100
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
