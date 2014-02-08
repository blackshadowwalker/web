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


<% 
    String thisPath=request.getContextPath();
%>
var array = new Array();

array[0] = "A";
array[1] = "B";
array[2] = "C";
array[3] = "D";
array[4] = "E";
array[5] = "F";
array[6] = "G";
array[7] = "H";
array[8] = "I";
array[9] = "J";
array[10] = "K";
array[11] = "L";
array[12] = "M";
array[13] = "N";
array[14] = "O";
array[15] = "P";
array[16] = "Q";
array[17] = "R";
array[18] = "S";
array[19] = "T";
array[20] = "U";
array[21] = "V";
array[22] = "W";
array[23] = "X";
array[24] = "Y";
array[25] = "Z";
array[26] = "AA";
array[27] = "AB";
array[28] = "AC";
array[29] = "AD";
array[30] = "AE";
array[31] = "AF";
array[32] = "AG";
array[33] = "AH";
array[34] = "AI";
array[35] = "AJ";
array[36] = "AK";
array[37] = "AL";
array[38] = "AM";
array[39] = "AN";
array[40] = "A0";
array[41] = "AP";
array[42] = "AQ";
array[43] = "AR";

// �Ƿ�������
var isSend = false;
// �Ƿ��������
var isHave = false;

// �Ƿ�Ϸ������ڣ�month ����0
function __isLegalDateN(text) {

	var strP = /^\d+(\.\d+)?$/;

	var date = text.value;
	
	
	if (date == "")
		return false;

	if (date.length != 8) {
		alert("������8λ���ڣ���ʽΪYYYYMMDD");
		text.value = "";
		text.focus();
		return false;
	}

	if (!strP.test(date)) {
		alert("����������");
		text.value = "";
		text.focus();
		return false;
	}
	// alert(typeof(date));
	var year = date.substring(0, 4);
	var month = date.substring(4, 6);
	var day = date.substring(6, 8);
	// alert(year);alert(month);alert(day);
	if (year < 1900 || year > 3000) {
		sError = "��ݴ���";
		alert(sError);
		text.value = "";
		text.focus();
		return false;
	}
	// if(month < 0 || month > 12)
	if (month <= 0 || month > 12) {
		sError = "�·ݲ���С��1��Ҳ���ܴ���12";
		alert(sError);
		text.value = "";
		text.focus();
		return false;
	}
	if (day < 1) {
		sError = "���ڲ���С��1";
		alert(sError);
		text.value = "";
		text.focus();
		return false;
	}
	if (day > 31) {
		sError = "���ڲ��ܴ���31";
		alert(sError);
		text.value = "";
		text.focus();
		return false;
	}
	if (month == 2) {
		if (__isLeapYear(year)) {
			if (day > 29) {
				sError = "���꣬2�·����ڲ��ܴ���29";
				alert(sError);
				text.value = "";
				text.focus();
				return false;
			}
		} else {
			if (day > 28) {
				sError = "�����꣬2�·����ڲ��ܴ���28";
				alert(sError);
				text.value = "";
				text.focus();
				return false;
			}
		}
	} else {
		var d1, m1 = month;
		if (m1 > 7)
			m1 = m1 + 1;
		d1 = 30 + m1 % 2;
		if (day > d1) {
			sError = "�������ڲ��ܴ���" + d1 + "��";
			alert(sError);
			text.value = "";
			text.focus();
			return false;
		}
	}
	return true;
}

