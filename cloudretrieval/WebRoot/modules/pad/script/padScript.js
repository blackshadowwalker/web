
//系统提示信息
function forxtts()
{
	dwr.engine.setAsync(false);
	
	var xx ="";
	 
	var thispath= document.getElementById("this_path_id").value;
 
    padBean.getxtxx('user_code',{
            
            callback:function(data){
             	
                if(data=="")
                {
                	xx+="<tr> <td><br><br><br><br><br></td></tr> <tr>";
                	xx+=" <td align='center'><img src='"+thispath+"/modules/pad/image/chushi_jlb22.gif' width='500' height='285'></td> </tr></table>";
                }
                else
                {
                	xx+=data;
                } //waitObj.hide();
            },
            
            exceptionHandler:function(err_info){
                alert(err_info);
                if(err_info!=""){
                        
                    alert(err_info);
                    
                    
                }
            }
        });
        
        document.getElementById("xxxs").innerHTML=xx;
        dwr.engine.setAsync(true);
}
//<bean:message key="button.detail" bundle="${language}"/>详情
function forjwrw(id)
{

	dwr.engine.setAsync(false);   
   var height=window.screen.availHeight-100;
   var windth=window.screen.availWidth-150;
 	
 	var thispath= document.getElementById("this_path_id").value;
    
     var srcFile = thispath+"/modules/oa/jwrwzdy/jsp/forwhry.jsp";
    var winFeatures = "dialogHeight:"+height+"px;dialogWidth:"+windth+"px;help:no;status:no";
    
    var huifu = window.showModalDialog(srcFile, id, winFeatures);
 
  	if(huifu==1)
  	{
 		forxtts();
	}
	dwr.engine.setAsync(true);
}

function sj()
{
	var thispath= document.getElementById("this_path_id").value;
	
	 var innerHTML="<table width=100% cellSpacing=1 cellPadding=0 border=1 >";
        

	padBean.getxtxx2(
	 
	 {
		callback : function(data) {

			if (data != "" && data != "no") {
	
			var xx = data.split("</R>");
			
			
			
			for(var i =0;i<xx.length-1;i++)
			{
				 var n = i+1;
				
				
				 innerHTML+="<tr bgcolor='#F8FCFF'><td>"+n+"、"+xx[i]+"</td></tr>";
			
			}
			innerHTML +="</table>"

			// document.all('table_div2').innerHTML=innerHTML;	

			} else {
			
				innerHTML+="<tr bgcolor='#F8FCFF'><td></td><td>无系统消息</td></tr>";
				innerHTML +="</table>";
			//	document.all('table_div2').innerHTML=innerHTML;
					

			}
			
			bz = 1;
		},
		exceptionHandler : function(err_info) {

			

			if (err_info != "") {
				alert(err_info);
				window.open(thispath + "/logoffAction.do?" + new Date(),
						"_parent");
			} else {
				alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
				window.open(thispath + "/logoffAction.do?" + new Date(),
						"_parent");
			}
		}
	});
	
}


function ckqjjh(rowID)
{
	var thispath= document.getElementById("this_path_id").value;
	
	var srcFile = thispath+"/modules/oa/qjjh/jsp/qjjhDetail.jsp";
    var winFeatures = "dialogHeight:200px;dialogWidth:600px;help:no;status:no";

    window.showModalDialog(srcFile, rowID, winFeatures);
}


function ckxjxx(rowID,bz)
{
	var thispath= document.getElementById("this_path_id").value;
	
	if(bz=="1")
 	{   
	    var srcFile = thispath+"/modules/oa/jqgl/jsp/jqglDetail.jsp";
	    
    }
    if(bz=="2")
 	{   
	    var srcFile =thispath+"/modules/oa/jqgl/jsp/jqgl_njDetail.jsp";
	    
    }
    if(bz=="3")
 	{   
	    var srcFile = thispath+"/modules/oa/jqgl/jsp/jqgl_sjDetail.jsp";
	    
    }
    var winFeatures = "dialogHeight:450px;dialogWidth:600px;help:no;status:no";
	
	window.showModalDialog(srcFile, rowID, winFeatures);
}


