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
// ���ڿ������ڴ������ʾ����
var processing = false;

// ��ȡҳ����Ϣ
function getPage(num){
	
	tObject.cancelSelectedRow("all");
	
	var thispath=$("#this_path_id").val();
    
    ggfjBean.queryTSGgfj(tObject.getPerPage(),num,tObject.tmpTJ,tObject.paixu,
    {
        callback:function(data)
        {
            if(data!="" && data!="no")
            {
            	/*
            	 *	���ݸ�ʽ��
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

            //������Ϣ��
            //update_scrollbar("��"+(rowElements.length-1)+"��");
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
//<bean:message key="button.detail" bundle="${language}"/>��ť
function forDetail()
{
    var height=screen.height;
    var srcFile = "modules/xxgl/ggfj/jsp/ggfjDetail.jsp";
    var winFeatures = "dialogHeight:"+height+"px;dialogWidth:800px;help:no;status:no";

    window.showModalDialog(srcFile, "", winFeatures);
}

//��ʼ<bean:message key="button.query" bundle="${language}"/>��ť
function forQuery(query_button)
{
    var thispath=$("#this_path_id").val();
    
    var op = null;
    var condi = null;
    var comma = false;
    var tmpString = "";
    var sqlString = " where 1=1 ";

    condi = " and ";

    //op = document.forms[0].value_op;

    var inval = document.forms[0].value;
    if (inval.value!="")
    {
        tmpString = "value like '\%" + inval.value + "\%'";
	
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
    //op = document.forms[0].path_op;


    var inval = document.forms[0].q_sc_rq;
    if (inval.value!="")
    {
    	var d = inval.value.split("-");
        tmpString = " year(sc_rq) = '" + d[0] + "'";
        tmpString += " and month(sc_rq) = '" + d[1] + "' ";
	
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
        
    var inval = document.forms[0].shunxu;
    var shunxu ="";
    
    if(inval.value!="")
    {
    	shunxu = inval.value;
    }
    else
    {
    	shunxu=" desc";
    }
        
    var inval = document.forms[0].paixu;
    var paixu;
    if (inval.value!="")
    {
        paixu = inval.value+" "+shunxu;
    }
    else
    {
    	paixu ="id "+shunxu;
    }

    query_button.disabled=true;
    //��ʾ�ȴ���
	 

    waitObj.show({
    	
    	left:"25%",
    	bottom:"50%",
    	width:"280px",
    	height:"50px",
    	text_align:"center",
    	msg:"<span style=\"font-weight:bold;\">ϵͳ��������<bean:message key="button.query" bundle="${language}"/>����ȴ�...</span>"
    });
    
    
    tObject.cancelSelectedRow("all");
    
    tObject.tmpTJ=sqlString;
    
    tObject.paixu=paixu;
    
    ggfjBean.queryTSGgfj(tObject.getPerPage(),1,sqlString,paixu,
    {
        callback:function(data)
        {    
            if(data!="" && data!="no")
            {
            	/*
            	 *	���ݸ�ʽ��
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

/* ********************************************************************
 * ҳ��ײ��˵�
 * ********************************************************************/
 
function updateArgs()
{
    var rowID = 0;
    var PersonIDs = null;
    var PersonNames = null;
    var StatusIDs = null;
    var StatusNames = null;
}
 
//<bean:message key="button.modify" bundle="${language}"/>��ť
function forUpdate()
{
    var thispath=$("#this_path_id").val();
    
    var lineNum=tObject.getSelectRowNum();

    var srcFile = "modules/xxgl/ggfj/jsp/ggfjUpdate.jsp";
    var winFeatures = "dialogHeight:400px;dialogWidth:600px;help:no;status:no";
    
    args = new updateArgs();
    args.rowID=tObject.getRowColValue(lineNum,1);
    args.PersonIDs = new Array();
    args.PersonNames = new Array();
    args.StatusIDs = new Array();
    args.StatusNames = new Array();
   
    for (var kk=0; kk<document.all('i_person').options.length; kk++)
    {
        args.PersonIDs[kk] = document.all('i_person').options[kk].value;
        args.PersonNames[kk] = document.all('i_person').options[kk].text;
    }
    for (var kk=0; kk<document.all('i_status').options.length; kk++)
    {
        args.StatusIDs[kk] = document.all('i_status').options[kk].value;
        args.StatusNames[kk] = document.all('i_status').options[kk].text;
    }
    
    var inArray = window.showModalDialog(srcFile, args, winFeatures);

    if (inArray != null)
    {
    	var array_Elem=inArray.split("|");
    	
        ggfjBean.updateTSGgfj(args.rowID,array_Elem[0],
        {
            callback:function(data)
            {
                if(data > 0)
                {
                	alert("<bean:message key="button.modify" bundle="${language}"/>�ɹ���");
                	var elem=array_Elem[1].split("</C>");

                	tObject.setRowValue({
                		row_num:lineNum,
                		data:[elem[0],
                              elem[1],
                              elem[2],
                              elem[3],
                              elem[4],
                              elem[5],
                             ]                		
                	});
                }
                else
                	alert("<bean:message key="button.modify" bundle="${language}"/>ʧ�ܡ�");
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

//<bean:message key="button.delete" bundle="${language}"/>��ť
function forDelete()
{
	var thispath=$("#this_path_id").val();
    var lineArr = new Array();
   
    lineArr=tObject.getSelectRowNum();

	var rowIds="";
	var len = 0;
	if(lineArr.length==undefined) 
		len = 1;
	else len = lineArr.length;
    for (var i = 0; i < len; i++) {
    	var lineNum;
    	if(len==1) lineNum =lineArr;
    	else lineNum  = lineArr[i];
    	if(lineNum=="") continue;
	    rowIds += tObject.getRowColValue(lineNum,1) + "</C>";
	}
	if(rowIds=="") return;

    if (!confirm("���Ҫ<bean:message key="button.delete" bundle="${language}"/>ѡ�еļ�¼�𣿴˲������ָܻ���"))
        return false;

    ggfjBean.deleteTSGgfj(rowIds.toString(),
    {
        callback:function(data)
        {
             if (data == 1)
             {
                 alert("<bean:message key="button.delete" bundle="${language}"/>�ɹ���");
                 for (var i = 0; i < len; i++) {
			    	var lineNum=-1;
			    	if(len==1) lineNum =lineArr;
			    	else lineNum  = lineArr[i];
			    	if(lineNum=="") continue;
			    	tObject.delRowValue(lineNum);
				}
             }
             else
             {
                 alert("�Բ�����ѡ��ĵ�"+lineNum+"����¼<bean:message key="button.delete" bundle="${language}"/>ʧ�ܣ�");
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


//���밴ť
function forInsert(thispath)
{
    var Ids = new Array();
    var Vals = new Array();

    if (!confirm("ȷ��Ҫ���ӹ���������"))
        return false;
    
    ggfjBean.addTSGgfj(Ids.toString(),Vals.toString(),
    {
        callback:function(data)
        {
        	if (data > 0)
            {
                alert("������Ϣ�ɹ�");
                forClear();
            }
            else
            {
                alert("�Բ���������Ϣʧ�ܣ�");
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

// �����������ݰ�ť
function forClear()
{
    document.getElementById("i_value").value="";
    document.getElementById("i_path").value="";
}

//�л����㿨Ƭ����
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
            //��ӹ�������
            document.all('path_name').innerHTML="ҳ��·������������>���ӹ�������";
        }
        else if (obj2==0)
        {
            $("#hx_table_div").css("display","");
            //<bean:message key="button.query" bundle="${language}"/>��������
            document.all('path_name').innerHTML="ҳ��·������������><bean:message key="button.query" bundle="${language}"/>��������";
        }
    }
}