function forCheckDept(jgbm, rydept, isEmpty) {

	var iii = 0;
	if (jgbm.value != "" && jgbm.value != null) {
		var dept_code = jgbm.value;

		dwr.engine.setAsync(false);
		baseBean.checkDept(dept_code, rydept, {
					callback : function(data) {
						if (data != true) {
							alert("�û���" + dept_code + "�����ڻ�����û��Ȩ��,��˶Ժ�����!");
							iii = 1;
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
		if (iii == 1) {
			jgbm.focus();

			if (rydept != "" && rydept != "undefine" && rydept != null
					&& isEmpty != 1) {
				jgbm.value = rydept;
			} else {
				jgbm.value = "";
			}

		}
	} else {

		if (rydept != "" && rydept != "undefine" && rydept != null
				&& isEmpty != 1) {
			jgbm.value = rydept;
		} else {
			jgbm.value = "";
		}
	}

}

function forCheckDept2(jgbm, jc_dept_id) {
	var iii = 0;
	if (jgbm.value != "" && jgbm.value != null) {
		var dept_code = jgbm.value;

		var rydept = document.getElementById(jc_dept_id).value;

		if (rydept == "") {

			alert("��ѡ��������");

			jgbm.value = "";

			return;
		}

		dwr.engine.setAsync(false);
		baseBean.checkDept(dept_code, rydept, {
					callback : function(data) {
						if (data != true) {
							alert("�û���" + dept_code + "�����ڻ�����û��Ȩ��,��˶Ժ�����!");
							iii = 1;
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
		if (iii == 1) {
			jgbm.focus();

			jgbm.value = "";

		}
	} else {

		jgbm.value = "";

	}
}

function setTab() {
	if (event.keyCode == 13) {
		event.keyCode = 9;
	}
}

var timer_num = 0;

var timer_info = "";

var isStop = false;

function setInfo(msg, start) {

	timer_info = msg;

	isStop = !start;
}

function stop_scrollbar(timer, msg) {

	isStop = true;

	clearTimeout(timer);

	update_scrollbar("");
}

function stop_scrollbar_tj(timer, msg) {

	isStop = true;

	clearTimeout(timer);

	update_scrollbar_tj(msg);
}

function isStart() {

	isStop = false;
}

// ����
/*
 * (srcFile); var winFeatures =
 * "dialogHeight:400px;dialogWidth:600px;help:no;status:no";
 * window.showModalDialog(srcFile, qx, winFeatures); }
 */
function start_scrollbar() {

	update_scrollbar(timer_info);
	/*
	 * switch(timer_num){
	 * 
	 * case 0:{
	 * 
	 * update_scrollbar(timer_info);
	 * 
	 * break; } case 1:{
	 * 
	 * update_scrollbar(timer_info+".");
	 * 
	 * break; } case 2:{
	 * 
	 * update_scrollbar(timer_info+"..");
	 * 
	 * break; } case 3:{
	 * 
	 * update_scrollbar(timer_info+"...");
	 * 
	 * break; } }
	 * 
	 * 
	 * if(timer_num==3){
	 * 
	 * timer_num=0; } else{
	 * 
	 * timer_num++; }
	 * 
	 * if(!isStop){ setTimeout('start_scrollbar()',800); }
	 */
}

function trim(str) {
	return str.replace(/(^\s*)|(\s*$)/g, "");
}

function show_scrollbar() {
	scrollbar.style.visibility = "visible";
}

function update_scrollbar(prompt) {

	if (prompt.indexOf("��") >= 0 && prompt.indexOf("��") >= 0) {

		scrollbar.style.visibility = "visible";
		scrollbar.innerHTML = prompt;
	} else if (prompt == "") {

		hidden_scrollbar();
	} else {

		scrollbar.style.visibility = "visible";
		scrollbar.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"modules/base/image/wait.gif\" border=0>";
	}
}

function update_scrollbar_tj(prompt) {

	if (prompt.indexOf("%") >= 0) {

		scrollbar.style.visibility = "visible";
		scrollbar.innerHTML = prompt;
	} else if (prompt == "") {

		hidden_scrollbar();
	} else {

		scrollbar.style.visibility = "visible";
		scrollbar.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"modules/base/image/wait.gif\" border=0>";
	}
}

function hidden_scrollbar() {
	scrollbar.style.visibility = "hidden";
}

function unlock_table() {
	OWC.ScreenUpdating = false;
	OWC.ActiveWorkbook.Protect("", false);
	OWC.ActiveSheet.Protection.Enabled = false;
}

function lock_table() {
	OWC.ActiveSheet.Protection.Enabled = true;
	OWC.ActiveWorkbook.Protect("", true);
	OWC.ScreenUpdating = true;
}

function show_integer_condition(colName, colReal) {
	document.write("<td width=\"10%\"><div align=\"right\">" + colName
			+ "��</div><input type='hidden' name='" + colReal
			+ "' value='='></td>");
}

function show_string_condition(colName, colReal, isDisabled, isDate, width) {

	if (typeof(width) == "string") {

		document.write("<td width=\"" + width + "\"><div align=\"right\">"
				+ colName + "��</div><input type='hidden' name='" + colReal
				+ "' value='='></td>");
	} else {

		document.write("<td width=\"10%\"><div align=\"right\">" + colName
				+ "��</div><input type='hidden' name='" + colReal
				+ "' value='='></td>");
	}
	
}
function radio_string_condition(colName, colReal, colId) {
	document
			.write("<td class=\"TDLeft2\" width=\"18%\"><div><input type=\"radio\" name=\""
					+ colReal
					+ "\" value=\""
					+ colId
					+ "\"  onclick=\"isCheck()\">" + colName + "</div></td>");
}

function refreshHeading() {
	// var colstr, vrange="";

	unlock_table();

	for (var x = 0, i = 1; x < baseColumn.length; x += 4, i++) {
		if (baseColumn[x] == '0')
			OWC.ActiveSheet.Columns(i).Hidden = true;
		else
			OWC.ActiveSheet.Columns(i).Hidden = false;
	}

	OWC.ActiveSheet.Columns.AutoFit();

	OWC.ActiveSheet.Protection.AllowFormattingRows = true;
	OWC.ActiveSheet.Protection.AllowFormattingColumns = true;

	lock_table();
}

function refreshHeading2(headerinfo) {

	var col_num = 1;

	if (typeof(headerinfo) == "string" && headerinfo.length > 0) {

		col_num = 3;

		OWC.ActiveSheet.Range("A1:" + array[baseColumn.length / 4 - 1] + "2")
				.Merge();
		// alert("OK2");
		OWC.ActiveSheet.Range("A1:" + array[baseColumn.length / 4 - 1] + "2").value = headerinfo;
		// alert("OK3");
		OWC.ActiveSheet.Range("A1").MergeArea.HorizontalAlignment = OWC.Constants.xlHAlignCenter;
		// alert("OK4");
		OWC.ActiveSheet.Range("A1").MergeArea.VerticalAlignment = OWC.Constants.xlVAlignCenter;
		// OWC.ActiveSheet.Range("A2:G2").Font.Bold=true;
		// alert("OK5");
		OWC.ActiveSheet.Range("A1:" + array[baseColumn.length / 4 - 1] + "2").Font.Name = "����_GB2312";
		// alert("OK6");
		OWC.ActiveSheet.Range("A1:" + array[baseColumn.length / 4 - 1] + "2").Font.Size = 18;
		// alert("OK7");
	}

	OWC.Cells(col_num + 1, 1).Select();
	OWC.ActiveWindow.FreezePanes = true;

	for (var x = 0, i = 1; x < baseColumn.length; x += 4, i++) {
		// alert("ok1...");

		// OWC.ActiveSheet.Cells(col_num,i).NumberFormat = "@";
		// OWC.ActiveSheet.Cells(col_num,i).value =baseColumn[x+1];

		OWC.ActiveSheet.Range(array[i - 1] + col_num).value = baseColumn[x + 1];

		// alert("OWC.ActiveSheet.Range("+array[i-1]+"1).value =
		// baseColumn["+(x+1)+"]\ti=="+i);

		if (baseColumn[x] == '0') {

			OWC.ActiveSheet.Columns(i).Hidden = true;

			// alert("hidden=true");
		} else {

			OWC.ActiveSheet.Columns(i).Hidden = false;

			// alert("hidden=false");
		}

		// OWC.ActiveSheet.Cells(col_num+1,i).NumberFormat = "@";
		// OWC.ActiveSheet.Cells(col_num+1,i).value ="";
	}

	// alert("for...end");

	OWC.ActiveSheet.Columns.AutoFit();

	// OWC.ActiveSheet.Protection.AllowFormattingRows = true;
	// OWC.ActiveSheet.Protection.AllowFormattingColumns = true;

	// lock_table();

	// alert("OK...end");
}

function tipNoDataInfo(timer, query_button, info) {

	if (info != "") {

		alert(info);
	}

	// ������Ϣ��
	if (typeof(timer) == "number") {

		stop_scrollbar(timer, "��0��");
	} else {

		update_scrollbar("��0��");
	}

	if (query_button != "") {

		document.getElementById(query_button).disabled = false;
	}

}

function checkIdcard(idcard) {

	idcard = idcard.toUpperCase();

	var Errors = new Array("��֤ͨ��!", "���֤����λ������!", "���֤����������ڳ�����Χ���зǷ��ַ�!",
			"���֤����У�����!", "���֤�����Ƿ�!");
	var area = {
		11 : "����",
		12 : "���",
		13 : "�ӱ�",
		14 : "ɽ��",
		15 : "���ɹ�",
		21 : "����",
		22 : "����",
		23 : "������",
		31 : "�Ϻ�",
		32 : "����",
		33 : "�㽭",
		34 : "����",
		35 : "����",
		36 : "����",
		37 : "ɽ��",
		41 : "����",
		42 : "����",
		43 : "����",
		44 : "�㶫",
		45 : "����",
		46 : "����",
		50 : "����",
		51 : "�Ĵ�",
		52 : "����",
		53 : "����",
		54 : "����",
		61 : "����",
		62 : "����",
		63 : "�ຣ",
		64 : "����",
		65 : "�½�",
		71 : "̨��",
		81 : "���",
		82 : "����",
		91 : "����"
	}
	var idcard, Y, JYM;
	var S, M;
	var idcard_array = new Array();
	idcard_array = idcard.split("");
	if (area[parseInt(idcard.substr(0, 2))] == null)
		return Errors[4];
	switch (idcard.length) {
		case 15 :
			if ((parseInt(idcard.substr(6, 2)) + 1900) % 4 == 0
					|| ((parseInt(idcard.substr(6, 2)) + 1900) % 100 == 0 && (parseInt(idcard
							.substr(6, 2)) + 1900)
							% 4 == 0)) {
				ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;// ���Գ������ڵĺϷ���
			} else {
				ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;// ���Գ������ڵĺϷ���
			}
			if (ereg.test(idcard))
				return "ok";
			else
				return Errors[2];
			break;
		case 18 :
			if (parseInt(idcard.substr(6, 4)) % 4 == 0
					|| (parseInt(idcard.substr(6, 4)) % 100 == 0 && parseInt(idcard
							.substr(6, 4))
							% 4 == 0)) {
				ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;// ����������ڵĺϷ���������ʽ
			} else {
				ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;// ƽ��������ڵĺϷ���������ʽ
			}
			if (ereg.test(idcard)) {
				S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10]))
						* 7
						+ (parseInt(idcard_array[1]) + parseInt(idcard_array[11]))
						* 9
						+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12]))
						* 10
						+ (parseInt(idcard_array[3]) + parseInt(idcard_array[13]))
						* 5
						+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14]))
						* 8
						+ (parseInt(idcard_array[5]) + parseInt(idcard_array[15]))
						* 4
						+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16]))
						* 2 + parseInt(idcard_array[7]) * 1
						+ parseInt(idcard_array[8]) * 6
						+ parseInt(idcard_array[9]) * 3;
				Y = S % 11;
				M = "F";
				JYM = "10X98765432";
				M = JYM.substr(Y, 1);
				if (M == idcard_array[17])
					return "ok";
				else
					return Errors[3];
			} else
				return Errors[2];
			break;
		default :
			return Errors[1];
			break;
	}
}

