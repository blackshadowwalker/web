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
//��ȡҳ����Ϣ
function getPage(num) {

	tObject.cancelSelectedRow("all");

	var thispath = $("#this_path_id").val();

	clglBean.queryTSClgl(tObject.getPerPage(), num, tObject.tmpTJ, {
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

						alert("û�з�����������");
					}

					// ������Ϣ��
					// update_scrollbar("��"+(rowElements.length-1)+"��");
				},
				exceptionHandler : function(err_info) {

					stop_scrollbar(timer, "");

					if (err_info != "") {
						alert(err_info);
						if (err_info.indexOf("���ִ���") < 0) {
							window.open(thispath + "/logoffAction.do?"
											+ new Date(), "_parent");
						}
					} else {
						alert("���ӳ�ʱ��ϵͳ�Զ��˳���");
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
 * ҳ��ײ��˵�
 ******************************************************************************/
//��ʼ<bean:message key="button.query" bundle="${language}"/>��ť
function forQuery(query_button) {

   var thispath = $("#this_path_id").val();
   var op = "like";
	condi = " and ";
	var comma = false;
	var tmpString = "";
	var sqlString = "";

	
	var inval = document.forms[0].LPNumber;
	
	if (inval.value != "") {
		tmpString = " LPNumber "+ op+ " '%" + inval.value +"%'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "and (" + tmpString;
		}
	}
	
	var inval = document.forms[0].locationId;
	
	if (inval.value != "") {
		tmpString = " l.locationId " + op + " '%" + inval.value + "%'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "and (" + tmpString;
		}
	}
	
	var inval1 = document.forms[0].time1;
	var inval2 = document.forms[0].time2;
	
	if (inval1.value != "" && inval2.value != "") {
		tmpString = " r.absTime between '"+inval1.value+"' and '"+inval2.value+"'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "and (" + tmpString;
		}
	}
	
	var inval = document.forms[0].xycd;
	
	if (inval.value != "") {
		tmpString = " xycd "+ op+ " '%" + inval.value +"%'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "and (" + tmpString;
		}
	}
	
	
	var inval = document.forms[0].comment;
	
	if (inval.value != "") {
		tmpString = " comment "+ op+ " '%" + inval.value +"%'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "and (" + tmpString;
		}
	}
	if (comma)
		sqlString += ")";
    
	query_button.disabled=true;
    //��ʾ�ȴ���
    waitObj.show({
    	
    	left:"25%",
    	bottom:"50%",
    	width:"280px",
    	height:"50px",
    	text_align:"center",
    	msg:"<span style=\"font-weight:bold;\"><bean:message key="msg.inProgress" bundle="${language}"/></span>"
    });

	tObject.cancelSelectedRow("all");

	tObject.tmpTJ = sqlString;

	clglBean.queryTSClgl(tObject.getPerPage(), 1, sqlString, {
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
						if(err_info.indexOf("<bean:message key="msg.error.error" bundle="${language}"/>")<0){
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
//modify��ť
function forUpdate(query_button) {
  var thispath = $("#this_path_id").val();
	var srcFile = "modules/ajgl/ajxxgl/clgl/jsp/clglUpdate.jsp";
	var winFeatures = "dialogHeight:450px;dialogWidth:930px;help:no;status:no";

	var lineNum = tObject.getSelectRowNum();

	args = new updateArgs();

	args.rowID = tObject.getRowColValue(lineNum, 1);

	var inArray = window.showModalDialog(srcFile, args, winFeatures);
	if (inArray != null) {
		var array_Elem = inArray.split("|");

		// ��ʾ������
		// update_scrollbar("�����޸ģ����Ժ�...");
		clglBean.updateTSClgl(args.rowID, array_Elem[0], {
					callback : function(data) {
					 
						if (data > 0) {
                     
							alert("<bean:message key="button.modify" bundle="${language}"/> <bean:message key="msg.success" bundle="${language}"/>!");

							var elem = array_Elem[1].split("</C>");

							tObject.setRowValue({
										row_num : lineNum,
										data : [elem[0], elem[1], elem[2],
												elem[3],elem[4],elem[5]]
									});
						} else {

							alert("<bean:message key="button.modify" bundle="${language}"/> <bean:message key="msg.failed" bundle="${language}"/>!");
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
//delete��ť
function forDelete(query_button) {
    var thispath = $("#this_path_id").val();
	var lineNum = tObject.getSelectRowNum();
	var rowId = tObject.getRowColValue(lineNum, 1);
	
	
	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/> <bean:message key="msg.delete" bundle="${language}"/>?"))
		return false;
    var array_Elem=0;
	// ��ʾ������
	// update_scrollbar("����ɾ�������Ժ�...");
    clglBean.deleteTSClgl(parseInt(rowId), 0, 
	{
	
				callback : function(data) {
					if (data == 1)
			        {
						alert("<bean:message key="person.msg.deleteUser" bundle="${language}"/> <bean:message key="msg.success" bundle="${language}"/>!");
			            tObject.delRowValue(lineNum);
			        }
			        else
			        {
			        	alert("<bean:message key="person.msg.deleteUser" bundle="${language}"/><bean:message key="msg.failed" bundle="${language}"/>!");
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
// detail��ť
function forDetail(query_button) {

    var lineNum = tObject.getSelectRowNum();

	var rowID = tObject.getRowColValue(lineNum, 1);

	var srcFile = "modules/ajgl/ajxxgl/clgl/jsp/clglDetail.jsp";
	var winFeatures = "dialogHeight:600px;dialogWidth:1000px;help:no;status:no";

	window.showModalDialog(srcFile, rowID, winFeatures);

}



