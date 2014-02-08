<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="java.sql.*,modules.base.basePublic;"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>

<%
	String thisPath = request.getContextPath();

	String jgbm = request.getParameter("jgbm").trim();
	
	String type = request.getParameter("type").trim();
	
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
<title>人员选择列表</title>
<meta http-equiv="Expires" CONTENT="0">
<meta http-equiv="Cache-Control" CONTENT="no-cache">
<meta http-equiv="Pragma" CONTENT="no-cache">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">

<script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
<script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>

<script type="text/javascript" src="<%=thisPath%>/dwr/interface/UserTree.js"></script>

<script src="<%=thisPath%>/modules/base/tree/alai_tree.js"></script>
<script src="<%=thisPath%>/modules/base/tree/alai_tree_user.js"></script>

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
      <td class=TDLeft>
        已选定的人员:(注：双击打开部门列表，单击选择人员，多选时双击已选人员为取消)
      </td>
    </tr>
    <tr>
    	<td>
    		<table>
    			<tr>
			      <td style="width:60%;"> 
			        <select name="select" size="<%=option_num%>" multiple id="sltName" style="width:300;" ondblclick="delSelectValue()"></select>
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
	

	long dept_id = 0l;
	String dept_name = null;
	String dept_manager = null;
	int dept_level = 0;
	int dept_lx = 0;
	
	ResultSet rs = null;
	
    try{
		con = dataSource.getConnection();
		
		pstm = con.prepareStatement("select id,dept_name,dept_manager,dept_level,dept_lx from t_s_dept where dept_code=? and status=1");
		
		pstm.setString(1,jgbm.trim());
		
		rs = pstm.executeQuery();
		
		if(rs!=null && rs.next()){
			
			dept_id=rs.getLong("id");
			dept_name=basePublic.out(rs.getString("dept_name").trim());
			dept_manager=rs.getString("dept_manager");
			dept_level=rs.getInt("dept_level");
			dept_lx=rs.getInt("dept_lx");
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
*	id</C>身份证号</C>人员姓名</C>人员代码（可能为空）</C>所属机构编号</C>所属机构名称</R>
*/
var userInfos = window.dialogArguments;

//var userInfos="";

var tree1=new alai_tree_user(divTree1);

//当前节点
var curNode;

var root=tree1.root;

var dept_id = <%=dept_id%>;
var dept_code = '<%=jgbm.trim()%>';
var dept_name = '<%=dept_name%>';
var dept_manager = '<%=dept_manager%>';
var dept_level = <%=dept_level%>;
var dept_lx = <%=dept_lx%>;
	
var values = dept_id+"</C>"+dept_code+"</C>"+dept_name+"</C>"+dept_manager+"</C>"+dept_level+"</C>"+dept_lx;
	
//var hasChild = true;

var type = '<%=type%>';

if(dept_name == "" || dept_name == null){

	root.add("机构不存在");
}
else{
	
	if(type == "checkbox"){
	
		var n=root.add("人员选择列表");
					
		var first = tree1.addDefaultNode(n,dept_name+"("+dept_code+")",values,"","home_grey");
		
		initListValue();
	}
	else if(type == "radio"){
		
		var n=root.add("人员选择列表");
					
		var first = tree1.addDefaultNode(n,dept_name+"("+dept_code+")",values,"","home_grey");
		
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
		
		var deptNodeInfo=srcNode.getKey();
		
		var dept=deptNodeInfo.split("</C>")[1];
		
		UserTree.queryTree(dept,{
		
	        callback:function(data){  
		    	/*
		    	*	data 数据格式：
		    	*
		    	*	id</C>dept_code</C>dept_name</C>dept_manager</C>dept_level</C>dept_lx|D</R>
		    	*	id</C>身份证号</C>人员姓名</C>人员代码（可能为空）</C>所属机构编号</C>所属机构名称|P</R>
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
		        	
		        		var sub_nodArrays=nodArrays[i].split("|");
		        		
		        		var tmpNode;
		        		
		        		var viewInfo="";
		        		
		        		if(sub_nodArrays[1]=="D"){//机构节点
		        		
		        			viewInfo=sub_nodArrays[0].split("</C>")[2]+"("+sub_nodArrays[0].split("</C>")[1]+")";
		        			
		        			tmpNode=tree1.addDefaultNode(srcNode,viewInfo,sub_nodArrays[0],"","home_grey");
		        			
		        			if(sub_nodArrays[2]=="n"){
		        		
			        			tmpNode.opened=true;
			        			
			        			tmpNode.icon.src=tree1.imageList.item["collapse_xp"].src;
			        		
								tmpNode.label.ico.src=tree1.imageList.item["home"].src;
		
		        			}
		        		}
		        		else{//人员节点
		        			
		        			viewInfo=sub_nodArrays[0].split("</C>")[2];
		        			var tb = "user_grey";
		        			if(sub_nodArrays[0].split("</C>")[6]=="是")
		        			{
		        				tb = "user";
		        			}
		        		
		        			if(type == "checkbox"){
			        			
			        			tmpNode=tree1.addChkNode(srcNode,viewInfo,sub_nodArrays[0],tb,tb);
			        			
			        			tmpNode.icon.src=tree1.imageList.item["collapse_xp"].src
			        		}
			        		else if(type == "radio"){
			        			
			        			tmpNode=tree1.addRadNode(srcNode,viewInfo,sub_nodArrays[0],tb,tb);
			        			
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
		*	id</C>身份证号</C>人员姓名</C>人员代码（可能为空）</C>所属机构编号</C>所属机构名称
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
}


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

	if(userInfos == "" || userInfos==null){
	
		return;
	}
	
	var tmpArrays=userInfos.split("</R>");
	
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

	if(userInfos == "" || userInfos == null){
	
		return;
	}
	
	var tmpArrays=userInfos.split("</R>");
	
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

function query_user_info(){

	var user_card=document.getElementById("query_user_info").value;
	

	if(user_card=="" || user_card.length!=18){
		
		alert("请输入正确的人员身份证号。");
		
		return;
	}
	
	//检查此用户是否已添加到List中
	for(var i=0;i<sltName.options.length;i++){
			
		if(sltName.options[i].value.split("</C>")[1]==user_card){
			
			alert("此人员已增加到列表中");
			
			return;
		}
	}
	
	UserTree.queryUserCard(user_card,{
		
        callback:function(data){  
	    	/*
	    	*	data 数据格式：
	    	*
	    	*	id</C>身份证号</C>人员姓名</C>人员代码（可能为空）</C>所属机构编号</C>所属机构名称
	    	*/
	        if(data==""){
	        
	            alert("该人员"+user_card+"不存在。"); 
	            
	            return;
	        }
	        else{
	        	
	        	if(type=="radio"){
	        	
	        		sltName.options[0] = null;
	        	}
	        	
	        	var item=document.createElement("option");
				
				item.text=data.split("</C>")[2]+"("+data.split("</C>")[1]+")";
				item.value=data;
				
				sltName.add(item);
				
				userInfos+=data+"</R>";
				
				syncTree(data,"select");
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

function forAbort()    
{         
    window.close();    
}


</script>

</body>
</html>