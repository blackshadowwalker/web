<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title></title>

  
  
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
	margin-left:55px;
}
#loginpannel{
	border:1px solid #fa0;
	background: url(images/login.png) no-repeat;
	position:absolute;
	left: 30%;
	top: 25%;
	z-index:100;
	cursor:move;
}
.titlelabel {
	color: #031670;
	font-size:25px;
	font-weight: 700;
	font-family: "Microsoft YaHei";
	margin-top:25px;
}
</style>
<script type="text/javascript">
	if("${faile}"=="faile"){
		alert("用户名或密码错误 ");
	}
	
</script>

</head>



<body topmargin="0" leftmargin="0" rightmargin="0"  onload="document.forms[0].usercode.focus()" >
	<div style="width:100%;height:100%;position:absolute;z-index:-1;top:0px;border:0px #f00 solid;">
		<!-- img id="backgroundimage" src="modules/logon/image/loginbg.png" width="100%" height="100%" -->
	</div> 
	
	<div id=loginpannel align=center style="border:0px #0f0 solid; width:550px; height:350px;">
		<br/>
		
		<div style="position: relative; left:30px; top:10px;float:left;" >
			<img src="images/jc.png"  width=70 height=70/>
		</div>
		<div style="position: relative; left:0px; width:100%; height:50px;">
			<p class=titlelabel  >SSH2 框架</p>
		</div>
		<br/>
		<form action="LoginAction?method=login"  method="post">
			<div class="loginTable">
				<table border =0  cellpadding="5" cellspacing="1" >
					  <tr>
						<td colspan="2">
							<span class=rightLabel>用户名:</span>
							<input type="text" name="user.userName" id="i_username" value='' style="width:180px; background:none;"  onKeyDown="javascript:if (event.keyCode==13) event.keyCode=9;" />
						</td>
					  </tr>
					  <tr>
						<td colspan="2">
							<span class=rightLabel>密&nbsp;&nbsp;码:</span>
						  <input type="password" value='' name="user.userPasswd" style="width:180px; background:none;" onKeyDown="javascript:if (event.keyCode==13) event.keyCode=9;" />
						  </td>
					  </tr>
					  <%--<tr>
					  	<td colspan="2">
					  		<span class=rightLabel>验证码:</span>
					  	  <input type="text" id="i_captchacode" name="captchacode" value="" style="background:none;" size=6 maxlength=4 onKeyDown="javascript:if (event.keyCode==13) cus_login();" />
					  	  <span  style="width:50px;height:35px;cursor:hand;" >
					  	  	<img src="" id="i_CaptchaCodepic" style="border:0px solid;"  onclick="refreshcode();" />
					  	  </span>
					  	 </td>						  	
					  </tr>
					  --%><tr>
						<td height="52" colspan="2">
							<span class=rightLabel>&nbsp;</span>
							<input type="submit" style="width:80px;height:30px;cursor:pointer;background:none;" value="登录"/>
							<input type="reset"  style="width:80px;height:30px;cursor:pointer;background:none;" value="重置"/>
						</td>
					  </tr>
				</table>
			</div>
		</form>
	</div>	
	<script>
	
		document.getElementById("i_username").focus();
	
	</script>
</body>

</html>
