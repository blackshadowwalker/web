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
function getPage(num) {

	tObject.cancelSelectedRow("all");

	roleBean.queryTSRole(tObject.getPerPage(), num, tObject.tmpTJ, {
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

			// tipNoDataInfo("","query","<bean:message key="msg.error.dataEmputy" bundle="${language}"/>");
			alert("<bean:message key="msg.error.dataEmputy" bundle="${language}"/>");

		}

	},
	exceptionHandler : function(err_info) {

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

//用于控制正在处理的显示开关
var processing = false;

//开始query>按钮
function forQuery(query_button) {
	var thispath = $("#this_path_id").val();

	var op = null;
	condi = " and ";
	var comma = false;
	var tmpString = "";
	var sqlString = " WHERE 1=1 ";

	op = document.forms[0].role_code_op;
	var inval = document.forms[0].role_code;
	if (inval.value != "") {
		tmpString = "role_code " + op.value + " '" + inval.value + "'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "AND (" + tmpString;
		}
	}

	op = document.forms[0].role_name_op;
	var inval = document.forms[0].role_name;
	if (inval.value != "") {
		tmpString = "role_name " + op.value + " '" + inval.value + "'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "AND (" + tmpString;
		}
	}
	if (comma)
		sqlString += ")";

	tObject.cancelSelectedRow("all");
	tObject.tmpTJ = sqlString;
	query_button.disabled = true;
	roleBean.queryTSRole(tObject.getPerPage(), 1, sqlString, {
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

//Modify按钮
function forUpdate() {
	var thispath = $("#this_path_id").val();

	var lineNum = tObject.getSelectRowNum();

	rowId = tObject.getRowColValue(lineNum, 1);

	var srcFile = thispath + "/modules/jcxx/role/jsp/roleUpdate.jsp";
	var winFeatures = "dialogHeight:590px;dialogWidth:500px;help:no;status:no";
	// var inArray =tObject.getRowValue(lineNum);
	var inArray = new Array();
	var k = 0;

	inArray[k++] = "0";
	inArray[k++] = "id";
	inArray[k++] = tObject.getRowColValue(lineNum, 1);

	inArray[k++] = "4";
	inArray[k++] = "role_code";
	inArray[k++] = tObject.getRowColValue(lineNum, 2);

	inArray[k++] = "8";
	inArray[k++] = "role_name";
	inArray[k++] = tObject.getRowColValue(lineNum, 3);

	inArray = window.showModalDialog(srcFile, inArray, winFeatures);
	
	if (inArray != null) {

		var rolecode = inArray[0];
		var role_name = inArray[1];
		var rulervalues = inArray[2];
		var sqlstr = " role_name='"+role_name+"'"
		roleBean.updateTSRole(rowId, sqlstr, rolecode, rulervalues,
		{
			callback : function(data) 
			{
				rowElements = data.split("</R>");
				colElements = rowElements[0].split("</C>");
				if (colElements[0] == 1) {
					alert("<bean:message key="button.modify" bundle="${language}"/><bean:message key="msg.success" bundle="${language}"/>!");
					tObject.setRowValue({
						row_num : lineNum,
						data : ["no", rolecode, role_name]
					});
			} else {
				alert("<bean:message key="button.modify" bundle="${language}"/><bean:message key="msg.failed" bundle="${language}"/>!");
			}
			// 隐藏信息条
			// hidden_scrollbar();
			},
			exceptionHandler : function(err_info) {
				if (err_info != "") {
					alert(err_info);
					window.open(thispath + "/logoffAction.do?"+ new Date(), "_parent");
				} else {
					alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
					window.open(thispath + "/logoffAction.do?"
							+ new Date(), "_parent");
				}
			}
		});
	}
}

//<bean:message key="button.delete" bundle="${language}"/>按钮
function forDelete() {
	var thispath = $("#this_path_id").val();

	var lineNum = tObject.getSelectRowNum();

	var rowId = tObject.getRowColValue(lineNum, 1);
	
	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/>  <bean:message key="button.delete" bundle="${language}"/>? <bean:message key="person.msg.cannotBeRestored" bundle="${language}"/>."))
		return false;

	// 显示进度条
	// update_scrollbar("正在<bean:message key="button.delete" bundle="${language}"/>，请稍候...");

	roleBean.deleteTSRole(rowId, {
		callback : function(data) {

		rowElements = data.split("</R>");

		colElements = rowElements[0].split("</C>");

		if (colElements[0] == "1") {
			alert("<bean:message key="button.delete" bundle="${language}"/> <bean:message key="msg.success" bundle="${language}"/>!");
			tObject.delRowValue(lineNum);
		} else {
			alert("<bean:message key="button.delete" bundle="${language}"/> <bean:message key="msg.failed" bundle="${language}"/>!");
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

//<bean:message key="button.detail" bundle="${language}"/>按钮
function forDetail() {
	var thispath = $("#this_path_id").val();

	var lineNum = tObject.getSelectRowNum();

	var srcFile = thispath + "/modules/jcxx/role/jsp/roleDetail.jsp";
	var winFeatures = "dialogHeight:540px;dialogWidth:500px;help:no;status:no";

	var inArray = tObject.getRowValue(lineNum);

	window.showModalDialog(srcFile, inArray, winFeatures);
}

//插入按钮
function forInsert(thispath) {

	var role_code = document.getElementById("i_role_code");

	if (trim(role_code.value) == "") {
		//请输入正确的角色代码!
		alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="role.columns.roleCode" bundle="${language}"/>!");

		document.getElementById("i_role_code").focus();

		return false;
	}

	var role_name = document.getElementById("i_role_name");
	if (trim(role_name.value) == "") {
		alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="role.columns.roleName" bundle="${language}"/>!");

		document.getElementById("i_role_name").focus();

		return false;
	}

	var dept_level = 10;

	if (document.all('rulervalues').value == "") {

		//请为准备添加的角色选择相应的权限
		alert("<bean:message key="role.msg.preparationSelectTree" bundle="${language}"/>!");
		return false;
	}

	//确定要增加角色信息吗
	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/> <bean:message key="button.insert" bundle="${language}"/>?"))
		return false;

	roleBean.addTSRole(trim(role_code.value), trim(role_name.value),
			trim(sfld.value+"</C>"+sftq.value), document.all('rulervalues').value,{
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

			document.getElementById("i_role_code").value = "";
			document.getElementById("i_role_name").value = "";
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

//重置输入内容按钮
function forClear() {
	document.getElementById("i_role_code").value = "";
	document.getElementById("i_role_name").value = "";
	document.getElementById("i_sfld").value = "";
	document.getElementById("i_sftq").value = "";
}

//切换顶层卡片标题
function switch_index(obj1, obj2) {
	var tmp;

	if (obj1.className != "activeindex") {
		for (var i = 0;; ++i) {
			tmp = document.getElementById('padindex' + i);
			if (tmp == null)
				break;

			if (i == obj2)
				tmp.className = 'activeindex';
			else
				tmp.className = 'hiddenindex';

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
			// 添加角色信息
		} else if (obj2 == 0) {
			$("#hx_table_div").css("display", "");
			// <bean:message key="button.query" bundle="${language}"/>角色信息
		}
	}
}

//复制按钮
/*
 * function getCopy() { var rowNumber = OWC.ActiveCell.Row;
 * 
 * if (typeof(OWC.ActiveSheet.Cells(rowNumber,1).value) == 'undefined' ||
 * OWC.Selection.Rows.count != 1) { alert("请选择一条记录!"); return false; }
 * 
 * var i = 0; for (i=0; i<baseColumn.length; i+=4) { if (baseColumn[i+2] ==
 * "role_code") break; } document.forms[1].role_code.value =
 * OWC.ActiveSheet.Cells(rowNumber, i/4+1).value; for (i=0; i<baseColumn.length;
 * i+=4) { if (baseColumn[i+2] == "role_name") break; }
 * document.forms[1].role_name.value = OWC.ActiveSheet.Cells(rowNumber,
 * i/4+1).value; for (i=0; i<baseColumn.length; i+=4) { if (baseColumn[i+2] ==
 * "dept_level") break; } document.forms[1].dept_level.value =
 * OWC.ActiveSheet.Cells(rowNumber, i/4+1).value;
 * 
 * //跳转到‘增加角色信息’标签 switch_index(this, 1);
 * 
 * document.forms[1].role_code.focus(); }
 */

//生成角色树tree
function createRulerTree(thispath, rulerID, checkORradio, isTextField, tagName,
		tagValue) {

	roleBean.createRulerTree({

		callback : function(data) {

		if (data != "" && data.length > 0) {

			var role_tree = new alai_tree_role(tree_div);

			var root = role_tree.root;

			var n1 = root.add("<bean:message key="role.label.roleTree" bundle="${language}"/>");//角色树

			var arrays = data.split(";");

			var length = arrays.length;

			for (var i = 0; i < length - 1; i++) {

				// 一级权限
				var sub_arrays1 = arrays[i].split(",");

				// 生成一级权限tree
				if (sub_arrays1[2] == "0") {// 一级权限

					// 将一级权限添加到树中
					var n2 = role_tree.addChkNode(n1, sub_arrays1[1],
							sub_arrays1[0], "", isTextField, "QUIVD",
							rulerID);

					// 生成二级权限tree
					for (var j = 0; j < length - 1; j++) {

						var sub_arrays2 = arrays[j].split(",");

						if (sub_arrays2[2] == "1"
							&& sub_arrays2[3] == sub_arrays1[0]) {// 二级权限

							// 将二级权限添加到树中
							var n3 = role_tree.addChkNode(n2,
									sub_arrays2[1], sub_arrays2[0], "",
									isTextField, "QUIVD", rulerID);

							// 生成三级权限tree
							for (var k = 0; k < length - 1; k++) {

								var sub_arrays3 = arrays[k].split(",");

								if (sub_arrays3[2] == "2"
									&& sub_arrays3[3] == sub_arrays2[0]) {// 三级权限

									var n4 = role_tree.addChkNode(n3,
											sub_arrays3[1], sub_arrays3[0],
											"", isTextField, "QUIVD",
											rulerID);
								}
							}
						}
					}
				}
			}

			role_tree.oncheck = function(srcNode, rulerElem) {

				if (srcNode.checkBox.checked) {
					// alert("checked="+tagName);
					rulerElem.value += srcNode.checkBox.value + ","
					+ $.trim(srcNode.textField.value) + ";";

					srcNode.textField.disabled = false;

					srcNode.label.style.color = "#ea1b7b";

					if ($.trim(tagName) != "") {

						var cod = document.getElementById(tagName);
						var val = document.getElementById(tagValue);
						cod.value = srcNode.checkBox.value;
						val.value = srcNode.checkBox.viewText;
						// alert(val.value);
					}
				} else {

					var values = "";

					var arrays = rulerElem.value.split(";");

					var length = arrays.length - 1;

					if (length == 1) {

						rulerElem.value = "";
					} else {

						for (var i = 0; i < length; i++) {

							var sub_arrays = arrays[i].split(",");

							if (sub_arrays[0] != srcNode.checkBox.value) {

								values += sub_arrays[0] + ","
								+ sub_arrays[1] + ";";
							}
						}

						rulerElem.value = values;
					}

					srcNode.textField.disabled = true;

					srcNode.label.style.color = "black";
				}
			}

			role_tree.onblur = function(srcNode, rulerElem) {

				if ($.trim(srcNode.textField.value) == "") {

					alert("<bean:message key="role.msg.tree.inputOperate" bundle="${language}"/> !");//请填写操作权限

					srcNode.textField.focus();
				} else {

					// 此处判断操作权限是否为Q、U、I、D等字母(略)

					var values = "";

					var arrays = rulerElem.value.split(";");

					var length = arrays.length - 1;

					if (length == 1) {

						var sub_arrays = arrays[0].split(",");

						rulerElem.value = srcNode.checkBox.value + ","
						+ $.trim(srcNode.textField.value) + ";";
					} else {

						for (var i = 0; i < length; i++) {

							var sub_arrays = arrays[i].split(",");

							if (sub_arrays[0] != srcNode.checkBox.value) {

								values += sub_arrays[0] + ","
								+ sub_arrays[1] + ";";
							} else {

								values += sub_arrays[0] + ","
								+ $.trim(srcNode.textField.value)
								+ ";";
							}
						}

						rulerElem.value = values;
					}
				}
			}
		}
	},

	exceptionHandler : function(err_info) {

		if (err_info != "") {

			alert(err_info);
		} else {

			alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
		}

		window.open(thispath + "/logoffAction.do?" + new Date(), "_parent");
	}
	});
}

//根据角色ID生成角色树tree
function viewRoleValuesTree(thispath, rulerID, role_code) {

	roleBean.queryRulerTree(role_code, {

		callback : function(data) {

		// alert(data);

		if (data != "" && data.length > 0) {

			var content = "";// 保存信息

			var role_tree = new alai_tree_role(view_tree_div);

			var root = role_tree.root;

			var n1 = root.add("<bean:message key="role.label.roleTree" bundle="${language}"/>");//角色树

			var arrays = data.split(";");

			var length = arrays.length;

			for (var i = 0; i < length - 1; i++) {

				// 一级权限
				var sub_arrays1 = arrays[i].split(",");

				// 生成一级权限tree
				if (sub_arrays1[2] == "0") {// 一级权限

					// 将一级权限添加到树中
					var n2 = null;

					if (sub_arrays1[5].toUpperCase() == "Y") {

						n2 = role_tree.addChkNode(n1, sub_arrays1[1],
								sub_arrays1[0], "", "true", sub_arrays1[4],
								rulerID);

						n2.checkBox.checked = true;
						n2.label.style.color = "#ea1b7b";

						content += sub_arrays1[0] + "," + sub_arrays1[4]
						                                              + "," + sub_arrays1[5] + ","
						                                              + sub_arrays1[6] + ";";
					} else {

						n2 = role_tree.addChkNode(n1, sub_arrays1[1],
								sub_arrays1[0], "", "true", "QUIVD",
								rulerID);
					}

					n2.checkBox.disabled = true;

					// 生成二级权限tree
					for (var j = 0; j < length - 1; j++) {

						var sub_arrays2 = arrays[j].split(",");

						if (sub_arrays2[2] == "1"
							&& sub_arrays2[3] == sub_arrays1[0]) {// 二级权限

							// 将二级权限添加到树中
							var n3 = null;

							if (sub_arrays2[5].toUpperCase() == "Y") {

								n3 = role_tree.addChkNode(n2,
										sub_arrays2[1], sub_arrays2[0], "",
										"true", sub_arrays2[4], rulerID);

								n3.checkBox.checked = true;
								n3.label.style.color = "#ea1b7b";

								content += sub_arrays2[0] + ","
								+ sub_arrays2[4] + ","
								+ sub_arrays2[5] + ","
								+ sub_arrays2[6] + ";";
							} else {

								n3 = role_tree.addChkNode(n2,
										sub_arrays2[1], sub_arrays2[0], "",
										"true", "QUIVD", rulerID);
							}

							n3.checkBox.disabled = true;

							// 生成三级权限tree
							for (var k = 0; k < length - 1; k++) {

								var sub_arrays3 = arrays[k].split(",");

								if (sub_arrays3[2] == "2"
									&& sub_arrays3[3] == sub_arrays2[0]) {// 三级权限

									var n4 = null;

									if (sub_arrays3[5].toUpperCase() == "Y") {

										n4 = role_tree.addChkNode(n3,
												sub_arrays3[1],
												sub_arrays3[0], "", "true",
												sub_arrays3[4], rulerID);

										n4.checkBox.checked = true;
										n4.label.style.color = "#ea1b7b";

										content += sub_arrays3[0] + ","
										+ sub_arrays3[4] + ","
										+ sub_arrays3[5] + ","
										+ sub_arrays3[6] + ";";
									} else {

										n4 = role_tree.addChkNode(n3,
												sub_arrays3[1],
												sub_arrays3[0], "", "true",
												"QUIVD", rulerID);
									}

									n4.checkBox.disabled = true;
								}
							}
						}
					}
				}
			}

		}
	},

	exceptionHandler : function(err_info) {

		if (err_info != "") {

			alert(err_info);
		} else {

			alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
		}

		window.open(thispath + "/logoffAction.do?" + new Date(), "_parent");
	}
	});
}

//根据角色ID生成角色树tree
function queryRoleValuesTree(thispath, rulerID, role_code) {

	roleBean.queryRulerTree(role_code, {

		callback : function(data) {

		if (data != "" && data.length > 0) {

			var content = "";// 保存信息

			var role_tree = new alai_tree_role(tree_div);

			var root = role_tree.root;

			var n1 = root.add("<bean:message key="role.label.roleTree" bundle="${language}"/>");//角色树

			var arrays = data.split(";");

			var length = arrays.length;

			for (var i = 0; i < length - 1; i++) {

				// 一级权限
				var sub_arrays1 = arrays[i].split(",");

				// 生成一级权限tree
				if (sub_arrays1[2] == "0") {// 一级权限

					// 将一级权限添加到树中
					var n2 = null;

					if (sub_arrays1[5].toUpperCase() == "Y") {

						n2 = role_tree.addChkNode(n1, sub_arrays1[1],
								sub_arrays1[0], "", "true", sub_arrays1[4],
								rulerID);

						n2.checkBox.checked = true;
						n2.textField.disabled = false;

						n2.label.style.color = "#ea1b7b";

						content += sub_arrays1[0] + "," + sub_arrays1[4]
						                                              + "," + sub_arrays1[5] + ","
						                                              + sub_arrays1[6] + ";"
					} else {

						n2 = role_tree.addChkNode(n1, sub_arrays1[1],
								sub_arrays1[0], "", "true", "QUIVD",
								rulerID);
					}

					// 生成二级权限tree
					for (var j = 0; j < length - 1; j++) {

						var sub_arrays2 = arrays[j].split(",");

						if (sub_arrays2[2] == "1"
							&& sub_arrays2[3] == sub_arrays1[0]) {// 二级权限

							// 将二级权限添加到树中
							var n3 = null;

							if (sub_arrays2[5].toUpperCase() == "Y") {

								n3 = role_tree.addChkNode(n2,
										sub_arrays2[1], sub_arrays2[0], "",
										"true", sub_arrays2[4], rulerID);

								n3.checkBox.checked = true;
								n3.textField.disabled = false;

								n3.label.style.color = "#ea1b7b";

								content += sub_arrays2[0] + ","
								+ sub_arrays2[4] + ","
								+ sub_arrays2[5] + ","
								+ sub_arrays2[6] + ";";
							} else {

								n3 = role_tree.addChkNode(n2,
										sub_arrays2[1], sub_arrays2[0], "",
										"true", "QUIVD", rulerID);
							}

							// 生成三级权限tree
							for (var k = 0; k < length - 1; k++) {

								var sub_arrays3 = arrays[k].split(",");

								if (sub_arrays3[2] == "2"
									&& sub_arrays3[3] == sub_arrays2[0]) {// 三级权限

									var n4 = null;

									if (sub_arrays3[5].toUpperCase() == "Y") {

										n4 = role_tree.addChkNode(n3,
												sub_arrays3[1],
												sub_arrays3[0], "", "true",
												sub_arrays3[4], rulerID);

										n4.checkBox.checked = true;
										n4.textField.disabled = false;

										n4.label.style.color = "#ea1b7b";

										content += sub_arrays3[0] + ","
										+ sub_arrays3[4] + ","
										+ sub_arrays3[5] + ","
										+ sub_arrays3[6] + ";";
									} else {

										n4 = role_tree.addChkNode(n3,
												sub_arrays3[1],
												sub_arrays3[0], "", "true",
												"QUIVD", rulerID);
									}
								}
							}
						}
					}
				}
			}

			document.all(rulerID).value = content;

			role_tree.oncheck = function(srcNode, rulerElem) {

				if (srcNode.checkBox.checked) {

					if (rulerElem.value == ""
						|| rulerElem.value.length == 0) {

						rulerElem.value = srcNode.checkBox.value + ","
						+ $.trim(srcNode.textField.value) + ",N,Y;";
					} else {

						var values = "";

						var arrays = rulerElem.value.split(";");

						var length = arrays.length - 1;

						var isHave = false;

						for (var i = 0; i < length; i++) {

							var sub_arrays = arrays[i].split(",");

							if (sub_arrays[0] == srcNode.checkBox.value) {

								values += srcNode.checkBox.value + ","
								+ $.trim(srcNode.textField.value)
								+ "," + sub_arrays[2] + ",Y;";

								isHave = true;
							} else {

								values += sub_arrays[0] + ","
								+ sub_arrays[1] + ","
								+ sub_arrays[2] + ","
								+ sub_arrays[3] + ";";
							}
						}

						if (!isHave) {

							values += srcNode.checkBox.value + ","
							+ $.trim(srcNode.textField.value)
							+ ",N,Y;";
						}

						rulerElem.value = values;
					}

					srcNode.textField.disabled = false;

					srcNode.label.style.color = "#ea1b7b";

				} else {

					var values = "";

					var arrays = rulerElem.value.split(";");

					var length = arrays.length - 1;

					for (var i = 0; i < length; i++) {

						var sub_arrays = arrays[i].split(",");

						if (sub_arrays[0] == srcNode.checkBox.value) {

							if (sub_arrays[2].toUpperCase() == "Y") {

								values += sub_arrays[0] + ","
								+ sub_arrays[1] + ","
								+ sub_arrays[2] + ",N;";
							}
						} else {

							values += sub_arrays[0] + "," + sub_arrays[1]
							                                           + "," + sub_arrays[2] + ","
							                                           + sub_arrays[3] + ";";
						}
					}

					rulerElem.value = values;

					srcNode.textField.disabled = true;

					srcNode.label.style.color = "black";
				}
			}

			role_tree.onblur = function(srcNode, rulerElem) {

				if ($.trim(srcNode.textField.value) == "") {

					alert("<bean:message key="role.msg.tree.inputOperate" bundle="${language}"/> !");//请填写操作权限

					srcNode.textField.focus();
				} else {

					// 此处判断操作权限是否为Q、U、I、D等字母(略)

					var values = "";

					var arrays = rulerElem.value.split(";");

					var length = arrays.length - 1;

					if (length == 1) {

						var sub_arrays = arrays[0].split(",");

						rulerElem.value = srcNode.checkBox.value + ","
						+ $.trim(srcNode.textField.value) + ","
						+ sub_arrays[2] + ",Y;";
					} else {

						for (var i = 0; i < length; i++) {

							var sub_arrays = arrays[i].split(",");

							if (sub_arrays[0] != srcNode.checkBox.value) {

								values += sub_arrays[0] + ","
								+ sub_arrays[1] + ","
								+ sub_arrays[2] + ","
								+ sub_arrays[3] + ";";
							} else {

								values += sub_arrays[0] + ","
								+ $.trim(srcNode.textField.value)
								+ "," + sub_arrays[2] + ",Y;";
							}
						}

						rulerElem.value = values;
					}
				}
			}

		}
	},

	exceptionHandler : function(err_info) {

		if (err_info != "") {

			alert(err_info);
		} else {

			alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
		}

		window.open(thispath + "/logoffAction.do?" + new Date(), "_parent");
	}
	});
}

function isSelectRuler(rulerID) {

	var rulerElem = document.all(rulerID);
	if (rulerElem.value == "") {
		return false;
	} else {

		var arrays = rulerElem.value.split(";");

		var length = arrays.length - 1;

		var delNum = 0;

		for (var i = 0; i < length; i++) {

			var sub_arrays = arrays[i].split(",");

			if (sub_arrays[3].toUpperCase() == "N") {

				delNum++;
			}
		}

		if (delNum == length) {

			return false;
		} else {

			return true;
		}
	}
}