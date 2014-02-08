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

// 用于控制正在处理的显示开关
var processing = false;

// 插入按钮
function forInsert(thispath, per_card) {
	var Vals = new Array();

	Vals[0] = per_card;

	var oldpasswd = document.forms[1].oldpasswd;
	if (trim(oldpasswd.value) == "") {
		alert("请输入正确的旧密码!");

		oldpasswd.focus();

		return false;
	}
	Vals[1] = trim(oldpasswd.value);

	var newpasswd = document.forms[1].newpasswd;
	if (trim(newpasswd.value) == "") {
		alert("请输入正确的新密码!");

		newpasswd.focus();

		return false;
	}
	Vals[2] = trim(newpasswd.value);

	var renewpasswd = document.forms[1].renewpasswd;
	if (trim(renewpasswd.value) == "") {
		alert("请输入正确的确认密码!");

		renewpasswd.focus();

		return false;
	}

	if (newpasswd.value != renewpasswd.value) {
		alert("新密码和确认密码不一致，请重新输入！");

		newpasswd.value = "";
		renewpasswd.value = "";

		newpasswd.focus();

		return;
	}

	if (newpasswd.value == oldpasswd.value) {
		alert("新密码与旧密码不能相同，请重新输入新密码！");

		newpasswd.value = "";
		renewpasswd.value = "";

		newpasswd.focus();

		return;
	}

	if (!confirm("确定要<bean:message key="button.modify" bundle="${language}"/>密码吗？"))
		return false;

	mmxgBean.updatePassword(Vals.toString(), {
				callback : function(data) {
					if (data > 0) {

						alert("<bean:message key="button.modify" bundle="${language}"/>密码成功！");
						 window.close(); 
					} else if (data == 0) {

						alert("系统正忙请稍候<bean:message key="button.modify" bundle="${language}"/>密码。");
					} else {

						alert("请确认旧密码是否正确。");
					}

					forClear();
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
	window.close();

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
			// 添加代码信息
			document.all('path_name').innerHTML = "页面路径：系统管理＞密码管理＞<bean:message key="button.modify" bundle="${language}"/>密码";
		} else if (obj2 == 0) {
			// <bean:message key="button.query" bundle="${language}"/>代码信息
			document.all('path_name').innerHTML = "页面路径：系统管理＞密码管理＞<bean:message key="button.modify" bundle="${language}"/>密码";
		}
	}
}
