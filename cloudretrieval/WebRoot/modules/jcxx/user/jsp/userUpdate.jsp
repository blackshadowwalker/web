<%@ page language="java" contentType="text/html;charset=GBK"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>

<%
    String thisPath=request.getContextPath();
%>

<script language="javascript">
    var roleArray = new Array();
    var args = window.dialogArguments;
</script>

<head> 
  <base target="_self"/> 
  <title><bean:message key="button.modify" bundle="${language}"/>用户信息</title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/userBean.js"></script>

  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
</head>

<body>

<div class=cardbody>

<form>

<table width=100% cellSpacing=1 cellPadding=0 class="tablestyle">

  <tr>
    <td class=tablebodyhead width=150px>用户代码</td>
    <td class=tablebody>
      <input type="text" name="user_code" size=18 maxlength=18 disabled>
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead>用户姓名</td>
    <td class=tablebody>
      <input type="text" name="user_name" size=20 maxlength=20 disabled>
    </td>
  </tr>

</table>

<table width=100% class=prompt>
  <tr>
    <td width="10px">
    </td>
    <td>
      所属机构：<input type="text" id="i_dept_code" name="dept_code" size=9 maxlength=9 value="" onblur="forCheckDept_user(dept_code)">
      <input type='hidden' name="dept_code_value" value="">
      <html:button property="button" onclick="forDeptTree(dept_code,'radio',dept_code_value)" styleClass="deptbutton">…</html:button>
      用户角色：<select size="1" id="i_role_code" name="role_code" value="">
<script language="javascript">
      for (var i=0;i<args.roleIDs.length;i++) 
          document.write("<option value='"+args.roleIDs[i]+"'>"+args.roleNames[i]+"</option>");
</script>
      </select>&nbsp;&nbsp;
      <button name="insrole" onClick="forInsRole()" class="button">增加</button>
    </td>
  </tr>
</table>

<div id=userRoles></div>

<script language="javascript">

