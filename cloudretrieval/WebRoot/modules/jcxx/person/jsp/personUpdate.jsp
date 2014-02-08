<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>

<html>

<%
    String thisPath=request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
	String basePathExt = (String)application.getInitParameter("basePathExt");
	basePathExt = basePathExt.replaceAll("\\\\","/");
	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
	String language = bform.language;
	String user_dept=bform.dept_code;
	
	String role_code = bform.role_code;
	
	String photopath = bform.photo_path;
%>

<script language="javascript">
    var args = window.dialogArguments;
</script>

<head>
  <title><bean:message key="person.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">  
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/personBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
  <script language="javascript" type="text/javascript" src="<%=thisPath%>/modules/base/scripts/My97DatePicker/WdatePicker.js"></script>
  <style type="text/css">
	body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;}
	#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
	#r-result{height:100%;width:20%;float:left;}
	.labelHeader{
		align:right;
		width:200px;
	}
	</style>
</head>

<body>
<div id="allmap" style=position:absolute;left:350px; >
    <img style="width:150px; height:150px;" id=img_ name=image  src="" /><br>
     <a><bean:message key="person.columns.photo" bundle="${language}"/>：</a><br>
     <span>
		<form id="logoForm" name="logoForm" enctype="multipart/form-data" target="hidden_frame" ACTION="" method="post"> 
			<iframe name='hidden_frame' id="hidden_frame"style="display: none"></iframe>
		    	<input type="file" id="photo" name="photo" size=1 maxlength=255 value="..." style=width:162px;height:25px; onchange="forUpdate();">
		</form>
	  </span>
</div>

<div class=cardbody style=width:350px;float:left;>

<form1>

<table width=100% cellSpacing=1 cellPadding=0 class="tablestyle">
  <tr>
 	<!-- 用户ID -->
    <td class=tablebodyhead><bean:message key="person.label.userId" bundle="${language}"/></td>
    <td class=tablebody>
    <% if(role_code.equals("xtgl")||role_code.equals("super")){ %>
      <input class=inputext type="text" id="i_user_code" name="user_code"  size=6 maxlength=6  readonly  disabled="disabled">
      <%} else{%>
      <input type="text" id="i_user_code" name="user_code"  size=6 maxlength=6 readonly disabled="disabled">
      <%} %>
    </td>
  </tr>
  <tr>
  <!-- 密码 -->
    <td class=tablebodyhead><bean:message key="person.columns.passWord" bundle="${language}"/></td>
    <td class=tablebody>
      <input class=inputext type="password" id="i_user_pass" name="user_pass"  size=20 maxlength=20 >
    </td>
  </tr>
  <tr>
  	<!-- 姓名 -->
    <td class=tablebodyhead><bean:message key="person.label.userName" bundle="${language}"/></td>
    <td class=tablebody>
      <input class=inputext type="text" id="i_user_name" name="user_name"  size=20 maxlength=20 >
    </td>
  </tr>
  <tr>
  <!-- 所属部门 -->
    <td class=tablebodyhead><bean:message key="person.label.department" bundle="${language}"/></td>
    <td class=tablebody>

       <input class=inputext type="text" id="i_dept_code" name="dept_code"  size=10 maxlength=9 onblur="forCheckDept(dept_code,re_dept_code.value)">
      <input type="hidden" name="re_dept_code" value="">
      <input type="hidden" name="dept_name"  id="dept_name" value="">
      <input type="hidden" name="dept_code_value" value="">
      <button onclick="forDeptTree(dept_code,'radio',dept_code_value)" class="deptbutton" style="margin-left:-15px;">…</button>  
    </td>
  </tr>
  <tr>
  <!-- 角色 -->
    <td class=tablebodyhead><bean:message key="person.label.role" bundle="${language}"/></td>
    <td class=tablebody>
       <select class=inputext  size="1" id="i_zw" name="zw" value="">
      <script language="javascript">
      for (var i=0;i<args.RoleIDs.length;i++) 
          document.write("<option value='"+args.RoleIDs[i]+"'>"+args.RoleNames[i]+"</option>");
		</script>
	 </select>
    </td>
  </tr>
  <tr>
  <!-- 性别 -->
    <td class=tablebodyhead><bean:message key="person.label.sex" bundle="${language}"/></td>
    <td class=tablebody>
      <select class=inputext size="1" id="i_xb" name="xb" value="">
