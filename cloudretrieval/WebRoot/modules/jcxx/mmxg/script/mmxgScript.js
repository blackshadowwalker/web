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

// ���ڿ������ڴ������ʾ����
var processing = false;

// ���밴ť
function forInsert(thispath, per_card) {
	var Vals = new Array();

	Vals[0] = per_card;

	var oldpasswd = document.forms[1].oldpasswd;
	if (trim(oldpasswd.value) == "") {
		alert("��������ȷ�ľ�����!");

		oldpasswd.focus();

		return false;
	}
	Vals[1] = trim(oldpasswd.value);

	var newpasswd = document.forms[1].newpasswd;
	if (trim(newpasswd.value) == "") {
		alert("��������ȷ��������!");

		newpasswd.focus();

		return false;
	}
	Vals[2] = trim(newpasswd.value);

	var renewpasswd = document.forms[1].renewpasswd;
	if (trim(renewpasswd.value) == "") {
		alert("��������ȷ��ȷ������!");

		renewpasswd.focus();

		return false;
	}

	if (newpasswd.value != renewpasswd.value) {
		alert("�������ȷ�����벻һ�£����������룡");

		newpasswd.value = "";
		renewpasswd.value = "";

		newpasswd.focus();

		return;
	}

	if (newpasswd.value == oldpasswd.value) {
		alert("������������벻����ͬ�����������������룡");

		newpasswd.value = "";
		renewpasswd.value = "";

		newpasswd.focus();

		return;
	}

	if (!confirm("ȷ��Ҫ<bean:message key="button.modify" bundle="${language}"/>������"))
		return false;

	mmxgBean.updatePassword(Vals.toString(), {
				callback : function(data) {
					if (data > 0) {

						alert("<bean:message key="button.modify" bundle="${language}"/>����ɹ���");
						 window.close(); 
					} else if (data == 0) {

						alert("ϵͳ��æ���Ժ�<bean:message key="button.modify" bundle="${language}"/>���롣");
					} else {

						alert("��ȷ�Ͼ������Ƿ���ȷ��");
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

// �����������ݰ�ť
function forClear() {
	window.close();

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
			// ��Ӵ�����Ϣ
			document.all('path_name').innerHTML = "ҳ��·����ϵͳ�����������<bean:message key="button.modify" bundle="${language}"/>����";
		} else if (obj2 == 0) {
			// <bean:message key="button.query" bundle="${language}"/>������Ϣ
			document.all('path_name').innerHTML = "ҳ��·����ϵͳ�����������<bean:message key="button.modify" bundle="${language}"/>����";
		}
	}
}
