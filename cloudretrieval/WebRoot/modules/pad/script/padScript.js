
//ϵͳ��ʾ��Ϣ
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
//<bean:message key="button.detail" bundle="${language}"/>����
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
				
				
				 innerHTML+="<tr bgcolor='#F8FCFF'><td>"+n+"��"+xx[i]+"</td></tr>";
			
			}
			innerHTML +="</table>"

			// document.all('table_div2').innerHTML=innerHTML;	

			} else {
			
				innerHTML+="<tr bgcolor='#F8FCFF'><td></td><td>��ϵͳ��Ϣ</td></tr>";
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
                	xx+="<br><font size='+1' color='#FF0000'>ע����ʱ�����쵼���д�����������</font>"+data;
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
//��Ա��λ
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
	 document.getElementById("xxxs").innerHTML="<br><br><br><br><br><br><br><br><br><br><br><br><br><img src='"+thispath+"/modules/pad/image/wait.gif' width='32' height='32'>����<bean:message key="button.query" bundle="${language}"/>����,���Ժ�......";
	var xx ="";
	 xx+="<br><font color='#0000FF' size='5'><strong>��Ա��λ���ͳ��</strong></font>";
	xx+="<hr>"
	xx+="<table width='100%' border='1' bordercolor='#000000' align='center' cellpadding='0' cellspacing='0' >"
  	xx+="<tr bgcolor='#EEF5F2'> "
   	xx+=" <td > <div align='center'><font color='#0000FF'><strong>��λ����</strong></font></div></td>"
    xx+="<td > <div align='center'><font color='#0000FF'><strong>��λ����</strong></font></div></td>"
    xx+="<td > <div align='center'><font color='#0000FF'><strong>ȱ������</strong></font></div></td>"
    xx+="<td > <div align='center'><font color='#0000FF'><strong>�ݰ�����</strong></font></div></td>"
    xx+="<td > <div align='center'><font color='#0000FF'><strong>̽�׼�����</strong></font></div></td>"
    xx+="<td > <div align='center'><font color='#0000FF'><strong>���ݼ�����</strong></font></div></td>"
    xx+="<td > <div align='center'><font color='#0000FF'><strong>�������</strong></font></div></td>"
 
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
	 document.getElementById("xxxs").innerHTML="<br><br><br><br><br><br><br><br><br><br><br><br><br><img src='"+thispath+"/modules/pad/image/wait.gif' width='32' height='32'>����<bean:message key="button.query" bundle="${language}"/>����,���Ժ�......";
	var xx="";
	xx+="<br>"
    xx+=" <div align='center'><font color='#0000FF' size='5'><strong>�������ͳ��</strong></font></div>"
	xx+="<hr>"
	xx+="<table width='100%'  border='1' bordercolor='#000000' align='center' cellpadding='0' cellspacing='0' >"
  	xx+="<tr bgcolor='#EEF5F2'> "
  	xx+=" <td > <div align='center'><font color='#0000FF'><strong>��λ����</strong></font></div></td>"
   	xx+=" <td > <div align='center'><font color='#0000FF'><strong>����������</strong></font></div></td>"
  	xx+="  <td > <div align='center'><font color='#0000FF'><strong>������������</strong></font></div></td>"
   	xx+=" <td > <div align='center'><font color='#0000FF'><strong>�����������</strong></font></div></td>"
  	xx+=" <td > <div align='center'><font color='#0000FF'><strong>�����������</strong></font></div></td>"
   	xx+=" <td > <div align='center'><font color='#0000FF'><strong>����δ���������</strong></font></div></td>"
  
 
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
//<bean:message key="button.detail" bundle="${language}"/>δ��ɵ�����
function getrwzx()
{dwr.engine.setAsync(false);
 var thispath= document.getElementById("this_path_id").value;
	 document.getElementById("xxxs").innerHTML="<br><br><br><br><br><br><br><br><br><br><br><br><br><img src='"+thispath+"/modules/pad/image/wait.gif' width='32' height='32'>����<bean:message key="button.query" bundle="${language}"/>����,���Ժ�......";
	var xx="";
	
  	
  	xx+="<br><table width='100%' border='1' bordercolor='#000000' align='center' cellpadding='0' cellspacing='0' >";
	        		xx+="<tr bgcolor='#ffffff'>";
		        	xx+="<td colspan='4'> <div align='center'><font color='#000000' ><strong>����δ��ɻ���</strong></font></div></td>";
		        	
		        	xx+="</tr>";
		        	xx+="<tr bgcolor='#0060f9'>";
		        	xx+="<td width='20%'> <div align='center'><font color='#ffffff'><strong>��������</strong></font></div></td>";
		        	xx+="<td width='70%'> <div align='center'><font color='#ffffff'><strong>δ��ɵ�λ</strong></font></div></td>";
		        	
		        	xx+="<td width='10%'> <div align='center'><font color='#ffffff'><strong>����</strong></font></div></td>";
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
   	
   	//���۷�Ϊ���� ddz ddzw Ϊһ��  fddz  Ϊ���� �����쵼Ϊ����
   
   	if(role_code=="fddz")
   	{
   		//�жϸ���ӳ��Ƿ�Ը�����ķ������зֹ�Ȩ�ޣ�
   		
   		rwglxxBean.forsffg(parseInt(rowID),
	    {
	        callback:function(data)
	        {
	             if (data == 0)
	             {
	                 alert("��û�зֹ�������λ�����ܶԸ������������!");
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
             	
               alert("ȷ����ϣ�");
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

//<bean:message key="button.detail" bundle="${language}"/>����ִ�����       
 function ckrw(dept_code,bz)
 {
 	var thispath= document.getElementById("this_path_id").value;
	var srcFile = thispath+"/modules/pad/jsp/ryzx.jsp";
	var winFeatures = "dialogHeight:600px;dialogWidth:400px;help:no;status:no";

	window.showModalDialog(srcFile, dept_code+"</C>"+bz, winFeatures);
 }
//<bean:message key="button.detail" bundle="${language}"/>��Ա��λ���       
 function ckqjjh(dept_code,bz)
 {
 	var thispath= document.getElementById("this_path_id").value;
	var srcFile = thispath+"/modules/pad/jsp/ryzw.jsp";
	var winFeatures = "dialogHeight:500px;dialogWidth:400px;help:no;status:no";

	window.showModalDialog(srcFile, dept_code+"</C>"+bz, winFeatures);
 }
 
 var subWin;
 //���������ִ��
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
//ȡ���������
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

//�������
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

    
     //��ô��ڵĴ�ֱλ��
    var iTop = (window.screen.availHeight-30-600)/2;        
    //��ô��ڵ�ˮƽλ��
    var iLeft = (window.screen.availWidth-10-800)/2;           
    

    var winFeatures = "dialogHeight:600px,dialogWidth:800px,scrollbars=yes, resizable=yes;";
    
    subWin = window.open(srcFile, "", winFeatures);
 
  	examTimeout();

    
}
//��������ǩ��

function forqs(id)
{
	padBean.forqs(id,{
            
            callback:function(data){
             	
               alert("ǩ�ճɹ���");
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
             	
               alert("���ճɹ���");
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
//��������
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
  
   
    
         //��ô��ڵĴ�ֱλ��
    var iTop = (window.screen.availHeight-30-600)/2;        
    //��ô��ڵ�ˮƽλ��
    var iLeft = (window.screen.availWidth-10-800)/2;           
    

    var winFeatures = "dialogHeight:600px,dialogWidth:800px,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no";
    
 	subWin = window.open(srcFile, rowID, winFeatures);
   
  	examTimeout();
}

//��������
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
//֪ͨ�����
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


//�ر�ҳ�����õ�
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
    
  