<script language="javascript">
      for (var i=0;i<args.XbIDs.length;i++) 
          document.write("<option value='"+args.XbIDs[i]+"'>"+args.XbNames[i]+"</option>");
</script>
      </select>
    </td>
  </tr>
  <tr>
  <!-- 出生日期 -->
    <td class=tablebodyhead><bean:message key="person.columns.birthday" bundle="${language}"/></td>
    <td class=tablebody>
      <input class=inputext type="text" id="i_csrq" name="csrq"  size=20 maxlength=20 class="Wdate" onClick="WdatePicker()">
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="person.columns.cellphone" bundle="${language}"/></td>
    <td class=tablebody>
      <input class=inputext type="text" id="i_sj" name="sj"  size=20 maxlength=20 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="person.columns.telephone" bundle="${language}"/></td>
    <td class=tablebody>
      <input class=inputext type="text" id="i_tel" name="tel"  size=20 maxlength=20 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="person.columns.email" bundle="${language}"/></td>
    <td class=tablebody>
      <input class=inputext type="text" id="i_mail" name="mail"  size=20 maxlength=20 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="person.columns.language" bundle="${language}"/></td>
    <td class=tablebody>
      <select class=inputext  size="1" id="i_language" name="language" value="" size="40">
		<script language="javascript">
		      for (var i=0;i<args.LanguageIDs.length;i++) 
		          document.write("<option value='"+args.LanguageIDs[i]+"'>"+args.LanguageNames[i]+"</option>");
		</script>
	</select>
    </td>
  </tr>
 
  
</table>

<script language="javascript">
   
    var url ="";
    dwr.engine.setAsync(false);

    personBean.beforeUpdateTUPerson(parseInt(args.rowID),
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
        
            colElements=rowElements[0].split("</C>");

            document.getElementById("i_user_code").value=colElements[0];
            document.getElementById("i_user_pass").value=colElements[1];
            document.getElementById("i_user_name").value=colElements[2];
            document.getElementById("i_dept_code").value=colElements[3];
            document.getElementById("i_zw").value=colElements[4];
            document.getElementById("i_xb").value=colElements[5];
            document.getElementById("i_csrq").value=colElements[6];
            document.getElementById("i_sj").value=colElements[7];
            document.getElementById("i_tel").value=colElements[8];
            document.getElementById("i_mail").value=colElements[9];
            document.getElementById("i_language").value=colElements[10];
          	url=colElements[11];
            
           
        },
        exceptionHandler:function(err_info)
        {
            if (err_info!="")
            {
                alert(err_info);
                window.open("<%=thisPath%>/logoffAction.do?"+new Date(),"_parent");
            }
            else
            {
                alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
                window.open("<%=thisPath%>/logoffAction.do?"+new Date(),"_parent");
            }
        }
    });
    dwr.engine.setAsync(true);
    var path="";
    path="<%=basePath %>${basePathExtName}/"+url;
    document.getElementById("img_").src = path;

</script>

</form1>

<button name="button" onClick="forSure()" class="button">
	<bean:message key="button.label.submit" bundle="${language}"/>
</button>
<button name="button" onClick="forAbort()" class="button">
	<bean:message key="button.label.close" bundle="${language}"/>
</button>

</div>


<script language="JavaScript">  


	
var file_name=url;


function forUpdate(){
 		
 		var files = document.getElementsByName("photo");
	    if (files[0].value == null || files[0].value == "")
	    {
	        alert("<bean:message key="baseinfo.error.attachFiles" bundle="${language}"/>");//请选择附件!
	        return false;
	    }
	    var fm1 = document.getElementById("logoForm");
	    var fileTypes = "*.jpg;*.bmp;*.gif,*.png,*.ico,*.jpeg";
	    var savepath = "photo";
	    var callback = "UploadCallback";
	    var root="<%=basePathExt%>/${basePathExtName}/${uploadPath}";
	    fm1.action ="<%=thisPath%>/upload.do?callback="+callback+"&dir="+savepath+"&fileTypes="+fileTypes+"&dirroot="+root;
	    fm1.submit();
 	}
 	
 	function UploadCallback(flag, cnt, files)
	{
		var thispath = "<%=thisPath%>";
		if (flag == false || cnt<1)
	    { 
	        alert("<bean:message key="baseinfo.error.attachFilesFailed" bundle="${language}"/>");//附件导入失败!
	        return false;
	    }
	    var filepath = files.split("</C>");
	    var filename = filepath[0].split(",");
	    file_name="${uploadPath}/photo/"+filename[0];
	    document.getElementById("img_").src="<%=basePath%>${basePathExtName}/"+file_name+" ";
	}
	
