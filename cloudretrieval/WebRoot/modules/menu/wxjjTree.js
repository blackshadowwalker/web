//
function forDetialLy(fgjbm,fgjmc,qx)
{
	var nodeKey = document.getElementById("xx").value;//节点的key值
	
    var id = nodeKey.split("</C>")[0];
    
    var srcFile = "/modules/xxjd/lyxxgl/jsp/lyxxglDetail.jsp?id="+id;

    window.open(thisPath+srcFile,"pad");
}



//增加楼幢
function forInsertLy(fgjbm,fgjmc,qx)
{
    
    var srcFile = "/lyglAction.do?fgj_bm="+fgjbm+"&fgj_mc="+fgjmc+"&qx="+qx;

    window.open(thisPath+srcFile,"pad");
}

//小区
function forDetialXq(fgjbm,fgjmc,qx)
{
	var nodeKey = document.getElementById("xx").value;//节点的key值
	
    var id = nodeKey.split("</C>")[0];
    
    var srcFile = "/modules/xxjd/xqxxgl/jsp/xqxxglDetail.jsp?id="+id;

    window.open(thisPath+srcFile,"pad");
}

//增加小区
function forInsertXq(fgjbm,fgjmc,qx)
{
    
    var srcFile = "/xqglAction.do?fgj_bm="+fgjbm+"&fgj_mc="+fgjmc+"&qx="+qx;

    window.open(thisPath+srcFile,"pad");
}


//分户账
function forDetailFhz(fgjbm,fgjmc,qx)
{
	var nodeKey = document.getElementById("xx").value;//节点的key值
	
    var lydm = nodeKey.split("</C>")[1];
    
    var srcFile = "/modules/zbjgl/zbjFhz.jsp?lydm="+lydm;

    window.open(thisPath+srcFile,"pad");
}
//质保金申请单
function forzbjsqdcx(fgjbm,fgjmc,qx)
{
	var nodeKey = document.getElementById("xx").value;//节点的key值
	//alert(nodeKey);
    var lydm = nodeKey.split("</C>")[1];
    
    var srcFile = "/modules/zbjxxdetail/zbjsqdcx.jsp?lydm="+lydm;

    window.open(thisPath+srcFile,"pad");
}
//<bean:message key="button.detail" bundle=""/>质保金明细<bean:message key="button.query" bundle=""/>
function forZbjmxcx(fgjbm,fgjmc,qx)
{
	var nodeKey = document.getElementById("xx").value;//节点的key值
	//alert(nodeKey);
    var lydm = nodeKey.split("</C>")[1];
    
    var srcFile = "/modules/zbjxxdetail/zbjsymx.jsp?lydm="+lydm;

    window.open(thisPath+srcFile,"pad");
}
//<bean:message key="button.detail" bundle=""/>维修资金楼幢总账
function forWxjjlyzz(fgjbm,fgjmc,qx)
{
	var nodeKey = document.getElementById("xx").value;//节点的key值
	//alert(nodeKey);
    var lydm = nodeKey.split("</C>")[1];
    
    var srcFile = "/modules/wxjjdetail/wxjjlyzz.jsp?lydm="+lydm;

    window.open(thisPath+srcFile,"pad");
}

//<bean:message key="button.detail" bundle=""/>维修资金楼幢总账明细
function forWxjjlyzzmx(fgjbm,fgjmc,qx)
{
	var nodeKey = document.getElementById("xx").value;//节点的key值
	//alert(nodeKey);
    var lydm = nodeKey.split("</C>")[1];
    
    var srcFile = "/modules/wxjjdetail/wxjjlyzzmx.jsp?lydm="+lydm;

    window.open(thisPath+srcFile,"pad");
}

//增加房屋
function forInsertFw(fgjbm,fgjmc,qx)
{
    
    var srcFile = "/fwxxglAction.do?fgj_bm="+fgjbm+"&fgj_mc="+fgjmc+"&qx="+qx;

    window.open(thisPath+srcFile,"pad");
}

//<bean:message key="button.modify" bundle=""/>房屋
function forUpdateFw(fgjbm,fgjmc,qx)
{	
	var nodeKey = document.getElementById("nodeInfo").value;//节点的key值
	
    var id = nodeKey.split("</C>")[0];
   // alert(id);
    var srcFile = thisPath+"/fwxxglAction.do?fgj_bm="+fgjbm+"&fgj_mc="+fgjmc+"&qx="+qx+"&bz=tree&id="+id;
    var winFeatures = "dialogHeight:500px;dialogWidth:800px;help:no;status:no";
    args = {};
    
    var inArray = window.showModalDialog(srcFile, args, winFeatures);

    if (inArray != null)
    {
    	var array_Elem=inArray.split("|");
    	
        fwxxglBean.updateTSFwxx(id,array_Elem[0],
        {
            callback:function(data)
            {
                if(data > 0)
                {
                	alert("成功。");
                	
                }
                else
                	alert("失败。");
            },
            exceptionHandler:function(err_info)
            { 
                if (err_info!="")
                {
                    alert(err_info);
                    window.open(thispath+"/logonAction.do?"+new Date(),"_parent");
                }
              }
        });    
    }
  }