function forzhzx()
{
	dwr.engine.setAsync(false);
	
	var xx ="";
	 
	var thispath= document.getElementById("this_path_id").value;
 
    padBean.getzhzx('20110301',{
            
            callback:function(data){
             
                if(data=="")
                {
                	xx+="<tr> <td><br><br><br><br><br></td></tr> <tr>";
                	xx+=" <td align='center'><img src='"+thispath+"/modules/pad/image/chushi_jlb22.gif' width='500' height='285'></td> </tr></table>";
                }
                else
                {
                	xx+="<br><font size='+1' color='#FF0000'>注：及时提醒领导进行待办事项审批</font>"+data;
                }
            },
            
            exceptionHandler:function(err_info){
                alert(err_info);
                if(err_info!=""){
                        
                    alert(err_info);
                    
                    
                }
            }
        });
        
        document.getElementById("zhzx").innerHTML=xx;
        dwr.engine.setAsync(true);
}
//警员在位
function forxj()
{
	var width = window.screen.width;
	var height = window.screen.height;
	var thispath= document.getElementById("this_path_id").value;
 
	var srcFile = thispath+"/modules/oa/zdzb/jsp/zdzbry_cx.jsp";
    var winFeatures = "dialogHeight:"+height+"px;dialogWidth:"+width+"px;help:no;status:no";

    window.showModalDialog(srcFile, "", winFeatures);

/**
	 dwr.engine.setAsync(false);
	 var thispath= document.getElementById("this_path_id").value;
	 document.getElementById("xxxs").innerHTML="<br><br><br><br><br><br><br><br><br><br><br><br><br><img src='"+thispath+"/modules/pad/image/wait.gif' width='32' height='32'>正在<bean:message key="button.query" bundle="${language}"/>数据,请稍后......";
	var xx ="";
	 xx+="<br><font color='#0000FF' size='5'><strong>警员在位情况统计</strong></font>";
	xx+="<hr>"
	xx+="<table width='100%' border='1' bordercolor='#000000' align='center' cellpadding='0' cellspacing='0' >"
  	xx+="<tr bgcolor='#EEF5F2'> "
   	xx+=" <td > <div align='center'><font color='#0000FF'><strong>单位名称</strong></font></div></td>"
    xx+="<td > <div align='center'><font color='#0000FF'><strong>在位人数</strong></font></div></td>"
    xx+="<td > <div align='center'><font color='#0000FF'><strong>缺勤人数</strong></font></div></td>"
    xx+="<td > <div align='center'><font color='#0000FF'><strong>休班人数</strong></font></div></td>"
    xx+="<td > <div align='center'><font color='#0000FF'><strong>探亲假人数</strong></font></div></td>"
    xx+="<td > <div align='center'><font color='#0000FF'><strong>公休假人数</strong></font></div></td>"
    xx+="<td > <div align='center'><font color='#0000FF'><strong>请假人数</strong></font></div></td>"
 
    xx+=" </tr>";
 
    padBean.getpadxx('20110301',{
            
            callback:function(data){
             	
                xx+=data;
                xx+="</table>";
                 document.getElementById("xxxs").innerHTML=xx;
            },
            
            exceptionHandler:function(err_info){
                alert(err_info);
                if(err_info!=""){
                        
                    alert(err_info);
                    
                    
                }
            }
        });
        
       
        dwr.engine.setAsync(true);
        **/
}
function forrwqk()
{dwr.engine.setAsync(false);
 var thispath= document.getElementById("this_path_id").value;
	 document.getElementById("xxxs").innerHTML="<br><br><br><br><br><br><br><br><br><br><br><br><br><img src='"+thispath+"/modules/pad/image/wait.gif' width='32' height='32'>正在<bean:message key="button.query" bundle="${language}"/>数据,请稍后......";
	var xx="";
	xx+="<br>"
    xx+=" <div align='center'><font color='#0000FF' size='5'><strong>任务情况统计</strong></font></div>"
	xx+="<hr>"
	xx+="<table width='100%'  border='1' bordercolor='#000000' align='center' cellpadding='0' cellspacing='0' >"
  	xx+="<tr bgcolor='#EEF5F2'> "
  	xx+=" <td > <div align='center'><font color='#0000FF'><strong>单位名称</strong></font></div></td>"
   	xx+=" <td > <div align='center'><font color='#0000FF'><strong>发布任务数</strong></font></div></td>"
  	xx+="  <td > <div align='center'><font color='#0000FF'><strong>当日任务总数</strong></font></div></td>"
   	xx+=" <td > <div align='center'><font color='#0000FF'><strong>需完成任务数</strong></font></div></td>"
  	xx+=" <td > <div align='center'><font color='#0000FF'><strong>已完成任务数</strong></font></div></td>"
   	xx+=" <td > <div align='center'><font color='#0000FF'><strong>上日未完成任务数</strong></font></div></td>"
  
 
  	xx+="</tr>"

 
  padBean.getrwxx('20110301',{
            
            callback:function(data){
             	
                xx+=data;
                xx+="</table>";
                document.getElementById("xxxs").innerHTML=xx;
            },
            
            exceptionHandler:function(err_info){
                alert(err_info);
                if(err_info!=""){
                        
                    alert(err_info);
                    
                    
                }
            }
        });
         
        dwr.engine.setAsync(true);
        
 
}
//<bean:message key="button.detail" bundle="${language}"/>未完成的任务
function getrwzx()
{dwr.engine.setAsync(false);
 var thispath= document.getElementById("this_path_id").value;
	 document.getElementById("xxxs").innerHTML="<br><br><br><br><br><br><br><br><br><br><br><br><br><img src='"+thispath+"/modules/pad/image/wait.gif' width='32' height='32'>正在<bean:message key="button.query" bundle="${language}"/>数据,请稍后......";
	var xx="";
	
  	
  	xx+="<br><table width='100%' border='1' bordercolor='#000000' align='center' cellpadding='0' cellspacing='0' >";
	        		xx+="<tr bgcolor='#ffffff'>";
		        	xx+="<td colspan='4'> <div align='center'><font color='#000000' ><strong>任务未完成机构</strong></font></div></td>";
		        	
		        	xx+="</tr>";
		        	xx+="<tr bgcolor='#0060f9'>";
		        	xx+="<td width='20%'> <div align='center'><font color='#ffffff'><strong>任务名称</strong></font></div></td>";
		        	xx+="<td width='70%'> <div align='center'><font color='#ffffff'><strong>未完成单位</strong></font></div></td>";
		        	
		        	xx+="<td width='10%'> <div align='center'><font color='#ffffff'><strong>操作</strong></font></div></td>";
		        	xx+="</tr>";

 
  padBean.getrwzx({
            
            callback:function(data){
             	
                xx+=data;
                xx+="</table>";
                document.getElementById("xxxs").innerHTML=xx;
            },
            
            exceptionHandler:function(err_info){
                alert(err_info);
                if(err_info!=""){
                        
                    alert(err_info);
                    
                    
                }
            }
        });
         
        dwr.engine.setAsync(true);
        
 
}

