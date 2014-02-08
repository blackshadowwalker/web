<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="java.sql.*,modules.base.basePublic;"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>

<%
	String thisPath = request.getContextPath();
	
	//String type = request.getParameter("type").trim();
	
	String type="radio";
	
	String div_height="450px";
	
	int option_num=1;
	
	if(type.equals("radio")){
			
	}
	else if (type.equals("checkbox")){
		
		div_height="400px";
		option_num=5;
		
	}
%>

<head>
<base target="_self"/>
<title>差错选择列表</title>
<meta http-equiv="Expires" CONTENT="0">
<meta http-equiv="Cache-Control" CONTENT="no-cache">
<meta http-equiv="Pragma" CONTENT="no-cache">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<script type="text/javascript" src="<%=thisPath%>/dwr/interface/QuestionTree.js"></script>
<script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
<script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
<script src="<%=thisPath%>/modules/base/tree/alai_tree.js"></script>
<script src="<%=thisPath%>/modules/base/tree/alai_tree_question.js"></script>
<link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css">
<title></title>
</head>

<body>
<div class=cardbody>
  <table class="tablebox">
    <tr>
      <td>
        <div id="divTree1" style="width:100%;height:<%=div_height %>;overflow-x:auto;overflow-y:auto"></div>
      </td>
    </tr>
     <tr>
    	 <td>
	      	<div>
	        	词条问题：
	        	<input type="text" size="18" maxlength="18" id="query_ques_info">
	        	<input type="button" value="<bean:message key="button.query" bundle="${language}"/>" onclick="query_ques_info()"><br>
	        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	<select size="1" id="wtct_id" name="wtct" onchange="selectWtct()">
        			<option value=''>请点击选择...</option>
	        	</select>
	        </div>
	      </td> 
    
    </tr> 
    <tr>
      <td class=TDLeft>
        已选定的差错:
      </td>
    </tr>
    <tr>
    	<td>
    		<table>
    			<tr>
			      <td style="width:60%;"> 
			        <select name="select" size="<%=option_num%>" multiple id="sltName" style="width:600;" ondblclick="delSelectValue()"></select>
			      </td>
			     
			    </tr>
    		</table>
    	</td>
    </tr>
    <tr>
      <td>
<script>

    document.write("<button name=\"button\" onClick=\"forSure()\" class=\"button\">确定</button>");
    
</script>
        <button name="button" onClick="forAbort()" class="button">取消</button>
      </td>
    </tr>
  </table>
</div>

<%

	DataSource dataSource=(DataSource)this.getServletConfig().getServletContext().getAttribute("basedb");
	
	Connection con = null;
	
	PreparedStatement pstm = null;

	StringBuffer infoSB = new StringBuffer();

	ResultSet rs = null;
	
    try{
		con = dataSource.getConnection();
		
		pstm = con.prepareStatement("select id,bh,description,type,sj_bh  from t_s_wtfl where sj_bh=? and status=1");
		
		pstm.setString(1,"root");
		
		rs = pstm.executeQuery();
		
		while(rs!=null && rs.next()){
			
			infoSB.append(rs.getLong("id")).append("</C>");
			infoSB.append(rs.getString("bh")).append("</C>");
			infoSB.append(basePublic.out(rs.getString("description").trim())).append("</C>");
			infoSB.append(rs.getInt("type")).append("</C>");
			infoSB.append(rs.getString("sj_bh")).append("</R>");
			
		}
    }
    catch ( Exception e){
    	
    	e.printStackTrace();
    }
    finally{
		
    	if(rs!=null){
    		
    		try{
    			rs.close();
    			rs=null;
    		}
    		catch(SQLException sql){
    		}
    	}
    	
    	if(pstm!=null){
    		
    		try{
    			pstm.close();
    			pstm=null;
    		}
    		catch(SQLException sql){
    		}
    	}
    	
    	if(con!=null){
    		
    		try{
    			con.close();
    			con=null;
    		}
    		catch(SQLException sql){
    		}
    	}
    }
