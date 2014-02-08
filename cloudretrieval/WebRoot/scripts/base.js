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
array[40] = "Ao";
array[41] = "AP";
array[42] = "AQ";
array[43] = "AR";
array[44] = "AS";
array[45] = "AT";
array[46] = "AU";
array[47] = "AV";
array[48] = "AW";
array[49] = "AX";
array[50] = "AY";
array[51] = "AZ";
array[52] = "BA";
array[53] = "BB";
array[54] = "BC";
array[55] = "BD";
array[56] = "BE";
array[57] = "BF";
array[58] = "BG";
array[59] = "BH";
array[60] = "BI";

// 是否发送请求
var isSend = false;
// 是否存在数据
var isHave = false;

// 是否合法的日期？month 基于0
function __isLegalDateN(text) {

	var strP = /^\d+(\.\d+)?$/;

	var date = text.value;
	if (date == "")
		return false;

	if (date.length != 8) {
		alert("请输入8位日期，格式为YYYYMMDD");
		text.value = "";
		text.focus();
		return false;
	}

	if (!strP.test(date)) {
		alert("请输入数字");
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
		sError = "年份错误";
		alert(sError);
		text.value = "";
		text.focus();
		return false;
	}
	// if(month < 0 || month > 12)
	if (month <= 0 || month > 12) {
		sError = "月份不能小于1，也不能大于12";
		alert(sError);
		text.value = "";
		text.focus();
		return false;
	}
	if (day < 1) {
		sError = "日期不能小于1";
		alert(sError);
		text.value = "";
		text.focus();
		return false;
	}
	if (day > 31) {
		sError = "日期不能大于31";
		alert(sError);
		text.value = "";
		text.focus();
		return false;
	}
	if (month == 2) {
		if (__isLeapYear(year)) {
			if (day > 29) {
				sError = "闰年，2月份日期不能大于29";
				alert(sError);
				text.value = "";
				text.focus();
				return false;
			}
		} else {
			if (day > 28) {
				sError = "非闰年，2月份日期不能大于28";
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
			sError = "该月日期不能大于" + d1 + "天";
			alert(sError);
			text.value = "";
			text.focus();
			return false;
		}
	}
	return true;
}

function forCheckDept(jgbm) {
	var iii = 0;
	if (jgbm.value != "" && jgbm.value != null) {
		var dept_code = jgbm.value;
		// var prompt=jgbm.value;
		dwr.engine.setAsync(false);
		baseBean.checkDept(dept_code, {
					callback : function(data) {
						if (data != true) {
							alert("该机构" + dept_code + "不存在或者您没有权限,请核对后输入!");
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

	// timer_num=0;

	// setInfo(msg,false);

	update_scrollbar("");
}

function isStart() {

	isStop = false;
}

// 0成功 1失败
function getRygw(inArray, i_rygw) {

	var flag = 0;

	dwr.engine.setAsync(false);
	wjczjcwtBean.getRygw(inArray, {
				callback : function(data) {

					if (data == "")
						flag = 1;

					rowElements = data.split("</R>");

					for (var i = 0; i < rowElements.length - 1; i++) {
						colElements = rowElements[i].split("</C>");

						var item = document.createElement("option");

						item.value = colElements[0];

						item.text = colElements[1];

						i_rygw.add(item);
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
	dwr.engine.setAsync(true);

	return flag;
}

// 帮助
function forShowHelps(qx) {
	// alert("页面权限："+qx);
	var srcFile = "jsp/showHelp.jsp";
	var winFeatures = "dialogHeight:400px;dialogWidth:600px;help:no;status:no";
	window.showModalDialog(srcFile, qx, winFeatures);
}

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
	/*
	 * if(prompt==""){
	 * 
	 * //hidden_scrollbar(); } else{
	 * 
	 *  }
	 */

	if (prompt.indexOf("共") >= 0 && prompt.indexOf("条") >= 0) {

		scrollbar.style.visibility = "visible";
		scrollbar.innerHTML = prompt;
	} else if (prompt == "") {

		hidden_scrollbar();
	} else {

		scrollbar.style.visibility = "visible";
		scrollbar.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"images/main/wait.gif\" border=0>";
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

/*
 * function show_integer_condition(colName, colReal) { document.write("<td class=TDTitle>"+colName+"：</td>");
 * document.write("<td class=TDTitle>"); document.write("<select size='1'
 * name='"+colReal+"' style='width:80px' value='=' onKeyDown='setTab()'>");
 * document.write("<option value='='>等于</option>"); document.write("<option
 * value='<>'>不等于</option>"); document.write("<option value='>'>大于</option>");
 * document.write("<option value='>='>大于等于</option>"); document.write("<option
 * value='<'>小于</option>"); document.write("<option value='<='>小于等于</option>");
 * document.write("</select>"); document.write("</td>"); }
 * 
 * function show_string_condition(colName, colReal,isDisabled,isDate) {
 * document.write("<td class=TDTitle>"+colName+"：</td>"); document.write("<td class=TDTitle>");
 * 
 * if(isDisabled){
 * 
 * document.write("<select size='1' name='"+colReal+"' style='width:80px'
 * value='=' onKeyDown='setTab()' disabled>"); } else{
 * 
 * document.write("<select size='1' name='"+colReal+"' style='width:80px'
 * value='=' onKeyDown='setTab()'>"); }
 * 
 * document.write("<option value='='>等于</option>"); document.write("<option
 * value='<>'>不等于</option>");
 * 
 * if(isDate){
 * 
 * document.write("<option value='>='>大于且等于</option>"); document.write("<option
 * value='<='>小于且等于</option>"); document.write("<option value='>'>大于</option>");
 * document.write("<option value='<'>小于</option>"); } else{
 * 
 * document.write("<option value='like'>匹配</option>"); document.write("<option
 * value='not like'>不匹配</option>"); }
 * 
 * 
 * document.write("</select>"); document.write("</td>"); }
 */

function show_integer_condition(colName, colReal) {
	document.write("<td width=\"18%\"><div align=\"right\">" + colName
			+ "：</div><input type='hidden' name='" + colReal
			+ "' value='='></td>");
	/*
	 * document.write("<td width=\"10%\" align=\"left\" valign=\"middle\">");
	 * document.write("<select size='1' name='"+colReal+"' style='width:80px'
	 * value='=' onKeyDown='setTab()'>"); document.write("<option value='='>等于</option>");
	 * document.write("<option value='<>'>不等于</option>"); document.write("<option
	 * value='>'>大于</option>"); document.write("<option value='>='>大于等于</option>");
	 * document.write("<option value='<'>小于</option>"); document.write("<option
	 * value='<='>小于等于</option>"); document.write("</select>");
	 * document.write("</td>");
	 */
}

function show_string_condition(colName, colReal, isDisabled, isDate, width) {alert(11);
	if (typeof(width) == "string") {

		document.write("<td width=\"" + width + "\"><div align=\"right\">"
				+ colName + "：</div><input type='text' name='" + colReal
				+ "' value='='></td>");
	} else {

		document.write("<td width=\"18%\"><div align=\"right\">" + colName
				+ "：</div><input type='text' name='" + colReal
				+ "' value='='></td>");
	}
	/*
	 * document.write("<td width=\"10%\" align=\"left\" valign=\"middle\">");
	 * 
	 * if(isDisabled){
	 * 
	 * document.write("<select size='1' name='"+colReal+"' style='width:80px'
	 * value='=' onKeyDown='setTab()' disabled>"); } else{
	 * 
	 * document.write("<select size='1' name='"+colReal+"' style='width:80px'
	 * value='=' onKeyDown='setTab()'>"); }
	 * 
	 * document.write("<option value='='>等于</option>"); document.write("<option
	 * value='<>'>不等于</option>");
	 * 
	 * if(isDate){
	 * 
	 * document.write("<option value='>='>大于且等于</option>"); document.write("<option
	 * value='<='>小于且等于</option>"); document.write("<option value='>'>大于</option>");
	 * document.write("<option value='<'>小于</option>"); }
	 * 
	 * document.write("<option value='like'>匹配</option>"); document.write("<option
	 * value='not like'>不匹配</option>"); document.write("</select>");
	 * document.write("</td>");
	 */
}
/*
 * function refreshHeading() { var colstr, vrange="";
 * 
 * unlock_table();
 * 
 * for (var x = 0, i = 1; x < baseColumn.length; x += 4, i ++) { colstr =
 * OWC.ActiveSheet.Columns(i).Address(false,false); colstr =
 * colstr.split(":")[0];
 * 
 * 
 * OWC.ActiveWindow.ColumnHeadings(i).Caption = baseColumn[x+1];
 * OWC.ActiveSheet.Columns(i).Locked = true; if (baseColumn[x] == '0')
 * OWC.ActiveSheet.Columns(i).Hidden = true; else
 * OWC.ActiveSheet.Columns(i).Hidden = false; }
 * 
 * OWC.ActiveSheet.Columns.AutoFit(); OWC.ViewableRange="A:"+colstr;
 * 
 * OWC.ActiveSheet.Protection.AllowFormattingRows = true;
 * OWC.ActiveSheet.Protection.AllowFormattingColumns = true;
 * 
 * lock_table(); }
 */
function refreshHeading() {
	// var colstr, vrange="";

	unlock_table();

	for (var x = 0, i = 1; x < baseColumn.length; x += 4, i++) {
		// colstr = OWC.ActiveSheet.Columns(i).Address(false,false);
		// colstr = colstr.split(":")[0];

		// OWC.ActiveWindow.ColumnHeadings(i).Caption = baseColumn[x+1];
		// OWC.ActiveSheet.Columns(i).Locked = true;
		if (baseColumn[x] == '0')
			OWC.ActiveSheet.Columns(i).Hidden = true;
		else
			OWC.ActiveSheet.Columns(i).Hidden = false;
	}

	OWC.ActiveSheet.Columns.AutoFit();
	// OWC.ViewableRange="A:"+colstr;

	OWC.ActiveSheet.Protection.AllowFormattingRows = true;
	OWC.ActiveSheet.Protection.AllowFormattingColumns = true;

	lock_table();
}

function refreshHeading2(headerinfo) {
	// var colstr, vrange="";

	// unlock_table();

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
		OWC.ActiveSheet.Range("A1:" + array[baseColumn.length / 4 - 1] + "2").Font.Name = "楷体_GB2312";
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

/*
 * function writeData(thispath){
 * 
 * dwr.engine.setAsync(false);
 * 
 * baseBean.getMenu2("0",null,{
 * 
 * callback:function(data){
 * 
 * var data_arrays=data.split(";");
 * 
 * var length=data_arrays.length;
 * 
 * for(var i=0;i<length-1;i++){
 * 
 * var sub_data_array=data_arrays[i].split(",");
 * 
 * if(sub_data_array[3]!=""){
 * 
 * document.write("<td> | </td>"); document.write("<td><a
 * id=\"a_css"+(i+1)+"\"
 * href='javascript:top.menu.forSubmenu(\""+thispath+"\",\""+sub_data_array[0]+"\");'
 * onclick='controlCss(\""+(i+1)+"\",\""+(length-1)+"\")'>"+sub_data_array[1]+"</a></td>"); } } },
 * 
 * exceptionHandler:function(err_info){
 * 
 * if(err_info!=""){
 * 
 * window.alert(err_info);
 * 
 * window.open(thispath+"/logoffAction.do?"+new Date(),"_parent"); } else{
 * 
 * window.alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
 * 
 * window.open(thispath+"/logoffAction.do?"+new Date(),"_parent"); } } });
 * 
 * dwr.engine.setAsync(true); }
 */

function tipNoDataInfo(timer, query_button, info) {

	if (info != "") {

		alert(info);
	}

	unlock_table();

	OWC.ActiveSheet.UsedRange.Clear();

	OWC.ActiveWindow.FreezePanes = false;

	lock_table();

	// 隐藏信息条
	if (typeof(timer) == "number") {

		stop_scrollbar(timer, "共0条");
	} else {

		update_scrollbar("共0条");
	}

	document.getElementById(query_button).disabled = false;
}

function checkIdcard(idcard) {

	idcard = idcard.toUpperCase();

	var Errors = new Array("验证通过!", "身份证号码位数不对!", "身份证号码出生日期超出范围或含有非法字符!",
			"身份证号码校验错误!", "身份证地区非法!");
	var area = {
		11 : "北京",
		12 : "天津",
		13 : "河北",
		14 : "山西",
		15 : "内蒙古",
		21 : "辽宁",
		22 : "吉林",
		23 : "黑龙江",
		31 : "上海",
		32 : "江苏",
		33 : "浙江",
		34 : "安徽",
		35 : "福建",
		36 : "江西",
		37 : "山东",
		41 : "河南",
		42 : "湖北",
		43 : "湖南",
		44 : "广东",
		45 : "广西",
		46 : "海南",
		50 : "重庆",
		51 : "四川",
		52 : "贵州",
		53 : "云南",
		54 : "西藏",
		61 : "陕西",
		62 : "甘肃",
		63 : "青海",
		64 : "宁夏",
		65 : "新疆",
		71 : "台湾",
		81 : "香港",
		82 : "澳门",
		91 : "国外"
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
				ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;// 测试出生日期的合法性
			} else {
				ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;// 测试出生日期的合法性
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
				ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;// 闰年出生日期的合法性正则表达式
			} else {
				ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;// 平年出生日期的合法性正则表达式
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

function writeData(thispath) {

	dwr.engine.setAsync(false);

	baseBean.getMenu2("0", null, {

		callback : function(data) {

			var data_arrays = data.split(";");

			var length = data_arrays.length;

			for (var i = 0; i < length - 1; i++) {

				var sub_data_array = data_arrays[i].split(",");

				if (trim(sub_data_array[3]) == ""
						|| trim(sub_data_array[3]) == "null") {

					document.write("<td><a id=\"a_css" + (i + 1)
							+ "\" href='javascript:top.menu.forSubmenu(\""
							+ thispath + "\",\"" + sub_data_array[0]
							+ "\");' onclick='controlCss(\"" + (i + 1)
							+ "\",\"" + (length - 1) + "\")'>"
							+ sub_data_array[1] + "</a></td>");
					document
							.write("<td align=\"left\"><div align=\"center\"><img src=\""
									+ thispath
									+ "/images/top/bt.gif\" width=\"8\" height=\"37\"></div></td>");
				} else {

					document.write("<td><a id=\"a_css" + (i + 1)
							+ "\" href='javascript:top.menu.doJY(\"" + thispath
							+ sub_data_array[3] + "?qx=" + sub_data_array[0]
							+ "\");' onclick='controlCss(\"" + (i + 1)
							+ "\",\"" + (length - 1) + "\")'>"
							+ sub_data_array[1] + "</a></td>");
					document
							.write("<td align=\"left\"><div align=\"center\"><img src=\""
									+ thispath
									+ "/images/top/bt.gif\" width=\"8\" height=\"37\"></div></td>");
				}

			}
		},

		exceptionHandler : function(err_info) {

			if (err_info != "") {

				window.alert(err_info);

				window.open(thispath + "/logoffAction.do?" + new Date(),
						"_parent");
			} else {

				window.alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");

				window.open(thispath + "/logoffAction.do?" + new Date(),
						"_parent");
			}
		}
	});

	dwr.engine.setAsync(true);
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

// 是否为闰年
function __isLeapYear(year) {
	if ((year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0)))
		return true;
	else
		return false;
}

// 是否合法的日期？month 基于0
function __isLegalDate(year, month, day) {
	if (year < 1900 || year > 3000) {
		sError = "年份错误";
		return false;
	}
	// if(month < 0 || month > 12)
	if (month <= 0 || month > 12) {
		sError = "月份不能小于1，也不能大于12";
		return false;
	}
	if (day < 1) {
		sError = "日期不能小于1";
		return false;
	}
	if (day > 31) {
		sError = "日期不能大于31";
		return false;
	}
	if (month == 2) {
		if (__isLeapYear(year)) {
			if (day > 29) {
				sError = "闰年，2月份日期不能大于29";
				return false;
			}
		} else {
			if (day > 28) {
				sError = "非闰年，2月份日期不能大于28";
				return false;
			}
		}
	} else {
		var d1, m1 = month;
		if (m1 > 7)
			m1 = m1 + 1;
		d1 = 30 + m1 % 2;
		if (day > d1) {
			sError = "该月日期不能大于" + d1 + "天";
			return false;
		}
	}
	return true;
}
// 是否合法的月？

function __isLegalMonth(year, month) {
	if (year < 1900 || year > 3000) {
		sError = "年份错误";
		return false;
	}
	// if(month < 0 || month > 12) //原来条件如果是200400则判断不出错误
	if (month < 0 || month > 12 || month == "00" || month == "0") // 改正上面的错误
	{
		sError = "月份不能小于1，也不能大于12";
		return false;
	}
	return true;
}

// 是否合法的年？
function __isLegalYear(year) {
	if (year < 1900 || year > 3000) {
		sError = "年份错误";
		return false;
	}
	return true;
}
// 是否为合法时间
function __isLegalTime(hour, minute, second) {
	if (hour < 0 || hour > 23) {
		sError = "时钟错误";
		return false;
	}
	if (minute < 0 || minute > 59) {
		sError = "分钟错误";
		return false;
	}
	if (second < 0 || second > 59) {
		sError = "秒钟错误";
		return false;
	}
	return true;
}
// 判定是否为数字
function __isNum(s) {
	var re = /^[0-9]+$/;
	return re.test(s);
}
function checkNum(id) {
	if (document.getElementById(id).value != "") {

		if (!__isNum(document.getElementById(id).value)) {
			alert("请输入正确的数字！");
			document.getElementById(id).value = 0;
		}
	}

}
// 时候为浮点数
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
	var re = /\"|\'|\“|\”|\‘|\’/;
	return re.test(s);
}

// 得到当前时间
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

// 判断字符串是否为空
function isNull(str) {
	if (str == null || Trim(str) == "")
		return true;
	return false;
}

// 判断字符串是否为整数
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

// 判断是否是浮点数
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

// 判断是否是正整数
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
function transTime(time) {

	var temp = time.substring(0, 4) + time.substring(5, 7)
			+ time.substring(8, 10);

	return temp;
}

/*
 * function DX(n) { var strOutput = "";
 * 
 * var tmp="";
 * 
 * 
 * if(n.indexOf("-")>=0){
 * 
 * n=n.substring(1,n.length);
 * 
 * tmp="负"; }
 * 
 * 
 * var strUnit = '千百拾亿千百拾万千百拾元角分'; n += "00"; var intPos = n.indexOf('.'); if
 * (intPos >= 0) n = n.substring(0, intPos) + n.substr(intPos + 1, 2); strUnit =
 * strUnit.substr(strUnit.length - n.length); for (var i=0; i < n.length; i++)
 * strOutput += '零壹贰叁肆伍陆柒捌玖'.substr(n.substr(i,1),1) + strUnit.substr(i,1);
 * return tmp+strOutput; }
 */
function DX(money, type) {

	var tmp = "";

	if (type == "ce") {

		if (money.indexOf("-") >= 0) {

			money = money.substring(1, money.length);

			tmp = "短款 ";
		} else {

			tmp = "长款 ";
		}
	} else {

		if (money.indexOf("-") >= 0) {

			money = money.substring(1, money.length);
			tmp = "负";
		}
	}

	var money = new String(Math.round(money * 100)); // 数字金额
	var chineseValue = ""; // 转换后的汉字金额
	var String1 = "零壹贰叁肆伍陆柒捌玖"; // 汉字数字
	var String2 = "万仟佰拾亿仟佰拾万仟佰拾元角分"; // 对应单位
	var len = money.length; // numberValue 的字符串长度
	var Ch1; // 数字的汉语读法
	var Ch2; // 数字位的汉字读法
	var nZero = 0; // 用来计算连续的零值的个数
	var String3; // 指定位置的数值
	if (len > 15) {
		alert("超出计算范围");
		return "";
	}
	if (money == 0) {

		// chineseValue = "零元整";

		if (type == "ce") {

			chineseValue = "相符";
		} else {

			chineseValue = "零元";
		}

		return chineseValue;

	}

	String2 = String2.substr(String2.length - len, len); // 取出对应位数的STRING2的值

	for (var i = 0; i < len; i++) {

		String3 = parseInt(money.substr(i, 1), 10); // 取出需转换的某一位的值
		// alert(String3);
		if (i != (len - 3) && i != (len - 7) && i != (len - 11)
				&& i != (len - 15)) {

			if (String3 == 0) {

				Ch1 = "";
				Ch2 = "";
				nZero = nZero + 1;

			} else if (String3 != 0 && nZero != 0) {

				Ch1 = "零" + String1.substr(String3, 1);
				Ch2 = String2.substr(i, 1);
				nZero = 0;

			} else {

				Ch1 = String1.substr(String3, 1);
				Ch2 = String2.substr(i, 1);
				nZero = 0;
			}
		} else { // 该位是万亿，亿，万，元位等关键位
			if (String3 != 0 && nZero != 0) {

				Ch1 = "零" + String1.substr(String3, 1);
				Ch2 = String2.substr(i, 1);
				nZero = 0;

			} else if (String3 != 0 && nZero == 0) {

				Ch1 = String1.substr(String3, 1);
				Ch2 = String2.substr(i, 1);
				nZero = 0;

			} else if (String3 == 0 && nZero >= 3) {

				Ch1 = "";
				Ch2 = "";
				nZero = nZero + 1;

			} else {

				Ch1 = "";
				Ch2 = String2.substr(i, 1);
				nZero = nZero + 1;

			}

			if (i == (len - 11) || i == (len - 3)) { // 如果该位是亿位或元位，则必须写上
				Ch2 = String2.substr(i, 1);
			}

		}
		chineseValue = chineseValue + Ch1 + Ch2;

	}

	/*
	 * if ( String3 == 0 ){ // 最后一位（分）为0时，加上“整” chineseValue = chineseValue +
	 * "整"; }
	 */

	return tmp + chineseValue;
}

/*
 * 武刚屏蔽 function viewGY(thispath,dept_code,select_gy){
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
 * //数据格式：id,per_name,per_code;
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
// 判断是否选择了第一行表头
function isHeader(id, row) { // 传参数行号

	if (typeof(row) == "number") {

		if (id == row) { // 表头信息

			return false;
		}

	}

	if (id == "1") { // 表头信息

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

function auto_view_data(thispath, report, row) {

	if (!isSend && isHave) {

		var rownumber = OWC.ActiveWindow.VisibleRange.row;

		if (rownumber != 1) {

			if (report == "n" || report == "y") {

				if (typeof(OWC.ActiveSheet.Cells(row, 1).value) != "undefined") {

					var id = OWC.ActiveSheet.Cells(rownumber, 1).value;

					if (typeof(id) == "undefined") {

						if (OWC.ActiveSheet.UsedRange.Rows.Count <= 20000) {// 限制20000条数据左右

							isSend = true;

							// alert(OWC.ActiveSheet.UsedRange.Rows.Count);

							forQuery(thispath, report,
									OWC.ActiveSheet.UsedRange.Rows.Count);
						}
					}
				}
			} else {

				if (typeof(OWC.ActiveSheet.Cells(2, 1).value) != "undefined") {

					var id = OWC.ActiveSheet.Cells(rownumber, 1).value;

					if (typeof(id) == "undefined") {

						if (OWC.ActiveSheet.UsedRange.Rows.Count <= 20000) {// 限制20000条数据左右

							isSend = true;

							// alert(OWC.ActiveSheet.UsedRange.Rows.Count);

							forQuery(thispath, report,
									OWC.ActiveSheet.UsedRange.Rows.Count);
						}
					}
				}
			}
		}
	}

}

function view_wait(div_id, thispath) {

	document.getElementById(div_id).innerHTML = "&nbsp;&nbsp;<img src=\""
			+ thispath + "/images/main/wait.gif\" border=0>&nbsp;正在<bean:message key="button.query" bundle="${language}"/>中...";

	document.getElementById(div_id).style.display = "";
}

function hide_wait(div_id) {

	document.getElementById(div_id).style.display = "none";
}

// 判断输入的机构号是否合法
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

						alert("输入的机构号不存在。");

						isR = false;

					} else if (data == "false") {

						alert("输入的机构号不是下属机构。");

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

function checkNK_Time(time, opt_type, input_id) {

	dwr.engine.setAsync(false);

	var validTime = false;

	baseBean.validNKTime(time, opt_type, {

				callback : function(data) {

					if (opt_type == 0) {// 检查时间是否大于等于系统时间cur_time

						if (data == "") {

							validTime = true;
						} else {

							if (data.indexOf("请") >= 0) {

								alert(data);
							} else {

								alert("选择时间必须大于或等于系统时间（" + data + "）。");
							}

							validTime = false;
						}
					} else if (opt_type == 1) {// 检查时间是否等于系统时间或系统时间+1（即：cur_time、cur_time+1）

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

						if (err_info.indexOf("错误信息") < 0) {

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



// 隐藏提示信息DIV
function hiddenMessage() {
	if ($("messDiv") != null) {
		$("messDiv").innerHTML = "";

		$("messDiv").style.position = "";
		$("messDiv").style.left = "";
		$("messDiv").style.top = "";
		$("messDiv").style.marginLeft = "";
		$("messDiv").style.marginTop = "";
		$("messDiv").style.width = "";
		$("messDiv").style.height = "";
		$("messDiv").style.background = "";
		$("messDiv").style.textAlign = "";
		$("messDiv").style.lineHeight = "";
		$("messDiv").style.zIndex = "";
		$("messDiv").id = "";
	}

	// document.body.disabled = false;
}

// 判断邮箱是否合法
function checkMail(str) {
	var strReg = "";
	var r;

	strReg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/i;
	r = str.search(strReg);
	if (r == -1)
		return false;
	else
		return true;
}

function isEmail(t) {
	var stra = /^\s*\w+\@\w+(\.\w+)+\s*$/i;
	if (stra.test(t))
		return true;
	else
		return false;
}
function forDeptTree(jgbm, id, per_card, per_name, type, jczbm) {
	/*
	 * 机构编码从登陆人员信息中获得
	 */

	var dept = jgbm;

	var srcFile = "deptree.jsp?jgbm=" + dept + "&args=" + type + "&jczbm="
			+ jczbm;

	var winFeatures = "dialogHeight:600px;dialogWidth:550px;help:no;status:no";

	// window.open(srcFile);
	inArray = window.showModalDialog(srcFile, type, winFeatures);

	var ryxx = inArray.split("<C>");

	if (typeof(inArray) == "undefined") {
		id.value = "";
		per_card.value = "";
		per_name.value = "";
	} else {
		id.value = ryxx[0];
		per_card.value = ryxx[1];
		per_name.value = ryxx[2];
	}

}

// 验证是否为数字
function isNumber(oNum) {
	if (!oNum)
		return false;
	var strP = /^\d+(\.\d+)?$/;
	if (!strP.test(oNum))
		return false;
	try {
		if (parseFloat(oNum) != oNum)
			return false;
	} catch (ex) {
		return false;
	}
	return true;
}