function controlCss(selfcss, total) {

	for (var i = 1; i <= total; i++) {

		if (i == selfcss) {

			document.getElementById("a_css" + i).style.color = "#B30000";

		} else {

			document.getElementById("a_css" + i).style.color = "#808080";

		}
	}
}

function sort_desc(e1, e2) {
	return (e2 - e1);
}

// �Ƿ�Ϊ����
function __isLeapYear(year) {
	if ((year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0)))
		return true;
	else
		return false;
}

// �Ƿ�Ϸ������ڣ�month ����0
function __isLegalDate(year, month, day) {
	if (year < 1900 || year > 3000) {
		sError = "��ݴ���";

		alert(sError);

		return false;
	}
	if (month <= 0 || month > 12) {
		sError = "�·ݲ���С��1��Ҳ���ܴ���12";

		alert(sError);

		return false;
	}
	if (day < 1) {
		sError = "���ڲ���С��1";

		alert(sError);

		return false;
	}
	if (day > 31) {
		sError = "���ڲ��ܴ���31";

		alert(sError);

		return false;
	}
	if (month == 2) {
		if (__isLeapYear(year)) {
			if (day > 29) {
				sError = "���꣬2�·����ڲ��ܴ���29";

				alert(sError);

				return false;
			}
		} else {
			if (day > 28) {
				sError = "�����꣬2�·����ڲ��ܴ���28";

				alert(sError);

				return false;
			}
		}
	} else {
		var d1, m1 = month;
		if (m1 > 7)
			m1 = m1 + 1;
		d1 = 30 + m1 % 2;
		if (day > d1) {
			sError = "�������ڲ��ܴ���" + d1 + "��";

			alert(sError);

			return false;
		}
	}
	return true;
}

// �Ƿ�Ϸ������ڣ�month ����0
function __isyfrq(text) {

	var strP = /^\d+(\.\d+)?$/;

	var date = text.value;
	
	
	if (date == "")
		return false;

	if (date.length != 4) {
		alert("������4λ���ڣ���ʽΪMMDD");
		text.value = "";
		
		return false;
	}

	if (!strP.test(date)) {
		alert("����������");
		text.value = "";
		
		return false;
	}
	// alert(typeof(date));
	
	var month = date.substring(0, 2);
	var day = date.substring(2, 4);
	// alert(year);alert(month);alert(day);
	
	if (month <= 0 || month > 12) {
		sError = "�·ݲ���С��1��Ҳ���ܴ���12";
		alert(sError);
		text.value = "";
		
		return false;
	}
	if (day < 1) {
		sError = "���ڲ���С��1";
		alert(sError);
		text.value = "";
		
		return false;
	}
	if (day > 31) {
		sError = "���ڲ��ܴ���31";
		alert(sError);
		text.value = "";
		
		return false;
	}
	
		var d1, m1 = month;
		if (m1 > 7)
			m1 = m1 + 1;
		d1 = 30 + m1 % 2;
		if (day > d1) {
			sError = "�������ڲ��ܴ���" + d1 + "��";
			alert(sError);
			text.value = "";
			
			return false;
		}
	
	return true;
}

//�ж�ʱ����Ƿ�Ϸ�
function _issj(test)
{
	var hour = test.value;
	
	var strP = /^\d+(\.\d+)?$/;

	
	if (hour == "")
		return false;

	
	if (!strP.test(hour)) {
		alert("����������");
		test.value = "";
		test.focus();
		return false;
	}
	
	
	if (hour < 0 || hour > 23) {
		sError = "ʱ�Ӵ���";
		test.value="";
		alert(sError);
		return false;
	}
}

//�ж�ʱ����Ƿ�Ϸ�
function _isfz(test)
{
	var hour = test.value;
	
	var strP = /^\d+(\.\d+)?$/;

	
	if (hour == "")
		return false;

	
	if (!strP.test(hour)) {
		alert("����������");
		test.value = "";
		test.focus();
		return false;
	}
	
	
	if (hour < 0 || hour > 59) {
		sError = "���Ӵ���";
		test.value="";
		alert(sError);
		return false;
	}
}

function _ists(test)
{
	var hour = test.value;
	
	var strP = /^\d+(\.\d+)?$/;

	
	if (hour == "")
		return false;

	
	if (!strP.test(hour)) {
		alert("����������");
		test.value = "";
		test.focus();
		return false;
	}
	
	
	if (hour < 0 || hour > 30) {
		sError = "���ں����������";
		test.value="";
		alert(sError);
		return false;
	}
}
// �Ƿ�Ϸ����£�

function __isLegalMonth(year, month) {
	if (year < 1900 || year > 3000) {
		sError = "��ݴ���";
		return false;
	}
	// if(month < 0 || month > 12) //ԭ�����������200400���жϲ�������
	if (month < 0 || month > 12 || month == "00" || month == "0") // ��������Ĵ���
	{
		sError = "�·ݲ���С��1��Ҳ���ܴ���12";
		return false;
	}
	return true;
}

