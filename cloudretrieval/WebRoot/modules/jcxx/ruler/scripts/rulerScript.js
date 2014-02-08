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

	rulerBean.queryTSRuler(tObject.getPerPage(), num, tObject.tmpTJ, {
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

						// tipNoDataInfo(timer,"query","<bean:message key="msg.error.dataEmputy" bundle="${language}"/>");
						alert("<bean:message key="msg.error.dataEmputy" bundle="${language}"/>");
					}

					// 隐藏信息条
					// update_scrollbar("共"+(rowElements.length-1)+"条");
				},
				exceptionHandler : function(err_info) {

					stop_scrollbar(timer, "");

					document.getElementById("query").disabled = false;
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

// 开始<bean:message key="button.query" bundle="${language}"/>按钮
function forQuery(query_button) {


	var thispath = $("#this_path_id").val();

	var op = null;
	var condi = " and ";
	var comma = false;
	var tmpString = "";
	var sqlString = " where 1=1 and status=1 ";

	op = "=";
	var inval = document.forms[0].ruler_code;
	if (inval.value != "") {
		tmpString = "ruler_code " + op + " '" + inval.value + "'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += " and (" + tmpString;
		}
	}
//	op = document.forms[0].ruler_name_op;
	
	var inval = document.forms[0].ruler_name;
	if (inval.value != "") {
		tmpString = "ruler_name " + op + " '" + inval.value + "'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += " and (" + tmpString;
		}
	}
	//op = document.forms[0].ruler_level_op;
	var inval = document.forms[0].ruler_level;
	if (inval.value != "") {
		tmpString = "ruler_level " + op + inval.value;
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += " and (" + tmpString;
		}
	}
	//op = document.forms[0].ruler_echo_op;
	var inval = document.forms[0].ruler_echo;
	if (inval.value != "") {
		tmpString = "ruler_echo " + op + inval.value;
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += " and (" + tmpString;
		}
	}
	//op = document.forms[0].ruler_manager_op;
	var inval = document.forms[0].ruler_manager;
	if (inval.value != "") {
		tmpString = "ruler_manager " + op + " '" + inval.value + "'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += " and (" + tmpString;
		}
	}
	if (comma)
		sqlString += ")";

	tObject.cancelSelectedRow("all");

	query_button.disabled = true;

	tObject.tmpTJ = sqlString;

	rulerBean.queryTSRuler(tObject.getPerPage(), 1, sqlString, {
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

function updateArgs() {
	var rowID = 0;
	var RulerLevelIDs = null;
	var RulerLevelNames = null;
	var RulerEchoIDs = null;
	var RulerEchoNames = null;
}

// <bean:message key="button.modify" bundle="${language}"/>按钮
function forUpdate() {
	var thispath = $("#this_path_id").val();

	var lineNum = tObject.getSelectRowNum();

	var srcFile = thispath + "/modules/jcxx/ruler/jsp/rulerUpdate.jsp";
	var winFeatures = "dialogHeight:300px;dialogWidth:600px;help:no;status:no";

	args = new updateArgs();
	args.RulerLevelIDs = new Array();
	args.RulerLevelNames = new Array();
	// args.TargetIDs = new Array();
	// args.TargetNames = new Array();
	args.RulerEchoIDs = new Array();
	args.RulerEchoNames = new Array();

	args.rowID = tObject.getRowColValue(lineNum, 1);

	for (var kk = 0; kk < document.all('i_ruler_level').options.length; kk++) {
		args.RulerLevelIDs[kk] = document.all('i_ruler_level').options[kk].value;
		args.RulerLevelNames[kk] = document.all('i_ruler_level').options[kk].text;
	}
	/*
	 * for (var kk=0; kk<document.all('i_target').options.length; kk++) {
	 * args.TargetIDs[kk] = document.all('i_target').options[kk].value;
	 * args.TargetNames[kk] = document.all('i_target').options[kk].text; }
	 */
	for (var kk = 0; kk < document.all('i_ruler_echo').options.length; kk++) {
		args.RulerEchoIDs[kk] = document.all('i_ruler_echo').options[kk].value;
		args.RulerEchoNames[kk] = document.all('i_ruler_echo').options[kk].text;
	}

	var inArray = window.showModalDialog(srcFile, args, winFeatures);
	if (inArray != null) {
		var array_Elem = inArray.split("|");

		rulerBean.updateTSRuler(args.rowID, array_Elem[0], {
					callback : function(data) {
						rowElements = data.split("</R>");

						colElement = rowElements[0].split("</C>");

						var num = colElement[0];

						if (num == 1) {

							alert("<bean:message key="button.modify" bundle="${language}"/> <bean:message key="msg.success" bundle="${language}"/>!");

							var elem = array_Elem[1].split("</C>");

							tObject.setRowValue({

										row_num : lineNum,
										data : [elem[0], elem[1], elem[2],
												elem[3], elem[4], elem[5],
												elem[6], elem[7], elem[8]]
									});
						} else {

							alert("<bean:message key="button.modify" bundle="${language}"/> <bean:message key="msg.failed" bundle="${language}"/>!");
						}

					},
					exceptionHandler : function(err_info) {

						if (err_info != "") {

							alert(err_info);

							window.open("thisPath/logoffAction.do?"
											+ new Date(), "_parent");
						} else {

							alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");

							window.open("thisPath/logoffAction.do?"
											+ new Date(), "_parent");
						}
					}
				});

	}
}

// <bean:message key="button.delete" bundle="${language}"/>按钮
function forDelete(thispath) {
	var thispath = $("#this_path_id").val();

	var lineNum = tObject.getSelectRowNum();

	rowId = tObject.getRowColValue(lineNum, 1);

	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/> <bean:message key="person.msg.deleteUser" bundle="${language}"/>? <bean:message key="person.msg.cannotBeRestored" bundle="${language}"/>."))
        return false;

	// 显示进度条
	// update_scrollbar("正在<bean:message key="button.delete" bundle="${language}"/>，请稍候...");

	rulerBean.deleteTSRuler(rowId, {
				callback : function(data) {

					if (data == 1) {
						alert("<bean:message key="person.msg.deleteUser" bundle="${language}"/> <bean:message key="msg.success" bundle="${language}"/>!");
				           
						tObject.delRowValue(lineNum);

					} else {
						 alert("<bean:message key="person.msg.deleteUser" bundle="${language}"/><bean:message key="msg.failed" bundle="${language}"/>!");
						
					}

					// 隐藏信息条
					// hidden_scrollbar();
				},
				exceptionHandler : function(err_info) {
					if (err_info != "") {
						alert(err_info);
						window.open("thisPath/logoffAction.do?"
										+ new Date(), "_parent");
					} else {
						alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
						window.open("thisPath/logoffAction.do?"
										+ new Date(), "_parent");
					}
				}
			});
}

// <bean:message key="button.detail" bundle="${language}"/>按钮
function forDetail() {
	var thispath = $("#this_path_id").val();

	var lineNum = tObject.getSelectRowNum();

	var rowID = tObject.getRowColValue(lineNum, 1);

	var srcFile = thispath + "/modules/jcxx/ruler/jsp/rulerDetail.jsp";
	var winFeatures = "dialogHeight:280px;dialogWidth:600px;help:no;status:no";

	window.showModalDialog(srcFile, rowID, winFeatures);
}

// 插入按钮
function forInsert() {
	var Ids = new Array();
	var Vals = new Array();

	var ruler_code = document.getElementById("i_ruler_code");
	if (trim(ruler_code.value) == "") {
		alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="ruler.columns.rulerCode" bundle="${language}"/>!");
		return false;
	}
	Ids[0] = "ruler_code";
	Vals[0] = "'" + trim(ruler_code.value) + "'";
	var ruler_name = document.getElementById("i_ruler_name");
	if (trim(ruler_name.value) == "") {
		alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="ruler.columns.rulerName" bundle="${language}"/>!");
		return false;
	}
	Ids[1] = "ruler_name";
	Vals[1] = "'" + trim(ruler_name.value) + "'";

	var ruler_desc = document.getElementById("i_ruler_desc");
	Ids[2] = "ruler_desc";
	Vals[2] = "'" + trim(ruler_desc.value) + "'";

	var ruler_page = document.getElementById("i_ruler_page");
	Ids[3] = "ruler_page";
	Vals[3] = "'" + trim(ruler_page.value) + "'";
	var ruler_level = document.getElementById("i_ruler_level");
	if (trim(ruler_level.value) == "") {
		alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="ruler.columns.rulerLevel" bundle="${language}"/>!");
		return false;
	}
	Ids[4] = "ruler_level";
	Vals[4] = trim(ruler_level.value);
	var ruler_echo = document.getElementById("i_ruler_echo");
	if (trim(ruler_echo.value) == "") {
		alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="ruler.columns.rulerEcho" bundle="${language}"/>!");
		return false;
	}
	Ids[5] = "ruler_echo";
	Vals[5] = trim(ruler_echo.value);
	var ruler_manager = document.getElementById("i_ruler_manager");
	if (trim(ruler_manager.value) == "") {
		alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="ruler.columns.rulerManager" bundle="${language}"/>!");
		return false;
	}
	Ids[6] = "ruler_manager";
	Vals[6] = "'" + trim(ruler_manager.value) + "'";
	var target = document.getElementById("i_target");

	Ids[7] = "target";
	Vals[7] = "'" + target.value + "'";

	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/> " +
			"<bean:message key="button.insert" bundle="${language}"/>" +
	 		" <bean:message key="ruler.name" bundle="${language}"/>!"))
	        return false;

	rulerBean.addTSRuler(Ids.toString(), Vals.toString(), {
				callback : function(data) {
					rowElements = data.split("</R>");

					for (var i = 0; i < rowElements.length - 1; ++i) {
						colElements = rowElements[i].split("</C>");

						if (colElements[0] == "1") {
							alert("<bean:message key="button.insert" bundle="${language}"/> <bean:message key="msg.success" bundle="${language}"/>!");

							forClear();
						} else {
							alert("<bean:message key="button.insert" bundle="${language}"/> <bean:message key="msg.failed" bundle="${language}"/>!");
						}
					}
				},
				exceptionHandler : function(err_info) {
					if (err_info != "") {
						alert(err_info);
						window.open("thisPath/logoffAction.do?"
										+ new Date(), "_parent");
					} else {
						alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
						window.open("thisPath/logoffAction.do?"
										+ new Date(), "_parent");
					}
				}
			});
}

