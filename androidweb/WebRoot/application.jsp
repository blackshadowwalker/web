<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <base href="http://applicationx.net/" />    
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Portal Home - Application X</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script type="text/javascript" src="includes/jscript/jquery.js"></script>
    <script type="text/javascript" src="templates/default/js/bootstrap.min.js"></script>
    <meta name="application-name" content="Application X"/>
    <meta name="msapplication-TileColor" content="#FFFFFF"/>
    <meta name="msapplication-TileImage" content="templates/default/img/win8tile.png"/>

    <link href="templates/default/css/whmcs.css" rel="stylesheet">
    <link href="templates/default/css/style.css" type="text/css" rel="stylesheet"/>
    <link href="templates/default/css/font-awesome.min.css" type="text/css" rel="stylesheet"/>
    <!--[if IE 7]>
    <link href="templates/default/css/font-awesome-ie7.css" type="text/css" rel="stylesheet"/>
    <![endif]-->
    <script src="templates/default/js/whmcs.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function(){
    
       		 });
        </script>
    
        <script type="text/javascript">
            var RecaptchaOptions = {
                theme: 'clean'
            };
        </script>
    
</head>

<body>



<div class="container logobar">
	<a href="index.php" class="brand">
		<img src="templates/default/img/whmcslogo.png" alt="Application X"/>
	</a>
<div id="languagechooser">
	<form method="post" action="/index.php" name="languagefrm" id="languagefrm">
		<input type="hidden" name="token" value="a31c38f94f5a941db87f44231abdd764bcd4a800" />
		<strong>Language:</strong> 
		<select name="language" onchange="languagefrm.submit()">
			<option>Arabic</option>
			<option>Catalan</option>
			<option>Croatian</option>
			<option>Czech</option>
			<option>Danish</option>
			<option>Dutch</option>
			<option selected="selected">English</option>
			<option>Farsi</option>
			<option>French</option>
			<option>German</option>
			<option>Hungarian</option>
			<option>Italian</option>
			<option>Norwegian</option>
			<option>Portuguese-br</option>
			<option>Portuguese-pt</option>
			<option>Russian</option>
			<option>Spanish</option>
			<option>Swedish</option>
			<option>Turkish</option>
			<option>Ukranian</option>
		</select>
	</form>
</div>

</div>
<div class="container">
    <div class="navbar navbar-inverse">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>

                <div class="nav-collapse">
                    <ul class="nav">
                        <li><a href="home.action">Home</a></li>
                    </ul>
                                            <ul class="nav">
                            <li><a href="announcements.php">Announcements</a></li>
                        </ul>
                        <ul class="nav">
                            <li><a href="knowledgebase.php">Knowledgebase</a></li>
                        </ul>
                        <ul class="nav">
                            <li><a href="serverstatus.php">Network Status</a></li>
                        </ul>
                        <ul class="nav">
                            <li><a href="affiliates.php">Affiliates</a></li>
                        </ul>
                        <ul class="nav">
                            <li><a href="contact.php">Contact Us</a></li>
                        </ul>
                        <ul class="nav pull-right">
                            <li><a href="cart.php?a=view">My Cart</a></li>
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"
                                                    href="#">Account&nbsp;<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="clientarea.php">Login</a></li>
                                    <li><a href="register.php">Register</a></li>
                                    <li class="divider"></li>
                                    <li><a href="pwreset.php">Forgot Password?</a></li>
                                </ul>
                            </li>
                        </ul>
                    
                </div>
                <!-- /.nav-collapse -->
            </div>
        </div>
        <!-- /navbar-inner -->
    </div>
    <!-- /navbar -->
</div>

<!-- open master container -->
<div class="container">

    <div class="whmcscontainer">
        <div class="contentpadded">

            <div id="ServiceContainer" class="container">
    <div id="ServiceRow" class="row" >
        <div class="span2 well homeFeature">
            <b>
                Web
                <br />
                Development<br />
                <br />
                <br />
                <a href="webdevelopment.php">
                    <img width="165" height="154" alt="" src="/templates/default/img/TabletClear.png" />
                </a><br />
            </b>
        </div>
        <!--end web dev. well-->
        <div class="span2 well homeFeature">
            <b>
                Application<br />
                Development<br />
                <br />
                <br />
                <a href="appdevelopment.php">
                    <img width="165" height="154" alt="" src="/templates/default/img/LogisticsClear.png" />
                </a><br />
            </b>
        </div>
        <!--end app dev well-->
        <div class="span2 well homeFeature">
            <b>
                Hosting<br />
                Solutions<br />
                <br />
                <br />
                <a href="hosting.php">
                    <img width="165" height="154" alt="" src="/templates/default/img/HostingClear.png" />
                </a><br />
            </b>
        </div>
        <!--end hosting well-->
        <div class="span2 well homeFeature">
            <b>
                Marketing<br />
                Services<br />
                <br />
                <br />
                <a href="marketing.php">
                    <img width="165" height="154" alt="" src="/templates/default/img/MarketingClear.png" />
                </a><br />
            </b>
        </div>
        <!--end marketing well-->
        <div class="span2 well homeFeature">
            <b>
                Other<br />
                Services<br />
                <br />
                <br />
                <a href="othersolutions.php">
                    <img width="165" height="154" alt="" src="/templates/default/img/ServicesClear.png" />
                </a><br />
            </b>
        </div>
        <!--end other services well-->
    </div>
