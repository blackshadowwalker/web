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
%>

<head>
<base target="_self"/>
<title>����ѡ���б�</title>
<meta http-equiv="Expires" CONTENT="0">
<meta http-equiv="Cache-Control" CONTENT="no-cache">
<meta http-equiv="Pragma" CONTENT="no-cache">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<script type="text/javascript" src="<%=thisPath%>/dwr/interface/DeptTree.js"></script>
<script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
<script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
<script src="<%=thisPath%>/modules/base/tree/alai_tree.js"></script>
<script src="<%=thisPath%>/modules/base/tree/alai_tree_dept_checkbox.js"></script>
<link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css">
<title></title>
</head>

<body>
<div class=cardbody>
  <table class="tablebox">
    <tr>
      <td>
        <div id="divTree1" style="width:100%;height:370px;overflow-x:auto;overflow-y:auto"></div>
      </td>
    </tr>
    <!-- <tr>
		<td >
			<div>
		       	������ţ�
		       	<input type="text" size="9" maxlength="9" id="query_dept_code">
		       	<input type="button" value="<bean:message key="button.query" bundle="${language}"/>" onclick="query_dept_code()"/>
		    </div>
		</td>
    </tr> -->
    
    <tr>
      <td class=TDLeft>
        ��ѡ���Ļ���:
      </td>
    </tr>
    <tr>
    	<td>
    		<table>
    			
    			<tr>
			      <td style="width:60%;"> 
			        <select name="select" size="6" multiple id="sltName" style="width:300;" ondblclick="delSelectValue()"></select>
			      </td>
			      
			    </tr>
    		</table>
    	</td>
    </tr>
    <tr>
      <td>
<script>

    document.write("<button name=\"button\" onClick=\"forSure()\" class=\"button\">ȷ��</button>");
    
</script>
        <button name="button" onClick="forAbort()" class="button">ȡ��</button>
      </td>
    </tr>
  </table>
</div>
<%

	
	String jgbm = request.getParameter("jgbm").trim();

	String type = request.getParameter("type").trim();

	DataSource dataSource=(DataSource)this.getServletConfig().getServletContext().getAttribute("basedb");
	
	Connection con = null;
	
	PreparedStatement pstm = null;
	
	long dept_id = 0l;
	String dept_name = null;
	String dept_manager = null;
	int dept_level = 0;
	int dept_lx = 0;
	
	boolean hasChild = false;
	
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
			
			rs.close();
			rs=null;
			
			pstm.close();
			pstm=null;
			
			pstm=con.prepareStatement("select id from t_s_dept where dept_manager=? and dept_code!=dept_manager and status=1");
			
			pstm.setString(1,jgbm);
			
			rs=pstm.executeQuery();
			
			if(rs!=null && rs.next()){
				
				hasChild = true;
			}
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
		����Ŀ¼���ؼ�Ӧ��ʾ��
		
		type=="checkbox"---��ѡ��������id</C>dept_code</C>dept_name</C>dept_manager</C>dept_level</C>dept_lx��
		type=="radio"---��ѡ��������id</C>dept_code</C>dept_name</C>dept_manager</C>dept_level</C>dept_lx��
*******************************************/

/*
*	��ѡ������Ϣ��ʽ��
*
*	id</C>dept_code</C>dept_name</C>dept_manager</C>dept_level</C>dept_lx</R>
*/
var deptInfos = window.dialogArguments;

//var deptInfos="";

var tree1=new alai_tree_dept(divTree1);

//��ǰ�ڵ�
var curNode;

var root=tree1.root;

var dept_id = <%=dept_id%>;
var dept_code = '<%=jgbm.trim()%>';
var dept_name = '<%=dept_name%>';
var dept_manager = '<%=dept_manager%>';
var dept_level = <%=dept_level%>;
var dept_lx = <%=dept_lx%>;
	
var values = dept_id+"</C>"+dept_code+"</C>"+dept_name+"</C>"+dept_manager+"</C>"+dept_level+"</C>"+dept_lx;

var hasChild = <%=hasChild%>;

var type = '<%=type%>';