function rwck(id)
{
	dwr.engine.setAsync(false);
	
    var rowID=id;
    

    var role_code = $("#role_code_id").val();
    var thispath= document.getElementById("this_path_id").value;
    var zxbz = 1;
   	
   	//评价分为三级 ddz ddzw 为一级  fddz  为二级 科室领导为三级
   
   	if(role_code=="fddz")
   	{
   		//判断副大队长是否对该任务的发起部门有分管权限；
   		
   		rwglxxBean.forsffg(parseInt(rowID),
	    {
	        callback:function(data)
	        {
	             if (data == 0)
	             {
	                 alert("您没有分管任务发起单位，不能对该任务进行评价!");
	                 zxbz =0;
	                 return false;
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
   	
   	if(zxbz==0)
   	{

   		return ;
   	}
   	var height=window.screen.availHeight-20;
    var windth=window.screen.availWidth;
  
    if(role_code=="fddz"||role_code=="ddz"||role_code=="ddzw")
    {
    	var srcFile = thispath+"/modules/oa/rwpj/jsp/rwpj_sj.jsp?rowID="+rowID;
    	//var winFeatures = "dialogHeight:600px;dialogWidth:800px;help:no;status:no";
    	
    	var winFeatures = "height="+height+"px,width="+windth+"px,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no";
	
    }
    else{
   	var srcFile = thispath+"/modules/oa/rwpj/jsp/rwpj.jsp?rowID="+rowID;
    //var winFeatures = "dialogHeight:600px;dialogWidth:800px;help:no;status:no";
   
	var winFeatures = "height="+height+"px,width="+windth+"px,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no";
	
    }

    //window.showModalDialog(srcFile, rowID, winFeatures);
   window.open(srcFile, rowID, winFeatures);
    dwr.engine.setAsync(true);
}

function forrwqr(id)
{
	padBean.forrwqr(id,{
            
            callback:function(data){
             	
               alert("确认完毕！");
                getrwzx();
            },
            
            exceptionHandler:function(err_info){
                alert(err_info);
                if(err_info!=""){
                        
                    alert(err_info);
                    
                    
                }
            }
        });
         
}

//<bean:message key="button.detail" bundle="${language}"/>任务执行情况       
 function ckrw(dept_code,bz)
 {
 	var thispath= document.getElementById("this_path_id").value;
	var srcFile = thispath+"/modules/pad/jsp/ryzx.jsp";
	var winFeatures = "dialogHeight:600px;dialogWidth:400px;help:no;status:no";

	window.showModalDialog(srcFile, dept_code+"</C>"+bz, winFeatures);
 }
//<bean:message key="button.detail" bundle="${language}"/>人员在位情况       
 function ckqjjh(dept_code,bz)
 {
 	var thispath= document.getElementById("this_path_id").value;
	var srcFile = thispath+"/modules/pad/jsp/ryzw.jsp";
	var winFeatures = "dialogHeight:500px;dialogWidth:400px;help:no;status:no";

	window.showModalDialog(srcFile, dept_code+"</C>"+bz, winFeatures);
 }
 
 var subWin;
 //进行任务的执行
 function forzxrw(sffk,rowID)
{
	
	dwr.engine.setAsync(false);
    var thispath= document.getElementById("this_path_id").value;
    if(sffk=="1")
    {
    	var srcFile = thispath+"/modules/oa/rwzx/jsp/rwzx.jsp?rowID="+rowID;
  
    	var height=window.screen.availHeight;
    	
    	var windth=window.screen.availWidth;
    	var winFeatures = "height="+height+"px,width="+windth+"px,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no";
    }
    else{
   	var srcFile = thispath+"/modules/oa/rwzx/jsp/rwzx_wx.jsp?rowID="+rowID;
  
		var height=window.screen.availHeight;
    	var windth=window.screen.availWidth;
    	var winFeatures = "height="+height+"px,width="+windth+"px,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no";
    }

    subWin=window.open(srcFile, rowID, winFeatures);
    
  	examTimeout();
   
    

    dwr.engine.setAsync(true);
}
//取消请假申请
function forjqqxsp(rowID)
{
     var thispath= document.getElementById("this_path_id").value;
    
    
    
    var srcFile = thispath+"/modules/oa/qjqx/jsp/qjqxUpdate.jsp?rowID="+rowID;
    
    var height=window.screen.availHeight-20;
    var windth=window.screen.availWidth;      

   	var winFeatures = "height="+height+"px,width="+windth+"px,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no";
	
  	 subWin = window.open(srcFile, "", winFeatures);
 
  	examTimeout();

}

//请假审批
function forqjsp(bz,rowID)
{
    var thispath= document.getElementById("this_path_id").value;
    
    if(bz=="1")
 	{   
	  	var srcFile = thispath+"/modules/oa/qjsp/jsp/qjspUpdate.jsp?rowID="+rowID;
    	
    }
    if(bz=="2")
 	{   
	     var srcFile = thispath+"/modules/oa/qjsp/jsp/jqgl_njUpdate.jsp?rowID="+rowID;
    	
    }
    if(bz=="3")
 	{   
	     var srcFile = thispath+"/modules/oa/qjsp/jsp/jqgl_sjUpdate.jsp?rowID="+rowID;
    	
    }

    
     //获得窗口的垂直位置
    var iTop = (window.screen.availHeight-30-600)/2;        
    //获得窗口的水平位置
    var iLeft = (window.screen.availWidth-10-800)/2;           
    

    var winFeatures = "dialogHeight:600px,dialogWidth:800px,scrollbars=yes, resizable=yes;";
    
    subWin = window.open(srcFile, "", winFeatures);
 
  	examTimeout();

    
}
//进行任务签售

function forqs(id)
{
	padBean.forqs(id,{
            
            callback:function(data){
             	
               alert("签收成功！");
                forxtts();
            },
            
            exceptionHandler:function(err_info){
                alert(err_info);
                if(err_info!=""){
                        
                    alert(err_info);
                    
                    
                }
            }
        });
         
}

function forcsxj(id)
{
	padBean.forcsxj(id,{
            
            callback:function(data){
             	
               alert("查收成功！");
                forxtts();
            },
            
            exceptionHandler:function(err_info){
                alert(err_info);
                if(err_info!=""){
                        
                    alert(err_info);
                    
                    
                }
            }
        });
         
}
//审批公文
function forspgw(spr,lrr,rowID)
{
	
    var thispath= document.getElementById("this_path_id").value;
   var bz=0;
    if(lrr==spr)
    {
    	bz =1;
    }
    else
    {
    	bz=2;
    }
    var srcFile = thispath+"/modules/oa/gwlz/jsp/gwlzsp.jsp?bz="+bz+"&&rowID="+rowID;
  
   
    
         //获得窗口的垂直位置
    var iTop = (window.screen.availHeight-30-600)/2;        
    //获得窗口的水平位置
    var iLeft = (window.screen.availWidth-10-800)/2;           
    

    var winFeatures = "dialogHeight:600px,dialogWidth:800px,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no";
    
 	subWin = window.open(srcFile, rowID, winFeatures);
   
  	examTimeout();
}

//审批公文
function forcpdsh(rowID)
{
	
    var thispath= document.getElementById("this_path_id").value;
    var srcFile = thispath+"/modules/oa/slqzts/jsp/cpb_sp.jsp?rowID="+rowID;

       
    

    var winFeatures = "dialogHeight:600px,dialogWidth:800px,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no";
    
 	subWin = window.open(srcFile, rowID, winFeatures);
   
  	examTimeout();
}

function forldxx(id)
{
dwr.engine.setAsync(false);   
   var height=window.screen.availHeight-100;
   var windth=window.screen.availWidth-150;
 	var thispath= document.getElementById("this_path_id").value;
    var srcFile =thispath+"/modules/oa/ldxx/jsp/ldxxUpdate.jsp?rowID="+id;
    var winFeatures = "dialogHeight:"+height+"px;dialogWidth:"+windth+"px;help:no;status:no";
    
    var huifu = window.showModalDialog(srcFile, "", winFeatures);
  if(huifu==1)
  {
 			 forxtts();
	}
	dwr.engine.setAsync(true);
}



function fordxhd(id)
{

	dwr.engine.setAsync(false);   
   var height=window.screen.availHeight-100;
   var windth=window.screen.availWidth-150;
 	
 	var thispath= document.getElementById("this_path_id").value;
    
     var srcFile = thispath+"/modules/oa/dxhd/jsp/forwhry.jsp";
    var winFeatures = "dialogHeight:"+height+"px;dialogWidth:"+windth+"px;help:no;status:no";
    
    var huifu = window.showModalDialog(srcFile, id, winFeatures);
 
  	if(huifu==1)
  	{
 		forxtts();
	}
	dwr.engine.setAsync(true);
}

function updateArgs()
{
    var rowID = 0;
}
function fortzdhf(id)
{
dwr.engine.setAsync(false);
	var thispath= document.getElementById("this_path_id").value;   
   var srcFile = thispath+"/modules/oa/tzd/jsp/tzdUpdate.jsp";
    var winFeatures = "dialogHeight:500px;dialogWidth:800px;help:no;status:no";
    
    args = new updateArgs();
    args.rowID=id;
   
    var fanhui = window.showModalDialog(srcFile, args, winFeatures);
    
    if(fanhui==1)
    {
  		forxtts();
  	}
	dwr.engine.setAsync(true);
}
//通知单审核
function fortzdsh(id)
{dwr.engine.setAsync(false);
	
   var thispath= document.getElementById("this_path_id").value;   
    
    var srcFile = thispath+"/modules/oa/tzd/jsp/tzd_sh.jsp";
    var winFeatures = "dialogHeight:500px;dialogWidth:800px;help:no;status:no";

    var fanhui =window.showModalDialog(srcFile, id, winFeatures);
   
    if(fanhui==1)
    {
  		forxtts();
  	}
  	dwr.engine.setAsync(true);
}
function forcktzd(id)
{

	var thispath= document.getElementById("this_path_id").value;   
   var srcFile = thispath+"/modules/oa/tzd/jsp/tzdDetail.jsp";
    var winFeatures = "dialogHeight:500px;dialogWidth:800px;help:no;status:no";
   
   
 	window.showModalDialog(srcFile, id, winFeatures);
    
    
}


//关闭页面后调用的
function examTimeout(){
        setInterval("refreshWin()",1000); 
    }
    
    
    function refreshWin(){
    	if(subWin!=null)
    	{
        if(subWin.closed) {
        	subWin=null;
            forxtts();
        }
        }
    }
    
  