<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
    String thisPath=request.getContextPath();
	String mainTitle = (String)request.getAttribute("mainTitle");
	System.out.println("getLocalName="+request.getLocalName());
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+thisPath+"/";
//	System.out.println("mainTitle: " + mainTitle);
%>
<html>
<head>
  <title><bean:message key="main.title" bundle="${language}" /></title>
   <base href="<%=basePath%>">
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/util.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/logonBean.js"></script>
  
  <LINK href="<%=thisPath%>/modules/pad/css/base.css" rel="stylesheet" type="text/css">
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/tools.js"></script>

  <SCRIPT src="<%=thisPath%>/table_view/jquery.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/jquery-ui-1.7.2.custom.min.js" type=text/javascript></SCRIPT>
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_wait_plugin/hx_wait_plugin.js"></script>
  <SCRIPT src="<%=thisPath%>/scripts/getBrowserType.js" type=text/javascript></SCRIPT>
  

<style type="text/css">

tr{
	height:40px;
}

.logintxt{
    border-right: #ffffff 0px solid;
    border-top: #ffffff 0px solid;
    font-size: 13pt; /*www.52css.com*/
    border-left: #ffffff 0px solid;
    border-bottom: #000000 1px solid;
    background-color: #ffffff;
    height:23px;
}
.rightLabel{
	display:inline-block;
	text-align:right;
	width:100px;
	heith:26px;
	border:0px #0f0 solid;
	font-size:16px;
}
.loginTable{
	
	border:0px solid #fa0;
	width:100%;
	height:100%;
}
#loginpannel{
	border:1px solid #fa0;
	background: url(modules/logon/image/logintable.png) no-repeat;
	position:absolute;
	left: 35%;
	top: 35%;
	z-index:100;
}
.titlelabel {
	color: #031670;
	font-size:18px;
	font-weight: 600;
	font-family: "Microsoft YaHei";
}
            
            
</style>
</head>

<script type="text/javascript">
	$(document).ready(function(){
		$( "#loginpannel" ).draggable();
		document.getElementById("i_usercode").focus();
		refreshcode();
	});
	
	$(window).resize(function() {
	 // location.reload();
	 /*
	 	var w = $(document).width();
	 	var h = $(document).height();
	 	$("#backgroundimage").width(w);
	 	$("#backgroundimage").height(h);
	 	*/
	});

 function setTab(){
    if (event.keyCode==13){
        cus_login();
    }
}

dwr.engine.setAsync(false);
  var waitObj=new hx_wait("<%=thisPath%>/modules/base/hx_wait_plugin");
    function cus_login()
    {
        var codeElem=document.getElementById('i_usercode');
        if(codeElem.value=="" || codeElem.value.length==0)
        {
            window.alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="login.username" bundle="${language}" />");
            codeElem.focus();
            return false;
        }
      
      	var pwElem=document.getElementById('i_password');
        if(pwElem.value=="" || pwElem.value.length==0)
        {
            window.alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="login.password" bundle="${language}" />");
            pwElem.focus();
            return false;
        }
        var vcode = $("#i_captchacode").val();
        vcode = $.trim(vcode);
        if(vcode==""){
        	 window.alert("<bean:message key="msg.pleaseInput" bundle="${language}"/> <bean:message key="login.captchacode" bundle="${language}"/>");
        	return false;
        }
        
        waitObj.show({
	    	left:"45%",
	    	bottom:"50%",
	    	width:"280px",
	    	height:"50px",
	    	text_align:"center",
	    	msg:"<span style=\"font-weight:bold;\"><bean:message key="login.wait" /> </span>"
   		 });
   		 
   		 var user_code = $.trim(codeElem.value);
        logonBean.checkRole(user_code, pwElem.value,  vcode,{
            callback:function(data){
            waitObj.hide();
           	var url = "<%=thisPath%>/logonAction.do";
				    window.opener=null;
					var scrWidth=screen.availWidth;
					var scrHeight=screen.availHeight;
				//	var self=window.open(url,"_blank","resizable=1");
//	var self=window.open(url,"newwindow","height="+scrHeight+",width="+scrWidth+",top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no");
					var openType = "";
					if(getBrowserOs()=="IE")
						openType = "teleframe";
					else
						openType = "_self";
					openType = "_self";
					waitObj.hide();
					window.top.location.href = url;
				//	var newWin = window.open(url, openType, "scrollbars:no,fullscreen=yes, channelmode=yes,titlebar=no, toolbar:no, location=no, direction=no,  resizeable=no,Width="+scrWidth+", Height="+scrHeight+"top=-50");
				//	self.moveTo(-4,-4);
				//	self.resizeTo(scrWidth+9,scrHeight+9);
					
					return ;
					if(getBrowserOs()=="IE")
					{
					//	window.open('','_self');
						if(newWin != this)
					//		window.top.close();
						;	
					}
            },
            
            exceptionHandler:function(err_info){
            	refreshcode();
                waitObj.hide();
                if(err_info!=""){
                    alert(err_info);
                    pwElem.value="";
                    document.getElementById("i_usercode").focus();
                }
            }
        });
        
        return false;
    }
    
	function forReset(){
    	document.getElementById('i_usercode').value="";
    	document.getElementById('i_password').value="";
    	document.getElementById('i_usercode').focus();
    	
    	return false;
    }
    function codeCallback(response,status,xhr){
    	$("#i_captchacode").val(response);
    }
    function refreshcode(){
    	$("#i_CaptchaCodepic").attr("src", "<%=thisPath%>/CaptchaCode?"+new Date());
    	$.get("<%=thisPath%>/getCaptchaCodeNum?"+new Date(), "" ,codeCallback, "text"); 
    }
	dwr.engine.setAsync(true);

