<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="javax.sql.DataSource"%>
<%@ page isELIgnored="false" %>
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
	
	//String jgbm = "370610000";
	
	//String type = "radio";
	
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
<title>����λ��ѡ���б�</title>
<meta http-equiv="Expires" CONTENT="0">
<meta http-equiv="Cache-Control" CONTENT="no-cache">
<meta http-equiv="Pragma" CONTENT="no-cache">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">

<script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
<script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
<script type="text/javascript" src="<%=thisPath%>/dwr/interface/LocationTree.js"></script>

<script src="<%=thisPath%>/modules/base/tree/alai_tree.js"></script>
<script src="<%=thisPath%>/modules/base/tree/alai_tree_dept.js"></script>
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
        ��ѡ���ĵ���λ��:(ע��˫���򿪣�����ѡ�񣬶�ѡʱ˫����ѡ����Ϊȡ��)
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
        <button name="button" onClick="window.returnValue = '</C></C></C></C></C></C>';window.close();" class="button" style=margin-left:50px; >���</button>
      </td>
    </tr>
  </table>
</div>
<%
	
	
	
	
	DataSource dataSource=(DataSource)this.getServletConfig().getServletContext().getAttribute("basedb");
	
	Connection con = null;
	
	PreparedStatement pstm = null;
	
    //int id = 1 ;
    int id = 1;
	String locationName = null;
	float longitude = 0;
	float latiTude = 0;
	int mapScaling = 0;
	
	boolean hasChild = false;
	
	ResultSet rs = null;
	
    try{
		con = dataSource.getConnection();
		
		pstm = con.prepareStatement("select id,locationName,longitude,latiTude,mapScaling from t_s_location where locationId=? and status=1");
		
		pstm.setString(1,jgbm.trim());
		
		rs = pstm.executeQuery();
		
		if(rs!=null && rs.next()){   
			
		//  id = rs.getInt("id");
		    id=rs.getInt("id");
		    locationName=basePublic.out(rs.getString("locationName").trim());
		//	locationName=rs.getString("locationName").trim();
			longitude=rs.getFloat("longitude");
			latiTude=rs.getFloat("latiTude");
			mapScaling=rs.getInt("mapScaling");
			
			rs.close();
			rs=null;
			
			pstm.close();
			pstm=null;
			
			pstm=con.prepareStatement("select id from t_s_location where parentLocationId=? and locationId!=parentLocationId and status=1");
			
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
		
		type=="checkbox"---��ѡ��������id</C>locationId</C>locationName</C>longitude</C>latiTude</C>mapScaling��
		type=="radio"---��ѡ��������id</C>locationId</C>locationName</C>longitude</C>latiTude</C>mapScaling��
*******************************************/

/*
*	��ѡ������Ϣ��ʽ��
*
*	id</C>locationId</C>locationName</C>longitude</C>latiTude</C>mapScaling</R>
*/
var deptInfos = window.dialogArguments;

//var deptInfos="";

var tree1=new alai_tree_dept(divTree1);

//��ǰ�ڵ�
var curNode;

var root=tree1.root;

var id = '<%=id%>';
var locationId = '<%=jgbm.trim()%>';
var locationName = '<%=locationName%>';
var longitude = '<%=longitude%>';
var latiTude = '<%=latiTude%>';
var mapScaling = <%=mapScaling%>;

	
var values = id+"</C>"+locationId+"</C>"+locationName+"</C>"+longitude+"</C>"+latiTude+"</C>"+mapScaling;
var hasChild = <%=hasChild%>;

var type = '<%=type%>';

if(locationId == ""){

	root.add("�������Ϣ");
}
else{

	if(type == "checkbox"){
		
		var n=root.add("����λ��ѡ���б�");
					
		var first = tree1.addChkNode(n,locationName+"("+locationId+")",values,"","home_grey");
		
		if(!hasChild){
		
			first.opened = true;
		}
		
		initListValue();
		
		parseNodeStatus(first);
	}
	else if(type == "radio"){
	
		var n=root.add("����λ��ѡ���б�");
					
		var first = tree1.addRadNode(n,locationName+"("+locationId+")",values,"","home_grey");
		
		if(!hasChild){
		
			first.opened = true;
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
		var deptNodeInfo=srcNode.getKey();
	
		var dept=deptNodeInfo.split("</C>")[1];
		
		LocationTree.queryTree(dept,{
		
	        callback:function(data){  
		    	/*
		    	*	data ���ݸ�ʽ��
		    	*
		    	*	id</C>dept_code</C>dept_name</C>dept_manager</C>dept_level</C>dept_lx|�Ƿ����¼�(y��n)</R>
		    	*/
		    	
		        if(data==""){
		        
		            alert("�õط�"+dept+"�������¼�"); 
		            
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
		*	id</C>�������(dept_code)</C>��������(dept_name)</C>�ϼ����(dept_manager)</C>��������(dept_level)</C>��������(dept_lx)
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

	if(deptInfos == "" || deptInfos==null){
	
		return;
	}
	
	var tmpArrays=deptInfos.split("</R>");
	
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

	if(deptInfos == "" || deptInfos == null){
	
		return;
	}
	
	var tmpArrays=deptInfos.split(",");
	
	var length=tmpArrays.length;
	
	if(length>0){
	
		for(var i=0;i<length;i++){
		
			var item=document.createElement("option");
				
			item.text=tmpArrays[i].split("</C>")[2]+"("+tmpArrays[i].split("</C>")[1]+")";
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
