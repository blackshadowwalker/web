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
		baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
		
		String user_dept=bform.dept_code;
%>

<script language="javascript">
    var args = window.dialogArguments;
</script>

<head>
  <title><bean:message key="dept.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">

 <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>

  
   <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/deptBean.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/jcxx/dept/script/deptScript.js"></script>
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
    <td class=tablebodyhead width=150px>
	<bean:message key="dept.columns.deptCode" bundle="${language}"/>
</td>
    <td class=tablebody>
      <input type="text" id="i_dept_code" name="dept_code"  size=9 maxlength=9 disabled>
    </td>
  </tr>
 <tr>
    <td class=tablebodyhead>
	<bean:message key="dept.columns.deptName" bundle="${language}"/>
	</td>
    <td class=tablebody>
      <input type="text" id="i_dept_name" name="dept_name" size=40 maxlength=80 value="">
        <input type="hidden" id="i_dept_level" name="dept_level" size=40 maxlength=80 value="10">
        <input type="hidden" id="i_dept_lx" name="dept_lx" size=40 maxlength=80 value="10">
    
    </td>
  </tr>
  
    <tr>
    <td class=tablebodyhead>
	<bean:message key="dept.columns.deptManager" bundle="${language}"/>
	</td>
    <td class=tablebody>
      <input type="text" id="i_dept_manager" name="dept_manager"  size=10 maxlength=9 onblur="forCheckDept(dept_manager,re_dept_manager.value)">
      <input type="hidden" name="re_dept_manager" value="">
      <input type="hidden" name="dept_manager_value" value="">
      <button onclick="forDeptTree(dept_manager,'radio',dept_manager_value)" class="deptbutton" style="margin-left:-15px;">…</button>  
    </td>
  </tr>
  
   <tr>
    <td class=tablebodyhead>
	<bean:message key="dept.columns.deptLeader" bundle="${language}"/>
	</td>
    <td class=tablebody>
      <input type="text" id="i_fgld" name="fgld" size=18 maxlength=18 value="" onKeyDown="setTab()" onblur="getPerName('<%=thisPath%>',value)">
      <input type="hidden" name="fgld_value" value="">
     <button onclick="forUserTree(fgld,'radio',fgld_value,1)" class="deptbutton" style="margin-left:-7px;">…</button>
	 <span id="i_per_name"></span>

    </td>
  </tr>
  
 

</table>

