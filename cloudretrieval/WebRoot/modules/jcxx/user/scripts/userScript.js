/*******************************************************************************
 * 用于<bean:message key="button.query" bundle="${language}"/>结果的显示控制，每个项目含四个字段： 1. <bean:message key="button.query" bundle="${language}"/>结果中的显示开关，0-不显示 1-显示 2. <bean:message key="button.query" bundle="${language}"/>结果中显示的列标题 3.
 * 对应的数据库中的字段名（全部为大写） 4. 显示类型，第一位：I-数值型，S-字符串或日期等类型，
 * 第二位：没有-单纯的类型，I-属性值，T-属性翻译成的名字
 ******************************************************************************/
function getPage(num) {

	tObject.cancelSelectedRow("all");

	userBean.queryTSUser(tObject.getPerPage(), num, tObject.tmpTJ, {
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

						// tipNoDataInfo(timer,'query',"没有<bean:message key="button.query" bundle="${language}"/>到相关机构信息。");
						alert("没有<bean:message key="button.query" bundle="${language}"/>到相关机构信息。");

						// 隐藏信息条
						// stop_scrollbar(timer,"");
						query_button.disabled = false;
					}

				},
				exceptionHandler : function(err_info) {
					if (err_info != "") {
						// stop_scrollbar(timer,"");

						query_button.disabled = false;
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
// 用于存储用户选择的角色信息
var roleArray = new Array();

/*******************************************************************************
 * 页面中部菜单
 ******************************************************************************/

// 重置输入条件按钮
// 开始<bean:message key="button.query" bundle="${language}"/>按钮
function forQuery(query_button) {
	var thispath = $("#this_path_id").val();

	var op = null;
	condi = " and ";
	var comma = false;
	var tmpString = "";
	var sqlString = " where 1=1 ";

	op = document.forms[0].user_code_op;
	var inval = document.forms[0].user_code;
	if (inval.value != "") {
		tmpString = "user_code " + op.value + " '" + inval.value + "'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "and (" + tmpString;
		}
	}
	op = document.forms[0].dept_code_op;
	var inval = document.forms[0].q_dept_code;
	if (inval.value != "") {
		tmpString = "b.dept_code " + parseDept(inval.value);
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "and (" + tmpString;
		}
	}
	op = document.forms[0].role_code_op;
	var inval = document.forms[0].role_code;
	if (inval.value != "") {
		tmpString = "role_code " + op.value + " '" + inval.value + "'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "and (" + tmpString;
		}
	}

	if (comma)
		sqlString += ")";

	tObject.tmpTJ = sqlString;

	query_button.disabled = true;

	tObject.cancelSelectedRow("all");

	userBean.queryTSUser(tObject.getPerPage(), 1, sqlString, {
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
						alert("没有<bean:message key="button.query" bundle="${language}"/>到相关信息。");

						tObject.setData({
									curPage : 0,
									totalPage : 0,
									totalRow : 0,
									data : null
								});

						// 隐藏信息条
						// stop_scrollbar(timer,"");
						query_button.disabled = false;
					}

				},
				exceptionHandler : function(err_info) {
					if (err_info != "") {
						// stop_scrollbar(timer,"");

						query_button.disabled = false;
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

// 重置按钮
function forSetPass(updatePage, thispath) {
	var rowNumber = OWC.ActiveCell.Row;
	var rowId = OWC.ActiveSheet.Cells(rowNumber, 1).value;
	var tag = isHeader(rowNumber);
	if (tag == false || typeof(rowId) == 'undefined'
			|| OWC.Selection.Rows.count != 1) {
		alert("请选择一条记录!");
		return false;
	}

	var srcFile = thispath + "/modules/jcxx/user/jsp/" + updatePage;
	var winFeatures = "dialogHeight:450px;dialogWidth:600px;help:no;status:no";

	var inArray = window.showModalDialog(srcFile, rowId, winFeatures);
	if (inArray != null) {
		// 显示进度条
		update_scrollbar("正在设置密码，请稍候...");

		userBean.setPassTSUser(rowId, inArray, null, {
					callback : function(data) {
						if (data == "1")
							alert("重置密码成功!");
						else
							alert("重置密码失败!");
						// 隐藏信息条
						hidden_scrollbar();
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

function updateArgs() {
	var rowID = 0;
	var roleIDs = null;
	var roleNames = null;
	var dept = "";
}

// <bean:message key="button.modify" bundle="${language}"/>按钮
function forUpdate() {
	var thispath = $("#this_path_id").val();

	var lineNum = tObject.getSelectRowNum();

	var srcFile = thispath + "/modules/jcxx/user/jsp/userUpdate.jsp";
	var winFeatures = "dialogHeight:300px;dialogWidth:600px;help:no;status:no";

	args = new updateArgs();
	args.roleIDs = new Array();
	args.roleNames = new Array();

	args.rowCard = tObject.getRowColValue(lineNum, 1);

	args.dept = document.getElementById("user_dept").value;

	for (var kk = 0; kk < document.all('q_role_code').options.length; kk++) {
		args.roleIDs[kk] = document.all('q_role_code').options[kk].value;
		args.roleNames[kk] = document.all('q_role_code').options[kk].text;
	}

	var inArray = window.showModalDialog(srcFile, args, winFeatures);

	if (inArray != null) {
		// 显示进度条
		// update_scrollbar("正在<bean:message key="button.modify" bundle="${language}"/>，请稍候...");

		var array_Elem = inArray.split("|");

		var dataArray = array_Elem[0].split("</C>");

		userBean.updateTSUser(dataArray[0], dataArray[1], dataArray[2], {
					callback : function(data) {
						rowElements = data.split("</R>");

						colElements = rowElements[0].split("</C>");

						if (colElements[0] == 1) {

							alert("<bean:message key="button.modify" bundle="${language}"/>成功。");

							var elem = array_Elem[1].split("</C>");

							tObject.setRowValue({

										row_num : lineNum,
										data : [elem[0], elem[1], elem[2]]
									});

						} else {

							alert("<bean:message key="button.modify" bundle="${language}"/>失败。");
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
}

// <bean:message key="button.delete" bundle="${language}"/>按钮
function forDelete() {

	var thispath = $("#this_path_id").val();

	var lineNum = tObject.getSelectRowNum();

	var rowCode = tObject.getRowColValue(lineNum, 1);

	if (!confirm("真的要<bean:message key="button.delete" bundle="${language}"/>选中的记录吗？此操作不能恢复！"))
		return false;

	userBean.deleteTSUser(rowCode, {
				callback : function(data) {

					if (data != 0) {

						alert("<bean:message key="button.delete" bundle="${language}"/>成功。");

						tObject.delRowValue(lineNum);

					} else {
						alert("对不起，您选择的第" + lineNum + "条记录<bean:message key="button.delete" bundle="${language}"/>失败！");
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
function forDetail() {

	var thispath = $("#this_path_id").val();

	var lineNum = tObject.getSelectRowNum();

	var rowCode = tObject.getRowColValue(lineNum, 1);

	var srcFile = thispath + "/modules/jcxx/user/jsp/userDetail.jsp";
	var winFeatures = "dialogHeight:360px;dialogWidth:600px;help:no;status:no";

	window.showModalDialog(srcFile, rowCode, winFeatures);
}

// 显示用户的角色信息
function forShowRole() {

	var innerHTML = "<table cellSpacing=1 cellPadding=0 class=tablestyle>";
	for (ii = 0; ii < roleArray.length; ii += 3) {
		innerHTML += "<tr>";
		innerHTML += "<td width=100px class=tablebody>" + roleArray[ii]
				+ "</td>";
		innerHTML += "<td width=200px class=tablebody>" + roleArray[ii + 2]
				+ "</td>";
		innerHTML += "<td class=tablebody><a href='javascript:forDelRole(" + ii
				+ ")'><bean:message key="button.delete" bundle="${language}"/></a></td>";
		innerHTML += "</tr>";
	}
	innerHTML += "</table>";
	document.all('userRoles').innerHTML = innerHTML;
}

// 增加角色信息
function forInsRole() {

	var ii = roleArray.length;

	var dept_code = document.getElementById("i_dept_code");
	if (trim(dept_code.value) == "") {
		alert("请输入正确的机构编号!");
		return false;
	}
	var role_code = document.getElementById("i_role_code");
	if (trim(role_code.value) == "") {
		alert("请选择正确的角色信息!");
		return false;
	}

	for (var kk = 0; kk < ii; kk += 3) {
		if (roleArray[kk] == dept_code.value
				&& roleArray[kk + 1] == role_code.value) {
			alert("选择的角色信息重复!");
			return false;
		}
	}

	var role_dept = document.getElementById("user_dept").value;

	dwr.engine.setAsync(false);

	baseBean.checkDept(trim(dept_code.value), trim(role_dept), {
		callback : function(data) {

			if (data == true) {
				roleArray[ii++] = dept_code.value;
				roleArray[ii++] = role_code.value;
				for (var kk = 0; kk < document.getElementById('i_role_code').options.length; kk++) {
					if (document.getElementById('i_role_code').options[kk].value == document
							.getElementById("i_role_code").value) {
						roleArray[ii] = document.all('i_role_code').options[kk].text;
						break;
					}
				}
				forShowRole();
			}
		},
		exceptionHandler : function(err_info) {
			if (err_info != "") {
				alert(err_info);
			} else {
				alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
				window.open("thisPath/logoffAction.do?" + new Date(),
						"_parent");
			}
		}
	});
	dwr.engine.setAsync(true);
}

// <bean:message key="button.delete" bundle="${language}"/>角色信息
function forDelRole(id) {
	if (isNaN(id) || id > roleArray.length) {

		alert("false");
		return false;
	}
	for (var i = 0, n = 0; i < roleArray.length; i += 3) {
		if (i != id) {
			roleArray[n++] = roleArray[i];
			roleArray[n++] = roleArray[i + 1];
			roleArray[n++] = roleArray[i + 2];
		}
	}
	roleArray.length -= 3;
	forShowRole();
}

// <bean:message key="button.delete" bundle="${language}"/>角色信息
/*
 * function forDelRole(id) { if (isNaN(id) || id > roleArray.length) { return
 * false; } for (var i=0,n=0;i<roleArray.length;i+=3) { if (i!=id) {
 * roleArray[n++]=roleArray[i]; roleArray[n++]=roleArray[i+1];
 * roleArray[n++]=roleArray[i+2]; } } roleArray.length-=3; forShowRole(); }
 */
// 插入按钮
function forInsert() {
	var Ids = new Array();
	var Vals = new Array();
	var user_code = document.getElementById("i_user_code");
	if (trim(user_code.value) == "") {
		alert("请输入正确的用户代码!");
		return false;
	}
	Ids[0] = "user_code";
	Vals[0] = trim(user_code.value);
	var user_name = document.getElementById("user_name");
	if (trim(user_name.value) == "") {
		alert("请输入正确的用户姓名!");
		return false;
	}
	Ids[1] = "user_name";
	Vals[1] = trim(user_name.value);

	if (roleArray.length == 0) {
		alert("请选择正确的角色信息!");
		return false;
	}

	if (!confirm("确定要增加用户信息吗？"))
		return false;

	var Roles = new Array();
	for (var ii = kk = 0; ii < roleArray.length; ii += 3) {
		Roles[kk++] = trim(user_code.value);
		//Roles[kk++] = roleArray[ii];
		Roles[kk++] = roleArray[ii + 1];
	}
	

	userBean.addTSUser(trim(user_name.value), Roles.toString(), {
				callback : function(data) {

					rowElements = data.split("</R>");

					for (var i = 0; i < rowElements.length - 1; ++i) {
						colElements = rowElements[i].split("</C>");

						if (colElements[0] == "1") {
							alert("增加用户信息成功");

							forClear();
						} else {
							alert("对不起，增加用户信息失败！");
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
	document.getElementById("i_user_code").value = "";
	document.getElementById("i_user_name").value = "";
	document.getElementById("i_dept_code").value = "";
	document.getElementById("i_role_code").value = "";
	roleArray = new Array();
	document.all('userRoles').innerHTML = "";

}

// 切换顶层卡片标题
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

			// 添加用户信息
			document.all('path_name').innerHTML = "页面路径：系统管理＞权限/角色管理＞角色分配";

			document.getElementById("userRoles").style.display = "";
		} else if (obj2 == 0) {
			$("#hx_table_div").css("display", "");
			// <bean:message key="button.query" bundle="${language}"/>用户信息
			document.all('path_name').innerHTML = "页面路径：系统管理＞权限/角色管理＞角色分配";

			document.getElementById("userRoles").style.display = "none";
		}
	}
}

// 判断用户代码是否已经存在
function isExist() {

	dwr.engine.setAsync(false);

	forCard('i_user_code');

	var user_code = document.getElementById("i_user_code");
	if (user_code.value != "") {
		userBean.isExist(user_code.value, {
					callback : function(data) {
						// alert(data);
						if (data != "") {
							if (data == 'used')//
							{
								alert("用户代码已用!");
								user_code.value = "";
								return false;
							} else {
								
								var datas = data.split("</C>");
								
								document.getElementById("i_user_name").value = datas[0];//员工姓名
								document.getElementById("i_dept_code").value = datas[1];//所属机构
							}
						}
						if (data == "") {
							alert("人员信息无此人!");
							user_code.value = "";
							return false;
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

	dwr.engine.setAsync(true);
}

function getRole(objId) {

	var dept = document.getElementById("user_dept").value;

	var roleElem = document.getElementById(objId);

	for (var j = roleElem.options.length - 1; j > 0; j--) {

		roleElem.options.remove(j);
	}

	userBean.getRole(dept, {
				callback : function(data) {
					if (data != "") {
						var rowElements = data.split("</R>");

						for (var i = 0; i < rowElements.length - 1; ++i) {
							var colElements = rowElements[i].split("</C>");

							roleElem.add(new Option(colElements[1],
									colElements[0]));

						}
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