// �Ƿ�Ϸ����ꣿ
function __isLegalYear(year) {
	if (year < 1900 || year > 3000) {
		sError = "��ݴ���";
		return false;
	}
	return true;
}
// �Ƿ�Ϊ�Ϸ�ʱ��
function __isLegalTime(hour, minute, second) {
	if (hour < 0 || hour > 23) {
		sError = "ʱ�Ӵ���";
		return false;
	}
	if (minute < 0 || minute > 59) {
		sError = "���Ӵ���";
		return false;
	}
	if (second < 0 || second > 59) {
		sError = "���Ӵ���";
		return false;
	}
	return true;
}
// �ж��Ƿ�Ϊ����
function __isNum(s) {
	var re = /^[0-9]+$/;
	return re.test(s);
}
function checkNum(id) {
	if (document.getElementById(id).value != "") {

		if (!__isNum(document.getElementById(id).value)) {
			alert("��������ȷ�����֣�");
			document.getElementById(id).value = 0;
		}
	}

}
// ʱ��Ϊ������
function __isFloat(s) {
	if (__isNum(s))
		return true;
	var re = /^[+|-]{0,1}\d*\.\d+$/;
	return re.test(s);
}

function _isEFloat(s) {
	var re = /^[+|-]{0,1}\d*\.[\.\d+]{0,1}\e[-|+]{0,1}\d+$/;
	return re.test(s);
}

function __isQuoteIn(s) {
	var re = /\"|\'|\��|\��|\��|\��/;
	return re.test(s);
}

// �õ���ǰʱ��
function getCurrentDate() {
	var date = new Date();
	var year = "" + date.getFullYear();
	var month = date.getMonth() + 1;
	if (month < 10) {
		month = "0" + month;
	}
	var day = date.getDate();
	if (day < 10) {
		day = "0" + day;
	}
	return year + month + day;
}

function checkDate(strElem) { // YYYYMMDD

	var str = document.getElementById(strElem).value;

	if (str != "") {

		if (!__isNum(str) || str.length != 8) {

			alert("���ڸ�ʽ���ԣ�ӦΪYYYYMMDD��");

			document.getElementById(strElem).value = "";

			return;
		}

		var year = str.substring(0, 4);

		var month = str.substring(4, 6);

		var day = str.substring(6, 8);

		var flag = __isLegalDate(year, month, day);

		if (!flag) {

			document.getElementById(strElem).value = "";
		}
	}

}

function checkDate2(strElem) {// YYYYMM

	var str = document.getElementById(strElem).value;

	if (str != "") {

		if (!__isNum(str) || str.length != 6) {

			alert("���ڸ�ʽ���ԣ�ӦΪYYYYMM��");

			document.getElementById(strElem).value = "";

			return;
		}

		var year = str.substring(0, 4);

		var month = str.substring(4, 6);

		var flag = __isLegalDate(year, month, "01");

		if (!flag) {

			document.getElementById(strElem).value = "";
		}
	}

}

function checkMonth(strElem) {

	var str = document.getElementById(strElem).value;

	if (str != "") {

		if (!__isNum(str) || str.length != 6) {

			alert("���ڸ�ʽ���ԣ�ӦΪYYYYMM��");

			document.getElementById(strElem).value = "";

			return;
		}

		var year = str.substring(0, 4);

		var month = str.substring(4, 6);

		var flag = __isLegalMonth(year, month);

		if (!flag) {

			document.getElementById(strElem).value = "";
		}
	}

}

// �ж��ַ����Ƿ�Ϊ��
function isNull(str) {
	if (str == null || Trim(str) == "")
		return true;
	return false;
}

// �ж��ַ����Ƿ�Ϊ����
function isInt(str) {
	// alert("OK");

	if (str == "")
		return false;

	// var ch = str.substring(0,1);
	// if (ch == "0" && str != "0")
	// return false;

	var result = true;

	for (var i = 0; i < str.length; i++) {
		var s = str.substring(i, i + 1);

		if (!(parseInt(s, 10) >= 0 && parseInt(s, 10) <= 9)) {
			result = false;

			break;
		}
	}

	return result;
}