// 重置输入内容按钮
function forClear() {
	//document.getElementById("i_ruler_code").value = "";
	//document.getElementById("i_ruler_name").value = "";
	//document.getElementById("i_ruler_desc").value = "";
	//document.getElementById("i_ruler_page").value = "";
	//document.getElementById("i_target").value = "";
	//document.getElementById("i_ruler_level").value = "";
	//document.getElementById("i_ruler_echo").value = "";
	//document.getElementById("i_ruler_manager").value = "";
}

// 切换顶层卡片标题
function switch_index(obj1, obj2) {
	var tmp;
//如果标签为一种不活动的状态
	if (obj1.className != "activeindex") {
		for (var i = 0;; ++i) {
		
			// 控制<bean:message key="button.query" bundle="${language}"/>和插入层的class
			tmp = document.getElementById('padindex' + i);
			if (tmp == null)
				break;

			if (i == obj2)
				tmp.className = 'activeindex';
			else
				tmp.className = 'hiddenindex';
			//控制<bean:message key="button.query" bundle="${language}"/>和插入界面是否显示
			tmp = document.getElementById('padcontent' + i);
			if (tmp == null)
				break;

			if (i == obj2)
				tmp.className = 'activecontent';
			else
				tmp.className = 'hiddencontent';
		}

		if (obj2 == 1) {

			$("#hx_table_div").css("display", "none");
			// 添加权限信息
		} else if (obj2 == 0) {
			$("#hx_table_div").css("display", "");
			// <bean:message key="button.query" bundle="${language}"/>权限信息
		}
	}
}