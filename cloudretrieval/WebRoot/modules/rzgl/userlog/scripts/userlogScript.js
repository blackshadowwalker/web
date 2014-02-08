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
//    System.out.println(language);
%>
/*******************************************************************************
 * 用于<bean:message key="button.query" bundle="${language}"/>结果的显示控制，每个项目含四个字段： 1. <bean:message key="button.query" bundle="${language}"/>结果中的显示开关，0-不显示 1-显示 2. <bean:message key="button.query" bundle="${language}"/>结果中显示的列标题 3.
 * 对应的数据库中的字段名（全部为大写） 4. 显示类型，第一位：I-数值型，S-字符串或日期等类型，
 * 第二位：没有-单纯的类型，I-属性值，T-属性翻译成的名字
 ******************************************************************************/
function getPage(num) {

	tObject.cancelSelectedRow("all");

	var thispath = $("#this_path_id").val();

	userlogBean.queryTSUserlog(tObject.getPerPage(), num, tObject.tmpTJ, {
				callback : function(data) {
					if (data != "" && data != "no") {
						/*
						 * 数据格式： value</C>value</C></R>value</C>value</C></R>|totalPage</C>totalRow</C>curPage</C>
						 */

						// alert(data);

						var array_ele = data.split("|");

						var dataElems = array_ele[0].split("</R>");

						var dataArrs = new Array();

						for (var i = 0; i < dataElems.length - 1; i++) {

							var colElems = dataElems[i].split("</C>");

							var rowArr = new Array();

							for (var j = 0; j < colElems.length - 1; j++) {

								rowArr[j] = colElems[j];
							}

							dataArrs[i] = rowArr;
						}

						var totalPage = array_ele[1].split("</C>")[0];
						var totalRow = array_ele[1].split("</C>")[1];
						var curPage = array_ele[1].split("</C>")[2];

						tObject.setData({
									curPage : parseInt(curPage),
									totalPage : parseInt(totalPage),
									totalRow : parseInt(totalRow),
									data : dataArrs
								});

					} else {

						alert("<bean:message key="msg.error.dataEmputy" bundle="${language}"/>");
					}

					// 隐藏信息条
					// update_scrollbar("共"+(rowElements.length-1)+"条");
				},
				exceptionHandler : function(err_info) {

					stop_scrollbar(timer, "");

					if (err_info != "") {
						alert(err_info);
						if (err_info.indexOf("<bean:message key="msg.error.error" bundle="${language}"/>") < 0) {
							window.open(thispath + "/logoffAction.do?"
											+ new Date(), "_parent");
						}
					} else {
						alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
						window.open(
								thispath + "/logoffAction.do?" + new Date(),
								"_parent");
					}
				}
			});
}
// 用于控制正在处理的显示开关
var processing = false;

function dblcallback(line_num)
{
//	tObject.cols.cols[colNum].alias
//	alert(tObject.cols.cols.length);
	var lineNum = tObject.getSelectRowNum();
	//json: id,user_code,user_name,user_ip,user_time,user_nr
	var rowValueObj = tObject.getRowValue(lineNum);
	var values="";
	for(var i=0;i<tObject.cols.cols.length; i++){
		var vid = tObject.cols.cols[i].alias;
		values += eval("rowValueObj."+vid);
		values += ",";
	}
	window.clipboardData.setData("Text", values);
	//alert("Copyed to Clipboard:"+values);
}


/*******************************************************************************
 * 页面底部菜单
 ******************************************************************************/
// 开始<bean:message key="button.query" bundle="${language}"/>按钮
function forQuery(query_button) {
	
   var thispath = $("#this_path_id").val();
	var op = null;
	condi = " and ";
	var comma = false;
	var tmpString = "";
	var sqlString = " where 1=1 and status=1 ";
	op = document.forms[0].user_code_op;
	var inval = document.forms[0].user_code;
	if (trim(inval.value) != "") {
		tmpString = "user_code like '%" + inval.value + "%'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "AND (" + tmpString;
		}
	}
	op = document.forms[0].user_ip_op;
	var inval = document.forms[0].user_ip;
	if (trim(inval.value) != "") {
		tmpString = "user_ip like '%" + inval.value + "%'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "AND (" + tmpString;
		}
	}
	op = document.forms[0].user_ip_op;
	var inval = document.forms[0].logcontent;
	if (trim(inval.value) != "") {
		var contents = trim(inval.value);
		var contentlist = contents.split(" ");
		for(var i=0; i<contentlist.length; i++)
		{
			var content = trim(contentlist[i]);
			if(content=="")
				continue;
			tmpString = "user_nr like '%" + content + "%'";
			if (comma) {
				sqlString += condi + tmpString;
			} else {
				comma = true;
				sqlString += "AND (" + tmpString;
			}
		}
	}
	
	if (comma)
		sqlString += ")";
    
	query_button.disabled=true;
    //显示等待条
    waitObj.show({
    	
    	left:"25%",
    	bottom:"50%",
    	width:"280px",
    	height:"50px",
    	text_align:"center",
    	msg:"<span style=\"font-weight:bold;\"><bean:message key="msg.inProgress" bundle="${language}"/></span>"
    });

	tObject.cancelSelectedRow("all");

	tObject.tmpTJ = sqlString;
	userlogBean.queryTSUserlog(tObject.getPerPage(), 1, sqlString, {
				callback : function(data) {
					if (data != "" && data != "no") {
						/*
						 * 数据格式： value</C>value</C></R>value</C>value</C></R>|totalPage</C>totalRow</C>curPage</C>
						 */

						var array_ele = data.split("|");

						var dataElems = array_ele[0].split("</R>");

						var dataArrs = new Array();

						for (var i = 0; i < dataElems.length - 1; i++) {

							var colElems = dataElems[i].split("</C>");

							var rowArr = new Array();

							for (var j = 0; j < colElems.length - 1; j++) {

								rowArr[j] = colElems[j];
							}

							dataArrs[i] = rowArr;
						}

						var totalPage = array_ele[1].split("</C>")[0];
						var totalRow = array_ele[1].split("</C>")[1];
						var curPage = array_ele[1].split("</C>")[2];

						tObject.setData({
									curPage : parseInt(curPage),
									totalPage : parseInt(totalPage),
									totalRow : parseInt(totalRow),
									data : dataArrs
								});

					} else {

						alert("<bean:message key="msg.error.dataEmputy" bundle="${language}"/>");

						tObject.setData({
									curPage : 0,
									totalPage : 0,
									totalRow : 0,
									data : null
								});
					}

					query_button.disabled = false;
		            waitObj.hide();
				},
				exceptionHandler : function(err_info) {

					// stop_scrollbar(timer,"");

					query_button.disabled = false;
					if (err_info != "") {
						alert(err_info);
						if (err_info.indexOf("<bean:message key="msg.error.error" bundle="${language}"/>") < 0) {
							window.open(thispath + "/logoffAction.do?"
											+ new Date(), "_parent");
						}
					} else {
						alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
						window.open(
								thispath + "/logoffAction.do?" + new Date(),
								"_parent");
					}
				}
	});
}



// <bean:message key="button.detail" bundle="${language}"/>按钮
function forDetail(query_button) {

    var lineNum = tObject.getSelectRowNum();

	var rowID = tObject.getRowColValue(lineNum, 1);

	var srcFile = "modules/rzgl/userlog/jsp/userlogDetail.jsp";
	var winFeatures = "dialogHeight:300px;dialogWidth:600px;help:no;status:no";
//	window.open(srcFile+"?rowID="+rowID,"",winFeatures);
	window.showModalDialog(srcFile, rowID, winFeatures);

}