%>


<script>

/***************************************
		阿赖目录树控件应用示例
		
		type==0---多选机构树（id</C>身份证号</C>人员姓名</C>人员代码（可能为空）</C>所属机构编号</C>所属机构名称）
		type==1---单选机构树（id</C>身份证号</C>人员姓名</C>人员代码（可能为空）</C>所属机构编号</C>所属机构名称）
*******************************************/

/*
*	已选人员信息格式：
*
*	id</C>问题编号</C>描述</C>上级</C>层级</C>违规积分</R>
*/
var quesInfos = window.dialogArguments;

var tree1=new alai_tree_question(divTree1);

//当前节点
var curNode;

var root=tree1.root;


var info='<%=infoSB.toString()%>'; 

var wt_id = 0;
var wtbh = "root";
var description ="";
var sj_bh = '';
var level =0 ;
var wgjf =0;

//var values = wt_id+"</C>"+wtbh+"</C>"+description+"</C>"+level+"</C>"+sj_bh;

var type = '<%=type%>';

/*if(dept_name == "" || dept_name == null){

	root.add("问题不存在");
}
else{*/
	
	if(type == "checkbox"){
	
		var n=root.add("差错选择列表");
					
		//var first = tree1.addDefaultNode(n,dept_name+"("+dept_code+")",values,"","home_grey");
		
		initListValue();
	}
	else if(type == "radio"){
		
		var n=root.add("差错选择列表");
		
		var info_Array=info.split("</R>");
		
		var first=null;
		
		for(var i=0;i<info_Array.length-1;i++){
		
			var array=info_Array[i].split("</C>");
			
			 first= tree1.addDefaultNode(n,array[2],info_Array[i],"","home_grey");
		}
					
		
		
		initListValue();
	}
	else{
	
		root.add("无效参数");
	}
	
	
	tree1.onview=function(srcNode){
		
		curNode=srcNode;		
		
		if(srcNode.opened){
		
			return;
		}
		
		//注：人员节点无法到达词流程
		
		var wtflNodeInfo=srcNode.getKey();
		
		var wtfl=wtflNodeInfo.split("</C>")[1];
		
		var wt_level=wtflNodeInfo.split("</C>")[3];
		
		QuestionTree.queryTree(wtfl,wt_level,{
		
	        callback:function(data){  
		    	/*
		    	*	data 数据格式：
		    	*	    	
		    		id</C>bh</C>description</C>type</C>first</C>second</C>third</C>wgjf</C>method</C>jftk</C>wtlx</C>wtlx_name</C>jffz</R>
		    	*/
		    	
		    	//节点已打开(作用：下次点击此节点时不用再次访问数据库)
		       	srcNode.opened=true;
		        	
		        if(data==""){
		        
		            //alert("该机构"+dept+"不存在下级"); 			
		        	srcNode.icon.src=tree1.imageList.item["collapse_xp"].src
		        			
		            return;
		        }
		        else{
		        	
		        	var nodArrays=data.split("</R>");

		        	var length=nodArrays.length-1;
		        	
		        	for(var i=0;i<length;i++){
		        	
		        		var sub_nodArrays=nodArrays[i].split("</C>");
		        		
		        		var tmpNode;
		        		
		        		var viewInfo="";
		        		
		        		if(sub_nodArrays[3]!="4"){//机构节点
		        		
		        			viewInfo=sub_nodArrays[2];
		        			
		        			tmpNode=tree1.addDefaultNode(srcNode,viewInfo,nodArrays[i],"","home_grey");
		        			
		        			/*if(sub_nodArrays[2]=="n"){
		        		
			        			tmpNode.opened=true;
			        			
			        			tmpNode.icon.src=tree1.imageList.item["collapse_xp"].src;
			        		
								tmpNode.label.ico.src=tree1.imageList.item["home"].src;
		
		        			}*/
		        		}
		        		else{//人员节点
		        			
		        			viewInfo=sub_nodArrays[2];
		        		
		        			if(type == "checkbox"){
			        			
			        			tmpNode=tree1.addChkNode(srcNode,viewInfo,sub_nodArrays[0],"","user");
			        			
			        			tmpNode.icon.src=tree1.imageList.item["collapse_xp"].src
			        		}
			        		else if(type == "radio"){
			        			
			        			tmpNode=tree1.addRadNode(srcNode,viewInfo,nodArrays[i],"","user");
			        			
			        			tmpNode.icon.src=tree1.imageList.item["collapse_xp"].src;
			        		}
			        		
			        		parseNodeStatus(tmpNode);
		        		}
		        		
		        		srcNode.label.ico.src=tree1.imageList.item["home"].src;
		        		
		        	}
		        }
		    },
		    exceptionHandler:function(err_info){
		    
		        if (err_info!="")
		        {
		            alert(err_info);
		            if(err_info.indexOf("<bean:message key="msg.error.error" bundle="${language}"/>")<0)
		            {
		                 window.open("<%=thisPath%>/logoffAction.do?"+new Date(),"_parent");
		            }
		        }
		        else
		        {
		            alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
		            window.open("<%=thisPath%>/logoffAction.do?"+new Date(),"_parent");
		         }    
		     }
		});
	}
	
	tree1.oncheck=function(srcNode,toNode){
		
		if(!tree1.validObject(srcNode)){
		
			return;
		}	
		//alert(srcNode.module.value);
		/*	数据格式：
		*
		*	id</C>bh</C>description</C>type</C>first</C>second</C>third</C>wgjf
		*/
		var value=srcNode.getKey();
			
		if(type=="checkbox"){
		
			if(srcNode.onselect()){//选中
				
				//检查list中是否已增加此节点值
				for(var i=0;i<sltName.options.length;i++){
				
					if(sltName.options[i].value==value){
						
						//list中已增加节点值，退出方法即可
						return;
					}
				}
				
				var item=document.createElement("option");
				
				
				item.text=value.split("</C>")[2]+"("+value.split("</C>")[1]+")";
				item.value=value;
				
				sltName.add(item);
			}
			/*else{//取消
				
				for(var i=0;i<sltName.options.length;i++){
				
					if(sltName.options[i].value==value){
					
						sltName.options[i] = null;
						
						break;
					}
				}
			}*/
		}
		else if(type=="radio"){
		
			sltName.options[0] = null;
			
			if(srcNode.onselect()){//选中
			
				var item=document.createElement("option");
				
				item.text=value.split("</C>")[2]+"("+value.split("</C>")[1]+")";
				item.value=value;
				
				sltName.add(item);
			}

		}
	}
