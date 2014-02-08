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

	locationBean.queryTSLocations(tObject.getPerPage(), num, tObject.tmpTJ, {
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

	op = document.forms[0].type_op;
	var inval = document.forms[0].locationName;
	
	if (inval.value != "") {
		tmpString = "locationName like '%" + inval.value + "%'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "and (" + tmpString;
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

	locationBean.queryTSLocation(tObject.getPerPage(), 1, sqlString, {
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

/*******************************************************************************
 * 页面底部菜单
 ******************************************************************************/

function updateArgs() {
	var rowID = 0;
}

// <bean:message key="button.modify" bundle="${language}"/>按钮
function forUpdate(query_button) {
  var thispath = $("#this_path_id").val();
	var srcFile = "modules/location/jsp/locationUpdate.jsp";
	var winFeatures = "dialogHeight:300px;dialogWidth:700px;help:no;status:no";

	var lineNum = tObject.getSelectRowNum();

	args = new updateArgs();

	args.rowID = tObject.getRowColValue(lineNum, 1);

	var inArray = window.showModalDialog(srcFile, args, winFeatures);
	if (inArray != null) {
		var array_Elem = inArray.split("|");

		// 显示进度条
		// update_scrollbar("<bean:message key="msg.inProgress" bundle="${language}"/>");
		locationBean.updateTSLocation(args.rowID, array_Elem[0], {
					callback : function(data) {
					 
						if (data > 0) {
                     
							alert("<bean:message key="button.modify" bundle="${language}"/> <bean:message key="msg.success" bundle="${language}"/>");

							var elem = array_Elem[1].split("</C>");

							tObject.setRowValue({
										row_num : lineNum,
										data : [elem[0], elem[1], elem[2],
												elem[3],elem[4],elem[5],elem[6]]
									});
						} else {

							alert("<bean:message key="button.modify" bundle="${language}"/><bean:message key="msg.failed" bundle="${language}"/>");
						}

						// 隐藏信息条
						// hidden_scrollbar();
					},
					exceptionHandler : function(err_info) {

						if (err_info != "") {

							alert(err_info);

							window.open(thispath + "/logoffAction.do?"
											+ new Date(), "_parent");
						} else {

							alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");

							window.open(thispath + "/logoffAction.do?"
											+ new Date(), "_parent");
						}
					}
				});

	}
}
// <bean:message key="button.delete" bundle="${language}"/>按钮
function forDelete(query_button) {
    var thispath = $("#this_path_id").val();
	var lineNum = tObject.getSelectRowNum();
	var rowId = tObject.getRowColValue(lineNum, 1);
	
	
	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/> <bean:message key="button.delete" bundle="${language}"/>?"))
		return false;
    var array_Elem=0;
	// 显示进度条
	// update_scrollbar("正在<bean:message key="button.delete" bundle="${language}"/>，请稍候...");
	locationBean.deleteTSLocation(parseInt(rowId), 0, 
	{
	
				callback : function(data) {
					if (data == 1)
			        {
			            alert("<bean:message key="button.delete" bundle="${language}"/> <bean:message key="msg.success" bundle="${language}"/>");
			            tObject.delRowValue(lineNum);
			        }
			        else
			        {
			            alert("对不起，您选择的第"+lineNum+"条记录<bean:message key="button.delete" bundle="${language}"/> <bean:message key="msg.failed" bundle="${language}"/>");
			        }
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
function forDetail(query_button) {

    var lineNum = tObject.getSelectRowNum();

	var rowID = tObject.getRowColValue(lineNum, 1);

	var srcFile = "modules/location/jsp/locationDetail.jsp";
	var winFeatures = "dialogHeight:600px;dialogWidth:600px;help:no;status:no";

	window.showModalDialog(srcFile, rowID, winFeatures);

}

// 插入按钮
function forInsert(thispath) {

  if(!$("#nvr_form").validateForm()){
		return;
   }

	var Ids = new Array();
	var Vals = new Array();
	
	var locationId = document.getElementById("i_rand");
	if (trim($("#i_id").val()) == "") {
		alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="location.columns.code" bundle="${language}"/>!");
		return false;
	}
	Ids[0] = "locationId";
	Vals[0] = "'" + trim($("#i_id").val()) + "'";

	var locationName = $.trim($("#i_type").val());

	if (locationName == "") {
		alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="location.columns.name" bundle="${language}"/>!");
		return false;
	}

	Ids[1] = "locationName";
	Vals[1] = "'" + locationName + "'";

	var longitude = document.getElementById("i_code");
	if (trim(longitude.value) == "") {
		alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="location.columns.longitude" bundle="${language}"/>!");
		return false;
	}
	Ids[2] = "longitude";
	Vals[2] = "'" + trim(longitude.value) + "'";

	var latiTude = document.getElementById("i_value");
	if (trim(latiTude.value) == "") {
		alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="location.columns.latitude" bundle="${language}"/>!");

		return false;
	}
	Ids[3] = "latiTude";
	Vals[3] = "'" + trim(latiTude.value) + "'";

	var mapScaling = document.getElementById("i_content");   
    if (trim(mapScaling.value) == "") {
		alert("<bean:message key="msg.pleaseSelect" bundle="${language}"/> <bean:message key="location.columns.mapScaling" bundle="${language}"/>!");
		return false;
	}
	Ids[4] = "mapScaling";
	Vals[4] = "'" + trim(mapScaling.value) + "'";
	
	var parentLocationId = document.getElementById("i_dept_manager");   
    if (trim(parentLocationId.value) == "") {
		alert("<bean:message key="msg.pleaseSelect" bundle="${language}"/> <bean:message key="location.label.parentLocation" bundle="${language}"/>!");
		return false;
	}
	Ids[5] = "parentLocationId";
	Vals[5] = "'" + trim(parentLocationId.value) + "'";
	

	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/> <bean:message key="button.insert" bundle="${language}"/>?"))
		return false;

	locationBean.addTSLocation(Ids.toString(), Vals.toString(), {
				callback : function(data) {
					if (data > 0) {
						alert("<bean:message key="button.insert" bundle="${language}"/> <bean:message key="msg.success" bundle="${language}"/>!");

						window.location.reload();
					} else {
						alert("<bean:message key="button.insert" bundle="${language}"/> <bean:message key="msg.failed" bundle="${language}"/>!");
					}
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

// 重置输入内容按钮
function forClear() {
    document.getElementById("i_id").value = "";
	document.getElementById("i_type").value = "";
	document.getElementById("i_code").value = "";
	document.getElementById("i_value").value = "";
	document.getElementById("i_content").value = "";
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
			// 添加地理位置信息
		} else if (obj2 == 0) {
			$("#hx_table_div").css("display", "");
		}
	}
}