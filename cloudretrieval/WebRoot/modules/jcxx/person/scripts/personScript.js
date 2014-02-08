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
    
    personBean.queryTUPerson(tObject.getPerPage(),num,tObject.tmpTJ,
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
                alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
                //<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>
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
    var sqlString = " where 1=1 ";

    condi = " and ";

    //op = document.forms[0].user_code_op;

    var inval = document.forms[0].user_code;
    if (inval.value!="")
    {
        tmpString = "user_code = '" + inval.value + "'";
	
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
    if (comma)
        sqlString += ")";

    query_button.disabled=true;
    tObject.cancelSelectedRow("all");
    tObject.tmpTJ=sqlString;
    personBean.queryTUPerson(tObject.getPerPage(),1,sqlString,
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
            	tObject.setData({
					curPage:0,
					totalPage:0,
					totalRow:0,
					data:null
				});
            	alert("<bean:message key="msg.error.dataEmputy" bundle="${language}"/>");
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
 
//Modify按钮
function forUpdate()
{
    var thispath=$("#this_path_id").val();
    var lineNum=tObject.getSelectRowNum();
    var srcFile = "modules/jcxx/person/jsp/personUpdate.jsp";
    var winFeatures = "dialogHeight:380px;dialogWidth:515px;help:no;status:no";
    
    args = new updateArgs();
    args.rowID=tObject.getRowColValue(lineNum,1);
    args.XbIDs = new Array();
    args.XbNames = new Array();
    args.RoleIDs = new Array();
    args.RoleNames = new Array();
    args.LanguageIDs = new Array();
    args.LanguageNames = new Array();
  
    for (var kk=0; kk<document.all('xb').options.length; kk++)
    {
        args.XbIDs[kk] = document.all('xb').options[kk].value;
        args.XbNames[kk] = document.all('xb').options[kk].text;
    }
    for (var kk=0; kk<document.all('i_role').options.length; kk++)
    {
        args.RoleIDs[kk] = document.all('i_role').options[kk].value;
        args.RoleNames[kk] = document.all('i_role').options[kk].text;
    }
    for (var kk=0; kk<document.all('i_language').options.length; kk++)
    {
        args.LanguageIDs[kk] = document.all('i_language').options[kk].value;
        args.LanguageNames[kk] = document.all('i_language').options[kk].text;
    }
   
    
    var inArray = window.showModalDialog(srcFile, args, winFeatures);

    if (inArray != null)
    {
    	var array_Elem=inArray.split("|");
        personBean.updateTUPerson(args.rowID,array_Elem[0].split("<#>")[0],array_Elem[0].split("<#>")[1],
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
                              elem[2],
                              elem[3],
                              elem[4],
                              elem[5],
                              elem[6],
                              elem[7],
                              elem[8],
                              elem[9],
                              elem[10],
                              elem[11],
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

//delete按钮
function forDelete()
{
	var thispath=$("#this_path_id").val();
    var lineNum=tObject.getSelectRowNum();
    var rowId=tObject.getRowColValue(lineNum,1);

    if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/> <bean:message key="person.msg.deleteUser" bundle="${language}"/>? <bean:message key="person.msg.cannotBeRestored" bundle="${language}"/>."))
        return false;

    personBean.deleteTUPerson(parseInt(rowId),
    {
        callback:function(data)
        {
             if (data == 1)
             {
                 alert("<bean:message key="person.msg.deleteUser" bundle="${language}"/> <bean:message key="msg.success" bundle="${language}"/>!");
                 tObject.setRowValue({
										row_num : lineNum,
										data : [, , ,,,,,,,,,,,,
												"注销"]
									});
             }
             else
             {
                 alert("<bean:message key="person.msg.deleteUser" bundle="${language}"/><bean:message key="msg.failed" bundle="${language}"/>!");
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

//<bean:message key="button.detail" bundle="${language}"/>按钮
function forDetail()
{
	var lineNum=tObject.getSelectRowNum();
    var rowID=tObject.getRowColValue(lineNum,1);
    
    var srcFile = "modules/jcxx/person/jsp/personDetail.jsp";
    var winFeatures = "dialogHeight:320px;dialogWidth:600px;help:no;status:no";

    window.showModalDialog(srcFile, rowID, winFeatures);
}

//插入按钮
function forInsert(thispath)
{
    var Ids = new Array();
    var Vals = new Array();
    
    var i=0;
    
    var user_code = document.getElementById("i_user_code");
    if(user_code.value=="")
    {
    	alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="person.columns.userID" bundle="${language}"/>!");//请输入用户名
    	return false;
    }
    Ids[i] = "user_code";
    Vals[i] = "'"+trim(user_code.value)+"'";
    var user_name = document.getElementById("i_user_name");
    if(user_name.value=="")
    {
    	alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="person.columns.userName" bundle="${language}"/>!");//请输入姓名
    	return false;
    }
    i++;
    Ids[i] = "user_name";
    Vals[i] = "'"+trim(user_name.value)+"'";
    var dept_code = document.getElementById("i_dept_code");
    if(dept_code.value=="")
    {
    	alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="person.columns.department" bundle="${language}"/>!");//请输入所属机构
    	return false;
    }
    i++;
    Ids[i] = "dept_code";
    Vals[i] = "'"+trim(dept_code.value)+"'";
    
    var xb = document.getElementById("i_xb");
    if(xb.value=="")
    {
    	alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="person.columns.sex" bundle="${language}"/>!");
//    	alert("请输入性别！");
    	return false;
    }
    i++;
    Ids[i] = "xb";
    Vals[i] = "'"+trim(xb.value)+"'";

    var role = document.getElementById("i_role");
    if(role.value=="")
    {
    	alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="person.columns.role" bundle="${language}"/>!");
    //	alert("请输入角色！");
    	return false;
    }
    i++;
    Ids[i] = "role_code";
    Vals[i] = "'"+trim(role.value)+"'";

	var language = document.getElementById("i_language");
	if(language.value=="")
    {
    	alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="person.columns.language" bundle="${language}"/>!");
    //	alert("请输入角色！");
    	return false;
    }
	i++;
    Ids[i] = "language";
    Vals[i] = "'"+trim(language.value)+"'";
    
    i++;
    Ids[i] = "passwd";
    Vals[i] = "'admin'";
    

    //确定要增加人员基本信息吗
    if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/> <bean:message key="button.insert" bundle="${language}"/> <bean:message key="person.name" bundle="${language}"/>!"))
        return false;
    
    personBean.addTUPerson(Ids.toString(),Vals.toString(),user_code.value,
    {
        callback:function(data)
        {
        	if (data > 0)
            {
               alert("<bean:message key="button.insert" bundle="${language}"/> <bean:message key="msg.success" bundle="${language}"/>!");
                window.location.href = window.location.href;
            }
            else
            {
            	//对不起，增加信息失败！
                alert("<bean:message key="button.insert" bundle="${language}"/> <bean:message key="msg.failed" bundle="${language}"/>!");
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
            //query人员基本信息
        }
    }
}

