<%@ page language="java" contentType="text/html;charset=GBK"%>

<html>

<%
    String thisPath=request.getContextPath();
%>

<head>
  <title><bean:message key="button.modify" bundle="${language}"/>��¼����</title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/mmxgBean.js"></script>
</head>
<style type="text/css">
#i_tip_info{
	
	color: red;
    font-family: "����";
    font-size: 14px;
    font-weight: bold;
    padding-left: 2px;
    text-align:right;
}
#i_text{
	
	color: #000000;
    font-family: "����";
    font-size: 13px;
    font-weight: bold;
    padding-right: 4px;
    text-align:right;
}
</style>
<body >

<div class=cardbody>
<span id="i_tip_info"></span>
<table>
<tr>
    <td height="10"></td>
</tr>
</table>
<form>
<input type="hidden" id="i_username" name="username">

<table width=100% cellSpacing=1 cellPadding=0 class="tablestyle">
  
  <tr>
    <td class=tablebodyhead>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="i_text">������</span></td>
    <td class=tablebody>
      <input type="password" id="i_old_pw" name="old_pw" size=20 maxlength=20 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="i_text">������</span></td>
    <td class=tablebody>
      <input type="password" id="i_new_pw" name="new_pw" size=20 maxlength=20 >
    </td>
  </tr>
  
  <tr>
    <td class=tablebodyhead>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="i_text">ȷ������</span></td>
    <td class=tablebody>
      <input type="password" id="i_renew_pw" name="renew_pw" size=20 maxlength=20>
    </td>
  </tr>

</table>
</form>
<table>
<tr>
    <td height="18"></td>
</tr>
</table>
&nbsp;&nbsp;<button name="button" onClick="modifyPwd('<%=thisPath%>')" class="button"><bean:message key="button.modify" bundle="${language}"/></button>
&nbsp;&nbsp;<button name="button" onClick="forAbort()" class="button">ȡ��</button>

</div>

<script language="JavaScript">   

var elemObj = window.dialogArguments;


document.getElementById("i_tip_info").innerHTML = elemObj.info;

document.getElementById("i_username").value = elemObj.username;


String.prototype.trim = function(){
 
	return this.replace(/(^\s*)|(\s*$)/g,""); 

} 

function modifyPwd(thispath){
	
	var Vals = new Array();
    
    
    Vals[0] = document.forms[0].username.value.trim();

    var oldpasswd = document.forms[0].old_pw.value.trim();
    
    if (oldpasswd == "")
    {
        alert("�����������!");    
    	
    	document.forms[0].old_pw.focus();
    	    
        return;
    }
    
    Vals[1] = oldpasswd;
    
    var newpasswd = document.forms[0].new_pw.value.trim();
    
    if (newpasswd == "")
    {
        alert("������������!");    
        
        document.forms[0].new_pw.focus();
        
        return;
    }
    
    Vals[2] = newpasswd;
    
    
    var renewpasswd = document.forms[0].renew_pw.value.trim();
    
    if (renewpasswd == "")
    {
        alert("������ȷ������!");    
        
        document.forms[0].renew_pw.focus();
        
        return;
    }
    
    if(newpasswd != renewpasswd)
    {
    	alert("��������ȷ�����벻һ�£����������룡");
    	
    	document.forms[0].new_pw.value = "";
    	
    	document.forms[0].renew_pw.value = "";
    	
    	document.forms[0].new_pw.focus();
    	
    	return;
    }
	
	
	if(newpasswd == oldpasswd){
		
		alert("������������벻����ͬ�����������������롣");
		
		document.forms[0].new_pw.value = "";
    	
    	document.forms[0].renew_pw.value = "";
    	
    	document.forms[0].new_pw.focus();
    	
		return;
	}
	
    if (!confirm("ȷ��Ҫ<bean:message key="button.modify" bundle="${language}"/>��¼������"))
        return;

    
    mmxgBean.updatePassword(Vals.toString(),
    {
        callback:function(data)
        {
        	if(data > 0){
        	
        		alert("<bean:message key="button.modify" bundle="${language}"/>����ɹ���");
        		
        		window.returnValue = "ok";
        		
        		window.close();
        	}
        	else if(data == 0){
        		
        		alert("ϵͳ��æ���Ժ�<bean:message key="button.modify" bundle="${language}"/>���롣");
        	}
        	else{
        		
        		alert("��ȷ�Ͼ������Ƿ���ȷ��");
        	}
        },
        exceptionHandler:function(err_info)
        { 
            if (err_info!="")
            {
                alert(err_info);
            }
        }
    });
} 

function forAbort()    
{   
	window.returnValue = "err";
	      
    window.close();    
}
</script> 

</body>

</html>
