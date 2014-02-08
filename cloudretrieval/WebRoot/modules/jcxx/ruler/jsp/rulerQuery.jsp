<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-tiles" prefix="tiles"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%> 
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>

<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>

<% 
	//得到系统路径；
    String thisPath=request.getContextPath();
 	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
    String language = bform.language;
   
   	List rulerCodeList=(List)request.getAttribute("rulerCodeList");
    List rulerNameList=(List)request.getAttribute("rulerNameList");
    String pagePath = rulerNameList.get(2)+">"+rulerNameList.get(1)+">"+rulerNameList.get(0);
    
    String qx=request.getParameter("qx");
	//获取下拉列表的值
	List RulerLevelIDs=(List)request.getAttribute("RulerLevelIDs");
    List RulerLevelNames=(List)request.getAttribute("RulerLevelNames");
    List RulerEchoIDs=(List)request.getAttribute("RulerEchoIDs");
    List RulerEchoNames=(List)request.getAttribute("RulerEchoNames");
   
%>

<html>
<head>
  <title><bean:message key="ruler.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <link href="<%=thisPath%>/modules/base/hx_table/css/hx_table.css" rel="stylesheet" type="text/css" />
  
   <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/jquery.hx_table.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/tools.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/jcxx/ruler/scripts/rulerObject.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/jcxx/ruler/scripts/rulerScript.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/rulerBean.js"></script>

  <script type="text/javascript" src="<%=thisPath%>/modulse/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modulse/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modulse/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("modules/base/css/calendar-blue.css"); </style>

  <style>
	.inputext{
		width:120px;
	}
  </style>
  
 </head>

<body onLoad="" topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">

<div class=tip>
    <table>
        <tr>
          <td width="20"><img src="<%=thisPath%>/modules/jcxx/ruler/image/icon1.gif" width="18" height="16"></td>
          <td width="915">
          	<div id="path_name">
          	<bean:message key="label.pagepath" bundle="${language}" />
			:<%=pagePath %>
			</div></td>
        </tr>
    </table>
</div>

<div class=padindex>
  <table>
    <tr>
      <td id=padindex0 class=activeindex onClick="switch_index(this, 0)"><div align="center">
	  <bean:message key="ruler.title"  bundle="${language}" />
	  </div></td>
      <td id=padindex1 class=hiddenindex onClick="switch_index(this, 1)" style="display:none"><div align="center">
		<bean:message key="ruler.insert"   bundle="${language}" />
	  </div></td>
    </tr>
  </table>
</div>

<div class=padcontent>

<div id=padcontent0 class=activecontent>

<form>

<!-- 选择query方式 -->

<table class=cardname>
<tbody>
  <tr>
    <td class=cardnameleft>
		<bean:message key="ruler.name" bundle="${language}"/>
	</td>
  </tr>
</tbody>
</table>

<!-- 输入query条件 -->

<div class=scrollarea>
<table class=tableinput>
<tbody>

 <tr> 
    <td width="150"><div align="right">
		<!-- 菜单代码： -->
		<bean:message key="ruler.label.rulerCode" bundle="${language}"/>:
	</div></td>
    <td width="200" > 
	<input class=inputext type="text" name="ruler_code" size=20 maxlength=20 value="" onKeyDown="setTab()"> 
    </td>
    <td width="100"><div align="right">
		<!-- 菜单名称：-->
		<bean:message key="ruler.label.rulerName" bundle="${language}"/>:
		</div></td>
    <td > 
	<input class=inputext type="text" name="ruler_name" size=20 maxlength=40 value="" onKeyDown="setTab()"> 
    </td>
  </tr>
  
   <tr> 
    <td width="150"><div align="right">
		<!-- 菜单级别： -->
		<bean:message key="ruler.label.rulerLevel" bundle="${language}"/>:
		</div></td>
    <td width="200" > 

 	<select class=inputext size="1" id="q_ruler_level" name="ruler_level" value="" onKeyDown="setTab()">
        <option value=''>...</option>
		<%
		    for (int i = 0; i < RulerLevelIDs.size(); i ++){
		%>
		        <option value='<%=RulerLevelIDs.get(i)%>'><%=RulerLevelNames.get(i)%></option>
		<%
		    }
		%>
      </select> 
    </td>
    <td width="100"><div align="right">
		<!-- 显示属性：-->
		<bean:message key="ruler.label.rulerEcho" bundle="${language}"/>:
	</div></td>
    <td > 

 	<select  class=inputext size="1" id="q_ruler_echo" name="ruler_echo" value="" onKeyDown="setTab()">
        <option value=''>...</option>
        <%
		    for (int i = 0; i < RulerEchoIDs.size(); i ++){
		%>
		        <option value='<%=RulerEchoIDs.get(i)%>'><%=RulerEchoNames.get(i)%></option>
		<%
		    }
		%>

      </select>
    </td>
  </tr>
  
  
  
  <tr>
<script language="javascript">
    show_string_condition("<bean:message key="ruler.label.rulerManager" bundle="${language}"/>:", "ruler_manager_op");
</script>
    <td class=TDLeft>
      <input class=inputext type="text" name="ruler_manager" size=20 maxlength=20 value="" onKeyDown="setTab()">
    </td>
  </tr>

</tbody>
</table>

</div>

<!-- <bean:message key="button.query" bundle="${language}"/>操作按钮 -->

