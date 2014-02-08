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
 * ����<bean:message key="button.query" bundle="${language}"/>�������ʾ���ƣ�ÿ����Ŀ���ĸ��ֶΣ� 1. <bean:message key="button.query" bundle="${language}"/>����е���ʾ���أ�0-����ʾ 1-��ʾ 2. <bean:message key="button.query" bundle="${language}"/>�������ʾ���б��� 3.
 * ��Ӧ�����ݿ��е��ֶ�����ȫ��Ϊ��д�� 4. ��ʾ���ͣ���һλ��I-��ֵ�ͣ�S-�ַ��������ڵ����ͣ�
 * �ڶ�λ��û��-���������ͣ�I-����ֵ��T-���Է���ɵ�����
 ******************************************************************************/

function getPage(num) {

	tObject.cancelSelectedRow("all");

	var thispath = $("#this_path_id").val();

	codeBean.queryTSCode(tObject.getPerPage(), num, tObject.tmpTJ, {
				callback : function(data) {
					if (data != "" && data != "no") {
						/*
						 * ���ݸ�ʽ�� value</C>value</C></R>value</C>value</C></R>|totalPage</C>totalRow</C>curPage</C>
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

					// ������Ϣ��
					// update_scrollbar("��"+(rowElements.length-1)+"��");
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

// ���ڿ������ڴ������ʾ����
var processing = false;

/*******************************************************************************
 * ҳ���в��˵�
 ******************************************************************************/

// ��ʼ<bean:message key="button.query" bundle="${language}"/>��ť
function forQuery(query_button) {
	var thispath = $("#this_path_id").val();

	var op = null;
	condi = " and ";
	var comma = false;
	var tmpString = "";
	var sqlString = " where 1=1 and status=1 ";

	op = document.forms[0].type_op;
	var inval = document.forms[0].type;
	if (inval.value != "") {
		tmpString = "type like '%" + inval.value + "%'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "and (" + tmpString;
		}
	}
	op = document.forms[0].code_op;
	var inval = document.forms[0].code;
	if (inval.value != "") {
		tmpString = "code " + op.value + " '" + inval.value + "'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "and (" + tmpString;
		}
	}
	op = 'like';
	var inval = document.forms[0].value;
	if (inval.value != "") {
		tmpString = "value " + op + " '%" + inval.value + "%'";
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

	codeBean.queryTSCode(tObject.getPerPage(), 1, sqlString, {
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
 * ҳ��ײ��˵�
 ******************************************************************************/

function updateArgs() {
	var rowID = 0;
}

// <bean:message key="button.modify" bundle="${language}"/>��ť
function forUpdate() {
	var thispath = $("#this_path_id").val();

	var srcFile = "modules/code/jsp/codeUpdate.jsp";
	var winFeatures = "dialogHeight:200px;dialogWidth:600px;help:no;status:no";

	var lineNum = tObject.getSelectRowNum();

	args = new updateArgs();

	args.rowID = tObject.getRowColValue(lineNum, 1);

	var inArray = window.showModalDialog(srcFile, args, winFeatures);
	if (inArray != null) {
		var array_Elem = inArray.split("|");

		// ��ʾ������
		// update_scrollbar("����<bean:message key="button.modify" bundle="${language}"/>�����Ժ�...");

		codeBean.updateTSCode(args.rowID, array_Elem[0], {
					callback : function(data) {
						if (data > 0) {

							alert("<bean:message key="msg.modify.success" bundle="${language}"/>");

							var elem = array_Elem[1].split("</C>");

							tObject.setRowValue({

										row_num : lineNum,
										data : [elem[0], elem[1], elem[2],
												elem[3]]
									});
						} else {

							alert("<bean:message key="msg.modify.failed" bundle="${language}"/>");
						}

						// ������Ϣ��
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

// <bean:message key="button.delete" bundle="${language}"/>��ť
function forDelete() {

	var thispath = $("#this_path_id").val();

	var lineNum = tObject.getSelectRowNum();

	var rowId = tObject.getRowColValue(lineNum, 1);

	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/><bean:message key="msg.delete" bundle="${language}"/>?"))
		return false;

	// ��ʾ������
	// update_scrollbar("����<bean:message key="button.delete" bundle="${language}"/>�����Ժ�...");

	codeBean.deleteTSCode(parseInt(rowId), {
				callback : function(data) {

					if (data == 1) {
						alert("<bean:message key="button.delete" bundle="${language}"/><bean:message key="msg.success" bundle="${language}"/>");

						tObject.delRowValue(lineNum);
					} else {
						alert("<bean:message key="button.delete" bundle="${language}"/><bean:message key="msg.failed" bundle="${language}"/>");
					}

					// ������Ϣ��
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

// <bean:message key="button.detail" bundle="${language}"/>��ť
function forDetail() {

	var lineNum = tObject.getSelectRowNum();

	var rowID = tObject.getRowColValue(lineNum, 1);

	var srcFile = "modules/code/jsp/codeDetail.jsp";
	var winFeatures = "dialogHeight:200px;dialogWidth:600px;help:no;status:no";

	window.showModalDialog(srcFile, rowID, winFeatures);
}

// ���밴ť
function forInsert(thispath) {
	if(!$("#codeform").validateForm()){
		return;
   }
	var Ids = new Array();
	var Vals = new Array();

	var type = $.trim($("#i_type").val());

	if (type == "") {
		alert("��������ȷ�Ĵ�������!", 1);
		return false;
	}

	Ids[0] = "type";
	Vals[0] = "'" + type + "'";

	var code = document.getElementById("i_code");
	if (trim(code.value) == "") {
		alert("��������ȷ�Ĵ���ֵ!");
		return false;
	}
	Ids[1] = "code";
	Vals[1] = "'" + trim(code.value) + "'";

	var value = document.getElementById("i_value");
	if (trim(value.value) == "") {
		alert("��������ȷ�Ĵ����ı�!");
		return false;
	}
	Ids[2] = "value";
	Vals[2] = "'" + trim(value.value) + "'";

	var content = document.getElementById("i_content");

	Ids[3] = "content";
	Vals[3] = "'" + trim(content.value) + "'";

	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/><bean:message key="button.insert" bundle="${language}"/>?"))
		return false;

	codeBean.addTSCode(Ids.toString(), Vals.toString(), {
				callback : function(data) {
					if (data > 0) {
						alert("<bean:message key="button.insert" bundle="${language}"/><bean:message key="msg.modify.success" bundle="${language}"/>");

						forClear();
					} else {
						alert("<bean:message key="button.insert" bundle="${language}"/><bean:message key="msg.modify.failed" bundle="${language}"/>");
					}

					/*
					 * rowElements=data.split("</R>");
					 * 
					 * for (var i=0; i<rowElements.length-1; ++i) {
					 * colElements=rowElements[i].split("</C>");
					 * 
					 * if (colElements[0] == "1") { alert("���Ӵ�����Ϣ�ɹ�");
					 * 
					 * forClear(); } else { alert("�Բ������Ӵ�����Ϣʧ�ܣ�"); } }
					 */
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

// �����������ݰ�ť
function forClear() {
	document.getElementById("i_type").value = "";
	document.getElementById("i_code").value = "";
	document.getElementById("i_value").value = "";
	document.getElementById("i_content").value = "";

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
			// ��Ӵ�����Ϣ
			document.all('path_name').innerHTML = "ҳ��·����ϵͳ����ϵͳ��Ϣ������׼���ݹ���";
		} else if (obj2 == 0) {
			$("#hx_table_div").css("display", "");
			// <bean:message key="button.query" bundle="${language}"/>������Ϣ
			document.all('path_name').innerHTML = "ҳ��·����ϵͳ����ϵͳ��Ϣ������׼���ݹ���";
		}
	}
}