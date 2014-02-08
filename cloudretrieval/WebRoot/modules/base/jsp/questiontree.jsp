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
<title>���ѡ���б�</title>
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
	        	�������⣺
	        	<input type="text" size="18" maxlength="18" id="query_ques_info">
	        	<input type="button" value="<bean:message key="button.query" bundle="${language}"/>" onclick="query_ques_info()"><br>
	        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	<select size="1" id="wtct_id" name="wtct" onchange="selectWtct()">
        			<option value=''>����ѡ��...</option>
	        	</select>
	        </div>
	      </td> 
    
    </tr> 
    <tr>
      <td class=TDLeft>
        ��ѡ���Ĳ��:
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
		����Ŀ¼���ؼ�Ӧ��ʾ��
		
		type==0---��ѡ��������id</C>���֤��</C>��Ա����</C>��Ա���루����Ϊ�գ�</C>�����������</C>�����������ƣ�
		type==1---��ѡ��������id</C>���֤��</C>��Ա����</C>��Ա���루����Ϊ�գ�</C>�����������</C>�����������ƣ�
*******************************************/

/*
*	��ѡ��Ա��Ϣ��ʽ��
*
*	id</C>������</C>����</C>�ϼ�</C>�㼶</C>Υ�����</R>
*/
var quesInfos = window.dialogArguments;

var tree1=new alai_tree_question(divTree1);

//��ǰ�ڵ�
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

	root.add("���ⲻ����");
}
else{*/
	
	if(type == "checkbox"){
	
		var n=root.add("���ѡ���б�");
					
		//var first = tree1.addDefaultNode(n,dept_name+"("+dept_code+")",values,"","home_grey");
		
		initListValue();
	}
	else if(type == "radio"){
		
		var n=root.add("���ѡ���б�");
		
		var info_Array=info.split("</R>");
		
		var first=null;
		
		for(var i=0;i<info_Array.length-1;i++){
		
			var array=info_Array[i].split("</C>");
			
			 first= tree1.addDefaultNode(n,array[2],info_Array[i],"","home_grey");
		}
					
		
		
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
		
		var wtflNodeInfo=srcNode.getKey();
		
		var wtfl=wtflNodeInfo.split("</C>")[1];
		
		var wt_level=wtflNodeInfo.split("</C>")[3];
		
		QuestionTree.queryTree(wtfl,wt_level,{
		
	        callback:function(data){  
		    	/*
		    	*	data ���ݸ�ʽ��
		    	*	    	
		    		id</C>bh</C>description</C>type</C>first</C>second</C>third</C>wgjf</C>method</C>jftk</C>wtlx</C>wtlx_name</C>jffz</R>
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
		        	
		        		var sub_nodArrays=nodArrays[i].split("</C>");
		        		
		        		var tmpNode;
		        		
		        		var viewInfo="";
		        		
		        		if(sub_nodArrays[3]!="4"){//�����ڵ�
		        		
		        			viewInfo=sub_nodArrays[2];
		        			
		        			tmpNode=tree1.addDefaultNode(srcNode,viewInfo,nodArrays[i],"","home_grey");
		        			
		        			/*if(sub_nodArrays[2]=="n"){
		        		
			        			tmpNode.opened=true;
			        			
			        			tmpNode.icon.src=tree1.imageList.item["collapse_xp"].src;
			        		
								tmpNode.label.ico.src=tree1.imageList.item["home"].src;
		
		        			}*/
		        		}
		        		else{//��Ա�ڵ�
		        			
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
		/*	���ݸ�ʽ��
		*
		*	id</C>bh</C>description</C>type</C>first</C>second</C>third</C>wgjf
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
		
		alert("��������ȷ���������ơ�");
		
		return;
	}
	
	for(var i=wtct_id.length-1;i>0;i--){
	    	
   		wtct_id.options.remove(i);

   	}
	
	QuestionTree.queryQuesCard(ques_name,{
		
        callback:function(data){
	    	/*
	    	*	data ���ݸ�ʽ��
	    	*   
	    	*    id</C>bh</C>description</C>type</C>first</C>second</C>third</C>wgjf
	    	*	id</C>���֤��</C>��Ա����</C>��Ա���루����Ϊ�գ�</C>�����������</C>������������
	    	*/
	    	
	        if(data==""){
	        
	            alert("������"+ques_name+"�����ڡ�"); 
	            
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