function forSure()    
{
    var i = 0;
    var updateString = new Array();
    var tmp = "|"+args.rowID+"</C>";

    tmp +=document.getElementById("i_user_code").value+"</C>";
    updateString[i++] = "user_code='"+document.getElementById("i_user_code").value+"'";
    tmp += document.getElementById("i_user_pass").value+"</C>";
    updateString[i++] = "passwd='"+document.getElementById("i_user_pass").value+"'";
    tmp += document.getElementById("i_user_name").value+"</C>";
    updateString[i++] = "user_name='"+document.getElementById("i_user_name").value+"'";
   
    tmp += document.getElementById("dept_name").value+"</C>";
    
    if(document.getElementById("i_dept_code").value=="")
    {
    //请输入机构编号
    	alert("<bean:message key="msg.pleaseInput" bundle="${language}"/><bean:message key="msg.pleaseInput" bundle="${language}"/>!");
    	return false;
    }
    updateString[i++] = "dept_code='"+document.getElementById("i_dept_code").value+"'";
    tmp += document.getElementById("i_zw").options[document.getElementById("i_zw").selectedIndex].text+"</C>";
    
     if(document.getElementById("i_zw").value=="")
    {
    	alert("<bean:message key="msg.pleaseInput" bundle="${language}"/><bean:message key="msg.pleaseInput" bundle="${language}"/>！");//请输入角色
    	return false;
    }
    
    updateString[i++] = "role_code='"+document.getElementById("i_zw").value+"'";
    
    tmp += document.getElementById("i_xb").value+"</C>";
    updateString[i++] = "xb='"+document.getElementById("i_xb").value+"'";
    
     tmp += document.getElementById("i_csrq").value+"</C>";
    updateString[i++] = "csrq='"+document.getElementById("i_csrq").value+"'";

    tmp += document.getElementById("i_sj").value+"</C>";
    updateString[i++] = "sj='"+document.getElementById("i_sj").value+"'";
    tmp += document.getElementById("i_tel").value+"</C>";
    updateString[i++] = "tel='"+document.getElementById("i_tel").value+"'";
    tmp += document.getElementById("i_mail").value+"</C>";
    updateString[i++] = "mail='"+document.getElementById("i_mail").value+"'";
    tmp += document.getElementById("i_language").value+"</C>";
    updateString[i++] = "language='"+document.getElementById("i_language").value+"'";
    tmp += file_name+"</C>";
    updateString[i++] = "photo_path='"+file_name+"'";
    
	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/> <bean:message key="button.modify" bundle="${language}"/>？"))
        return false;
        
    window.returnValue = updateString.toString()+"<#>"+file_name+tmp;
    window.close();    
} 

function forAbort()    
{         
    window.close();    
} 
function forDeptTree(test,type,hidden)
{
    var dept = "37015oooo";
	
    var srcFile = '<%=thisPath%>'+"/modules/base/jsp/deptree.jsp?jgbm="+'<%=user_dept%>'+"&type="+type;
    


    var winFeatures = "dialogHeight:600px;dialogWidth:450px;help:no;status:no";

    inArray = window.showModalDialog(srcFile, hidden.value, winFeatures);
	
	if (typeof(inArray) == "undefined"||inArray == "")
	{
     	//test.value = "";
     }
	else //如果另外指定了机构则下拉列表显示该机构的人员姓名
	{
		hidden.value=inArray+"</R>";
		test.value = inArray.split("</C>")[1];
		document.getElementById("dept_name").value = inArray.split("</C>")[2];
		
	}
}
   
</script> 

</body>

</html>
