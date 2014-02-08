<%@ page language="java" contentType="text/html;charset=GBK" isErrorPage="false"%>

<HTML>
<% 
    String thisPath=request.getContextPath();
    String qx=request.getParameter("qx");  
%>



 	<HEAD>
  <title>pad PAGE</title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="css/base.css" type="text/css">
  <LINK href="<%=thisPath%>/modules/pad/css/base.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="Skin.css">
  <script language="javascript" src="<%=thisPath%>/modules/base/hx_table/js/tools.js"></script>

  <script language="javascript" src="<%=thisPath%>/modules/base/scripts/base.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/interface/padBean.js"></script>
  <script type="text/javascript" src="<%=thisPath%>/dwr/engine.js"></script>
  <SCRIPT src="<%=thisPath%>/table_view/jquery.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/jquery-ui-1.7.2.custom.min.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/SortView.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/PagerView.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/TableView.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/SelectorView.js" type=text/javascript></SCRIPT>
  <SCRIPT src="<%=thisPath%>/table_view/common.js" type=text/javascript></SCRIPT>
  <script language="javascript" src="<%=thisPath%>/modules/pad/script/padScript.js"></script>

</HEAD>

<body topmargin="0" leftmargin="0" background="" style="background-repeat:repeat-x;">


<input id="this_path_id" type="hidden" value="<%=thisPath%>"/>

<div align="center">
<font color='#0000FF' size=4>指定月份<bean:message key="button.query" bundle="${language}"/>
<input id="cxyf" type="text" value="" size=6/>(格式：201101)</font>
<button name="submit" onClick="showc()" class="button"><bean:message key="button.query" bundle="${language}"/></button>
<hr>
<div id="dyxx">
</div>
<script language ="javascript">



//***************************************************函数开始，这是用来显示日历的***********************
function showc()
{
var cxyf = document.getElementById("cxyf").value;

var my;
if(cxyf!="")
{	
	var nf = cxyf.substr(0,4);
	var yf =cxyf.substr(4,6)-1;
	
	if(cxyf.substr(4,6)=="")
	{
		alert("<bean:message key="button.query" bundle="${language}"/>月份输入错误，请重新输入，格式：201101");
		return false;
	}
	var fhxx=__isLegalMonth(nf,cxyf.substr(4,6));
	if(fhxx==false)
	{
		alert("<bean:message key="button.query" bundle="${language}"/>月份输入错误，请重新输入，格式：201101");
		return false;
	}
	my = new Date(nf,yf,1,00,00,00);
}
else
{
	my = new Date();
}


document.getElementById("dyxx").innerHTML="";

var dyxx="";

dyxx +="<div align='center'>";
var k=1;
var j=1;
var today;
var tomonth;
var theday=1;//日期
var max;
var temp;
var tempday;//这个月第一天的星期
dyxx +="<font color='#0000FF' size=5>"+my.getFullYear() + "年" + (my.getMonth()+1)+"月</font><font color='#0000FF' size=3>(注：蓝字表示计划休假，红字表示休假状态,<img src='<%=thisPath%>/modules/pad/image/ball5.gif' width='10' height='10'>表示领导警员，<img src='<%=thisPath%>/modules/pad/image/ball4.gif' width='10' height='10'>表示非领导警员)</font>";
dyxx +="<table border='1' width='100%' height='95%'>";
 dyxx +="<tr  align='center'  bgcolor='#b2d7fc'>";
  dyxx +="<td height='10'><font color='red'>星期天</font></td>";
  dyxx +="<td height='10'>星期一</td>";
  dyxx +="<td height='10'>星期二</td>";
  dyxx +="<td height='10'>星期三</td>";
  dyxx +="<td height='10'>星期四</td>";
  dyxx +="<td height='10'>星期五</td>";
  dyxx +="<td height='10'>星期六</td>";
 dyxx +="</tr>";
temp=my.getDate();
my.setDate(1);
//dyxx +=my.getDate());
tempday=my.getDay();//返回第一天是星期几
my.setDate(temp);
today=my.getDay();//返回现在星期几

  switch ((my.getMonth()+1))
  {
    case 1:
    case 3:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12:
     max=31;
     break;
    case 4:
    case 6:
    case 9:
    case 11:
     max=30;
     break;
    default:
    {
  	 var sfyn=__isLeapYear(my.getFullYear());
  	 if(sfyn==false)
  	 {
    	 max=29;
     }
     else
     {
     	max=28;
     }
     //dyxx +=max);}
     }
     break;
    }
    
   //连接数据库进行请销假的<bean:message key="button.query" bundle="${language}"/>
     	dwr.engine.setAsync(false);
     	
     	var qxjxx ="";
     	padBean.getqxj(my.getFullYear(),my.getMonth()+1,max,'<%=thisPath%>',
	    {
	        callback:function(data)
	        {
	            qxjxx =data;
	        },
	        exceptionHandler:function(err_info)
	        { 
	            if (err_info!="")
	            {
	                alert(err_info);
	                window.open("/logoffAction.do?"+new Date(),"_parent");
	            }
	            else
	            {
	                alert("<bean:message key="msg.error.timeOutAndLogout" bundle="${language}"/>");
	                window.open("/logoffAction.do?"+new Date(),"_parent");
	            }
	        }
	    });
	  
	    var qxjxs = qxjxx.split("</C>");
for(k=0;k<6;k++)
{
 dyxx +="<tr>";
  for(j=0;j<=6;j++)
  {
 
   dyxx +="<td >";
   if (j>=(tempday))
   {
    tempday=0;//设置为最小，相当于取消判断条件
    
    if (theday<=max)
    {
    
     if (theday==my.getDate()) 
     {
     	if(cxyf!="")
     	 dyxx +="<div align='center'><strong>"+theday + "</strong></div>";
     	else
      	dyxx +="<div align='center'><font color='#0000FF'  size='2'><strong>[" + theday + "]</strong></font></div>";
      }
     else    
      if (j==0)
       dyxx +="<div align='center'><font color='red'><strong>" + theday + "</strong></font></div>";
      else
       dyxx +="<div align='center'><strong>"+theday + "</strong></div>";
     	dyxx +=qxjxs[theday-1]
     	theday++;
     	
     	
    
     	
    }
   }
   dyxx +="</td>";
   
    
  }
 
 dyxx +="</tr>";
dyxx +="</div>";
dwr.engine.setAsync(true);
}

dyxx +="</table>";
document.getElementById("dyxx").innerHTML=dyxx;
}
//************************************************函数结束

showc();
</script>
</div>

</body>
<script type="text/javascript">
sj();
</script>

</HTML>
