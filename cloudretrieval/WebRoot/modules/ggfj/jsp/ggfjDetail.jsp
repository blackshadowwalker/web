<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<%
    baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
    String language = bform.language;
    System.out.println(language);
%>

<html>

<%
	String serverPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";

    String thisPath=request.getContextPath();
%>

<head>
  <title><bean:message key="ggfj.title" bundle="${language}"/></title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base.css" type="text/css" media="screen">
  <link rel="stylesheet" href="<%=thisPath%>/modules/base/css/base-print.css" type="text/css" media="print">
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/baseBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/ggfjBean.js"></script>
<style>
.TrColor
{
    background-color:#E09ED8;

}
</style>
</head>

<body>

<div class=cardbody>

  <table width=100% cellSpacing=1 cellPadding=0 class="tablestyle">

<script>
    var rowID = window.dialogArguments;

    dwr.engine.setAsync(false);

    ggfjBean.detailTSGgfj("",
    {
        callback:function(data)
        {
        	if(data=="") {
        		alert("<bean:message key="msg.error.dataEmputy" bundle="${language}"/>");
        		this.close();
        	}
       		document.write("<tr><td class=tablebodyhead width=150px><bean:message key="ggfj.columns.filename" bundle="${language}"/></td>");
            document.write("<td class=tablebodyhead width=150px><bean:message key="ggfj.columns.uploadOn" bundle="${language}"/></td>");
            document.write("<td class=tablebodyhead width=100px><bean:message key="ggfj.columns.uploader" bundle="${language}"/></td>");
            document.write("<td class=tablebodyhead width=50px><bean:message key="ggfj.columns.download" bundle="${language}"/></td>");
            document.write("</tr>");
	            
            rows=data.split("</R>"); 
			for(var i=0; i<rows.length-1; i++){	        
	            colElements=rows[i].split("</C>");
		//		alert(rows[i]);
				if(i%2==0) color = "TrColor";
				else color="tablebody";
	            document.write("<tr>");
	            document.write("<td class=' "+color+"'>"+colElements[0]+"</td>");
	            document.write("<td class=' "+color+"'>"+colElements[2]+"</td>");
	            document.write("<td class=' "+color+"'>"+colElements[3]+"</td>");
	            document.write("<td class=' "+color+"'><button onclick=download('"+colElements[0].replace(/\s+/g,"_")+"','"+colElements[1]+"') ><bean:message key="ggfj.columns.download" bundle="${language}"/></button></td>");
	            document.write("</tr>");
	         }
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

  </table>

<button name="button" onClick="forAbort()" class="button">
	<bean:message key="button.label.close" bundle="${language}"/>
</button>

</div>
<iframe id="_hidden_iframe" name="_hidden_iframe" style="display:none;width:900;height:300"></iframe>
<script language="JavaScript">    

function forAbort()    
{         
    window.close();
} 

function download(name,path)
{
	var url = "<%=serverPath%>/jsp/download.jsp?fileName="+name+"&filePath="+path;
//	alert(url);
	window.open(url);
//	window.open(url,"_hidden_iframe");
}

</script> 



</body>

</html>
