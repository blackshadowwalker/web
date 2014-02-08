<%@ page language="java" contentType="text/html;charset=GBK"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<%@ page import="javax.sql.DataSource"%>

<html>

<%
    String thisPath=request.getContextPath();

	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
	
	String user_dept=bform.dept_code;
	
	String role_code = bform.role_code;
%>

<script language="javascript">
    var args = window.dialogArguments;
</script>

<head>
  <title><bean:message key="button.modify" bundle="${language}"/>人员基本信息</title>
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
</head>

<body>

<div class=cardbody>

<form>

<table width=100% cellSpacing=1 cellPadding=0 class="tablestyle">
  <tr>
    <td class=tablebodyhead>用户名</td>
    <td class=tablebody>
    <% if(role_code.equals("xtgl")||role_code.equals("super")){ %>
      <input type="text" id="i_user_code" name="user_code"  size=6 maxlength=6  >
      <%} else{%>
      <input type="text" id="i_user_code" name="user_code"  size=6 maxlength=6 readonly >
      <%} %>
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead>密码</td>
    <td class=tablebody>
      <input type="text" id="i_user_pass" name="user_pass"  size=20 maxlength=20 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead>姓名</td>
    <td class=tablebody>
      <input type="text" id="i_user_name" name="user_name"  size=20 maxlength=20 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead>所属部门</td>
    <td class=tablebody>

       <input type="text" id="i_dept_code" name="dept_code"  size=10 maxlength=9 onblur="forCheckDept(dept_code,re_dept_code.value)">
      <input type="hidden" name="re_dept_code" value="">
      <input type="hidden" name="dept_name" value="">
      <input type="hidden" name="dept_code_value" value="">
      <button onclick="forDeptTree(dept_code,'radio',dept_code_value)" class="deptbutton" style="margin-left:-15px;">…</button>  
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead>性别</td>
    <td class=tablebody>
      <select size="1" id="i_xb" name="xb" value="">
<script language="javascript">
      for (var i=0;i<args.XbIDs.length;i++) 
          document.write("<option value='"+args.XbIDs[i]+"'>"+args.XbNames[i]+"</option>");
</script>
      </select>
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead>出生日期</td>
    <td class=tablebody>
      <input type="text" id="i_csrq" name="csrq"  size=20 maxlength=20 class="Wdate" onClick="WdatePicker()">
    </td>
  </tr>
   <tr>
    <td class=tablebodyhead>参加工作时间</td>
    <td class=tablebody>
      <input type="text" id="i_gzsj" name="gzsj"  size=20 maxlength=20 class="Wdate" onClick="WdatePicker()">
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead>职级</td>
    <td class=tablebody>
      <input type="text" id="i_zc" name="zc"  size=20 maxlength=20 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead>职位</td>
    <td class=tablebody>
    
       <select size="1" id="i_zw" name="zw" value="">
      <script language="javascript">
      for (var i=0;i<args.RoleIDs.length;i++) 
          document.write("<option value='"+args.RoleIDs[i]+"'>"+args.RoleNames[i]+"</option>");
</script>
 </select>
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead>手机</td>
    <td class=tablebody>
      <input type="text" id="i_sj" name="sj"  size=20 maxlength=20 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead>办公电话</td>
    <td class=tablebody>
      <input type="text" id="i_tel" name="tel"  size=20 maxlength=20 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead>电子邮箱</td>
    <td class=tablebody>
      <input type="text" id="i_mail" name="mail"  size=20 maxlength=20 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead>家庭住址</td>
    <td class=tablebody>
      <input type="text" id="i_jtzz" name="jtzz"  size=20 maxlength=20 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead>挂职职务</td>
    <td class=tablebody>
  <select size="1" id="i_gzzw" name="gzzw" value="">
      <script language="javascript">
      for (var i=0;i<args.RoleIDs.length;i++) 
          document.write("<option value='"+args.RoleIDs[i]+"'>"+args.RoleNames[i]+"</option>");
	</script>
      </select>
    </td>
  </tr>
  
</table>