</div>
<!--end row1 div-->

<div class="well">
    <div class="styled_title">
        <h1>Choose a Domain...</h1>
    </div>
    <p>Start your web hosting experience with us by entering the domain name you want to register, transfer or simply purchase hosting for below...</p>
    <br />
    <div class="textcenter">
        <form method="post" action="https://applicationx.net/domainchecker.php">
<input type="hidden" name="token" value="a31c38f94f5a941db87f44231abdd764bcd4a800" />
            <input class="input-block-level" name="domain" type="text" value=" eg. yourdomain.com" onfocus="if(this.value==' eg. yourdomain.com')this.value=''" onblur="if(this.value=='')this.value=' eg. yourdomain.com'" />
                        <div class="captchainput" align="center">
                <p>Please enter the characters you see in the image below into the text box provided. This is required to prevent automated submissions.</p>
                                <p><script type="text/javascript" src="http://www.google.com/recaptcha/api/challenge?k=6LdINLoSAAAAAFo3F0O36H9CDPX1cnxRDwH1-2qn"></script>
	<noscript>
  		<iframe src="http://www.google.com/recaptcha/api/noscript?k=6LdINLoSAAAAAFo3F0O36H9CDPX1cnxRDwH1-2qn" height="300" width="500" frameborder="0"></iframe><br/>
  		<textarea name="recaptcha_challenge_field" rows="3" cols="40"></textarea>
  		<input type="hidden" name="recaptcha_response_field" value="manual_challenge"/>
	</noscript></p>
                            </div>
                        <div class="form-actions">
                <input type="submit" value="Check Availability" class="btn btn-primary btn-large" /> <input type="submit" name="transfer" value="Transfer" class="btn btn-success btn-large" /> <input type="submit" name="hosting" value="Order Hosting Only" class="btn btn-large" />            </div>
        </form>
    </div>
</div>





    </div>
</div>

<!-- This closest master container from header.tpl -->
</div>


  <div id="pageFoot" class="ui-helper-clearfix">
            <div class="container">
 <!--facebook like button-->
    <script id="twitter-wjs" src="//platform.twitter.com/widgets.js"></script>
    <script id="facebook-jssdk" src="//connect.facebook.net/en_US/all.js#xfbml=1"></script>
    <script>        (function (d, s, id)  (document, 'script', 'facebook-jssdk'));</script>
    <!--end like button-->
    <div class="row-fluid">
        <div class="span4">
            <h3>
                <i class="icon icon-cloud"></i>Hosting Solutions</h3>
            <ul>
                <li><a href="/DedicatedServer" class="white">Dedicated Servers</a></li>
                <li><a href="/cart.php?gid=9" class="white">Shared Hosting</a></li>
                <li><a href="/Cloud-Servers" class="white">Cloud Servers</a></li>
                <li><a href="/MSExchange" class="white">Exchange Hosting</a></li>
                <li><a href="/Sharepoint" class="white">Sharepoint</a></li>
            </ul>
        </div>
        <!--end first column-->
        <div class="span4">
            <h3>
                <i class="icon icon-fire"></i>Web Development</h3>
            <ul>
                <li><a href="/CMS-Dev" class="white">CMS Development</a></li>
                <li><a href="/Programming" class="white">Programming</a></li>
                <li><a href="/Database-Dev" class="white">Database Development</a></li>
                <li><a href="/E-Commerce" class="white">E-Commerce</a></li>
            </ul>
            <h3>
                <i class="icon icon-bullhorn"></i>Marketing</h3>
            <ul>
                <li><a href="/Social-Media" class="white">Social Media</a></li>
                <li><a href="/Email" class="white">Email Campaigns</a></li>
                <li><a href="/Target-Mail" class="white">Targeted Mailing</a></li>
            </ul>
        </div>
        <!--end column 2-->
        <div class="span4">
            <h3>
                <i class="icon icon-heart"></i>Get to Know Us!</h3>
            <ul>
                <li><a href="/Portfolio" class="white">Our Portfolio</a></li>
                <li><b>Like us on Facebook</b>
                    <div class="fb-like" data-href="https://www.facebook.com/ApplicationX?ref=ts&fref=ts"
                        data-send="false" data-layout="button_count" data-width="450" data-show-faces="true">
                    </div>
                </li>
                <li>Follow Us on Twitter <a href="https://twitter.com/applicationx" class="twitter-follow-button"
                    data-show-count="false">Follow @applicationx</a>
                    <script>                        !function (d, s, id)  } (document, "script", "twitter-wjs");</script>
                </li>
                <li><a href="/contact.php" class="white">Contact Us</a></li>
                <li><a href="/About-Us" class="white">About Us</a></li>
            </ul>
        </div>
        <!--end column 3-->
    </div>
    <!--end row div-->
        </div>
		</div>
<div class="container">
    <div class="footer">
        <div id="copyright">Copyright &copy; 2013 Application X. All Rights Reserved.</div>
    </div>
</div>



</body>
</html>