<script language="javascript">

    dwr.engine.setAsync(false);

    deptBean.beforeUpdateTSDept(args.rowID,
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
        
            colElements=rowElements[0].split("</C>");

            document.forms[0].dept_code.value = colElements[0];
            document.forms[0].dept_name.value = colElements[1];
            document.forms[0].dept_manager.value = colElements[2];
           
             document.forms[0].fgld.value = colElements[3];
               document.getElementById("i_per_name").innerHTML=colElements[4];
           

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

<button name="button" onClick="forSure()" class="button">
	<bean:message key="button.label.submit" bundle="${language}"/>
</button>
<button name="button" onClick="forAbort()" class="button">
	<bean:message key="button.label.close" bundle="${language}"/>
</button>

</div>

<script language="JavaScript">    

function forSure()    
{
    var i = 0;
    var j = 0;
    
    var dept_code="";
    var dept_name="";
    var dept_lx="";
  
    var dept_level="";
  
    
    var updateString = new Array();
    var updateString2 = new Array();
    
	if(document.forms[0].dept_code.value!="")
    {
    	updateString[i++] = "dept_code='"+document.forms[0].dept_code.value+"'";
    	updateString2[j++] = "dept_code='"+document.forms[0].dept_code.value+"'";
    	
    	dept_code=document.forms[0].dept_code.value;
    }
    else
    {
    	alert("请输入机构编号");
    	return;
    }
    
    if(document.forms[0].dept_name.value!="")
    {
    	updateString[i++] = "dept_name='"+document.forms[0].dept_name.value+"'";
    	
    	dept_name=document.forms[0].dept_name.value;
    }
    else
    {
    	alert("请输入机构名称");
    	return;
    }
    
    if(document.forms[0].dept_level.value!="")
    {
    	updateString[i++] = "dept_level="+document.forms[0].dept_level.value;
    	
    	dept_level=document.forms[0].dept_level.value;
    	
    	level_name=document.forms[0].dept_level.value;
    }
    else
    {
    	alert("请输入机构等级");
    	return;
    }
    
    if(document.forms[0].dept_lx.value!="")
    {
    	updateString[i++] = "dept_lx="+document.forms[0].dept_lx.value;
    	
    	dept_lx=document.forms[0].dept_lx.value;
    	
    	lx_name=document.forms[0].dept_lx.value;
    }
    else
    {
    	alert("请输入机构类型");
    	return;
    }

   	

    
    if(document.forms[0].dept_manager.value!="")
    {
    	updateString[i++] = "dept_manager='"+document.forms[0].dept_manager.value+"'";
    }
    else
    {
    	alert("请输入机构上级编号");
    	return;
    }
    var fgld = document.getElementById("i_per_name").innerHTML;
    if(document.forms[0].fgld.value!="")
    {
		updateString[i++] = "fgld='"+document.forms[0].fgld.value+"'";
	}
	else
	{
		updateString[i++] = "fgld=''";
	}
	
    var curr = "no";
    if(document.forms[0].dept_manager.value != document.forms[0].re_dept_manager.value)
    {
    	curr = dept_code+",";
    	curr += dept_level+",";
    	curr += dept_lx;
    }
    
    if (!confirm("确定要<bean:message key="button.modify" bundle="${language}"/>机构信息吗？"))
        return false;

    window.returnValue = updateString.toString()+"</C>"+updateString2.toString()+"|no</C>"+dept_code+"</C>"+dept_name+"</C>"+fgld+"</C>|"+curr;
    //alert(updateString.toString()+"</C>"+updateString2.toString()+"|no</C>"+dept_code+"</C>"+dept_name+"</C>"+fgld+"</C>|"+curr);
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
    var dept = "37015oooo";
	
    var srcFile = '<%=thisPath%>'+"/modules/base/jsp/deptree.jsp?jgbm="+args.dept_manager+"&type="+type;

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
		
	}
}

function forUserTree(test,type,hidden,form)
{
	/*
	   机构编号从登陆人员信息中获得
	*/  

	var dept = '<%=user_dept%>';
	
    var srcFile = "<%=thisPath%>/modules/base/jsp/usertree.jsp?jgbm="+dept+"&type="+type;

    var winFeatures = "dialogHeight:600px;dialogWidth:500px;help:no;status:no";

    inArray = window.showModalDialog(srcFile, hidden.value, winFeatures);
    
	
	if (typeof(inArray) != "undefined" && trim(inArray)!="")
	{
		hidden.value=inArray+"</R>";
		test.value=inArray.split("</C>")[1];
		document.getElementById("i_per_name").innerHTML = inArray.split("</C>")[2];
	}
	else
	{
		hidden.value="";
		test.value="";
		document.getElementById("i_per_name").innerHTML = "";
	}
		
}     

function checkNum(id)
{
	if(!__isNum(document.getElementById(id).value))
	{
		alert("请输入正确的数字！");
		document.getElementById(id).value=0;
	}
	if(id!="i_counters")
	{
		if(parseInt(document.getElementById(id).value) > parseInt(document.getElementById("i_counters").value))
		{
			alert("输入的数量大于柜台数量！");
			document.getElementById(id).value=0;
		}
	}

}

function Add_number(id,max)
{
	var number = document.getElementById(id);
	if(number.value<max)
		number.value++;
}

function Muli_number(id,min)
{
	var number = document.getElementById(id);
	if(number.value>min)
		number.value--;
}

function changeLevel()
{
	if(document.getElementById("i_dept_level").value == 4){
	
		document.getElementById("tr_counters").style.display = "";
		document.getElementById("tr_low_counters").style.display = "";
		document.getElementById("tr_cash_counters").style.display = "";
	}
	else{
	
		document.getElementById("tr_counters").style.display = "none";
		document.getElementById("tr_low_counters").style.display = "none";
		document.getElementById("tr_cash_counters").style.display = "none";
	}
}
</script> 

</body>

</html>