//}


function forSure()
{         
    var valueArrs = new Array();
    
    var listValue = document.getElementById("sltName");
    
    
    for (var i = 0; i < listValue.length; i ++){
    
        valueArrs[i]=listValue[i].value
    }
    
    window.returnValue = valueArrs.toString();
    
    window.close();
} 

function delSelectValue(){

	if(sltName.value!=""){
	
		var value=sltName.value;
		
		for(var i=0;i<sltName.options.length;i++){
				
			if(sltName.options[i].value==sltName.value){
			
				sltName.options[i] = null;
				
				break;
			}
		}
		
		syncTree(value,'cancle');
	}
}

function syncTree(value,opt_type){
	
		var selectNode=tree1.getSelectedNode();

		/*if(tree1.colNode[i].nodeType!="general"){
		
		alert("not general...");
		
			if(opt_type=="select"){
			
				if(type=="radio"){
					
					if(tree1.colNode[i].module.value==value && !tree1.colNode[i].module.checked){
			
						tree1.colNode[i].module.checked=true;
					}
					else if(tree1.colNode[i].module.value!=value && tree1.colNode[i].module.checked){
					
						tree1.colNode[i].module.checked=false;
					}
				}
				else if(type=="checkbox"){
				
					if(tree1.colNode[i].module.value==value && !tree1.colNode[i].module.checked){
			
						tree1.colNode[i].module.checked=true;
						
						break;
					}
				}
			}*/
			if(opt_type=="cancle"){
			
			if(selectNode!=null){selectNode.label.style.background="";selectNode.label.style.color="black";}

		}

}