<!-- <button name="query" onClick="forQuery('')" class="button">开始<bean:message key="button.query" bundle="${language}"/></button>
<button name="reset" onClick="forReset()" class="button">清空条件</button> -->


<span id=scrollbar>操作正在进行，请等待...</span>

</form>

<!-- 显示button.query结果 -->

<div id="hx_table_div" class="queryresult"></div>

<!-- <object id="OWC" classid="clsid:0002E551-0000-0000-C000-000000000046"
    class="queryresult viewastext">
  <param name="AutoFit" value="false">
  <param name="DisplayColHeaders" value="false">
  <param name="DisplayGridlines" value="true">
  <param name="DisplayHorizontalScrollBar" value="true">
  <param name="DisplayVerticalScrollBar" value="true">
  <param name="DisplayRowHeadings" value="true">
  <param name="DisplayColumnHeadings" value="true">
  <param name="DisplayTitleBar" value="false">
  <param name="DisplayToolbar" value="true">
  <param name="DisplayPropertyToolbox" value="false">
  <param name="DisplayWorkbookTabs" value="false">
  <param name="DisplayOfficeLogo" value="false">
  <param name="EnableAutoCalculate" value="false">
  <param name="EnableEvents" value="true">
  <param name="NumberFormat" value="General">
</object> -->
</div>

<!-- 增加菜单信息 -->

<div id=padcontent1 class=hiddencontent>

<table class=cardname>
  <tr>
    <td class=cardnameleft>
	<bean:message key="ruler.insert" bundle="${language}"/>
	
	</td>
    <td class=cardnameright><bean:message key="label.note.requiredField" bundle="${language}"/></td>
  </tr>
</table>

<!-- 输入 -->

<form>

<div class=inputarea style="height:210px;">

<table class=tableinput>

  <tr >
    <td class=TDTitle>
		<span style="font-weight:normal;">*</span>
		<bean:message key="ruler.columns.rulerCode" bundle="${language}"/>:
	</td>
    <td class=TDLeft >
      <input class=inputext  type="text" id="i_ruler_code" name="ruler_code" size=20 maxlength=20 value="">
 
    </td>
  </tr>
  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>
		<bean:message key="ruler.columns.rulerName" bundle="${language}"/>:
	</td>
    <td class=TDLeft>
      <input class=inputext type="text" id="i_ruler_name" name="ruler_name" size=20 maxlength=40 value="">
 
    </td>
  </tr>
  <tr>
    <td class=TDTitle>
		<bean:message key="ruler.columns.rulerDesp" bundle="${language}"/>:
	</td>
    <td class=TDLeft>
      <input class=inputext  type="text" id="i_ruler_desc" name="ruler_desc" maxlength=512 value="">
    </td>
  </tr>
  <tr>
    <td class=TDTitle>
		<bean:message key="ruler.columns.rulerPage" bundle="${language}"/>:
	</td>
    <td class=TDLeft>
      <input class=inputext type="text" id="i_ruler_page" name="ruler_page"  maxlength=256 value="">
    </td>
  </tr>
  <tr style="display:none">
    <td class=TDTitle><span style="font-weight:normal;">*</span>菜单所属：</td>
    <td class=TDLeft>
      <select class=inputext  size="1" id="i_target" name="target" value="" onKeyDown="setTab()">
        <option value='0' selected >本系统</option>
        <option value='1'>外部系统</option>
      </select>

    </td>
  </tr>
  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>
		<bean:message key="ruler.columns.rulerLevel" bundle="${language}"/>:
	</td>
    <td class=TDLeft>
      <select class=inputext  size="1" id="i_ruler_level" name="ruler_level" value="" onKeyDown="setTab()">
		<%
		    for (int i = 0; i < RulerLevelIDs.size(); i ++){
		%>
		        <option value='<%=RulerLevelIDs.get(i)%>'><%=RulerLevelNames.get(i)%></option>
		<%
		    }
		%>
      </select>
  
    </td>
  </tr>
  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>
		<bean:message key="ruler.columns.rulerEcho" bundle="${language}"/>:
	</td>
    <td class=TDLeft>
      <select class=inputext  size="1" id="i_ruler_echo" name="ruler_echo" value="" onKeyDown="setTab()">
		<%	
		    for (int i = 0; i < RulerEchoIDs.size(); i ++){
		%>
		        <option value='<%=RulerEchoIDs.get(i)%>'><%=RulerEchoNames.get(i)%></option>
		<%
		    }
		%>
      </select>

    </td>
  </tr>
  <tr>
    <td class=TDTitle><span style="font-weight:normal;">*</span>
		<bean:message key="ruler.columns.rulerManager" bundle="${language}"/>:
	</td>
    <td class=TDLeft>
      <input class=inputext  type="text" id="i_ruler_manager" name="ruler_manager" size=20 maxlength=20 value="">

    </td>
  </tr>

</table>
</div>

<!-- 插入操作按钮 -->
<span width=200px >&nbsp;</span>
<button name="submit" onClick="forInsert()" class="button"><bean:message key="button.label.submit" bundle="${language}"/></button>

<button name="clear" onClick="forClear()" class="button"><bean:message key="button.label.reset" bundle="${language}"/></button></button>

</form>
<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<input id="qx_id" type="hidden" value="<%=qx%>"/>
</div>
</div>
<script type="text/javascript">


</script>
</body>
</html>