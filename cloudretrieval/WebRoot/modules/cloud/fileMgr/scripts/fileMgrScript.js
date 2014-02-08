<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<%
	String path = request.getContextPath();
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
	
    fileMgrBean.queryFile(tObject.getPerPage(),num,tObject.tmpTJ,
    {
        callback:function(data)
        {
            if(data!="" && data!="no")
            {
            	/*
            	 *	数据格式：
            	 *	value</C>value</C></R>value</C>value</C></R></F>totalPage</C>totalRow</C>curPage</C>
            	 */
            
            	var array_ele=data.split("</F>");
            	
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
            	//<bean:message key="msg.error.dataEmputy" bundle="${language}"/>
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
            	window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
            }
            else
            {
                alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");//连接超时，系统自动退出
                window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
            }    
        }
    });
}

function forAutoUpload(query_button){
	var b = $("#i_autoProcess").attr("checked");
	b =!b;
	$("#i_autoProcess").attr("checked", b);
	if(b)
		$("#hx_toolbar_event2").text("<bean:message key="button.autoProcessCancel" bundle="${language}"/>");//关闭自动处理
	else
		$("#hx_toolbar_event2").text("<bean:message key="button.autoProcess" bundle="${language}"/>");//自动处理
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
    /* 
    sqlString = " where 1=1 ";
    condi = " and ";

    //op = document.forms[0].user_code_op;

    var inval = document.forms[0].user_code;
    if (inval.value!="")
    {
        tmpString = "jh = '" + inval.value + "'";
	
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
    //op = document.forms[0].user_name_op;

    var inval = document.forms[0].user_name;
    if (inval.value!="")
    {
        tmpString = "user_name like '%" + inval.value + "%'";
	
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
    //op = document.forms[0].dept_code_op;

    var inval = document.forms[0].dept_code;
    if (inval.value!="")
    {
        tmpString = "dept_code in(select dept_code from t_s_deptmgr where dept_manager = '" + inval.value + "')";
	
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
    if (comma)
        sqlString += ")";

    tObject.tmpTJ=sqlString;
*/
    query_button.disabled=true;
    tObject.cancelSelectedRow("all");
    fileMgrBean.queryFile(tObject.getPerPage(),1,sqlString,
    {
        callback:function(data)
        {    
            if(data!="" && data!="no")
            {
            	/*
            	 *	数据格式：
            	 *	value</C>value</C></R>value</C>value</C></R></F>totalPage</C>totalRow</C>curPage</C>
            	 */
            	
            	var array_ele=data.split("</F>");
            	
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

/* ********************************************************************
 * 页面底部菜单
 * ********************************************************************/
 
function updateArgs()
{
    var rowID = 0;
    var XbIDs = null;
    var XbNames = null;
    var SfldIDs = null;
    var SfldNames = null;
    var SftqIDs = null;
    var SftqNames = null;
}

function forShowInNewWindow(){
	openedInNewWindow = true;
	window.open(window.location,"filemgr");
	history.go(-1);
}

function forUpload(){
	if($("#i_LocationId").val()==""){
		alert("<bean:message key="filemgr.error.selectLocation" bundle="${language}"/>!");//请选择地点
		$("#i_LocationId").focus();
		return ;
	}
	var videodatetime = $("#i_videodatetime").val();
	var  str = videodatetime.toString();
  	str =  str.replace(/-/g,"/");
	var strDate = new Date(str);
	
	
	var postString ="locationId="+$("#i_LocationId").val()+"</C>videodatetime="+strDate.getTime()+"</C>" +
			"timespan="+$("#i_timespan").val()+"&usercode="+$("#user_code").val();
	
	var session_id = $("#session_id").val();
	var dir = "videos";
	var root = $("#uploadroot").val();
	var returnURL =$("#basePath").val()+"/saveUploadFile";
	var srcFile = $("#uploadServer").val()+"/"+ $("#uploadpage").val()+"?"+"sessionid="+session_id+"&dir="+dir+"&dirroot="+root+"&filetype=*.avi&returnURL="+returnURL;
	srcFile += "&postString="+postString;
	var uploadwindow = window.open(srcFile, "uploadwindow");
	uploadwindow.title="File Upload";
}

function forProcess(process_button){
	process_button.disabled = true;
	var thispath=$("#this_path_id").val();
    var lineNum=tObject.getSelectRowNum();
    var fileList = new Array();
    if(lineNum.length==undefined){
    	var id = tObject.getRowColValue(lineNum,1);
    	var path = tObject.getRowColValue(lineNum,5);
    	var name = tObject.getRowColValue(lineNum,4);
    	var fileName = path+"/"+name;
    	fileList.push(fileName);
    }
    else
	    for(var i=0; i<lineNum.length; i++){
	    	var id = tObject.getRowColValue(lineNum[i],1);
	    	var path = tObject.getRowColValue(lineNum[i],5);
	    	var name = tObject.getRowColValue(lineNum[i],4);
	    	var fileName = path+"/"+name;
	    	fileList.push(fileName);
	    }
    timeHandle = setInterval(getPercent, 2000);
    realAnalyBean.processFile(fileList,  $("#i_LocationId").val(),
    {
    	callback:function(retdata){
    	process_button.disabled = false;
    		getReport(retdata);
    	},
    	exceptionHandler:function(err_info){ 
    		process_button.disabled = false;
    		alert(err_info); 
    	}
    });
}

function forDownload(query_button){
	query_button.disabled = true;
	var thispath=$("#this_path_id").val();
    var lineNum=tObject.getSelectRowNum();
    var id = tObject.getRowColValue(lineNum,1);
    fileMgrBean.getFilePath(id,{
    	callback:function(url)
        {
    		query_button.disabled = false;
    		var time = new Date();
    		url = url+"?id="+time.getTime();
    		if(url!="")
    			window.open(url,"_blank");//"downloadframe"
    		else
    			alert("<bean:message key="msg.error.dataEmputy" bundle="${language}"/>");
        },
        exceptionHandler:function(err_info){
        	query_button.disabled = false;
        	alert(err_info);
        }
    });
    
}
//<bean:message key="button.modify" bundle="${language}"/>按钮
function forUpdate()
{
    var thispath=$("#this_path_id").val();
    
    var lineNum=tObject.getSelectRowNum();

    var srcFile = "modules/cloud/fileMgr/jsp/fileMgrUpdate.jsp";
    var winFeatures = "dialogHeight:400px;dialogWidth:600px;help:no;status:no";
    
    args = new updateArgs();
    args.rowID=tObject.getRowColValue(lineNum,1);
    args.XbIDs = new Array();
    args.XbNames = new Array();
    args.RoleIDs = new Array();
    args.RoleNames = new Array();
  
    
    var inArray = window.showModalDialog(srcFile, args, winFeatures);

    if (inArray != null)
    {
    	var array_Elem=inArray.split("|");
    	fileMgrBean.UpdateFile(args.rowID,array_Elem[0],
        {
            callback:function(data)
            {
                if(data > 0)
                {
                	alert("<bean:message key="button.modify" bundle="${language}"/> <bean:message key="msg.success" bundle="${language}"/>!");
                	var elem=array_Elem[1].split("</C>");

                	tObject.setRowValue({
                		row_num:lineNum,
                		data:[elem[0],
                              elem[1],
                             ]                		
                	});
                }
                else
                	alert("<bean:message key="button.modify" bundle="${language}"/> <bean:message key="msg.failed" bundle="${language}"/>!");
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
}


//<bean:message key="button.autoRefresh" bundle="${language}"/>
function forRefresh()
{
	setTimeout("forQuery('query_button')",1000);
	setTimeout("forRefresh()",10000);
}

//案件分发
function forDistribution(){
	
	var thispath=$("#this_path_id").val();
	
	 var srcFile = "modules/cloud/fileMgr/jsp/caseDistribution.jsp";
     var winFeatures = "dialogHeight:150px;dialogWidth:250px;help:no;status:no";
     
     if(s==null||s==""){
    	 return false;
     }else{
    	 var inArray = window.showModalDialog(srcFile, s, winFeatures);
     }
    
     
     if(inArray==null || inArray==""){
    	    return;
     }
     
     var Ids = new Array();
     var Vals = new Array();
     
     ch =new Array();
	 ch = s.split(",");
	 for(i=0;i<ch.length-1;i++){
		 
		 Ids[0] = "case_code";
		 Vals[0] = "'"+trim(inArray)+"'";
		 
		 var t = ch[i];
		 Vals[1] = "'"+trim(t)+"'";
		 Ids[1] = "video_code";
		 
		 fileMgrBean.addCaseDistribution(Ids.toString(),Vals.toString(),
	    		    {
	    		        callback:function(data)
	    		        {
	    		        	var tep = data.split("视");
	    		        	var code =tep[1];
	    		        	if (code!=null)
	    		            {
	    		                alert(data);
	    		            }
	    		            else
	    		            {
	    		                alert("<bean:message key="msg.failed" bundle="${language}"/> ");
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
	    		                alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>!");
	    		                window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
	    		            }    
	    		        }
	    		    });
	 }
     
}

//视频播放
function forPlayback(){
	
	var lineNum=tObject.getSelectRowNum();
    var rowId=tObject.getRowColValue(lineNum,1);
	
    var srcFile = "modules/cloud/fileMgr/jsp/videoPlay.jsp";
    var winFeatures = "dialogHeight:450px;dialogWidth:550px;help:no;status:no";
    
    var inArray = window.showModalDialog(srcFile, rowId, winFeatures);
}

//<bean:message key="button.delete" bundle="${language}"/>按钮
function forDelete()
{
	var thispath=$("#this_path_id").val();
    var lineNum=tObject.getSelectRowNum();
    var rowId=tObject.getRowColValue(lineNum,1);

    if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/> <bean:message key="button.delete" bundle="${language}"/>? <bean:message key="msg.cannotBeRestored" bundle="${language}"/>!"))
        return false;

    fileMgrBean.deleteVdieo(parseInt(rowId),
    {
        callback:function(data)
        {
             if (data == 1)
             {
                 alert("<bean:message key="button.delete" bundle="${language}"/> <bean:message key="msg.success" bundle="${language}"/>");
                 tObject.delRowValue(lineNum);
             }
             else
             {
            	 alert("<bean:message key="button.delete" bundle="${language}"/> <bean:message key="msg.failed" bundle="${language}"/>");
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


//插入按钮
function forInsert(thispath)
{

}

// 重置输入内容按钮
function forClear()
{
}

//切换顶层卡片标题
function switch_index(obj1, obj2)
{
    var tmp;

    if (obj1.className != "activeindex")
    {
        for (var i=0; ; ++i)
        {
            tmp = document.getElementById('padindex'+i);
            if (tmp == null)
                break;

            if (i == obj2)
                tmp.className = 'activeindex';
            else
                tmp.className = 'hiddenindex';

            tmp = document.getElementById('padcontent'+i);
            if (tmp == null)
                break;

            if (i == obj2)
                tmp.className = 'activecontent';
            else
                tmp.className = 'hiddencontent';
        }
        
        if (obj2==1)
        {
            $("#hx_table_div").css("display","none");
            //添加人员基本信息
        }
        else if (obj2==0)
        {
            $("#hx_table_div").css("display","");
        }
    }
}