if(dept_code == ""){

	root.add("����ػ�����Ϣ");
}
else{

	if(type == "checkbox"){
		
		var n=root.add("����ѡ���б�");
		
		if(dept_code=="370000000"){
			
			var first = tree1.addChkNode(n,dept_name+"("+dept_code+")",values,"","home_grey",false);
		}
		else{
			
			var first = tree1.addChkNode(n,dept_name+"("+dept_code+")",values,"","home_grey",true);
		}
		
		
		if(!hasChild){
		
			first.opened = true;
		}
		
		initListValue();
		
		parseNodeStatus(first);
	}
	else if(type == "radio"){
		
		var n=root.add("����ѡ���б�");
					
		var first = tree1.addRadNode(n,dept_name+"("+dept_code+")",values,"","home_grey");
		
		if(!hasChild){
		
			first.opened = true;
		}
		
		initListValue();
		
		parseNodeStatus(first);
	}
	else{
	
		root.add("��Ч����");
	}
	
	tree1.onview=function(srcNode,from){ //չʾ�ӽ��

		curNode=srcNode;
		
		if(srcNode.opened){
		
			if(from=="checked"){
	   
		        if(srcNode.hasChild==true){
		        	
		        	for(i=0;i<srcNode.children.length;i++){
		        
		        		srcNode.children[i].module.checked=true;
		        	}
		        }
		        
			}
		
			return;
		}
	
		var deptNodeInfo=srcNode.module.value;
		
		var dept=deptNodeInfo.split("</C>")[1];
		
		DeptTree.queryTree(dept,{
		
	        callback:function(data){  
		    	/*
		    	*	data ���ݸ�ʽ��
		    	*
		    	*	id</C>dept_code</C>dept_name</C>dept_manager</C>dept_level</C>dept_lx|�Ƿ����¼�(y��n)</R>
		    	*/
		    	
		        if(data==""){
		        
		            //alert("�û���"+dept+"�������¼�"); 
		            
		            return;
		        }
		        else{
		        	
		        	//�ڵ��Ѵ�(���ã��´ε���˽ڵ�ʱ�����ٴη������ݿ�)
		        	srcNode.opened=true;
		        	
		        	var nodArrays=data.split("</R>");
		        	
		        	var length=nodArrays.length-1;
		        	
		        	for(var i=0;i<length;i++){
		        	
		        		var sub_nodArrays=nodArrays[i].split("|");
		        		
		        		var tmpNode;
		        		
		        		var viewInfo=sub_nodArrays[0].split("</C>")[2]+"("+sub_nodArrays[0].split("</C>")[1]+")";
		        		
		        		if(type == "checkbox"){
		        		
		        			tmpNode=tree1.addChkNode(srcNode,viewInfo,sub_nodArrays[0],"","home_grey",true);
		        			
		        			if(from=="checked"){
		        			
		        				tmpNode.module.checked=true;
		        			}
		        		}
		        		else if(type == "radio"){
		        		
		        			tmpNode=tree1.addRadNode(srcNode,viewInfo,sub_nodArrays[0],"","home_grey");

		        		}
		        		
		        		parseNodeStatus(tmpNode);
		        		
		        		if(sub_nodArrays[1]=="n"){
		        		
		        			tmpNode.opened=true;
		        			
		        			tmpNode.icon.src=tree1.imageList.item["collapse_xp"].src
		        		
							tmpNode.label.ico.src=tree1.imageList.item["home"].src;
		
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
	
	tree1.oncheck=function(srcNode,toNode){  //ѡ�е�ʱ��
		
		if(!tree1.validObject(srcNode.module)){
		
			return;
		}
		/*	���ݸ�ʽ��
		*
		*	id</C>�������(dept_code)</C>��������(dept_name)</C>�ϼ����(dept_manager)</C>��������(dept_level)</C>��������(dept_lx)
		*/
		var value=srcNode.module.value;
			
		if(type=="checkbox"){
		
			if(srcNode.module.checked){//ѡ��

				tree1.onview(srcNode,"checked");
		
				//���list���Ƿ������Ӵ˽ڵ�ֵ
				for(var i=0;i<sltName.options.length;i++){
				
					if(sltName.options[i].value==value){
						
						//list�������ӽڵ�ֵ���˳���������
						return;
					}
				}
				
				var item=document.createElement("option");
				
				item.text=value.split("</C>")[2]+"("+value.split("</C>")[1]+")";
				item.value=value;
				
				sltName.add(item);
			}
			else{//ȡ��
				
				if(srcNode.hasChild==true){
		        	
		        	for(i=0;i<srcNode.children.length;i++){
		        
		        		srcNode.children[i].module.checked=false;
		        	}
		        }
				
				for(var i=0;i<sltName.options.length;i++){
				
					if(sltName.options[i].value==value){
					
						sltName.options[i] = null;
						
						break;
					}
				}
			}
		}
		else if(type=="radio"){
			
			sltName.options[0] = null;
			
			if(srcNode.module.checked){//ѡ��
			
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

function syncTree(value,type){

	for(var i=0;i<tree1.colNode.length;i++){
		
		if(tree1.colNode[i].module.value==value){
		
			if(type=="select"){
			
				tree1.colNode[i].module.checked=true;
			}
			else if(type=="cancle"){
			
				tree1.colNode[i].module.checked=false;
			}
			
			break;
		}
	}
}

function parseNodeStatus(srcNode){

	if(deptInfos == "" || deptInfos==null){
	
		return;
	}
	
	var tmpArrays=deptInfos.split("</R>");
	
	var length=tmpArrays.length-1;
	
	if(length>0){
	
		for(var i=0;i<length;i++){
		
			if(tmpArrays[i]==srcNode.module.value){
			
				srcNode.module.checked=true;
				
				break;
			}
		}
	}
}

function initListValue(){

	if(deptInfos == "" || deptInfos == null){
	
		return;
	}
	
	var tmpArrays=deptInfos.split("</R>");
	
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

function query_dept_code(){

	var dept_code=document.getElementById("query_dept_code").value;
	

	if(dept_code=="" || dept_code.length!=9){
		
		alert("��������ȷ�Ļ�����š�");
		
		return;
	}
	
	//���˻����Ƿ������ӵ�List��
	for(var i=0;i<sltName.options.length;i++){
			
		if(sltName.options[i].value.split("</C>")[1]==dept_code){
			
			alert("�˻��������ӵ��б���");
			
			return;
		}
	}
	
	DeptTree.queryDeptCode(dept_code,{
		
        callback:function(data){  
	    	/*
	    	*	data ���ݸ�ʽ��
	    	*
	    	*	id</C>dept_code</C>dept_name</C>dept_manager</C>dept_level</C>dept_lx
	    	*/
	        if(data==""){
	        
	            alert("�û���"+dept_code+"�����ڡ�"); 
	            
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
				
				deptInfos+=data+"</R>";
				
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