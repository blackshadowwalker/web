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

	String kmbh = request.getParameter("kmbh").trim();
	
	String type = request.getParameter("type").trim();
	
	//String kmbh = "0";
	
	//String type = "checkbox";
	
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
<title>��Ŀѡ���б�</title>
<meta http-equiv="Expires" CONTENT="0">
<meta http-equiv="Cache-Control" CONTENT="no-cache">
<meta http-equiv="Pragma" CONTENT="no-cache">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<script type="text/javascript" src="<%=thisPath%>/dwr/interface/KmbTree.js"></script>
<script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
<script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
<script src="<%=thisPath%>/modules/base/tree/alai_tree.js"></script>
<script src="<%=thisPath%>/modules/base/tree/alai_tree_kmb.js"></script>
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
        ��ѡ���Ŀ�Ŀ:
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
	
	StringBuffer infoSB = new StringBuffer();
	
	ResultSet rs = null;
	
	try{
		con = dataSource.getConnection();
		
		pstm = con.prepareStatement("select acc_code,account_name,parent_acc_id,tree_level,balance_direction from t_o_kmb where parent_acc_id=? order by acc_code");
		
		pstm.setString(1,kmbh.trim());
		
		rs = pstm.executeQuery();
		
		while(rs!=null && rs.next()){
			
			infoSB.append(rs.getString("acc_code")).append("</C>");
			infoSB.append(basePublic.out(rs.getString("account_name").trim())).append("</C>");
			infoSB.append(rs.getString("parent_acc_id")).append("</C>");
			infoSB.append(rs.getInt("tree_level")).append("</C>");
			infoSB.append(rs.getString("balance_direction")).append("</R>");
			
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
		
		type=="checkbox"---��ѡ��������acc_code</C>account_name</C>parent_acc_id</C>tree_level</C>balance_direction</R>��
		type=="radio"---��ѡ��������acc_code</C>account_name</C>parent_acc_id</C>tree_level</C>balance_direction</R>��
*******************************************/

/*
*	��ѡ��Ŀ��Ϣ��ʽ��
*
*	acc_code</C>account_name</C>parent_acc_id</C>tree_level</C>balance_direction</R>
*/
var kmbInfos = window.dialogArguments;

//var kmbInfos="";

var tree1=new alai_tree_kmb(divTree1);

//��ǰ�ڵ�
var curNode;

var root=tree1.root;

var info='<%=infoSB.toString()%>'; 
	
//var values = acc_code+"</C>"+account_name+"</C>"+parent_acc_id+"</C>"+tree_level+"</C>"+balance_direction;

var type = '<%=type%>';

/*
if(acc_code == ""){

	root.add("����ػ�����Ϣ");
}
else{
*/

	if(type == "checkbox"){
		
		var n=root.add("��Ŀѡ���б�");
					
		//var first = tree1.addChkNode(n,account_name+"("+acc_code+")",values,"","home_grey");
		
		var info_Array=info.split("</R>");
		
		var first=null;
		
		for(var i=0;i<info_Array.length-1;i++){
		
			var array=info_Array[i].split("</C>");
			
			 first= tree1.addChkNode(n,array[1]+"("+array[0]+")",info_Array[i],"","home_grey");
			 
		}
		
		initListValue();
		
		parseNodeStatus(first);
		
	}
	else if(type == "radio"){
		
		var n=root.add("��Ŀѡ���б�");
		
		var info_Array=info.split("</R>");
		
		var first=null;
		
		for(var i=0;i<info_Array.length-1;i++){
		
			var array=info_Array[i].split("</C>");
			
			 first= tree1.addRadNode(n,array[1]+"("+array[0]+")",info_Array[i],"","home_grey");
			 
		}
		
		initListValue();
		
		parseNodeStatus(first);
	}
	else{
	
		root.add("��Ч����");
	}
	
	tree1.onview=function(srcNode){ //չʾ�ӽ��
		
		curNode=srcNode;
		
		if(srcNode.opened){
		
			return;
		}
		
		var kmbNodeInfo=srcNode.getKey();
		
		var kmb=kmbNodeInfo.split("</C>")[0];
		
		KmbTree.queryKmb(kmb,{
		
	        callback:function(data){  
		    	/*
		    	*	data ���ݸ�ʽ��
		    	*
		    	*	acc_code</C>account_name</C>parent_acc_id</C>tree_level</C>balance_direction|�Ƿ����¼�(y��n)</R>
		    	*/
		    	
		        if(data==""){
		        
		            alert("�ÿ�Ŀ"+kmb+"�������¼�"); 
		            
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
		        		
		        		var viewInfo=sub_nodArrays[0].split("</C>")[1]+"("+sub_nodArrays[0].split("</C>")[0]+")";
		        		
		        		if(type == "checkbox"){
		        		
		        			tmpNode=tree1.addChkNode(srcNode,viewInfo,sub_nodArrays[0],"","home_grey");
		        		}
		        		else if(type == "radio"){
		        		
		        			tmpNode=tree1.addRadNode(srcNode,viewInfo,sub_nodArrays[0],"","home_grey");
		        		}
		        		
		        		parseNodeStatus(tmpNode);
		        		
		        		if(sub_nodArrays[1]=="n"){
		        		
		        			tmpNode.opened=true;
		        			
		        			tmpNode.icon.src=tree1.imageList.item["collapse_xp"].src;
		        		
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
		
		if(!tree1.validObject(srcNode)){
			
			return;
		}
			
		/*	���ݸ�ʽ��
		*
		*	��Ŀ���(acc_code)</C>��Ŀ����(account_name)</C>�ϼ���Ŀ���(parent_acc_id)</C>��Ŀ����(tree_level)</C>��ط���(balance_direction)
		*/
		var value=srcNode.getKey();
			
		if(type=="checkbox"){
		
			if(srcNode.onselect() && value.split("</C>")[3]!="1"){//ѡ��
				
				//���list���Ƿ������Ӵ˽ڵ�ֵ
				for(var i=0;i<sltName.options.length;i++){
				
					if(sltName.options[i].value==value){
						
						//list�������ӽڵ�ֵ���˳���������
						return;
					}
				}
				
				var item=document.createElement("option");
				
				
				item.text=value.split("</C>")[1]+"("+value.split("</C>")[0]+")";
				item.value=value;
				
				sltName.add(item);
			}
			else{//ȡ��
				
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
			
			if(srcNode.onselect() && value.split("</C>")[3]!="1"){//ѡ��
			
				var item=document.createElement("option");
				
				item.text=value.split("</C>")[1]+"("+value.split("</C>")[0]+")";
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

function syncTree(value,type){

	//alert("��ʼͬ�����ڵ�...\n"+value+"\n"+type);
	
		var selectNode=tree1.getSelectedNode();
	
			
		if(type=="select"){
		
			//tree1.colNode[i].module.checked=true;
		}
		else if(type=="cancle"){
		
			if(selectNode!=null){selectNode.label.style.background="";selectNode.label.style.color="black";}
		}

}

function parseNodeStatus(srcNode){

	if(kmbInfos == "" || kmbInfos==null){
	
		return;
	}
	
	var tmpArrays=kmbInfos.split("</R>");
	
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

	if(kmbInfos == "" || kmbInfos == null){
	
		return;
	}
	
	var tmpArrays=kmbInfos.split("</R>");
	
	var length=tmpArrays.length-1;
	
	if(length>0){
	
		for(var i=0;i<length;i++){
		
			var item=document.createElement("option");
				
			item.text=tmpArrays[i].split("</C>")[1]+"("+tmpArrays[i].split("</C>")[0]+")";
			item.value=tmpArrays[i];
			
			sltName.add(item);
		}
	}
}


function forAbort()    
{         
    window.close();    
}

</script>

</body>
</html>
