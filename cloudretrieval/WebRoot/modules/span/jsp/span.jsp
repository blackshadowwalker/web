<%@ page language="java" contentType="text/html;charset=GBK" isErrorPage="false"%>

<HTML>

<%
    String thisPath=request.getContextPath();
%>

<SCRIPT>
function switchSysBar()
{
    if (pagespantext.innerText==7)
    {
        pagespantext.innerText=8;
        pagespantext.title="打开左栏";
        parent.document.all("second").cols="0,10,*";
    }
    else
    {
        pagespantext.innerText=7;
        pagespantext.title="关闭左栏";
        parent.document.all("second").cols="180,10,*";
    }
}
</SCRIPT>

<HEAD>
  <title>spanPAGE</title>
  <meta http-equiv="Expires" CONTENT="0">
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
  <meta http-equiv="Pragma" CONTENT="no-cache">
  <link rel="stylesheet" href="<%=thisPath%>/modules/span/css/base.css" type="text/css">
</HEAD>

<body>

  <table id="pagespan" border=0 cellSpacing=0 cellPadding=0>
    <tr>
       <td onclick=switchSysBar()>
         <DIV id="pagespantext" title="打开左栏">7</DIV>    
       </td>
    </tr>
  </table>





</body>

</HTML>