</script>


<body topmargin="0" leftmargin="0" rightmargin="0"  onload="document.forms[0].usercode.focus()" >
<div style="width:100%;height:100%;position:absolute;z-index:-1;top:0px;border:0px #f00 solid;">
	<img id="backgroundimage" src="modules/logon/image/loginbg.png" width="100%" height="100%" >
</div> 

<div id=loginpannel align=center style="border:0px #0f0 solid; width:420px; height:280px;">
		<br/>
		<!-- &nbsp;&nbsp;电&nbsp;子&nbsp;警&nbsp;察&nbsp;系&nbsp;统 -->
		<p class=titlelabel ><bean:message key="main.title" bundle="${language}" /></p>
		<form action="">
				<div class="loginTable">
					<table border =0  cellpadding="5" cellspacing="1" >
						  <tr>
							<td colspan="2">
								<span class=rightLabel><bean:message key="login.username" bundle="${language}"/>:</span>
								<input type="text" name="usercode" value='' id="i_usercode"  style="width:180px; background:none;"  onKeyDown="javascript:if (event.keyCode==13) event.keyCode=9;" />
							</td>
						  </tr>
						  <tr>
							<td colspan="2">
								<span class=rightLabel><bean:message key="login.login.password" bundle="${language}"/>:</span>
							  <input id="i_password" type="password" value='' name="password" style="width:180px; background:none;" onKeyDown="javascript:if (event.keyCode==13) event.keyCode=9;" />
							  </td>
						  </tr>
						  <tr>
						  	<td colspan="2">
						  		<span class=rightLabel><bean:message key="login.captchacode" bundle="${language}"/>:</span>
						  	  <input type="text" id="i_captchacode" name="captchacode" value="" style="background:none;" size=6 maxlength=4 onKeyDown="javascript:if (event.keyCode==13) cus_login();" />
						  	  <span  style="width:50px;height:35px;cursor:hand;" >
						  	  	<img src="" id="i_CaptchaCodepic" style="border:0px solid;"  onclick="refreshcode();" />
						  	  </span>
						  	 </td>						  	
						  </tr>
						  <tr>
							<td height="52" colspan="2">
								<span class=rightLabel>&nbsp;</span>
								<!-- <span style="border:1px solid #0f0;width:180px; height:20px;" ></span>123
								<span style="border:1px solid #00f;width:180px; height:20px;"></span>
								<a href="#" onclick="cus_login()"></a>
								<a href="#" onclick="forReset()" style="float:left">
								</a> -->
								<input type="button" onclick="cus_login()" style="width:80px;height:30px;cursor:pointer;background:none;" value="<bean:message key="button.login" bundle="${language}"/>"/>
								<input type="button" onclick="forReset()" style="width:80px;height:30px;cursor:pointer;background:none;" value="<bean:message key="button.reset" bundle="${language}"/>"/>
							</td>
						  </tr>
					</table>
				</div>
			</form>
		
</div>	

</body>

</html>