<script language="javascript">

    dwr.engine.setAsync(false);

    personBean.beforeUpdateTUPerson(parseInt(args.rowID),
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
        
            colElements=rowElements[0].split("</C>");

            document.forms[0].user_code.value = colElements[0];
            document.forms[0].user_name.value = colElements[1];
            document.forms[0].dept_code.value = colElements[2];
            document.forms[0].dept_name.value= colElements[3]
            document.forms[0].xb.value = colElements[4];
            document.forms[0].csrq.value = colElements[5];
            document.forms[0].gzsj.value = colElements[6];
            document.forms[0].zc.value = colElements[7];
            document.forms[0].zw.value = colElements[8];
            document.forms[0].sj.value = colElements[9];
            document.forms[0].tel.value = colElements[10];
            document.forms[0].mail.value = colElements[11];
            document.forms[0].jtzz.value = colElements[12];
            document.forms[0].gzzw.value = colElements[13];
            document.forms[0].user_pass.value = colElements[14];
           
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
    var i = 0;
    var updateString = new Array();
    var tmp = "|"+args.rowID+"</C>";

    tmp += document.forms[0].user_code.value+"</C>";
    updateString[i++] = "jh='"+document.forms[0].user_code.value+"'";
    tmp += document.forms[0].user_pass.value+"</C>";
    updateString[i++] = "passwd='"+document.forms[0].user_pass.value+"'";
    tmp += document.forms[0].user_name.value+"</C>";
    updateString[i++] = "user_name='"+document.forms[0].user_name.value+"'";
    tmp += document.forms[0].dept_name.value+"</C>";
    
    if(document.forms[0].dept_code.value=="")
    {
    	alert("请输入机构编号！");
    	return false;
    }
    updateString[i++] = "dept_code='"+document.forms[0].dept_code.value+"'";
    tmp += document.forms[0].xb.value+"</C>";
    updateString[i++] = "xb='"+document.forms[0].xb.value+"'";
    tmp += document.forms[0].csrq.value+"</C>";
    updateString[i++] = "csrq='"+document.forms[0].csrq.value+"'";
    tmp += document.forms[0].gzsj.value+"</C>";
    updateString[i++] = "gzsj='"+document.forms[0].gzsj.value+"'";
    tmp += document.forms[0].zc.value+"</C>";
    updateString[i++] = "zc='"+document.forms[0].zc.value+"'";
    tmp += document.forms[0].zw.options[document.forms[0].zw.selectedIndex].text+"</C>";
    
     if(document.forms[0].zw.value=="")
    {
    	alert("请输入职位！");
    	return false;
    }
    
    updateString[i++] = "zw='"+document.forms[0].zw.value+"'";
    tmp += document.forms[0].sj.value+"</C>";
    updateString[i++] = "sj='"+document.forms[0].sj.value+"'";
    tmp += document.forms[0].tel.value+"</C>";
    updateString[i++] = "tel='"+document.forms[0].tel.value+"'";
    tmp += document.forms[0].mail.value+"</C>";
    updateString[i++] = "mail='"+document.forms[0].mail.value+"'";
    tmp += document.forms[0].jtzz.value+"</C>";
    updateString[i++] = "jtzz='"+document.forms[0].jtzz.value+"'";
    
    if(document.forms[0].gzzw.value==0)
    {
    	tmp += " </C>";
    }
    else
    {
    	  tmp += document.forms[0].gzzw.options[document.forms[0].gzzw.selectedIndex].text+"</C>";
    }
    updateString[i++] = "gzzw='"+document.forms[0].gzzw.value+"'";
    
    if(document.forms[0].gzzw.value!="0")
    {
    	updateString[i++] = "role_code='"+document.forms[0].gzzw.value+"'";
    }
    else
    {
    	updateString[i++] = "role_code='"+document.forms[0].zw.value+"'";
    }
    

	if (!confirm("确定要<bean:message key="button.modify" bundle="${language}"/>吗？"))
        return false;
        
    window.returnValue = updateString.toString()+tmp;
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
		document.forms[0].dept_name.value = inArray.split("</C>")[2];
		
	}
}
   
</script> 

</body>

</html>