//以图形方式展开
function forGUI(fgjbm,fgjmc,qx)
{
    var nodeKey = document.getElementById("xx").value;//节点的key值
	
	//节点类型，楼幢代码，楼幢编号，小区名称
    var info = nodeKey.split("</C>")[6]+"</C>"+nodeKey.split("</C>")[1]+
    "</C>"+nodeKey.split("</C>")[2]+"</C>"+nodeKey.split("</C>")[4];
  
    var menuString = "" ;
    
    for(var i = 0; i<menu.length; i++)
    {
    	menuString +=menu[i].join("</C>")+"</R>";
    }
    
    document.forms[0].menu.value = menuString;
   
    var srcFile = "/fwGUIAction.do?info="+info;
   
    var form = document.forms[0];
    
    form.action = thisPath + srcFile;
    
    form.method = "post";
    
    form.target = "pad";
    
    form.submit();
    
    

    //window.open(thisPath+srcFile,"pad");
}


//<bean:message key="button.detail" bundle=""/>业主信息
function forDetailYz(fgjbm,fgjmc,qx)
{
	var nodeKey = document.getElementById("nodeInfo").value;//节点的key值
	
    var id = nodeKey.split("</C>")[3];
    
    var srcFile = "/modules/xxjd/yzxxgl/jsp/yzxxglDetail.jsp?id="+id;

    window.open(thisPath+srcFile,'','height=200, width=550, top=30, left=250, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no');
}


//<bean:message key="button.detail" bundle=""/>维修资金分户账
function forDetailWxzj(fgjbm,fgjmc,qx)
{
	var nodeKey = document.getElementById("nodeInfo").value;//节点的key值
	
    var id = nodeKey.split("</C>")[1];
    
    var srcFile = "/modules/wxjjgl/showFhz.jsp?id="+id;

    window.open(thisPath+srcFile,'','height=200, width=550, top=30, left=250, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no');
}


//刷新树节点
function forRefresh()
{
	
    if(!node.opened)
    {
		return;
	}
    
	var nodeKey = document.getElementById("xx").value;
	var children = node.children;
    var lyOrFgj = nodeKey.split("</C>")[6];//判断父节点是楼幢还是房管局
    var dept = nodeKey.split("</C>")[1];
    var childrenInfo = [];
    var refreshNode = [];
    
    for(var i = 0; i< children.length; i++)
    {
    	childrenInfo[i] = children[i].getKey();
    }
    
	LyTree.queryTree(dept,lyOrFgj,
    {
        callback:function(data)
        {
            var rowsElements = data.split("</R>");
            
         	if(lyOrFgj == 'F')
         	{
         		
         		for(var i = 0; i<rowsElements.length-1; i++)
         		{
         			var colsElements = rowsElements[i].split("|");
         			
         			if(colsElements[1] == 'X')
         			{
         			    var bz = 0;
         			    var xqInfo = colsElements[0].split("</C>");
         			    var id = xqInfo[0];
         			    
         				for(var j = 0; j<childrenInfo.length; j++)
         				{
         					var colsInfo = childrenInfo[j].split("</C>");
         					
         					if(colsInfo[6] == 'X'&&colsInfo[0] == id)
         					{
         						bz = 1;
         						break;
         					}
         						
         				}
         				
         				if(bz == 0)
         				{
         					tmpNode=tree1.addDefaultNode(node,xqInfo[2],colsElements[0]+"</C>"+colsElements[1],"","xq_grey");
         				}
         				
         			}
         			
         			else continue;
         		}
         	}
         	else if(lyOrFgj=='X')
         	{
         		for(var i = 0; i<rowsElements.length-1; i++)
         		{
         			var colsElements = rowsElements[i].split("|");
         			var bz = 0;
         			var xqInfo = colsElements[0].split("</C>");
         			var id = xqInfo[0];
         			    
         		    for(var j = 0; j<childrenInfo.length; j++)
         			{
         				var colsInfo = childrenInfo[j].split("</C>");
         					
         				if(colsInfo[0] == id)
         				{
         					bz = 1;
         					break;
         				}
         						
         			}
         				
         			if(bz == 0)
         			{
         				tmpNode=tree1.addDefaultNode(node,xqInfo[2],colsElements[0]+"</C>"+colsElements[1],"","ly");
						tmpNode.icon.src=tree1.imageList.item["collapse_xp"].src;
         			}
         			
         		}
            }
          
        },
        exceptionHandler:function(err_info)
        { 
            if (err_info!="")
            {
                alert(err_info);
                window.open("logoffAction.do?"+new Date(),"_parent");
            }
            else
            {
                window.open("logoffAction.do?"+new Date(),"_parent");
            }
        }
    }); 
	

}

