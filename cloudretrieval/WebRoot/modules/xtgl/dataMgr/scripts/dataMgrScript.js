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

function getPage(num) {

	tObject.cancelSelectedRow("all");

	var thispath = $("#this_path_id").val();

	dataMgrBean.queryTSDataMgr(tObject.getPerPage(), num, tObject.tmpTJ, {
				callback : function(data) {
					if (data != "" && data != "no") {
						/*
						 * 数据格式： value</C>value</C></R>value</C>value</C></R>|totalPage</C>totalRow</C>curPage</C>
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

					// 隐藏信息条
					// update_scrollbar("共"+(rowElements.length-1)+"条");
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
// 用于控制正在处理的显示开关
var processing = false;

/*******************************************************************************
 * 页面底部菜单
 ******************************************************************************/
// 开始query按钮
function forQuery(query_button) {
   var thispath = $("#this_path_id").val();
	var op = null;
	condi = " and ";
	var comma = false;
	var tmpString = "";
	var sqlString = " where 1=1 and status=1 ";
    
	query_button.disabled=true;
    //显示等待条
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
 
	dataMgrBean.queryTSDataMgr(tObject.getPerPage(), 1, sqlString, {
				callback : function(data) {
					if (data != "" && data != "no") {
						/*
						 * 数据格式： value</C>value</C></R>value</C>value</C></R>|totalPage</C>totalRow</C>curPage</C>
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
	
function forBackUp(query_button) {  
var yonghu = $("#my_user").val();
    var curr_time = new Date();
	var strDate = curr_time.getYear()+"";
	strDate += curr_time.getMonth()+1+"";
	strDate += curr_time.getDate()+"";
	strDate += curr_time.getHours()+"";
	strDate += curr_time.getMinutes()+"";
	strDate += curr_time.getSeconds();
	var sql = strDate + ".sql"
	var _name = $("#wjm_sql").val();
	var _pass = "<bean:message key="db.msg.pleaseInputFileName" bundle="${language}"/>";
	if(_name == _pass )
		if(!confirm("<bean:message key="db.msg.warninput" bundle="${language}"/>")){ //确定不输入备份文件名吗
			 return false;
		}else{
			_name = "";
		}
	query_button.disabled=true;
    //显示等待条
    waitObj.show({
    	left:"25%",
    	bottom:"50%",
    	width:"280px",
    	height:"50px",
    	text_align:"center",
    	msg:"<span style=\"font-weight:bold;\"><bean:message key="msg.inProgress" bundle="${language}"/></span>"
    });
   dataMgrBean.addTSBackDataMgr(sql,_name, yonghu,{
					callback : function(data) {
					if (data=="1") {
						alert("<bean:message key="db.msg.warninput" bundle="${language}"/>");//备份成功
					} else if(data=="-2") {
						alert("<bean:message key="db.msg.writeFailed" bundle="${language}"/>");//备份失败[写入文件失败]
					}else if(data=="-1"){
						alert("<bean:message key="db.msg.backupingAndTryLater" bundle="${language}"/>");//系统正在备份,请稍候再试!
					}
					else{
						alert("<bean:message key="db.msg.backupFailed" bundle="${language}"/>[ERROR:"+data+"]");
					}
						// hidden_scrollbar();
					query_button.disabled = false;
		            waitObj.hide();
		            
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
function updateArgs() {
	   var rowID = 0;
	}	
function forRecover(query_button) {
  var yonghu = $("#my_user").val();
   var lineNum = tObject.getSelectRowNum();
	var rowId = tObject.getRowColValue(lineNum, 1);
	query_button.disabled=true;
    //显示等待条
    waitObj.show({
    	
    	left:"25%",
    	bottom:"50%",
    	width:"280px",
    	height:"50px",
    	text_align:"center",
    	msg:"<span style=\"font-weight:bold;\"><bean:message key="msg.inProgress" bundle="${language}"/></span>"
    });
	    dataMgrBean.addTSRestoreDataMgr(parseInt(rowId), yonghu,{
					callback : function(data) {
					alert(data)
						if (data > 0) {
							alert("<bean:message key="db.msg.recoverSucced" bundle="${language}"/>");//还原成功.
						} else {
							alert("<bean:message key="db.msg.recoverFailed" bundle="${language}"/>");//还原失败.
						}
						query_button.disabled = false;
			            waitObj.hide();
						// 隐藏信息条
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
function forDownload(query_button){
	var lineNum = tObject.getSelectRowNum();
	var rowId = tObject.getRowColValue(lineNum, 1);
	query_button.disabled=true;
    //显示等待条
    waitObj.show({
    	
    	left:"25%",
    	bottom:"50%",
    	width:"280px",
    	height:"50px",
    	text_align:"center",
    	msg:"<span style=\"font-weight:bold;\"><bean:message key="msg.inProgress" bundle="${language}"/></span>"
    });
	dataMgrBean.downloadFile(parseInt(rowId),{
		callback : function(data) {
			if (data != "" && data != "no") {
				var thispath=$("#this_path_id").val();
				var array_ele = data;
                var path ="WEB-INF/DBBackUp/"
                var filePath = path+array_ele;
                var url = serverPath+"jsp/download.jsp?fileName="+array_ele+"&filePath="+filePath;
                window.open(url);
				
			} else {
				alert("<bean:message key="db.msg.error.fileNotExist" bundle="${language}"/>");//此文件不存在
			}
			query_button.disabled = false;
            waitObj.hide();
			// 隐藏信息条
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





