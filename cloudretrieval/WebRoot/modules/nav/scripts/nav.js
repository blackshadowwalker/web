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

function writeData(thispath,user_code){
    dwr.engine.setAsync(false);
    navBean.getMenu("0",null,
    {
        callback:function(data)
        { 
          if(data!="")
          {
	        	var data_arrays=data.split(";");
	       		var length=data_arrays.length;
	        	for(var i=0;i<length-1;i++){
	            	var sub_data_array=data_arrays[i].split(",");
	            	if(sub_data_array[3]=="" || sub_data_array[3]=="null")
	            	{
	            		//sub_data_array[3]=="" 说明还有下级菜单
	            		document.write("<td class='menuitem'>" +
	                			"<a class=\"link_bai14b\" id=\"a_css"+(i+1)+"\" " +
	                					"href='javascript:changeMenu(\""+thispath+"\",\""+sub_data_array[0]+"\",\""+user_code+"\",\""+(i+1)+"\",\""+(length-1)+"\")'  " +
	                			">"+sub_data_array[1]+"</a></td>");
	            	}
	            	else
	            	{
	               		if(sub_data_array[5]=="1")
	               		{//外部系统权限
	               			var tmpUrl="";
	               			if(sub_data_array[3].indexOf("http://")<0){
	               				tmpUrl="http://";
	               			}
	               			if(sub_data_array[3].indexOf("?")<0){
	               				tmpUrl+=sub_data_array[3]+"?user_code="+user_code;
	               			}
	               			else{
	               				tmpUrl+=sub_data_array[3]+"&user_code="+user_code;
	               			}
	               			document.write("<td class='menuitem'><a id=\"a_css"+(i+1)+"\" href='"+tmpUrl+"' target='pad' onclick='controlCss(\""+(i+1)+"\",\""+(length-1)+"\")'>"+sub_data_array[1]+"</a></td>");
	               		}
	               		else
	               		{
		                	document.write("<td class='menuitem'><a id=\"a_css"+(i+1)+"\" href='"+thispath+sub_data_array[3]+"?qx="+sub_data_array[0]+"&dept_code="+sub_data_array[6]+"' onclick='controlCss(\""+(i+1)+"\",\""+(length-1)+"\")' target='pad'>"+sub_data_array[1]+"</a></td>");
	               		}
	            	}
	                
	            }
            }
            else
            {
            	document.write("<td class='menuitem' width='80%'></td>");
            }
        },
          
        exceptionHandler:function(err_info){ 
          
            if(err_info!=""){
                
                window.alert(err_info);
                
                window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
            }
            else{
                               
                window.alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
                
                window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
            }    
        }
    });
    
    dwr.engine.setAsync(true);
}

var win=window.top.menu
function changeMenu(path, rulecode,usercode, selfcss,total){
	controlCss(selfcss,total);//change color
	//alert(win)
	win.forSubmenu(path,rulecode,usercode); //get submenu
}
function controlCss(selfcss,total){
	for(var i=1;i<=total;i++){
		if(i==selfcss){
			document.getElementById("a_css"+i).style.color="#0F0";
		}
		else{
			document.getElementById("a_css"+i).style.color="#FFF";
		}
	}
}