// �ж��Ƿ��Ǹ�����
function isFloat(strTest) {
	var reg;
	reg = /^\+?(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;
	var r = strTest.match(reg);
	if (strTest == '0') {
		return true;
	} else if (r == null) {
		// alert("no float data");
		return false;
	} else {
		// alert(strTest + " is a float data");
		return true;
	}
}

// �ж��Ƿ���������
function myIsInt(strTest) {
	var reg;
	// reg=/^\+?[0-9]*[0-9][0-9]*$/;
	reg = /^\+?[0-9]*[1-9][0-9]*$/;
	var r = strTest.match(reg);
	if (r == null) {
		// alert("no float data");
		return false;
	} else {
		// alert(strTest + " is a float data");
		return true;
	}
}

/*
 * ������� function viewGY(thispath,dept_code,select_gy){
 * 
 * var gyElem=document.getElementById(select_gy);
 * 
 * var length=gyElem.length-1;
 * 
 * 
 * for(var i=length;i>0;i--){
 * 
 * gyElem.remove(i); }
 * 
 * 
 * baseBean.getGY(trim(dept_code),"all","",{
 * 
 * callback:function(data){
 * 
 * //alert(data);
 * 
 * //���ݸ�ʽ��id,per_name,per_code;
 * 
 * if(data!="" || data.length>0){
 * 
 * var arrays=data.split(";");
 * 
 * var arrays_length=arrays.length-1;
 * 
 * for(var j=0;j<arrays_length;j++){
 * 
 * var sub_arrays=arrays[j].split(",");
 * 
 * gyElem.add(new Option(sub_arrays[1]+"("+sub_arrays[2]+")",sub_arrays[2])); } } } ,
 * exceptionHandler:function(err_info){
 * 
 * if (err_info!="") { alert(err_info);
 * window.open(thispath+"/logoffAction.do?"+new Date(),"_parent"); } else {
 * alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>"); window.open(thispath+"/logoffAction.do?"+new
 * Date(),"_parent"); } } }); }
 */
// �ж��Ƿ�ѡ���˵�һ�б�ͷ
function isHeader(id, row) { // �������к�

	if (typeof(row) == "number") {

		if (id == row) { // ��ͷ��Ϣ

			return false;
		}

	}

	if (id == "1") { // ��ͷ��Ϣ

		return false;
	} else {

		return true;
	}

}

function parseDept(dept_code) {

	var tmp = " in (select dept_code from t_s_deptmgr where dept_manager='"
			+ dept_code + "')";

	return tmp;
}

function view_cur_date(startElem1, stopElem1, startElem2, stopElem2) {

	if (typeof(startElem1) == "undefined" && typeof(startElem2) == "undefined"
			&& typeof(stopElem1) == "undefined"
			&& typeof(stopElem2) == "undefined") {

		var tempnktime = getXTTime("/mbank", "yyyyMMdd", 1);

		return tempnktime;
	} else {

		var date = new Date();

		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();

		if (month < 10) {

			month = "0" + month;
		}

		if (day < 10) {

			day = "0" + day;
		}

		if (typeof(startElem1) == "string" && startElem1 != ""
				&& startElem1.length > 1) {

			document.getElementById(startElem1).value = year + "" + month
					+ "01";
		}

		if (typeof(startElem2) == "string" && startElem2 != ""
				&& startElem2.length > 1) {

			document.getElementById(startElem2).value = year + "" + month
					+ "01";
		}

		if (typeof(stopElem1) == "string" && stopElem1 != ""
				&& stopElem1.length > 1) {

			document.getElementById(stopElem1).value = year + "" + month + ""
					+ day;
		}

		if (typeof(stopElem2) == "string" && stopElem2 != ""
				&& stopElem2.length > 1) {

			document.getElementById(stopElem2).value = year + "" + month + ""
					+ day;
		}

		return year + "" + month + "" + day;
	}
}

function getXTTime(thispath, format, type) {

	dwr.engine.setAsync(false);

	var xtTime = "";

	baseBean.xtTime(format, type, {

				callback : function(data) {

					xtTime = data;
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

	dwr.engine.setAsync(true);

	return xtTime;
}

/*
 * function auto_view_data(thispath,report,row){
 * 
 * if(!isSend && isHave){
 * 
 * var rownumber=OWC.ActiveWindow.VisibleRange.row;
 * 
 * if(rownumber!=1){
 * 
 * if(report=="n" || report=="y"){
 * 
 * if(typeof(OWC.ActiveSheet.Cells(row,1).value)!="undefined"){
 * 
 * var id=OWC.ActiveSheet.Cells(rownumber,1).value;
 * 
 * if(typeof(id)=="undefined"){
 * 
 * if(OWC.ActiveSheet.UsedRange.Rows.Count<=20000){//����20000����������
 * 
 * isSend=true;
 * 
 * //alert(OWC.ActiveSheet.UsedRange.Rows.Count);
 * 
 * forQuery(thispath,report,OWC.ActiveSheet.UsedRange.Rows.Count); } } } } else{
 * 
 * if(typeof(OWC.ActiveSheet.Cells(2,1).value)!="undefined"){
 * 
 * var id=OWC.ActiveSheet.Cells(rownumber,1).value;
 * 
 * if(typeof(id)=="undefined"){
 * 
 * if(OWC.ActiveSheet.UsedRange.Rows.Count<=20000){//����20000����������
 * 
 * isSend=true;
 * 
 * //alert(OWC.ActiveSheet.UsedRange.Rows.Count);
 * 
 * forQuery(thispath,report,OWC.ActiveSheet.UsedRange.Rows.Count); } } } } } }
 *  }
 */
function view_wait(div_id, thispath) {

	document.getElementById(div_id).innerHTML = "&nbsp;&nbsp;<img src=\""
			+ thispath + "/images/main/wait.gif\" border=0>&nbsp;����<bean:message key="button.query" bundle="${language}"/>��...";

	document.getElementById(div_id).style.display = "";
}

function hide_wait(div_id) {

	document.getElementById(div_id).style.display = "none";
}

// �ж�����Ļ�������Ƿ�Ϸ�
function sureDept(input_dept, dl_dept, thispath) {

	dwr.engine.setAsync(false);

	var dept_code = document.getElementById(input_dept).value;

	var dl = document.getElementById(dl_dept).value;

	var isR = false;

	if (dept_code == "") {

		isR == false;
	}

	if (dl == "") {

		isR == false;
	}

	// alert("dl===="+dl);

	baseBean.sureDept(trim(dept_code), trim(dl), {

				callback : function(data) {

					// alert("dl==="+dl);

					// alert("data==="+data);

					if (data == "error") {

						alert("����Ļ�����Ų����ڡ�");

						isR = false;

					} else if (data == "false") {

						alert("����Ļ�����Ų�������������");

						isR = false;

					} else {

						// alert("OK...");

						isR = true;
					}

					// alert("isR===="+isR);

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

	dwr.engine.setAsync(true);

	return isR;

}

function transTime(time) {

	var temp = time.substring(0, 4) + time.substring(5, 7)
			+ time.substring(8, 10);

	return temp;
}

function checkNK_Time(time, opt_type, input_id) {

	dwr.engine.setAsync(false);

	var validTime = false;

	baseBean.validNKTime(time, opt_type, {

				callback : function(data) {

					if (opt_type == 0) {// ���ʱ���Ƿ���ڵ���ϵͳʱ��cur_time

						if (data == "") {

							validTime = true;
						} else {

							if (data.indexOf("��") >= 0) {

								alert(data);
							} else {

								alert("ѡ��ʱ�������ڻ����ϵͳʱ�䣨" + data + "����");
							}

							validTime = false;
						}
					} else if (opt_type == 1) {// ���ʱ���Ƿ����ϵͳʱ���ϵͳʱ��+1������cur_time��cur_time+1��

						if (data == "0") {

							document.getElementById(input_id).value = "0";

							validTime = true;
						} else if (data == "1") {

							document.getElementById(input_id).value = "1";

							validTime = true;
						} else {

							document.getElementById(input_id).value = "";

							alert(data);

							validTime = false;
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

						validTime = false;
					} else {
						alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
						window.open(
								thispath + "/logoffAction.do?" + new Date(),
								"_parent");

						validTime = false;
					}
				}
			});

	dwr.engine.setAsync(true);

	return validTime;
}

function _jsDate(startTime, endTime, dateNum) {

	// alert("��ʼ��������...");

	var startElem = document.getElementById(startTime);
	var endElem = document.getElementById(endTime);

	if (startElem.value == "" || endElem.value == "") {

		// alert("��ѡ��ʼ���ڻ�������ڡ�");

		// document.getElementById("i_pzxql").value="";
		// document.getElementById("i_xjxql").value="";

		return;
	}

	if (dateNum != "") {

		document.getElementById(dateNum).value = "";
	}

	dwr.engine.setAsync(false);

	TimeBean.segDate(startElem.value, endElem.value, {

				callback : function(data) {

					// alert(data);

					if (data >= 0) {

						data += 1;
					}

					else {

						alert("�������ڲ���С�ڿ�ʼ���ڡ�");

						document.getElementById(endTime).value = "";

						return;
					}

					if (dateNum != "") {

						document.getElementById(dateNum).value = data;
					}
				}
			});

	dwr.engine.setAsync(true);

}

function userClearAllData(type, code, id) {

	dwr.engine.setAsync(false);

	var validClear = false;

	baseBean.clearAllData(type, code, id, {

				callback : function(data) {

					if (data == "") {

						validClear = true;
					} else {

						alert(data);

						validClear = false;
					}
				},
				exceptionHandler : function(err_info) {

					if (err_info != "") {
						alert(err_info);

						if (err_info.indexOf("������Ϣ") < 0) {

							window.open(thispath + "/logoffAction.do?"
											+ new Date(), "_parent");

						}

						validClear = false;
					} else {
						alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
						window.open(
								thispath + "/logoffAction.do?" + new Date(),
								"_parent");

						validClear = false;
					}
				}
			});

	dwr.engine.setAsync(true);

	return validClear;
}

function forAdd(obj) {

	var tmp = document.getElementById(obj).value;

	if (__isFloat(tmp)) {

		if (tmp != 100) {

			if (tmp.indexOf(".") > 0) {

				document.getElementById(obj).value = (parseFloat(tmp) + 0.1)
						.toFixed(2);
			} else {

				document.getElementById(obj).value = parseInt(tmp) + 1;
			}
		}
	} else {

		alert("���������֡�");
	}

}

function forPlu(obj) {

	var tmp = document.getElementById(obj).value;

	if (__isFloat(tmp)) {

		if (tmp != 0) {

			if (tmp.indexOf(".") > 0) {

				document.getElementById(obj).value = (parseFloat(tmp) - 0.1)
						.toFixed(2);
			} else {

				document.getElementById(obj).value = parseInt(tmp) - 1;
			}
		}
	} else {

		alert("���������֡�");
	}
}

/*
 * ͼ��
 * 
 * type:ͼ������
 * 
 * 1---������״ͼ
 * 
 * 2---��״ͼ
 * 
 * 
 * data:����������Ϣ
 * 
 * x_tag:x���ǩ
 * 
 * obj:��ʾ�Ķ�������
 * 
 * y_max:y�����ֵ
 * 
 * y_sm:y��˵��
 * 
 * x_legend:x��ײ�˵��
 */
function getFlash(type, thispath, data, x_tag, obj, y_max, y_sm, x_legend,
		links, y_min) {

	if (type == 1) { // ��������״ͼ

		var so = new SWFObject(thispath + "/modules/base/open-flash-chart.swf",
				"pie", "500", "250", "8", "#EEF5F2", "high");

		so.addVariable("variables", "true");

		so.addVariable("bg_colour", "#EEF5F2");

		so.addVariable("x_grid_colour", "#FFFFFF");// x��grid�׵���ɫ

		so.addVariable("y_grid_colour", "#FFFFFF");// y��grid�׵���ɫ

		so.addVariable("x_axis_colour", "#48DF7D");// x�������ɫ

		so.addVariable("y_axis_colour", "#48DF7D");// y�������ɫ

		so.addVariable("x_label_style", "12,#5B719D,2,1");// x�������������ʽ,12-size��#5B719D-��ɫָ

		so.addVariable("y_label_style", "12,#5B719D");// y�������������,12-size��#5B719D-��ɫָʽ

		// so.addVariable("title","��״ͼ,{font-size: 20;color:#5284C7}"); //����

		// so.addVariable("y_legend","����,12,0x736AFF"); //y���Ա�˵��

		so.addVariable("y_ticks", "5,10,6");

		so.addVariable("bar_3d", "50,0x9933CC," + y_sm + ",10");

		// so.addVariable("bar_3d_2","50,0x736AFF,"+y_sm+",10");

		so.addVariable("values", data);

		// so.addVariable("values_2",data);

		so.addVariable("x_labels", x_tag);

		so.addVariable("x_axis_steps", "1");// x�ᱳ�����߸�������

		so.addVariable("y_axis_steps", "0.5");// Y�ᱳ�����߸�������

		so.addVariable("tool_tip", "����:#x_label#<br>" + y_sm + ":#val#");// tooltip������ȥ��ʾ����

		so.addVariable("y_max", y_max);

		so.addParam("allowScriptAccess", "always");

		so.addParam("onmouseout", "onrollout2();");

		if (x_legend != "" && x_legend != null) {

			so.addVariable("x_legend", x_legend + ",12,0x736AFF");
		}

		so.addVariable("x_axis_3d", "3");

		so.write(obj);
	}

	else if (type == 2) { // ��״ͼ

		var so = new SWFObject(thispath + "/modules/base/open-flash-chart.swf",
				"pie", "300", "250", "8", "#EEF5F2", "high");

		so.addVariable("variables", "true");

		so.addVariable("bg_colour", "#EEF5F2");

		so.addVariable("title", "");

		so.addVariable("pie", "60,0x505050,{font-size:12px;}");

		so.addVariable("values", data);

		so.addVariable("pie_labels", x_tag);

		so.addVariable("colours", "0xff1211,0x112fff,0xcdf123,0xddf123");

		so.addVariable("allowScriptAccess", "always");

		so.addVariable("tool_tip", "#val#��<br>");

		so.write(obj);

	}

	else if (type == 3) { // ��������״ͼ

		var so = new SWFObject(thispath + "/modules/base/open-flash-chart.swf",
				"pie", "300", "250", "8", "#EEF5F2", "high");

		so.addVariable("variables", "true");

		so.addVariable("bg_colour", "#EEF5F2");

		so.addVariable("x_grid_colour", "#FFFFFF");// x��grid�׵���ɫ

		so.addVariable("y_grid_colour", "#FFFFFF");// y��grid�׵���ɫ

		so.addVariable("x_axis_colour", "#48DF7D");// x�������ɫ

		so.addVariable("y_axis_colour", "#48DF7D");// y�������ɫ

		so.addVariable("x_label_style", "12,#5B719D,,1");// x�������������ʽ,12-size��#5B719D-��ɫָ

		so.addVariable("y_label_style", "12,#5B719D");// y�������������,12-size��#5B719D-��ɫָʽ

		so.addVariable("title", "��״ͼ,{font-size: 20;color:#5284C7}"); // ����

		so.addVariable("y_legend", "����,12,0x736AFF");

		so.addVariable("y_ticks", "5,10,5");

		so.addVariable("bar_3d", "50,0x9933CC," + y_sm + ",10");

		so.addVariable("values", data);

		so.addVariable("x_labels", x_tag);

		so.addVariable("x_axis_steps", "1");// x�ᱳ�����߸�������

		so.addVariable("y_axis_steps", "0.5");// Y�ᱳ�����߸�������

		so.addVariable("tool_tip", "����:#x_label#<br>����:#val#");// tooltip������ȥ��ʾ����

		so.addVariable("y_max", y_max);

		so.addVariable("y_min", y_min);

		so.addParam("allowScriptAccess", "always");

		so.addParam("onmouseout", "onrollout2();");

		if (x_legend != "" && x_legend != null) {

			so.addVariable("x_legend", x_legend + ",12,0x736AFF");
		}

		so.addVariable("x_axis_3d", "3");

		so.write(obj);
	}

	else if (type == 4) { // ����ͼ

		var dd = data.split("</C>");

		var so = new SWFObject(thispath + "/modules/base/open-flash-chart.swf",
				"linechart", "600", "200", "8", "#FFFFFF");

		so.addVariable("variables", "true");

		so.addVariable("bg_colour", "#FFFFFF"); // #EEF5F2

		so.addVariable("x_grid_colour", "#F8F8D8");// x��grid�׵���ɫ
		so.addVariable("y_grid_colour", "#F8F8D8");// y��grid�׵���ɫ
		so.addVariable("x_axis_colour", "#784016");// x�������ɫ
		so.addVariable("y_axis_colour", "#784016");// y�������ɫ
		so.addVariable("x_label_style", "10,#5B719D,2,1");// x�������������ʽ,12-size��#5B719D-��ɫָ
		so.addVariable("y_label_style", "12,#5B719D");// y�������������,12-size��#5B719D-��ɫָʽ

		so.addVariable("y_ticks", "5,10,6");// 5������ߵĳ���,10������������ߵĳ���,8�����ּ���

		so.addVariable("line_dot", "2.5,#80a033," + y_sm.split("</C>")[0]
						+ ",10,5");

		so.addVariable("line_2", "2,#CC3399," + y_sm.split("</C>")[1] + ",10"); // �޵���

		so.addVariable("values", dd[0]);

		so.addVariable("links", links);

		so.addVariable("values_2", dd[1]); // ƽ����

		so.addVariable("x_labels", x_tag);

		so.addVariable("x_axis_steps", "1");// ������Ĵ�С

		so.addVariable("y_max", y_max);// ͼ�εĸ߶�

		if (y_min != "" && y_min != null) {

			so.addVariable("y_min", y_min);
		}

		so.addVariable("tool_tip", "#x_label# #key#<br>#val#");

		so.addParam("allowScriptAccess", "always");// "sameDomain");

		so.write(obj);

	} else if (type == 5) { // ����ͼ

		var so = new SWFObject(thispath + "/modules/base/open-flash-chart.swf",
				"linechart", "300", "180", "8", "#FFFFFF");

		so.addVariable("variables", "true");

		so.addVariable("bg_colour", "#FFFFFF"); // #EEF5F2

		so.addVariable("x_grid_colour", "#F8F8D8");// x��grid�׵���ɫ
		so.addVariable("y_grid_colour", "#F8F8D8");// y��grid�׵���ɫ
		so.addVariable("x_axis_colour", "#784016");// x�������ɫ
		so.addVariable("y_axis_colour", "#784016");// y�������ɫ
		so.addVariable("x_label_style", "12,#5B719D,2,1");// x�������������ʽ,12-size��#5B719D-��ɫָ
		so.addVariable("y_label_style", "12,#5B719D");// y�������������,12-size��#5B719D-��ɫָʽ

		so.addVariable("y_ticks", "5,10,5");// 5������ߵĳ���,10������������ߵĳ���,8�����ּ���

		so.addVariable("num_decimals", "8");

		so.addVariable("line_dot", "2.5,#CC3399," + y_sm + ",10,3");

		// data="0.2,0.4,0.1,0.9,0.6,1,0.7,0.3,0.6,0.3"

		so.addVariable("values", data);

		so.addVariable("links",
				"javascript:test(1),javascript:test(2),javascript:forBar(3)");

		so.addVariable("x_labels", x_tag);

		so.addVariable("x_axis_steps", "1");// ������Ĵ�С

		so.addVariable("y_max", y_max);// ͼ�εĸ߶�

		so.addVariable("tool_tip", "#x_label#<br>#val#");

		so.addParam("allowScriptAccess", "always");// "sameDomain");

		so.write(obj);

	} else if (type == 6) { // ����ͼ

		var so = new SWFObject(thispath + "/modules/base/open-flash-chart.swf",
				"linechart", "500", "180", "8", "#FFFFFF");

		so.addVariable("variables", "true");

		so.addVariable("bg_colour", "#FFFFFF"); // #EEF5F2

		so.addVariable("x_grid_colour", "#F8F8D8");// x��grid�׵���ɫ
		so.addVariable("y_grid_colour", "#F8F8D8");// y��grid�׵���ɫ
		so.addVariable("x_axis_colour", "#784016");// x�������ɫ
		so.addVariable("y_axis_colour", "#784016");// y�������ɫ
		so.addVariable("x_label_style", "12,#5B719D,2,1");// x�������������ʽ,12-size��#5B719D-��ɫָ
		so.addVariable("y_label_style", "12,#5B719D");// y�������������,12-size��#5B719D-��ɫָʽ

		so.addVariable("y_ticks", "5,10,5");// 5������ߵĳ���,10������������ߵĳ���,8�����ּ���

		so.addVariable("num_decimals", "4");

		so.addVariable("line_dot", "2.5,#CC3399," + y_sm + ",10,3");

		// data="0.2,0.4,0.1,0.9,0.6,1,0.7,0.3,0.6,0.3"

		so.addVariable("values", data);

		so.addVariable("links",
				"javascript:test(1),javascript:test(2),javascript:forBar(3)");

		so.addVariable("x_labels", x_tag);

		so.addVariable("x_axis_steps", "1");// ������Ĵ�С

		so.addVariable("y_max", y_max);// ͼ�εĸ߶�

		so.addVariable("tool_tip", "#x_label#<br>#val#");

		so.addParam("allowScriptAccess", "always");// "sameDomain");

		so.write(obj);

	}

}

// ð������ ��С��������
function doOrder(jyz) {

	var temp;

	if (jyz != "") {

		var jyz_order = jyz.split(",");

		var len = jyz_order.length;

		for (var i = 0; i < len; i++) {

			for (var j = i; j < len; j++) {

				if (parseInt(jyz_order[i], 10) > parseInt(jyz_order[j], 10)) {

					temp = jyz_order[j];
					jyz_order[j] = jyz_order[i];
					jyz_order[i] = temp;
				}
			}
		}

		return jyz_order.toString();
	}
}

function getLevel(level_id, dept, flag, thispath) {

	var levelElem = document.getElementById(level_id);

	for (var i = levelElem.length - 1; i > 0; i--) {

		levelElem.options.remove(i);

	}

	baseBean.queryDeptLevel(dept, flag, {
				callback : function(data) {
					if (data != "") {

						var rowElements = data.split("</R>");

						for (var i = 0; i < rowElements.length - 1; ++i) {
							var colElements = rowElements[i].split("</C>");

							levelElem.add(new Option(colElements[1],
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

function StringBuffer() {

	this._infos_ = new Array;

	if (typeof StringBuffer._initialized == "undefined") {

		StringBuffer.prototype.append = function(str) {

			this._infos_.push(str);

			return this;
		}

		StringBuffer.prototype.toString = function(separator) {

			separator = typeof(separator) == "undefined" ? "" : separator;

			return this._infos_.join(separator);
		}

		StringBuffer.prototype.size = function() {

			return this._infos_.length;
		}

		StringBuffer._initialized = true;
	}
}

// ����û�����Ȩ��ruler_word
function getQX(qx, tihspath, params) {
	var tmp = arguments[3];

	baseBean.getRW(qx, {
		callback : function(data) {
		
		
			if (data.length > 0
					&& (params instanceof Array || typeof(params) == "object")) {
				if (params instanceof Array) {

					for (var i = 0; i < params.length; i++) {

						// �������Ƿ����
						var elemObj = document.getElementById(params[i].elemId);

						if (typeof elemObj == "undefined" || elemObj == null) {

							// alert("ҳ����idΪ"+params[i].elemId+"Ԫ��δ���ڡ�");

							continue;
						}

						if (data.indexOf(params[i].optMark) < 0) {// ����

							switch (params[i].objSource) {

								case "page" : {// ҳ��Ԫ��

									// ��ô���ʽ
									if (params[i].type == "disabled") {

										elemObj.disabled = true;
									} else if (params[i].type == "hide") {

										elemObj.style.display = "none";
									}

									break;
								}
								case "tableObj" : {// ��������Ԫ��

									tObject.setToolbarBtnDisabled(
											params[i].elemId, true);

									break;
								}
							}
						} else {// ��ʾ

							switch (params[i].objSource) {

								case "page" : {// ҳ��Ԫ��

									// ��ô���ʽ
									if (params[i].type == "disabled") {

										elemObj.disabled = false;
									} else if (params[i].type == "hide") {

										elemObj.style.display = "";
									}

									break;
								}
								case "tableObj" : {// ��������Ԫ��

									tObject.setToolbarBtnDisabled(
											params[i].elemId, false);

									break;
								}
							}
						}
					}
				} else {

					// �������Ƿ����
					var elemObj = document.getElementById(params.elemId);

					if (typeof elemObj == "undefined") {

						alert("ҳ����idΪ" + params.elemId + "Ԫ��δ���ڡ�");

						return;
					}

					if (data.indexOf(params.optMark) < 0) {// ����

						switch (params.objSource) {

							case "page" : {// ҳ��Ԫ��

								// ��ô���ʽ
								if (params.type == "disabled") {

									elemObj.disabled = true;
								} else if (params.type == "hide") {

									elemObj.style.display = "none";
								}

								break;
							}
							case "tableObj" : {// ��������Ԫ��

								tObject.setToolbarBtnDisabled(params.elemId,
										true);

								break;
							}
						}
					} else {// ��ʾ

						switch (params.objSource) {

							case "page" : {// ҳ��Ԫ��

								// ��ô���ʽ
								if (params.type == "disabled") {

									elemObj.disabled = false;
								} else if (params.type == "hide") {

									elemObj.style.display = "";
								}

								break;
							}
							case "tableObj" : {// ��������Ԫ��

								tObject.setToolbarBtnDisabled(params.elemId,
										false);

								break;
							}
						}
					}
				}
			}
		},

		exceptionHandler : function(err_info) {
			if (err_info != "") {
				alert(err_info);
				window.open(tihspath + "/logoffAction.do?" + new Date(),
						"_parent");
			} else {
				alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
				window.open(tihspath + "/logoffAction.do?" + new Date(),
						"_parent");
			}
		}
	});
}

// ��ʾ��Ϣ����ʾ
function showMessage(txt, time) {

	var messDiv = document.createElement("DIV");
	messDiv.id = "messDiv";
	messDiv.style.position = "absolute";
	messDiv.style.right = "60%";
	messDiv.style.bottom = "70%";
	messDiv.style.marginRight = "-125px";
	messDiv.style.marginBottom = "-75px";
	messDiv.style.width = "250px";
	messDiv.style.height = "65px";
	messDiv.style.background = "#FFFFFF";
	messDiv.style.textAlign = "center";
	messDiv.style.lineHeight = "150px";
	messDiv.style.zIndex = "10002";

	var strHtml = "";

	strHtml += "<table style=\"width:100%;height:25px;background:#6666FF;border:1px solid #66CCFF;text-align:left;font-weight:bold;color: #FFFFFF;\">";
	strHtml += "<tr>";
	strHtml += "<td style=\"width:85%\">��ʾ��Ϣ</td>";
	strHtml += "<td style=\"width:15%;cursor:pointer;\" onclick=\"hiddenMessage()\">�ر�</td>";
	strHtml += "</tr>";
	strHtml += "</table>";

	strHtml += "<table style=\"width:100%;height:40px;border:1px solid #66CCFF;text-align:left;color: #000000;\">";
	strHtml += "<tr>";
	strHtml += "<td style=\"width:100%;height:40px;font-size:14px;\">" + txt
			+ "</td>";
	strHtml += "</tr>";
	strHtml += "</table>";

	messDiv.innerHTML = strHtml;

	document.body.appendChild(messDiv);

	messDiv.focus();
	document.body.onselectstart = function() {
		return false;
	};
	// document.body.disabled = true;

	if (time != 0)
		setTimeout(function() {
					hiddenMessage();
				}, time * 1000);
}
function check_stu_code(code, codes, table_name, code_dept)
{	
	if(codes.value=="")
	{
		return false;
	}
  
   baseBean.check_stu_code(code,codes.value,table_name, code_dept,
    {
        callback:function(data)
        {
        	
        	if (data==-1)
            {
                alert("��Ǹ����ѧ�Ų��ڱ����ţ�");
                codes.value=""
                codes.focus();
            }
            
        },
        exceptionHandler:function(err_info)
        { 
            if (err_info!="")
            {
                alert(err_info);
                window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
            }
            else
            {
                alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
                window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
            }    
        }
    });
}

function pd_only(code,codes,table_name)
{	
	if(codes.value=="")
	{
		return false;
	}
  
   baseBean.pd_only(code,codes.value,table_name,
    {
        callback:function(data)
        {
        	if (data==0)
            {
        		alert("<bean:message key="dept.error.thisDeptExists" bundle="${language}"/>");//alert("�ú����Ѿ����ڣ�");
                codes.value=""
            }
            
        },
        exceptionHandler:function(err_info)
        { 
            if (err_info!="")
            {
                alert(err_info);
                window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
            }
            else
            {
                alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
                window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
            }    
        }
    });
}

//strIssueDate��һ��������������ʼ����

//strMaturityDate��һ�������������������
function  getDaydiff(d1, d2){  
     var  arrDate,strDate,arrDate2,strDate2,diffDays
     arrDate= d1.split("-")  
     strDate=new  Date(arrDate[1]  +  '-'  +  arrDate[2]  +  '-'  +  arrDate[0])    //ת��Ϊ12-18-2002��ʽ  
     arrDate2=d2.split("-")  
     strDate2= new  Date(arrDate2[1]  +  '-'  +  arrDate2[2]  +  '-'  +  arrDate2[0])  
     diffDays = parseInt(Math.abs(strDate2-strDate)  /  1000  /  60  /  60  /24)    //�����ĺ�����ת��Ϊ����  
     return diffDays+1; 
}

