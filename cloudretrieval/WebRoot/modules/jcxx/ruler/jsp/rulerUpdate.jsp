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
	String language = bform.language;
%>

<script language="javascript">
    var args = window.dialogArguments;
</script>

<head>
  <title><bean:message key="button.modify" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/rulerBean.js"></script>
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
	<!-- 权限代码 -->
	<bean:message key="ruler.columns.rulerCode" bundle="${language}"/>
	</td>
    <td class=tablebody>
      <input class=inputext type="text" id="i_ruler_code" name="ruler_code"  size=20 maxlength=20 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="ruler.columns.rulerName" bundle="${language}"/></td>
    <td class=tablebody>
      <input class=inputext type="text" id="i_ruler_name" name="ruler_name"  size=20 maxlength=40 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="ruler.columns.rulerDesp" bundle="${language}"/></td>
    <td class=tablebody>
      <input class=inputext type="text" id="i_ruler_desc" name="ruler_desc"  size=50 maxlength=512 >
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="ruler.columns.rulerPage" bundle="${language}"/></td>
    <td class=tablebody>
      <input class=inputext type="text" id="i_ruler_page" name="ruler_page"  size=50 maxlength=256 >
    </td>
  </tr>
  <tr style="display:none">
    <td class=tablebodyhead>权限所属系统</td>
    <td class=tablebody>
      <select class=inputext size="1" id="i_target" name="target">
		<option value="0">本系统</option>
		<option value="1">外部系统</option>
      </select>
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="ruler.columns.rulerLevel" bundle="${language}"/></td>
    <td class=tablebody>
      <select class=inputext size="1" id="i_ruler_level" name="ruler_level" value="">
<script language="javascript">
      for (var i=0;i<args.RulerLevelIDs.length;i++) 
          document.write("<option value='"+args.RulerLevelIDs[i]+"'>"+args.RulerLevelNames[i]+"</option>");
</script>
      </select>
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="ruler.columns.rulerEcho" bundle="${language}"/></td>
    <td class=tablebody>
      <select class=inputext size="1" id="i_ruler_echo" name="ruler_echo" value="">
<script language="javascript">
      for (var i=0;i<args.RulerEchoIDs.length;i++) 
          document.write("<option value='"+args.RulerEchoIDs[i]+"'>"+args.RulerEchoNames[i]+"</option>");
</script>
      </select>
    </td>
  </tr>
  <tr>
    <td class=tablebodyhead><bean:message key="ruler.columns.rulerManager" bundle="${language}"/></td>
    <td class=tablebody>
      <input class=inputext type="text" id="i_ruler_manager" name="ruler_manager"  size=20 maxlength=20 >
    </td>
  </tr>
</table>

<script language="javascript">

    dwr.engine.setAsync(false);

    rulerBean.beforeUpdateTSRuler(args.rowID,
    {
        callback:function(data)
        {
            rowElements=data.split("</R>"); 
        
            colElements=rowElements[0].split("</C>");

            //document.forms[0].id.value = colElements[0];
            document.forms[0].ruler_code.value = colElements[1];
            document.forms[0].ruler_name.value = colElements[2];
            document.forms[0].ruler_desc.value = colElements[3];
            document.forms[0].ruler_page.value = colElements[4];
            document.forms[0].ruler_level.value = colElements[5];
            document.forms[0].target.value = trim(colElements[6]);
            document.forms[0].ruler_echo.value = colElements[7];
            document.forms[0].ruler_manager.value = colElements[8];
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
    var updateString = new Array();

    updateString[i++] = "ruler_code='"+document.forms[0].ruler_code.value+"'";
    updateString[i++] = "ruler_name='"+document.forms[0].ruler_name.value+"'";
    updateString[i++] = "ruler_desc='"+document.forms[0].ruler_desc.value+"'";
    updateString[i++] = "ruler_page='"+document.forms[0].ruler_page.value+"'";
    updateString[i++] = "ruler_level="+document.forms[0].ruler_level.value;
    updateString[i++] = "ruler_echo="+document.forms[0].ruler_echo.value;
    updateString[i++] = "ruler_manager='"+document.forms[0].ruler_manager.value+"'";
    updateString[i++] = "target='"+document.forms[0].target.value+"'";
  
    var ruler_code=document.forms[0].ruler_code.value;
    
    var ruler_name=document.forms[0].ruler_name.value;
    
    var ruler_page=document.forms[0].ruler_page.value
    
    var ruler_level=document.forms[0].ruler_level.value;
    
    var level_name=document.forms[0].ruler_level.options[document.forms[0].ruler_level.selectedIndex].text;
    
    var ruler_echo=document.forms[0].ruler_echo.value;
    
    var echo_name=document.forms[0].ruler_echo.options[document.forms[0].ruler_echo.selectedIndex].text;
    
    var ruler_manager=document.forms[0].ruler_manager.value;

	if (!confirm("<bean:message key="msg.areYouSure" bundle="${language}"/> <bean:message key="button.modify" bundle="${language}"/>？"))
        return false;
	
    window.returnValue = updateString.toString()+"|no</C>"+ruler_code+"</C>"+ruler_name+"</C>"+ruler_page+"</C>"+ruler_level+"</C>"+level_name+"</C>"+ruler_echo+"</C>"+echo_name+"</C>"+ruler_manager+"</C>";
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

</script> 

</body>

</html>