function forCheckDept_user(deptcode){
	
	forCheckDept(deptcode,args.dept,1);
}


    function forShowRole()
    {
        var innerHTML="<table width=100% cellSpacing=1 cellPadding=0 class=tablestyle>";
        innerHTML+="<tr>";
        innerHTML+="<td width=100px class=tablebodyhead>机构编号</td>";
        innerHTML+="<td width=200px class=tablebodyhead>用户角色</td>";
        innerHTML+="<td class=tablebodyhead>操作</td>";
        innerHTML+="<tr>";
        for (ii=0; ii<roleArray.length; ii+=3) 
    {
        innerHTML+="<tr>";
        innerHTML+="<td width=100px class=tablebody>"+roleArray[ii]+"</td>";
        innerHTML+="<td width=200px class=tablebody>"+roleArray[ii+2]+"</td>";
        innerHTML+="<td class=tablebody><a href='javascript:forDelRole("+ii+")'>删除</a></td>";
        innerHTML+="</tr>";
    }
    innerHTML+="</table>";
    
      
    document.all('userRoles').innerHTML=innerHTML;
    }

    // 增加角色信息
    function forInsRole()
    {

        var ii = roleArray.length;
    
        var dept_code = document.forms[0].dept_code;
        
        if (dept_code.value =="")
        {
            alert("请输入正确的机构编号!");    
            return false;
        }
        
       
        var role_code = document.forms[0].role_code;
        if (role_code.value =="")
        {
            alert("请选择正确的角色信息!");    
            return false;
        }
    
        for (var kk=0; kk<ii; kk+=3)
        {
        
            if ((roleArray[kk] == dept_code.value) && (roleArray[kk+1] == role_code.value))
            {
                alert("选择的角色信息重复!");
                return false;
            }
        }
        
        dwr.engine.setAsync(false);

        baseBean.checkDept(dept_code.value,args.dept,
        {                   
            callback:function(data)
            {       
                if (data == true)
                {           
			        roleArray[ii++] = dept_code.value;
			        roleArray[ii++] = role_code.value;
			        for (var kk=0; kk<document.all('i_role_code').options.length; kk++)
			        {
			            if (document.all('i_role_code').options[kk].value == document.forms[0].role_code.value)
			            {
			                roleArray[ii] = document.all('i_role_code').options[kk].text;
			                break;
			            }
			        }
			        forShowRole();
                }               
            },              
            exceptionHandler:function(err_info)
            {       
                if (err_info!="")
                {
                    alert(err_info);
                }
                else
                {
                    alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
                    window.open("<%=thisPath%>/logoffAction.do?"+new Date(),"_parent");
                }
            }   
        });         
        dwr.engine.setAsync(true);
    }
    
    
    

    //删除角色信息
 function forDelRole(id)
{
    if (isNaN(id) || id > roleArray.length)
    {
        return false;
    }
    for (var i=0,n=0;i<roleArray.length;i+=3)
    {
        if (i!=id)
        {
            roleArray[n++]=roleArray[i];
            roleArray[n++]=roleArray[i+1];
            roleArray[n++]=roleArray[i+2];
        }
    }
    roleArray.length-=3;
   
    forShowRole();
}

    dwr.engine.setAsync(false);

    userBean.beforeUpdateTSUser(args.rowCard,
    {
        callback:function(data)
        {

            rowElements=data.split("</R>"); 
        
            colElements=rowElements[0].split("</C>");
            document.forms[0].user_code.value = colElements[0];
            document.forms[0].user_name.value = colElements[1];

            for (var i=1,k=0; i<rowElements.length-1; ++i)
            {
                colElements=rowElements[i].split("</C>");
                roleArray[k++] = colElements[0];
                roleArray[k++] = colElements[1];
                roleArray[k++] = colElements[2];
            }

            forShowRole();
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
</script>

</form>

<button name="button" onClick="forSure()" class="button">提交</button>
<button name="button" onClick="forAbort()" class="button">取消</button>

</div>

<script language="JavaScript">    

function forSure()    
{
    var updateString = new Array();
    var updateDepts = new Array();
    var updateRoles = new Array();
    var roleNames=new Array();

    if (roleArray.length < 3)
    {
        alert("用户应至少包含有一条角色信息!");
        return false;
    }

    var i = 0;

    updateString[i++] = document.forms[0].user_code.value;
    updateString[i++] =document.forms[0].user_name.value;
    
    var user_code=document.forms[0].user_code.value;
    
    var user_name=document.forms[0].user_name.value;

    for (var i = k = 0; k < roleArray.length; k += 3, i++)
    {
        updateDepts[i] = roleArray[k];
        updateRoles[i] = roleArray[k+1];
        roleNames[i]=roleArray[k+2];
    }

    retValue = new Array(4);

    retValue[0] = updateString.toString();
    retValue[1] = updateDepts.toString();
    retValue[2] = updateRoles.toString();
    retValue[3]=roleNames.toString();
	
	if (!confirm("确定要<bean:message key="button.modify" bundle="${language}"/>吗？"))
        return false;
	
    window.returnValue = updateString.toString()+"</C>"+updateDepts.toString()+"</C>"+updateRoles.toString()+"</C>|"+user_code+"</C>"+user_name+"</C>"+roleNames.toString()+",</C>";
    window.close();    
} 

function forAbort()    
{         
    window.close();    
} 

function forPrint()    
{         
    window.print();
} 
function forDeptTree(test,type,hidden)
{
	/*
	   机构编号从登陆人员信息中获得
	*/  
	
    var srcFile ="<%=thisPath%>/modules/base/jsp/deptree.jsp?jgbm="+args.dept+"&type="+type;

    var winFeatures = "dialogHeight:600px;dialogWidth:450px;help:no;status:no";

    inArray = window.showModalDialog(srcFile, hidden.value, winFeatures);
	
	if (typeof(inArray) == "undefined")
	{
     	//test.value = "";
     }
	else //如果另外指定了机构则下拉列表显示该机构的人员姓名
	{
		hidden.value=inArray+"</R>";
		test.value = inArray.split("</C>")[1];
		
	}
}


</script> 

</body>

</html>
