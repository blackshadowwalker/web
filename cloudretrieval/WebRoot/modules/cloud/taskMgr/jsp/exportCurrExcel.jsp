<%@ page contentType="application/vnd.ms-excel;charset=GBK"%>
<%
			response.setHeader("Content-Disposition", "attachment;filename="
			+ java.net.URLEncoder.encode("报表下载", "UTF-8") + ".xls");

	/*
	 数据格式：
	 试题类型<//C>试题内容<//C>答案<//C>分值<//R>
	 */

	String info = new String(request.getParameter("hidden_data")
			.getBytes("iso-8859-1"), "GBK");
	String title = new String(request.getParameter("hidden_title")
			.getBytes("iso-8859-1"), "GBK");
	String total = new String(request.getParameter("hidden_total")
			.getBytes("iso-8859-1"), "GBK");
%>

<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:w="urn:schemas-microsoft-com:office:word"
xmlns:m="http://schemas.microsoft.com/office/2004/12/omml"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 14">
<meta name=Originator content="Microsoft Word 14">


<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .75in 1.0in .75in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;}
tr
	{mso-height-source:auto;
	mso-ruby-visibility:none;}
col
	{mso-width-source:auto;
	mso-ruby-visibility:none;}
br
	{mso-data-placement:same-cell;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	border:none;
	mso-protection:locked visible;
	mso-style-name:常规;
	mso-style-id:0;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
.xl24
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	border:.5pt solid windowtext;}
.xl25
	{mso-style-parent:style0;
	border:.5pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	font-size:16.0pt;
	font-weight:700;
	text-align:center;}
	
.xl29
	{mso-style-parent:style0;
	border-top:none;
	border-right:.5pt
	 solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
	
ruby
	{ruby-align:left;}
rt
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-char-type:none;
	display:none;}
.tablestyle{
    border-top: 2px solid #000000; 
    border-right: 2px solid #000000; 
    border-bottom: 1px solid #000000; 
    border-left: 1px solid #000000; 
}
.TdTitle
{

    border-bottom:1px solid #000000;
    border-left:1px solid #000000;
    padding:0px;
    margin:0px;
    font-size:12px;
    text-align:center;
    font-weight: bold;

}
.TD
{
	height: 22px;
    border-bottom:1px solid #000000;
    border-left:1px solid #000000;
    padding:0px;
    margin:0px;
    font-size:12px;
    text-align:center;
    word-break:break-all;

}

.TdRight
{
	height: 22px;
    border-bottom:1px solid #000000;
    border-left:1px solid #000000;
    padding:0px;
    margin:0px;
    text-align:right;
    font-size:12px;
    word-break:break-all;

}

-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet2</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>285</x:DefaultRowHeight>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>4</x:ActiveRow>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
   <x:ExcelWorksheet>
    <x:Name>Sheet3</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>285</x:DefaultRowHeight>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>9120</x:WindowHeight>
  <x:WindowWidth>10635</x:WindowWidth>
  <x:WindowTopX>240</x:WindowTopX>
  <x:WindowTopY>15</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link="blue" vlink="purple">

<table border="0" cellpadding="0" cellspacing="0" width="690"	style='border-collapse:collapse;table-layout:fixed;width:690px'>


<%
	String[] infos = info.split("</T>");
	String[] zd = infos[0].toString().split("</C>");
	int cols = zd.length;
%>

	
	<tr height=39 style='mso-height-source:userset;height:29.25pt'>
		<td colspan="<%=cols%>" height=39 class=xl26 style='height:29.25pt;width:690px'><%=title%></td>
	</tr>
	
	<tr height=32 style='mso-height-source:userset;height:24.0px'>
		<td colspan=6 height=22  style='height:24.0px;text-align:right;'>合计：<%=total%> </td>
	</tr>
	
	<tr height=24 style='mso-height-source:userset;height:18.0px'>
<%
		for (int n = 0; n < zd.length; n++) {
		//表头
%>
			<td class=xl24 style='border-left:none'><%=zd[n].toString()%></td>
<%
		}
%>
	</tr>

<%
		if (infos[1].toString() != null && infos[1].toString().trim().length() > 0) {

			String rowArrs[] = infos[1].toString().split("</R>");

			int row = rowArrs.length;

			for (int i = 0; i < row; i++) {
%>
				<tr height=19 style='height:14.25px'>
<%				String colArrs[] = rowArrs[i].split("</C>");
				String colData = "";
				for (int n = 0; n < colArrs.length; n++) {
					colData = "&nbsp;"+colArrs[n] ;
%>
					<td height=19 class=xl25  style="height:13px;border-top:none;text-align:left;"><%=colData%></td>
<%
				}
%>
				</tr>
<%
			}
		}
%>

</table>

</body>

</html>
