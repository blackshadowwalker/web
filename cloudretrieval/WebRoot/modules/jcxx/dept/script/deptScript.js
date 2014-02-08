/*******************************************************************************
 * ���ڲ�ѯ�������ʾ���ƣ�ÿ����Ŀ���ĸ��ֶΣ� 1. ��ѯ����е���ʾ���أ�0-����ʾ 1-��ʾ 2.��ѯ�������ʾ���б��� 3.
 * ��Ӧ�����ݿ��е��ֶ�����ȫ��Ϊ��д�� 4. ��ʾ���ͣ���һλ��I-��ֵ�ͣ�S-�ַ��������ڵ����ͣ�
 * �ڶ�λ��û��-���������ͣ�I-����ֵ��T-���Է���ɵ�����
 ******************************************************************************/
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

	deptBean.queryTSDept(tObject.getPerPage(), num, tObject.tmpTJ, {
				callback : function(data) {

					if (data != "" && data != "no")
					{
						/*
						 * ���ݸ�ʽ�� value</C>value</C></R>value</C>value</C></R>|totalPage</C>totalRow</C>curPage</C>
						 */

						var array_ele = data.split("|");

						var allElements = array_ele[0].split("</S>");

						var dataElems = allElements[0].split("</R>");

						var dataArrs = new Array();

						for (var i = 0; i < dataElems.length - 1; i++)
						{

							var colElems = dataElems[i].split("</C>");

							var rowArr = new Array();

							for (var j = 0; j < colElems.length - 1; j++)
							{

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

						// rate = allElements[1];

						// tObject.setTipInfo("���������Ļ�������Ϊ"+(dataElems.length-1)+"����ռȫ�е�"+rate+"%");

					} else {

						// tipNoDataInfo("","query","<bean:message key="msg.error.dataEmputy" bundle="${language}"/>");

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

// ���ڿ������ڴ������ʾ����
var processing = false;

// ��ʼ<bean:message key="button.query" bundle="${language}"/>��ť
function forQuery(query_button) {
	var thispath = $("#this_path_id").val();
   
	var op = null;
	var condi = "and";
	var comma = false;
	var tmpString = "";
	var sqlString = " WHERE 1=1  ";

	var check_radio = document.forms[0].check_radio;

	if (check_radio[0].checked)
	{
		var inval = document.getElementById(check_radio[0].value);
		if (inval.value != "")
		{

			tmpString = "dept_code " + parseDept(inval.value);
			if (comma)
			{
				sqlString += condi + tmpString;
			} 
			else
			{
				comma = true;
				sqlString += "AND (" + tmpString;

			}

		}
		else 
		{
			alert("<bean:message key="msg.pleaseSelect" bundle="${language}"/> <bean:message key="dept.columns.deptCode" bundle="${language}"/>!");//alert("��ѡ�������ţ�");
			return false;
		}
	}

	else if (check_radio[1].checked) {
		var inval = document.getElementById(check_radio[1].value);
		if (inval.value != "") {
			tmpString = " dept_code "
					+ parseDept(document.getElementById("user_dept").value)
					+ " and dept_name like '%" + inval.value + "%'";
			if (comma) {
				sqlString += condi + tmpString;
			} else {
				comma = true;
				sqlString += "AND (" + tmpString;

			}
		} else {
			alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="dept.columns.deptName" bundle="${language}"/>!");//alert("������������ƣ�");
			return false;
		}
	} else {
		alert("<bean:message key="msg.pleaseSelect" bundle="${language}"/> " +
				"<bean:message key="button.query" bundle="${language}"/> " +
				"<bean:message key="dept.label.queryMode" bundle="${language}"/>!");
		return false;
	}

	if (comma)
		sqlString += ")";

	// sqlString += tmpString;

	// ��ʾ��Ϣ��
	// var timer=setTimeout('start_scrollbar()');

	query_button.disabled = true;

	tObject.tmpTJ = sqlString;

	deptBean.queryTSDept(tObject.getPerPage(), 1, sqlString, {
		callback : function(data) {

			if (data != "" && data != "no") {
				/*
				 * ���ݸ�ʽ�� value</C>value</C></R>value</C>value</C></R>|totalPage</C>totalRow</C>curPage</C>
				 */

				var array_ele = data.split("|");

				var allElements = array_ele[0].split("</S>");

				var dataElems = allElements[0].split("</R>");

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
							data : dataArrs,
							cols_align : [null, null, null, null, null, null,
									null, null, null, "right", "right", "right"]
						});

				rate = allElements[1].split("</C>")[0];

			//	tObject.setTipInfo("���������Ļ�������Ϊ"+ allElements[1].split("</C>")[1] + "����ռ�������ǵĵ�" + rate);

			} else {

				// tipNoDataInfo("","query","<bean:message key="msg.error.dataEmputy" bundle="${language}"/>");
				alert("<bean:message key="msg.error.dataEmputy" bundle="${language}"/>");

			}
			query_button.disabled = false;

		},
		exceptionHandler : function(err_info) {

			// stop_scrollbar(timer,"");

			query_button.disabled = false;

			if (err_info != "") {
				alert(err_info);
				window.open(thispath + "/logoffAction.do?" + new Date(),
						"_parent");
			} else {
				alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
				window.open(thispath + "/logoffAction.do?" + new Date(),
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
	var DeptLevelIDs = null;
	var DeptLevelNames = null;
	var DeptLxIDs = null;
	var DeptLxNames = null;
	var DeptAreaIDs = null;
	var DeptAreaNames = null;
	var BmLxIDs = null;
	var BmLxNames = null;
	var Gyqx_jglxIDs = null;
	var Gyqx_jglxNames = null;
}

// <bean:message key="button.modify" bundle="${language}"/>��ť
function forUpdate() {
	var thispath = $("#this_path_id").val();

	var lineNum = tObject.getSelectRowNum();
	var rowId = tObject.getRowColValue(lineNum, 1);

	var srcFile = thispath + "/modules/jcxx/dept/jsp/deptUpdate.jsp";
	var winFeatures = "dialogHeight:230px;dialogWidth:600px;help:no;status:no";

	args = new updateArgs();
	args.DeptLevelIDs = new Array();
	args.DeptLevelNames = new Array();
	args.DeptLxIDs = new Array();
	args.DeptLxNames = new Array();
	
	args.dept_manager = document.getElementById("user_dept").value;

	args.rowID = tObject.getRowColValue(lineNum, 1);




	var inArray = window.showModalDialog(srcFile, args, winFeatures);
	

	if (inArray != null) {
		var array_Elem = inArray.split("|");
		// ��ʾ������
		// show_scrollbar("����<bean:message key="button.modify" bundle="${language}"/>�����Ժ�...");
		deptBean.updateTSDept(rowId, array_Elem[0], array_Elem[2], {
					callback : function(data) {

						rowElements = data.split("</R>");

						colElements = rowElements[0].split("</C>");

						if (colElements[0] == 1) {

							 alert("<bean:message key="button.insert" bundle="${language}"/> <bean:message key="msg.success" bundle="${language}"/>!");

							var elem = array_Elem[1].split("</C>");

							tObject.setRowValue({

										row_num : lineNum,
										data : [elem[0], elem[1], elem[2],
												elem[3]]
									});

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

	var jgbm = tObject.getRowColValue(lineNum, 2);

	var dept = document.getElementById("dl_jg").value;

	if (jgbm == dept) {
		alert("<bean:message key="dept.error.connotDeleteThisDept" bundle="${language}"/>!");
		return;
	}

	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/> <bean:message key="dept.msg.deleteDept" bundle="${language}"/>? <bean:message key="person.msg.cannotBeRestored" bundle="${language}"/>."))
		return false;

	// ��ʾ������
	// show_scrollbar("����<bean:message key="button.delete" bundle="${language}"/>�����Ժ�...");

	deptBean.deleteTSDept(rowId, jgbm, {
				callback : function(data) {

					if (data == "have") {

						alert("<bean:message key="dept.error.thersIsPeople" bundle="${language}"/>");

					} else {

						rowElements = data.split("</R>");

						colElements = rowElements[0].split("</C>");

						if (parseInt(colElements[0]) == "1") {
							 alert("<bean:message key="dept.msg.deleteDept" bundle="${language}"/> <bean:message key="msg.success" bundle="${language}"/>!");
							tObject.setRowValue({

										row_num : lineNum,
										data : [, , ,
												"ע��"]
									});
									
						} else {
							alert("<bean:message key="dept.msg.deleteDept" bundle="${language}"/><bean:message key="msg.failed" bundle="${language}"/>!");
						}
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

	var srcFile = "modules/jcxx/dept/jsp/deptDetail.jsp";
	var winFeatures = "dialogHeight:200px;dialogWidth:500px;help:no;status:no";

	window.showModalDialog(srcFile, rowID, winFeatures);
}

// ���밴ť
function forInsert(thispath) {
	var Ids = new Array();
	var Vals = new Array();

	var dept_code = document.getElementById("i_dept_code");
	if (trim(dept_code.value) == "") {
		alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="dept.columns.deptCode" bundle="${language}"/>!");//alert("��������ȷ�Ļ������!");
		return false;
	}

	var dept_name = document.getElementById("i_dept_name");
	if (trim(dept_name.value) == "") {
		alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="dept.columns.deptName" bundle="${language}"/>!");//alert("��������ȷ�Ļ�������!");
		return false;
	}
	Ids[0] = "dept_name";
	Vals[0] = "'" + trim(dept_name.value) + "'";

	var dept_manager = document.getElementById("i_dept_manager");
	if (trim(dept_manager.value) == "") {
		alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="dept.columns.deptManager" bundle="${language}"/>!");//alert("��������ȷ���ϼ��������!");
		return false;
	}
	Ids[1] = "dept_manager";
	Vals[1] = "'" + trim(dept_manager.value) + "'";
	
	var fgld = document.getElementById("i_fgld");
	Ids[2] = "fgld";
	Vals[2] = "'"+trim(fgld.value)+"'";

	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/> <bean:message key="button.insert" bundle="${language}"/> <bean:message key="dept.name" bundle="${language}"/>!"))
        return false;

	deptBean.addTSDept(Ids.toString(), Vals.toString(), trim(dept_code.value).toString(), 10,10, 
	{
				callback : function(data) {
					if (data == "have") {
						alert("<bean:message key="dept.error.thisDeptExists" bundle="${language}"/>");
						return;
					}
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
	document.getElementById("i_dept_code").value = "";
	document.getElementById("i_dept_name").value = "";
	document.getElementById("i_dept_level").value = "";
	document.getElementById("i_dept_lx").value = "";
	document.getElementById("i_dept_manager").value = "";


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
			// ��ӻ�������
		} else if (obj2 == 0) {
			$("#hx_table_div").css("display", "");
		}
	}
}

function forNum() {

	var dept = document.getElementById("i_dept_code").value;

	if (dept == "") {
		return;
	}
	if (dept.length != 6) {

		alert("<bean:message key="dept.error.deptShouldBe6Bit" bundle="${language}"/>");//alert("�������Ϊ6λ��");

		document.getElementById("i_dept_code").value = "";

		return;
	} else {

		if (!(__isNum(dept))) {

			alert("<bean:message key="dept.error.thisDeptExists" bundle="${language}"/>");//alert("�������ӦΪ���֡�");

			document.getElementById("i_dept_code").value = "";

			return;

		}
	}

	dwr.engine.setAsync(false);
	baseBean.sureDept(dept, dept, {
				callback : function(data) {
					if (data != "false") {
						alert("<bean:message key="dept.error.thisDeptExists" bundle="${language}"/>");//alert("�û�������Ѵ��ڣ�");
						document.getElementById("i_dept_code").value = "";
						return;
					}
				},
				exceptionHandler : function(err_info) {
					if (err_info != "") {
						alert(err_info);
						if (err_info.indexOf("<bean:message key="msg.error.error" bundle="${language}"/>") < 0) {
							window.open("thisPath/logoffAction.do?"
											+ new Date(), "_parent");
						}
					} else {
						alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
						window.open("thisPath/logoffAction.do?"
										+ new Date(), "_parent");
					}
				}
			});
	dwr.engine.setAsync(true);

}

function changeLevel() {
	if (document.getElementById("i_dept_level").value == 4) {

		document.getElementById("tr_counters").style.display = "";
		document.getElementById("tr_low_counters").style.display = "";
	} else {

		document.getElementById("tr_counters").style.display = "none";
		document.getElementById("tr_low_counters").style.display = "none";
	}
}

function forTime(grade_id) {
	var value = document.getElementById(grade_id).value;

	if (value == "" || value == "4") {
		document.getElementById("i_confirm_time").value = "";

		document.getElementById("tr_confirm_time").style.display = "none";

	} else {
		document.getElementById("tr_confirm_time").style.display = "";

	}

}