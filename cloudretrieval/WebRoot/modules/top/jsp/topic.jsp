<%@ page contentType="text/html;charset=GBK" isErrorPage="false" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page import="modules.base.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<HTML>

<%
	String thisPath=request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
    baseForm user = (baseForm)session.getAttribute("baseuser");
    String version = (String)session.getAttribute("version");
    String bundle = user.language;
	String picture = (String)request.getSession().getAttribute("picture");

    List languagesKeys = (List)request.getAttribute("languagesKeys");
    List languagesNames = (List)request.getAttribute("languagesNames");
%>

<HEAD>
  <title>topic PAGE</title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/logonBean.js"></script>
  
  <link href="css/bootstrap.css" rel="stylesheet">
    <!-- Loading Flat UI -->
    <link href="css/flat-ui.css" rel="stylesheet">
    
     <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
    <![endif]-->
  
  <style>
   .topic {
	font: bold 30px 黑体;
	color: #04477C;
	position: absolute;
	top: 20px;
	left: 400px;
	width:600px
}
   .userinfo {
	font: bold 12px 宋体;
	color: white;
	position:absolute;
	top: 5px;
	right: 5px;
}
   .ptgzrq {
	font: bold 12px 宋体;
	color: white;
	position:absolute;
	top: 25px;
	right: 5px;
	}
	.languageSelect{
		font: bold 10px ;
		color: #000 ;
		margin-top:-1px;
		margin-left:-5px;
		margin-bottom:5px;
		border:1px RGB(80,172,232) solid;
		width:105px;
		height:20px;
		vertical-align:middle;
		background: RGB(80,172,232);
	}
  </style>
  
</HEAD>
<BODY>

<table border="0" width="100%" style="background:url('<%=thisPath %>/modules/top/image/top_bg.jpg');background-position:top right;background-repeat:no-repeat;height:100px;width:100%">
    <tbody>
        <tr>
            <td width="100px" align="right" id="logo">
              <p id="i_image">
            	<img id="img_" src="${basePathExtName}/<%=user.logo %>" height="90" >
              </p>
            <!-- <img src="image/logo.png" height="90"> -->
            </td>

            <td>
	            <table border="0" style="margin-top:5px;" cellpadding="0" cellspacing="0">
	               <tr>
	                 <td style="font: bold 32 黑体; color:#003366" id="mainTitle"><%=user.mainTitle %></td>
	               </tr>
	            </table>
            </td>
            <td align="right">
            	<div style="position:absolute;top:0px;right:10px;border:0px #f00 solid;" > 
            		<font style="font-size='11px';">
            		<bean:message key="top.version" bundle="<%=bundle %>" />:
            		<%=version %>&nbsp;&nbsp;
            		</font>

            	<span style="border:solid 0px #f00; width:80px; height:20px; overflow:hidden;">
					<select class="languageSelect" onchange="changLanguage(this)" >
						<% 
							String selected = "";
							for(int i=0; i<languagesKeys.size(); i++){ 
								if(languagesKeys.get(i).equals(user.language))
									selected = "selected";
								else
									selected = "";
						%>
							<option value="<%=languagesKeys.get(i)%>"  <%=selected %>><%=languagesNames.get(i)%></option>
						<% } %>
					</select>
					</span>
            		&nbsp;&nbsp;&nbsp;
            	</div>
            	<div style=" border:0px #0f0 solid;" >
           		 <font style="font-size='14px'">
           		 	<bean:message key="top.welcome" bundle="<%=bundle %>" />
           		 	:<%=user.user_name %>
           		 		(<%=user.user_code %>) 
           		 	&nbsp;&nbsp;&nbsp;
           		 	</font>
           		 </div>
            </td>
        </tr>
    </tbody>
</table>
<script>

	function changLanguage(obj){
		var lang = obj.options[obj.selectedIndex].value;
		var thispath = "<%=thisPath%>";
		logonBean.setLanguage("<%=user.user_code %>",lang,{
			callback : function(data) {
				window.open(thispath + "/logonAction.do?"+ new Date(), "_parent");
			},
			exceptionHandler : function(err_info) {
				if(err_info!="")
					alert(err_info);
				else{
					window.open(thispath + "/logoffAction.do?" + new Date(),"_parent");
				}
			}
		});
	}
</script>
</BODY>
</HTML>
