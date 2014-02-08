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
/*******************************************************************************
 * 用于<bean:message key="button.query" bundle="${language}"/>结果的显示控制，每个项目含四个字段： 1. <bean:message key="button.query" bundle="${language}"/>结果中的显示开关，0-不显示 1-显示 2. <bean:message key="button.query" bundle="${language}"/>结果中显示的列标题 3.
 * 对应的数据库中的字段名（全部为大写） 4. 显示类型，第一位：I-数值型，S-字符串或日期等类型，
 * 第二位：没有-单纯的类型，I-属性值，T-属性翻译成的名字
 ******************************************************************************/

function getPage(num) {

	tObject.cancelSelectedRow("all");

	var thispath = $("#this_path_id").val();

	statisticBean.queryStatistic(tObject.getPerPage(), num, tObject.tmpTJ, {
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

/*******************************************************************************
 * 页面中部菜单
 ******************************************************************************/

// 开始<bean:message key="button.query" bundle="${language}"/>按钮
function forQuery(query_button) {
	var thispath = $("#this_path_id").val();

	var op = "like";
	condi = " and ";
	var comma = false;
	var tmpString = "";
	var sqlString = "";

	
	var inval = document.forms[0].LPNumber;
	
	if (inval.value != "") {
		tmpString = " LPNumber "+ op+ " '%" + inval.value +"%'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "and (" + tmpString;
		}
	}
	
	var inval = document.forms[0].locationId;
	
	if (inval.value != "") {
		tmpString = " l.locationId " + op + " '%" + inval.value + "%'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "and (" + tmpString;
		}
	}
	
	var inval1 = document.forms[0].time1;
	var inval2 = document.forms[0].time2;
	
	if (inval1.value != "" && inval2.value != "") {
		tmpString = " r.absTime between '"+inval1.value+"' and '"+inval2.value+"'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "and (" + tmpString;
		}
	}
	if (comma)
		sqlString += ")";

	query_button.disabled = true;

	tObject.cancelSelectedRow("all");

	tObject.tmpTJ = sqlString;

	statisticBean.queryStatistic(tObject.getPerPage(), 1, sqlString, {
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

/*******************************************************************************
 * 页面底部菜单
 ******************************************************************************/

// <bean:message key="button.delete" bundle="${language}"/>按钮
function forDelete() {

	var thispath = $("#this_path_id").val();

	var lineNum = tObject.getSelectRowNum();

	var rowId = tObject.getRowColValue(lineNum, 1);

	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/><bean:message key="msg.delete" bundle="${language}"/>?"))
		return false;

	// 显示进度条
	// update_scrollbar("正在<bean:message key="button.delete" bundle="${language}"/>，请稍候...");

	statisticBean.deleteStatistic(parseInt(rowId), {
				callback : function(data) {

					if (data == 1) {
						alert("<bean:message key="button.delete" bundle="${language}"/><bean:message key="msg.success" bundle="${language}"/>");

						tObject.delRowValue(lineNum);
					} else {
						alert("<bean:message key="button.delete" bundle="${language}"/><bean:message key="msg.failed" bundle="${language}"/>");
					}

					// 隐藏信息条
					// hidden_scrollbar();
				},
				exceptionHandler : function(err_info) {
					if (err_info != "") {
						alert(err_info);
						window.open(
								thispath + "/logoffAction.do?" + new Date(),
								"_parent");
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
function forDetail() {

	var lineNum = tObject.getSelectRowNum();

	var rowID = tObject.getRowColValue(lineNum, 1);

	var srcFile = "modules/cloud/statistic/jsp/statisticDetail.jsp";
	var winFeatures = "dialogHeight:450px;dialogWidth:850px;help:no;status:no";

	window.showModalDialog(srcFile, rowID, winFeatures);
}
//切换顶层卡片标题
function switch_index(obj1, obj2)
{
    var tmp;

    if (obj1.className != "activeindex")
    {
        for (var i=0; ; ++i)
        {
            tmp = document.getElementById('padindex'+i);
            if (tmp == null)
                break;

            if (i == obj2)
                tmp.className = 'activeindex';
            else
                tmp.className = 'hiddenindex';

            tmp = document.getElementById('padcontent'+i);
            if (tmp == null)
                break;

            if (i == obj2)
                tmp.className = 'activecontent';
            else
                tmp.className = 'hiddencontent';
        }
        
        if (obj2==1)
        {
            $("#hx_table_div").css("display","none");
            //增加摄像头信息管理
            document.all('path_name').innerHTML="页面路径：云计算分析中心＞分析中心＞图形分析";
        }
        else if (obj2==0)
        {
            $("#hx_table_div").css("display","");
            //<bean:message key="button.query" bundle="${language}"/>摄像头信息管理
            document.all('path_name').innerHTML="页面路径：云计算分析中心＞分析中心＞报表分析";
        }
    }
}



