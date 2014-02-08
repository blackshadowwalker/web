/*******************************************************************************
 * ����<bean:message key="button.query" bundle="${language}"/>�������ʾ���ƣ�ÿ����Ŀ���ĸ��ֶΣ� 1. <bean:message key="button.query" bundle="${language}"/>����е���ʾ���أ�0-����ʾ 1-��ʾ 2. <bean:message key="button.query" bundle="${language}"/>�������ʾ���б��� 3.
 * ��Ӧ�����ݿ��е��ֶ�����ȫ��Ϊ��д�� 4. ��ʾ���ͣ���һλ��I-��ֵ�ͣ�S-�ַ��������ڵ����ͣ�
 * �ڶ�λ��û��-���������ͣ�I-����ֵ��T-���Է���ɵ�����
 ******************************************************************************/
function getPage(num) {

	tObject.cancelSelectedRow("all");

	userBean.queryTSUser(tObject.getPerPage(), num, tObject.tmpTJ, {
				callback : function(data) {
					if (data != "" && data != "no") {
						/*
						 * ���ݸ�ʽ�� value</C>value</C></R>value</C>value</C></R>|totalPage</C>totalRow</C>curPage</C>
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

						// tipNoDataInfo(timer,'query',"û��<bean:message key="button.query" bundle="${language}"/>����ػ�����Ϣ��");
						alert("û��<bean:message key="button.query" bundle="${language}"/>����ػ�����Ϣ��");

						// ������Ϣ��
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

// ���ڿ������ڴ������ʾ����
var processing = false;
// ���ڴ洢�û�ѡ��Ľ�ɫ��Ϣ
var roleArray = new Array();

/*******************************************************************************
 * ҳ���в��˵�
 ******************************************************************************/

// ��������������ť
// ��ʼ<bean:message key="button.query" bundle="${language}"/>��ť
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
						 * ���ݸ�ʽ�� value</C>value</C></R>value</C>value</C></R>|totalPage</C>totalRow</C>curPage</C>
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
						alert("û��<bean:message key="button.query" bundle="${language}"/>�������Ϣ��");

						tObject.setData({
									curPage : 0,
									totalPage : 0,
									totalRow : 0,
									data : null
								});

						// ������Ϣ��
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
 * ҳ��ײ��˵�
 ******************************************************************************/

// ���ð�ť
function forSetPass(updatePage, thispath) {
	var rowNumber = OWC.ActiveCell.Row;
	var rowId = OWC.ActiveSheet.Cells(rowNumber, 1).value;
	var tag = isHeader(rowNumber);
	if (tag == false || typeof(rowId) == 'undefined'
			|| OWC.Selection.Rows.count != 1) {
		alert("��ѡ��һ����¼!");
		return false;
	}

	var srcFile = thispath + "/modules/jcxx/user/jsp/" + updatePage;
	var winFeatures = "dialogHeight:450px;dialogWidth:600px;help:no;status:no";

	var inArray = window.showModalDialog(srcFile, rowId, winFeatures);
	if (inArray != null) {
		// ��ʾ������
		update_scrollbar("�����������룬���Ժ�...");

		userBean.setPassTSUser(rowId, inArray, null, {
					callback : function(data) {
						if (data == "1")
							alert("��������ɹ�!");
						else
							alert("��������ʧ��!");
						// ������Ϣ��
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

// <bean:message key="button.modify" bundle="${language}"/>��ť
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
		// ��ʾ������
		// update_scrollbar("����<bean:message key="button.modify" bundle="${language}"/>�����Ժ�...");

		var array_Elem = inArray.split("|");

		var dataArray = array_Elem[0].split("</C>");

		userBean.updateTSUser(dataArray[0], dataArray[1], dataArray[2], {
					callback : function(data) {
						rowElements = data.split("</R>");

						colElements = rowElements[0].split("</C>");

						if (colElements[0] == 1) {

							alert("<bean:message key="button.modify" bundle="${language}"/>�ɹ���");

							var elem = array_Elem[1].split("</C>");

							tObject.setRowValue({

										row_num : lineNum,
										data : [elem[0], elem[1], elem[2]]
									});

						} else {

							alert("<bean:message key="button.modify" bundle="${language}"/>ʧ�ܡ�");
						}

						// ������Ϣ��
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

// <bean:message key="button.delete" bundle="${language}"/>��ť
function forDelete() {

	var thispath = $("#this_path_id").val();

	var lineNum = tObject.getSelectRowNum();

	var rowCode = tObject.getRowColValue(lineNum, 1);

	if (!confirm("���Ҫ<bean:message key="button.delete" bundle="${language}"/>ѡ�еļ�¼�𣿴˲������ָܻ���"))
		return false;

	userBean.deleteTSUser(rowCode, {
				callback : function(data) {

					if (data != 0) {

						alert("<bean:message key="button.delete" bundle="${language}"/>�ɹ���");

						tObject.delRowValue(lineNum);

					} else {
						alert("�Բ�����ѡ��ĵ�" + lineNum + "����¼<bean:message key="button.delete" bundle="${language}"/>ʧ�ܣ�");
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

// <bean:message key="button.detail" bundle="${language}"/>��ť
function forDetail() {

	var thispath = $("#this_path_id").val();

	var lineNum = tObject.getSelectRowNum();

	var rowCode = tObject.getRowColValue(lineNum, 1);

	var srcFile = thispath + "/modules/jcxx/user/jsp/userDetail.jsp";
	var winFeatures = "dialogHeight:360px;dialogWidth:600px;help:no;status:no";

	window.showModalDialog(srcFile, rowCode, winFeatures);
}

// ��ʾ�û��Ľ�ɫ��Ϣ
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

// ���ӽ�ɫ��Ϣ
function forInsRole() {

	var ii = roleArray.length;

	var dept_code = document.getElementById("i_dept_code");
	if (trim(dept_code.value) == "") {
		alert("��������ȷ�Ļ������!");
		return false;
	}
	var role_code = document.getElementById("i_role_code");
	if (trim(role_code.value) == "") {
		alert("��ѡ����ȷ�Ľ�ɫ��Ϣ!");
		return false;
	}

	for (var kk = 0; kk < ii; kk += 3) {
		if (roleArray[kk] == dept_code.value
				&& roleArray[kk + 1] == role_code.value) {
			alert("ѡ��Ľ�ɫ��Ϣ�ظ�!");
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

// <bean:message key="button.delete" bundle="${language}"/>��ɫ��Ϣ
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

// <bean:message key="button.delete" bundle="${language}"/>��ɫ��Ϣ
/*
 * function forDelRole(id) { if (isNaN(id) || id > roleArray.length) { return
 * false; } for (var i=0,n=0;i<roleArray.length;i+=3) { if (i!=id) {
 * roleArray[n++]=roleArray[i]; roleArray[n++]=roleArray[i+1];
 * roleArray[n++]=roleArray[i+2]; } } roleArray.length-=3; forShowRole(); }
 */
// ���밴ť
function forInsert() {
	var Ids = new Array();
	var Vals = new Array();
	var user_code = document.getElementById("i_user_code");
	if (trim(user_code.value) == "") {
		alert("��������ȷ���û�����!");
		return false;
	}
	Ids[0] = "user_code";
	Vals[0] = trim(user_code.value);
	var user_name = document.getElementById("user_name");
	if (trim(user_name.value) == "") {
		alert("��������ȷ���û�����!");
		return false;
	}
	Ids[1] = "user_name";
	Vals[1] = trim(user_name.value);

	if (roleArray.length == 0) {
		alert("��ѡ����ȷ�Ľ�ɫ��Ϣ!");
		return false;
	}

	if (!confirm("ȷ��Ҫ�����û���Ϣ��"))
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
							alert("�����û���Ϣ�ɹ�");

							forClear();
						} else {
							alert("�Բ��������û���Ϣʧ�ܣ�");
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

// �����������ݰ�ť
function forClear() {
	document.getElementById("i_user_code").value = "";
	document.getElementById("i_user_name").value = "";
	document.getElementById("i_dept_code").value = "";
	document.getElementById("i_role_code").value = "";
	roleArray = new Array();
	document.all('userRoles').innerHTML = "";

}

// �л����㿨Ƭ����
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

			// ����û���Ϣ
			document.all('path_name').innerHTML = "ҳ��·����ϵͳ����Ȩ��/��ɫ������ɫ����";

			document.getElementById("userRoles").style.display = "";
		} else if (obj2 == 0) {
			$("#hx_table_div").css("display", "");
			// <bean:message key="button.query" bundle="${language}"/>�û���Ϣ
			document.all('path_name').innerHTML = "ҳ��·����ϵͳ����Ȩ��/��ɫ������ɫ����";

			document.getElementById("userRoles").style.display = "none";
		}
	}
}

// �ж��û������Ƿ��Ѿ�����
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
								alert("�û���������!");
								user_code.value = "";
								return false;
							} else {
								
								var datas = data.split("</C>");
								
								document.getElementById("i_user_name").value = datas[0];//Ա������
								document.getElementById("i_dept_code").value = datas[1];//��������
							}
						}
						if (data == "") {
							alert("��Ա��Ϣ�޴���!");
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
