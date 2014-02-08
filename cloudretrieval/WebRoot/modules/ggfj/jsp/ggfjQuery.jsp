<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<%@ page import="java.text.*"%>

<% 
    String thisPath=request.getContextPath();
    String qx=request.getParameter("qx");
    List PersonIDs=(List)request.getAttribute("PersonIDs");
    List PersonNames=(List)request.getAttribute("PersonNames");
    List StatusIDs=(List)request.getAttribute("StatusIDs");
    List StatusNames=(List)request.getAttribute("StatusNames");
	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
	String language = bform.language;
	SimpleDateFormat sdf3=new SimpleDateFormat("yyyy-MM-dd");
    String dqsj = sdf3.format(new Date());
    
    SimpleDateFormat sdf4=new SimpleDateFormat("yyyy-MM");
    String dqyf = sdf4.format(new Date());
%>

<html>

<head>
  <title>公共附件</title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
  <link href="<%=thisPath%>/modules/base/hx_table/css/hx_table.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/jquery-1.3.2.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_wait_plugin/hx_wait_plugin.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/jquery.hx_table.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/tools.js"></script>
  <script language="javascript" type="text/javascript" src="<%=thisPath%>/modules/base/scripts/My97DatePicker/WdatePicker.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/xxgl/ggfj/scripts/ggfjScript.js"></script>
  <script language="javascript" src="<%=thisPath%>/modules/xxgl/ggfj/scripts/ggfjObject.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/ggfjBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/calendar-setup.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/modules/base/scripts/cn_utf8.js"></script>
  <style type="text/css"> @import url("<%=thisPath%>/modules/base/css/calendar-blue.css"); </style>
</head>

<body onload="" topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">

<div class=tip>
    <table>
        <tr>
          <td width="20"><img src="<%=thisPath%>/images/main/icon1.gif" width="18" height="16"></td>
          <td width="915"><div id="path_name"><bean:message key="label.pagepath" bundle="${language}"/>：系统管理>基本信息管理><bean:message key="button.query" bundle="${language}"/>公共附件</div></td>
        </tr>
    </table>
</div>
<div class=padindex>
  <table>
    <tr>
      <td id=padindex0 class=activeindex onclick="switch_index(this, 0)"><div align="center"><bean:message key="button.query" bundle="${language}"/>公共附件<div></td>
    </tr>
  </table>
</div>

<div class=padcontent>

<div id=padcontent0 class=activecontent>

<form>

<!-- 选择<bean:message key="button.query" bundle="${language}"/>方式 -->

<table class=cardname>
<tbody>
  <tr>
    <td class=cardnameleft>公共附件</td>
  </tr>
</tbody>
</table>

<!-- 输入<bean:message key="button.query" bundle="${language}"/>条件 -->

<div class=scrollarea>

<table class=tableinput>
<tbody>


  <tr>
<script language="javascript">
    show_string_condition("文件名称", "value_op");
</script>
    <td class=TDLeft>
      <input type="text" name="value" size=20 maxlength=20 value="" onKeyDown="setTab()">
    </td>
 </tr>
 <tr>
<script language="javascript">
    show_string_condition("上传日期", "sc_rq_op");
</script>
    <td class=TDLeft>
    <input type="text" id="i_q_sc_rq" name="q_sc_rq" size=12 maxlength=10 value="" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM'})" onKeyDown="setTab()">
    </td>
  </tr>

 
<script language="javascript">

    show_string_condition("排序条件", "paixu_op");
</script>
    <td class=TDLeft>
     <select size="1" id="q_paixu" name="paixu" value="" onKeyDown="setTab()">
        <option value=''>请选择排序条件...</option>

        <option value='id'>内部编号</option>
        <option value='value'>文件名称</option>
        <option value='path'>文件路径</option>
        <option value='sc_rq'>上传日期</option>
        <option value='person'>上传用户</option>
        <option value='status'>状态</option>
      </select>
      
       </td>
  </tr>
  
  <tr>
<script language="javascript">

    show_string_condition("排序方式", "shunxu_op");
</script>
    <td class=TDLeft>
     <select size="1" id="q_shunxu" name="shunxu" value="" onKeyDown="setTab()">
        <option value=''>请选择排序方式...</option>
        <option value='desc' selected>降序</option>
        <option value='asc'>升序</option>

      </select>
      
       </td>
  </tr>
      
</tbody>
</table>

</div>

</form>

<!-- 显示<bean:message key="button.query" bundle="${language}"/>结果 -->

<div id="hx_table_div" class="queryresult"></div>
</div>
<!-- 增加公共附件 -->

<div id=padcontent1 class=hiddencontent>

<table class=cardname>
  <tr>
    <td class=cardnameleft>新增公共附件</td>
    <td class=cardnameright><bean:message key="label.note.requiredField" bundle="${language}"/></td>
  </tr>
</table>

<!-- 输入 -->

<form>

<div class=inputarea id="inputarea">

<table class=tableinput>

  <tr>
    <td class=TDTitle>
      文件名称：
    </td>
    <td class=TDLeft>
      <input type="text" id="i_value" name="value" size=20 maxlength=20 value="">
    </td>
  </tr>
  <tr>
    <td class=TDTitle>
      文件路径：
    </td>
    <td class=TDLeft>
      <input type="text" id="i_path" name="path" size=20 maxlength=20 value="">
    </td>
  </tr>

</table>
</div>

<!-- 插入操作按钮 -->

<button name="submit" onClick="forInsert('<%=thisPath%>')" class="button"><bean:message key="button.label.submit" bundle="${language}"/></button>
<button name="clear" onClick="forClear()" class="button"><bean:message key="button.label.reset" bundle="${language}"/></button></button>

</form>

<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>
<input id="qx_id" type="hidden" value="<%=qx%>"/>

</div>
</div>
<script type="text/javascript">
	var waitObj=new hx_wait($("#this_path_id").val()+"/modules/base/hx_wait_plugin");
    var height = document.body.clientHeight;
    $("#inputarea").height(height - 110);
    $("#hx_table_div").height(height - 173);

function UploadImage(obj)
{
	var width="900px";
	var height=screen.height;
	var url = "<%=thisPath%>/jsp/uploadDlg.jsp";
	var k  = window.showModalDialog(url,window,"location:No;help:No;dialogWidth:"+width+";status:no;dialogHeight:"+height+";");
	if(k==null){
		return;
	}
	var info = k.split("</F>");
	var serverPath = info[1];
	var len = info[0].split("</R>").length-1;
	
    var Vals = new Array();
	var Paths = new Array();
		
	//	fj += "<a  href=\"\" target=downLoad_hide onclick=download(\""+con[0].replace(/\s+/g,"_")+"\",\""+con[1]+"\") >"+con[0].replace(/\s+/g,'&nbsp;')+"</a>";

    if (!confirm("确定要增加公共附件吗？"))
        return false;
    
    ggfjBean.addTSGgfj(info[0].toString(),
    {
        callback:function(data)
        {
        	if (data == len)
            {
                alert("附件上传成功");
              
            }
            else if(data>0){
            	
                alert("部分附件上传成功！");
            }
            else
            {
                alert("对不起，增加信息失败！");
            }
        },
        exceptionHandler:function(err_info)
        { 
            if (err_info!="")
            {
                alert(err_info);
                window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
            }
            else
            {
                alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
                window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
            }    
        }
    });	


}


</script>
</body>
</html>
