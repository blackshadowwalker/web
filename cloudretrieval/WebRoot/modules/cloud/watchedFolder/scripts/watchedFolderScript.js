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
// 用于控制正在处理的显示开关
var processing = false;



// 获取页面信息
function getPage(num){
	
	tObject.cancelSelectedRow("all");
	
	var thispath=$("#this_path_id").val();
	watchedFolderBean.queryWatchedFolder(tObject.getPerPage(),num,tObject.tmpTJ,
    {
        callback:function(data)
        {
            if(data!="" && data!="no")
            {
            	/*
            	 *	数据格式：
            	 *	value</C>value</C></R>value</C>value</C></R></F>totalPage</C>totalRow</C>curPage</C>
            	 */
            
            	var array_ele=data.split("|");
            	
            	var dataElems=array_ele[0].split("</R>");
            	
            	var dataArrs=new Array();
            	
            	for(var i=0;i<dataElems.length-1;i++){
            		
            		var colElems=dataElems[i].split("</C>");
            		
            		var rowArr=new Array();
            		
            		for(var j=0;j<colElems.length-1;j++){
            			
            			rowArr[j]=colElems[j];
            		}
            		
            		dataArrs[i]=rowArr;
            	}
            	
            	var totalPage=array_ele[1].split("</C>")[0];
            	var totalRow=array_ele[1].split("</C>")[1];
            	var curPage=array_ele[1].split("</C>")[2];
            	
            	
            	tObject.setData({
					curPage:parseInt(curPage),
					totalPage:parseInt(totalPage),
					totalRow:parseInt(totalRow),
					data:dataArrs
				});
            	
            }
            else{
            	
            	alert("<bean:message key="msg.error.dataEmputy" bundle="${language}"/>");
            }

            //隐藏信息条
            //update_scrollbar("共"+(rowElements.length-1)+"条");
        },
        exceptionHandler:function(err_info)
        {
            
            stop_scrollbar(timer,"");

            if (err_info!="")
            {
                alert(err_info);
                if(err_info.indexOf("<bean:message key="msg.error.error" bundle="${language}"/>")<0){
                	window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
                }
            }
            else
            {
                alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
                window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
            }    
        }
    });
}

//开始<bean:message key="button.query" bundle="${language}"/>按钮
function forQuery(query_button)
{
    var thispath=$("#this_path_id").val();
    
    var op = null;
    var condi = null;
    var comma = false;
    var tmpString = "";
    var sqlString = "";
    op="like";
    condi = " and ";
    var inval = document.forms[0]._LPNumber;
	if (inval.value != "") {
		tmpString = "r.LPNumber " + op + " '%" + inval.value + "%' ";
		if (comma) {
			sqlString += condi + tmpString;
		} else {
			comma = true;
			sqlString += " and (" + tmpString;
		}
	}
	
	if(comma) sqlString += " ) ";
	tObject.cancelSelectedRow("all");

	query_button.disabled = true;
    //显示等待条
	 
    waitObj.show({
    	
    	left:"25%",
    	bottom:"50%",
    	width:"280px",
    	height:"50px",
    	text_align:"center",
    	msg:"<span style=\"font-weight:bold;\"><bean:message key="msg.inProgress" bundle="${language}"/>...</span>"
    });
    
    tObject.cancelSelectedRow("all");
    tObject.tmpTJ=sqlString;
    
    watchedFolderBean.queryWatchedFolder(tObject.getPerPage(),1,sqlString,
    {
        callback:function(data)
        {   
            if(data!="" && data!="no")
            {
            	/*
            	 *	数据格式：
            	 *	value</C>value</C></R>value</C>value</C></R></F>totalPage</C>totalRow</C>curPage</C>
            	 */
            	
            	var array_ele=data.split("|");
            	
            	var dataElems=array_ele[0].split("</R>");
            	
            	var dataArrs=new Array();
            	
            	for(var i=0;i<dataElems.length-1;i++){
            		
            		var colElems=dataElems[i].split("</C>");
            		
            		var rowArr=new Array();
            		
            		for(var j=0;j<colElems.length-1;j++){
            			
            			rowArr[j]=colElems[j];
            		}
            		
            		dataArrs[i]=rowArr;
            	}
            	
            	var totalPage=array_ele[1].split("</C>")[0];
            	var totalRow=array_ele[1].split("</C>")[1];
            	var curPage=array_ele[1].split("</C>")[2];
            	
            	tObject.setData({
					curPage:parseInt(curPage),
					totalPage:parseInt(totalPage),
					totalRow:parseInt(totalRow),
					data:dataArrs
				});
            }
            else
            {
            	alert("<bean:message key="msg.error.dataEmputy" bundle="${language}"/>");
            	tObject.setData({
					curPage:0,
					totalPage:0,
					totalRow:0,
					data:null
				});
            }
            query_button.disabled=false;
            waitObj.hide();
        },
        exceptionHandler:function(err_info)
        {
            
            //stop_scrollbar(timer,"");
            
            query_button.disabled=false;
            if (err_info!="")
            {
                alert(err_info);
                if(err_info.indexOf("<bean:message key="msg.error.error" bundle="${language}"/>")<0){
                	window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
                }
            }
            else
            {
                alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
                window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
            }    
        }
    });
}


//<bean:message key="button.detail" bundle="${language}"/>按钮
function forDetail()
{
	var lineNum=tObject.getSelectRowNum();
    var rowID=tObject.getRowColValue(lineNum,1);
    
    var srcFile = "modules/cloud/watchedFolder/jsp/watchedFolderDetail.jsp";
    var winFeatures = "dialogHeight:450px;dialogWidth:850px;help:no;status:no";

    window.showModalDialog(srcFile, rowID, winFeatures);
}

//<bean:message key="button.delete" bundle="${language}"/>按钮
function forDelete(thispath) {

	var lineNum=tObject.getSelectRowNum();
    var rowID=tObject.getRowColValue(lineNum,1);
    
    var srcFile = "modules/cloud/watchedFolder/jsp/watchedFolderUpload.jsp";
    var winFeatures = "dialogHeight:450px;dialogWidth:850px;help:no;status:no";

    window.showModalDialog(srcFile, window, winFeatures);
}


//插入按钮
function forInsert(thispath) {

	if(!$("#watch_form").validateForm()){
		return;
   }
	
	if (!confirm("确定要增加代码信息吗？"))
		return false;

	watchedFolderBean.addTSNvr(Ids.toString(), Vals.toString(), {
				callback : function(data) {
					if (data > 0) {
						alert("增加NVR信息成功");

						forClear();
					} else {
						alert("对不起，增加NVR信息失败！");
					}

					/*
					 * rowElements=data.split("</R>");
					 * 
					 * for (var i=0; i<rowElements.length-1; ++i) {
					 * colElements=rowElements[i].split("</C>");
					 * 
					 * if (colElements[0] == "1") { alert("增加代码信息成功");
					 * 
					 * forClear(); } else { alert("对不起，增加代码信息失败！"); } }
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
