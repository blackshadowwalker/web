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
//	System.out.println(language);
%>
/*******************************************************************************
 * ����<bean:message key="button.query" bundle="${language}"/>�������ʾ���ƣ�ÿ����Ŀ���ĸ��ֶΣ� 1. <bean:message key="button.query" bundle="${language}"/>����е���ʾ���أ�0-����ʾ 1-��ʾ 2. <bean:message key="button.query" bundle="${language}"/>�������ʾ���б��� 3.
 * ��Ӧ�����ݿ��е��ֶ�����ȫ��Ϊ��д�� 4. ��ʾ���ͣ���һλ��I-��ֵ�ͣ�S-�ַ��������ڵ����ͣ�
 * �ڶ�λ��û��-���������ͣ�I-����ֵ��T-���Է���ɵ�����
 ******************************************************************************/
function getPage(num) {

	tObject.cancelSelectedRow("all");

	var thispath = $("#this_path_id").val();

	taskMgrBean.queryTask(tObject.getPerPage(), num, tObject.tmpTJ, {
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
 * ҳ��ײ��˵�
 ******************************************************************************/
// ��ʼ<bean:message key="button.query" bundle="${language}"/>��ť
function forQuery(query_button) {
   var thispath = $("#this_path_id").val();
	var op = null;
	condi = " and ";
	var comma = false;
	var tmpString = "";
	var sqlString = " where 1=1 and t.status=1 ";
	op = document.forms[0].taskName_op;
	var taskName = document.forms[0].taskName;
	if (taskName.value != "") {
		tmpString = "t.taskName like '%" + taskName.value + "%'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "AND (" + tmpString;
		}
	}
	op = document.forms[0].creator_op;
	var creator = document.forms[0].creator;
	if (creator.value != "") {
		tmpString = "t.creator like '%" + creator.value + "%'";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += "AND (" + tmpString;
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


	taskMgrBean.queryTask(tObject.getPerPage(), 1, sqlString, {
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


function pageArgs() {
	var title = "";
	var data = "";
}

// ֹͣ��ť
function forStop(query_button) {
	
	var pId = index;
	alert("my count is "+num);
	alert(pId);
	var thispath = $("#this_path_id").val();
	var lineNum = tObject.getSelectRowNum();
	var st ="1";
	for(var i=0;i<num;i++){
		var rowId = tObject.getRowColValue(pId[i], 1 );
		
		if (!confirm("ȷ��ֹͣ������"))
			return false;
		alert(rowId);
		taskMgrBean.stopTask(parseInt(rowId), {
			callback : function(data) {
			  
			if (data == 1) {
				alert("�ɹ�ֹͣ");
			    window.location.href = window.location.href;
			} else {
				alert("�Բ�����ѡ��ĵ�"+lineNum+"������ֹͣʧ�ܣ�");
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
	
	
	
}


// <bean:message key="task.report" bundle="${language}"/>��ť
function forReport(query_button) {
	var thispath = $("#this_path_id").val();
//	var lineNum = tObject.getSelectRowNum();
//	var rowIds = new Array(); 
//	for(var t=0;t<index.length;t++){
//		var rowId = tObject.getRowColValue(index[t], 1);
//		rowIds.push(rowId);
//	}
//	alert(rowIds);
	var args = new pageArgs();
	args.title="<bean:message key="task.management.report" bundle="${language}"/>";
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
    
	taskMgrBean.taskReport(index, {
		callback : function(data) {
		waitObj.hide();
		if (data != "" && data != "no" &&data != null) {
			data="<bean:message key="task.serialNumber" bundle="${language}"/>" +
					"</C><bean:message key="task.lpNumber" bundle="${language}"/>" +
				    "</C><bean:message key="task.occurrenceTime" bundle="${language}"/>" +
				    "</C><bean:message key="task.location" bundle="${language}"/></T>"+data;
			args.data=data;
			var srcFile = "modules/cloud/taskMgr/jsp/taskMgrReport.jsp";
			var winFeatures = "dialogHeight:"+screen.height+"px;dialogWidth:"+screen.width+"px;help:no;status:no";
			window.showModelessDialog(srcFile, args,winFeatures);
			window = null;
		}else {

			alert("<bean:message key="msg.error.dataEmputy" bundle="${language}"/>");
		}
		query_button.disabled = false;
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


function updateArgs() {
	var rowID = 0;
}
//<bean:message key="button.modify" bundle="${language}"/>��ť
function forUpdate(query_button) {
	  var thispath = $("#this_path_id").val();
	  var srcFile = "modules/cloud/taskMgr/jsp/taskMgrUpdate.jsp";
		var winFeatures = "dialogHeight:300px;dialogWidth:600px;help:no;status:no";

		var lineNum = tObject.getSelectRowNum();

		args = new updateArgs();

		args.rowID = tObject.getRowColValue(lineNum, 1);

		var inArray = window.showModalDialog(srcFile, args, winFeatures);
		if (inArray != null) {
			var array_Elem = inArray.split("|");

			// ��ʾ������
			// update_scrollbar("����<bean:message key="button.modify" bundle="${language}"/>�����Ժ�...");
			taskMgrBean.updateTSTask(args.rowID, array_Elem[0], {
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


// <bean:message key="button.detail" bundle="${language}"/>��ť
function forDetail(query_button) {

    var lineNum = tObject.getSelectRowNum();

	var rowID = tObject.getRowColValue(lineNum, 1);

	var srcFile = "modules/cloud/taskMgr/jsp/taskMgrDetail.jsp";
	var winFeatures = "dialogHeight:250px;dialogWidth:600px;help:no;status:no";

	window.showModalDialog(srcFile, rowID, winFeatures);

}
