/*******************************************************************************
 * ���ڲ�ѯ�������ʾ���ƣ�ÿ����Ŀ���ĸ��ֶΣ� 1. ��ѯ����е���ʾ���أ�0-����ʾ 1-��ʾ 2. ��ѯ�������ʾ���б��� 3.
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

var p_num=1;
function getPage(num) {
	p_num=num;
	tObject.cancelSelectedRow("all");

	var thispath = $("#this_path_id").val();

	casetypeBean.queryCasetype(tObject.getPerPage(), num, tObject.tmpTJ, {
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


// ��ʼ��ѯ��ť
function forQuery(query_button) {

   var thispath = $("#this_path_id").val();

	var sqlString = " ";

    
	query_button.disabled=true;
    //��ʾ�ȴ���
    waitObj.show({
    	
    	left:"25%",
    	bottom:"50%",
    	width:"280px",
    	height:"50px",
    	text_align:"center",
    	msg:"<span style=\"font-weight:bold;\"><bean:message key="msg.inProgress" bundle="${language}"/>...</span>"
    });

	tObject.cancelSelectedRow("all");

	tObject.tmpTJ = sqlString;

	casetypeBean.queryCasetype(tObject.getPerPage(), 1, sqlString, {
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
 * ҳ��ײ��˵�
 ******************************************************************************/

function updateArgs() {
	var rowID = 0;
}

// �޸İ�ť
function forUpdate(query_button) {
  var thispath = $("#this_path_id").val();
	var srcFile = "modules/ajgl/ajxxgl/casetype/jsp/casetypeUpdate.jsp";
	var winFeatures = "dialogHeight:350px;dialogWidth:580px;help:no;status:no";

	var lineNum = tObject.getSelectRowNum();

	args = new updateArgs();

	args.rowID = tObject.getRowColValue(lineNum, 1);

	var inArray = window.showModalDialog(srcFile, args, winFeatures);
	if (inArray != null) {
		var array_Elem = inArray.split("|");

		// ��ʾ������
		// update_scrollbar("�����޸ģ����Ժ�...");
		casetypeBean.updateCasetype(args.rowID, array_Elem[0], {
					callback : function(data) {
					 
						if (data > 0) {
                     
							alert("<bean:message key="msg.modify.success" bundle="${language}"/>");

							var elem = array_Elem[1].split("</C>");

							tObject.setRowValue({
										row_num : lineNum,
										data : [  elem[0],elem[1]]
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
// ɾ����ť
function forDelete(query_button) {
    var thispath = $("#this_path_id").val();
	var lineNum = tObject.getSelectRowNum();
	var rowId = tObject.getRowColValue(lineNum, 1);
	
	
	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/><bean:message key="msg.delete" bundle="${language}"/>?"))
		return false;
    var array_Elem=0;
	// ��ʾ������
	// update_scrollbar("����ɾ�������Ժ�...");
	casetypeBean.deleteCasetype(parseInt(rowId), 0, 
	{
	
				callback : function(data) {
					if (data == 1)
			        {
			            alert("<bean:message key="button.delete" bundle="${language}"/><bean:message key="msg.success" bundle="${language}"/>");
			            tObject.delRowValue(lineNum);
			        }
			        else
			        {
			            alert("<bean:message key="button.delete" bundle="${language}"/><bean:message key="msg.failed" bundle="${language}"/>");
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


// ���밴ť
function forInsert(thispath) {

  if(!$("#case_form").validateForm()){
		return;
   }

	var Ids = new Array();
	var Vals = new Array();

	Ids[0] = "name";
	Vals[0] = "'" + $("#name").val() + "'";


	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/><bean:message key="button.insert" bundle="${language}"/>?"))
		return false;

	casetypeBean.insertCasetype(Ids.toString(), Vals.toString(), {
				callback : function(data) {
					if (data > 0) {
						alert("<bean:message key="button.insert" bundle="${language}"/><bean:message key="msg.modify.success" bundle="${language}"/>");

						forClear();
					} else {
						alert("<bean:message key="button.insert" bundle="${language}"/><bean:message key="msg.modify.failed" bundle="${language}"/>");
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
    $("#reset").click();
}
// �л����㿨Ƭ����
function switch_index(obj1, obj2) {
	var tmp;
//�����ǩΪһ�ֲ����״̬
	if (obj1.className != "activeindex") {
		for (var i = 0;; ++i) {
		
			// ���Ʋ�ѯ�Ͳ�����class
			tmp = document.getElementById('padindex' + i);
			if (tmp == null)
				break;

			if (i == obj2)
				tmp.className = 'activeindex';
			else
				tmp.className = 'hiddenindex';
			//���Ʋ�ѯ�Ͳ�������Ƿ���ʾ
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
			// ��ӵ���λ����Ϣ
			document.all('path_name').innerHTML = "ҳ��·������������������Ϣ������������������������";
		} else if (obj2 == 0) {
			$("#hx_table_div").css("display", "");
			// ��ѯ����λ����Ϣ
			document.all('path_name').innerHTML = "ҳ��·������������������Ϣ�������������������Ͳ�ѯ";
		}
	}
}