function parseNodeStatus(srcNode){

	if(quesInfos == "" || quesInfos==null){
	
		return;
	}
	
	var tmpArrays=quesInfos.split("</R>");
	
	var length=tmpArrays.length-1;
	
	if(length>0){
	
		for(var i=0;i<length;i++){
		
			if(tmpArrays[i]==srcNode.getKey()){
			
				//srcNode.module.checked=true;
				
				break;
			}
		}
	}
}

function initListValue(){

	if(quesInfos == "" || quesInfos == null){
	
		return;
	}
	
	var tmpArrays=quesInfos.split("</R>");
	
	var length=tmpArrays.length-1;
	
	if(length>0){
	
		for(var i=0;i<length;i++){
		
			var item=document.createElement("option");
				
			item.text=tmpArrays[i].split("</C>")[2]+"("+tmpArrays[i].split("</C>")[1]+")";
			item.value=tmpArrays[i];
			
			sltName.add(item);
		}
	}
	
	
}

function query_ques_info(){

	var ques_name=document.getElementById("query_ques_info").value;
	

	if(ques_name==""){
		
		alert("请输入正确的问题名称。");
		
		return;
	}
	
	for(var i=wtct_id.length-1;i>0;i--){
	    	
   		wtct_id.options.remove(i);

   	}
	
	QuestionTree.queryQuesCard(ques_name,{
		
        callback:function(data){
	    	/*
	    	*	data 数据格式：
	    	*   
	    	*    id</C>bh</C>description</C>type</C>first</C>second</C>third</C>wgjf
	    	*	id</C>身份证号</C>人员姓名</C>人员代码（可能为空）</C>所属机构编号</C>所属机构名称
	    	*/
	    	
	        if(data==""){
	        
	            alert("该问题"+ques_name+"不存在。"); 
	            
	            return;
	        }
	        else{
	        	
	        	/*if(type=="radio"){
	        	
	        		sltName.options[0] = null;
	        	}*/
	        	
	        	rows=data.split("</R>");
	        	
	        	for(var i=0;i<rows.length-1;i++){
	        	
	        		var item=document.createElement("option");
				
					item.text=rows[i].split("</C>")[2]+"("+rows[i].split("</C>")[1]+")";
					item.value=rows[i];
					
					wtct_id.add(item);
	        	}
	        	
				//userInfos+=data+"</R>";
				
				//syncTree(data,"select");
	        }
	    },
	    exceptionHandler:function(err_info){
	    
	        if (err_info!="")
	        {
	            alert(err_info);
	            if(err_info.indexOf("<bean:message key="msg.error.error" bundle="${language}"/>")<0)
	            {
	                 window.open("<%=thisPath%>/logoffAction.do?"+new Date(),"_parent");
	            }
	        }
	        else
	        {
	            alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
	            window.open("<%=thisPath%>/logoffAction.do?"+new Date(),"_parent");
	         }    
	     }
	});
}

function selectWtct(){
	
	if(type=="radio"){
	        	
	     sltName.options[0] = null;
	}
	
	var wtctElem=document.getElementById("wtct_id");
	
	var value=wtctElem.value;
	
	var name=wtctElem[wtctElem.selectedIndex].innerText;
	
	var item=document.createElement("option");
				
	item.text=name;
	item.value=value;
	
	sltName.add(item);
}

function forAbort()    
{         
    window.close();    
}


</script>

</body>
</html>