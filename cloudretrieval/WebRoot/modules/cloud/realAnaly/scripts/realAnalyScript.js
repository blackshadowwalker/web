// ���ڿ������ڴ������ʾ����
var processing = false;

// ��ȡҳ����Ϣ
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

//��ʼ<bean:message key="button.query" bundle="${language}"/>��ť
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
    var XbIDs = null;
    var XbNames = null;
    var SfldIDs = null;
    var SfldNames = null;
    var SftqIDs = null;
    var SftqNames = null;
}
 
//<bean:message key="button.modify" bundle="${language}"/>��ť
function forUpdate()
{
    var thispath=$("#this_path_id").val();
    
    var lineNum=tObject.getSelectRowNum();

    var srcFile = "modules/jcxx/person/jsp/personUpdate.jsp";
    var winFeatures = "dialogHeight:400px;dialogWidth:600px;help:no;status:no";
    
    args = new updateArgs();
    args.rowID=tObject.getRowColValue(lineNum,1);
    args.XbIDs = new Array();
    args.XbNames = new Array();
    args.RoleIDs = new Array();
    args.RoleNames = new Array();
  
    for (var kk=0; kk<document.all('xb').options.length; kk++)
    {
        args.XbIDs[kk] = document.all('xb').options[kk].value;
        args.XbNames[kk] = document.all('xb').options[kk].text;
    }
    for (var kk=0; kk<document.all('i_gzzw').options.length; kk++)
    {
        args.RoleIDs[kk] = document.all('i_gzzw').options[kk].value;
        args.RoleNames[kk] = document.all('i_gzzw').options[kk].text;
    }
   
    
    var inArray = window.showModalDialog(srcFile, args, winFeatures);

    if (inArray != null)
    {
    	var array_Elem=inArray.split("|");
    	
        personBean.updateTUPerson(args.rowID,array_Elem[0],
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
                              elem[6],
                              elem[7],
                              elem[8],
                              elem[9],
                              elem[10],
                              elem[11],
                              elem[12],
                             
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
    var lineNum=tObject.getSelectRowNum();
    var rowId=tObject.getRowColValue(lineNum,1);

    if (!confirm("���Ҫע������Ա�𣿴˲������ָܻ���"))
        return false;

    personBean.deleteTUPerson(parseInt(rowId),
    {
        callback:function(data)
        {
             if (data == 1)
             {
                 alert("ע���ɹ���");
                 tObject.setRowValue({

										row_num : lineNum,
										data : [, , ,,,,,,,,,,,,
												"ע��"]
									});
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

//<bean:message key="button.detail" bundle="${language}"/>��ť
function forDetail()
{
	var lineNum=tObject.getSelectRowNum();
    var rowID=tObject.getRowColValue(lineNum,1);
    
    var srcFile = "modules/jcxx/person/jsp/personDetail2.jsp";
    var winFeatures = "dialogHeight:400px;dialogWidth:600px;help:no;status:no";

    window.showModalDialog(srcFile, rowID, winFeatures);
}

//���밴ť
function forInsert(thispath)
{
    var Ids = new Array();
    var Vals = new Array();

    var user_code = document.getElementById("i_user_code");
    if(user_code.value=="")
    {
    	alert("�������û�����");
    	return false;
    }
    Ids[0] = "jh";
    Vals[0] = "'"+trim(user_code.value)+"'";
    var user_name = document.getElementById("i_user_name");
    if(user_name.value=="")
    {
    	alert("������������");
    	return false;
    }
    Ids[1] = "user_name";
    Vals[1] = "'"+trim(user_name.value)+"'";
    var dept_code = document.getElementById("i_dept_code");
    if(dept_code.value=="")
    {
    	alert("����������������");
    	return false;
    }
    Ids[2] = "dept_code";
    Vals[2] = "'"+trim(dept_code.value)+"'";
    
    var xb = document.getElementById("i_xb");
    if(xb.value=="")
    {
    	alert("�������Ա�");
    	return false;
    }
    Ids[3] = "xb";
    Vals[3] = "'"+trim(xb.value)+"'";
    
    
    var csrq = document.getElementById("i_csrq");
    Ids[4] = "csrq";
    Vals[4] = "'"+trim(csrq.value)+"'";
    var zc = document.getElementById("i_zc");
    Ids[5] = "zc";
    Vals[5] = "'"+trim(zc.value)+"'";
    var zw = document.getElementById("i_zw");
    
    if(zw.value=="")
    {
    	alert("������ְλ��");
    	return false;
    }
    Ids[6] = "zw";
    Vals[6] = "'"+trim(zw.value)+"'";
    var sj = document.getElementById("i_sj");
    
     if(sj.value=="")
    {
   // 	alert("�������ֻ���");
   //	return false;
    }
    
    Ids[7] = "sj";
    Vals[7] = "'"+trim(sj.value)+"'";
    var tel = document.getElementById("i_tel");
    Ids[8] = "tel";
    Vals[8] = "'"+trim(tel.value)+"'";
    var mail = document.getElementById("i_mail");
    Ids[9] = "mail";
    Vals[9] = "'"+trim(mail.value)+"'";
    var jtzz = document.getElementById("i_jtzz");
    
    if(jtzz.value=="")
    {
    //	alert("�������ͥסַ ��");
    //	return false;
    }
    Ids[10] = "jtzz";
    Vals[10] = "'"+trim(jtzz.value)+"'";


	 var gzzw = document.getElementById("i_gzzw");
    Ids[11] = "gzzw";
    Vals[11] = "'"+trim(gzzw.value)+"'";
    
     Ids[12] = "passwd";
    Vals[12] = "'admin'";
    
    var gzsj = document.getElementById("i_gzsj");
    
    if(gzsj.value=="")
    {
    //	alert("�����빤��ʱ�� ��");
    //	return false;
    }
    Ids[13] = "gzsj";
    Vals[13] = "'"+trim(gzsj.value)+"'";
    
    if(gzzw.value!="0")
    {
    	Ids[14] = "role_code";
    	Vals[14] = "'"+trim(gzzw.value)+"'";
    }
    else
    {
    	Ids[14] = "role_code";
    	Vals[14] = "'"+trim(zw.value)+"'";
    }

    if (!confirm("ȷ��Ҫ������Ա������Ϣ��"))
        return false;
    
    personBean.addTUPerson(Ids.toString(),Vals.toString(),user_code.value,
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
    document.getElementById("i_user_code").value="";
    document.getElementById("i_user_name").value="";
    document.getElementById("i_dept_code").value="";
    document.getElementById("i_xb").value="";
    document.getElementById("i_csrq").value="";
    document.getElementById("i_zc").value="";
    document.getElementById("i_zw").value="0";
    document.getElementById("i_sj").value="";
    document.getElementById("i_tel").value="";
    document.getElementById("i_mail").value="";
    document.getElementById("i_jtzz").value="";
    document.getElementById("i_gzzw").value="0";
   
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
            //�����Ա������Ϣ
			
            document.all('path_name').innerHTML="ҳ��·�����Ʒ���>�ļ��ϴ�";
        }
        else if (obj2==0)
        {
            $("#hx_table_div").css("display","");
            //<bean:message key="button.query" bundle="${language}"/>��Ա������Ϣ
            document.all('path_name').innerHTML="ҳ��·�����Ʒ���>�ļ�����";
        }
    }
}

