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
<title>��Աѡ���б�</title>
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
        ��ѡ������Ա:(ע��˫���򿪲����б�����ѡ����Ա����ѡʱ˫����ѡ��ԱΪȡ��)
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

    document.write("<button name=\"button\" onClick=\"forSure()\" class=\"button\">ȷ��</button>");
    
</script>
        <button name="button" onClick="forAbort()" class="button">ȡ��</button>
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
		����Ŀ¼���ؼ�Ӧ��ʾ��
		
		type==0---��ѡ��������id</C>���֤��</C>��Ա����</C>��Ա���루����Ϊ�գ�</C>�����������</C>�����������ƣ�
		type==1---��ѡ��������id</C>���֤��</C>��Ա����</C>��Ա���루����Ϊ�գ�</C>�����������</C>�����������ƣ�
*******************************************/

/*
*	��ѡ��Ա��Ϣ��ʽ��
*
*	id</C>���֤��</C>��Ա����</C>��Ա���루����Ϊ�գ�</C>�����������</C>������������</R>
*/
var userInfos = window.dialogArguments;

//var userInfos="";

var tree1=new alai_tree_user(divTree1);

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
	
//var hasChild = true;

var type = '<%=type%>';

if(dept_name == "" || dept_name == null){

	root.add("����������");
}
else{
	
	if(type == "checkbox"){
	
		var n=root.add("��Աѡ���б�");
					
		var first = tree1.addDefaultNode(n,dept_name+"("+dept_code+")",values,"","home_grey");
		
		initListValue();
	}
	else if(type == "radio"){
		
		var n=root.add("��Աѡ���б�");
					
		var first = tree1.addDefaultNode(n,dept_name+"("+dept_code+")",values,"","home_grey");
		
		initListValue();
	}
	else{
	
		root.add("��Ч����");
	}
	
	
	tree1.onview=function(srcNode){
		
		curNode=srcNode;		
		
		if(srcNode.opened){
		
			return;
		}
		
		//ע����Ա�ڵ��޷����������
		
		var deptNodeInfo=srcNode.getKey();
		
		var dept=deptNodeInfo.split("</C>")[1];
		
		UserTree.queryTree(dept,{
		
	        callback:function(data){  
		    	/*
		    	*	data ���ݸ�ʽ��
		    	*
		    	*	id</C>dept_code</C>dept_name</C>dept_manager</C>dept_level</C>dept_lx|D</R>
		    	*	id</C>���֤��</C>��Ա����</C>��Ա���루����Ϊ�գ�</C>�����������</C>������������|P</R>
		    	*/
		    	
		    	//�ڵ��Ѵ�(���ã��´ε���˽ڵ�ʱ�����ٴη������ݿ�)
		       	srcNode.opened=true;
		        	
		        if(data==""){
		        
		            //alert("�û���"+dept+"�������¼�"); 			
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
		        		
		        		if(sub_nodArrays[1]=="D"){//�����ڵ�
		        		
		        			viewInfo=sub_nodArrays[0].split("</C>")[2]+"("+sub_nodArrays[0].split("</C>")[1]+")";
		        			
		        			tmpNode=tree1.addDefaultNode(srcNode,viewInfo,sub_nodArrays[0],"","home_grey");
		        			
		        			if(sub_nodArrays[2]=="n"){
		        		
			        			tmpNode.opened=true;
			        			
			        			tmpNode.icon.src=tree1.imageList.item["collapse_xp"].src;
			        		
								tmpNode.label.ico.src=tree1.imageList.item["home"].src;
		
		        			}
		        		}
		        		else{//��Ա�ڵ�
		        			
		        			viewInfo=sub_nodArrays[0].split("</C>")[2];
		        			var tb = "user_grey";
		        			if(sub_nodArrays[0].split("</C>")[6]=="��")
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
		/*	���ݸ�ʽ��
		*
		*	id</C>���֤��</C>��Ա����</C>��Ա���루����Ϊ�գ�</C>�����������</C>������������
		*/
		var value=srcNode.getKey();
			
		if(type=="checkbox"){
		
			if(srcNode.onselect()){//ѡ��
				
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
			/*else{//ȡ��
				
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
			
			if(srcNode.onselect()){//ѡ��
			
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
		
		alert("��������ȷ����Ա���֤�š�");
		
		return;
	}
	
	//�����û��Ƿ�����ӵ�List��
	for(var i=0;i<sltName.options.length;i++){
			
		if(sltName.options[i].value.split("</C>")[1]==user_card){
			
			alert("����Ա�����ӵ��б���");
			
			return;
		}
	}
	
	UserTree.queryUserCard(user_card,{
		
        callback:function(data){  
	    	/*
	    	*	data ���ݸ�ʽ��
	    	*
	    	*	id</C>���֤��</C>��Ա����</C>��Ա���루����Ϊ�գ�</C>�����������</C>������������
	    	*/
	        if(data==""){
	        
	            alert("����Ա"+user_card+"�����ڡ�"); 
	            
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