<%@ page contentType="application/vnd.ms-excel;charset=UTF-8"%>
<%@ page import="org.json.*"%>
<%    

JSONObject json = new JSONObject(new String(request.getParameter("xls_datas").getBytes("iso-8859-1"),"GBK"));


JSONArray datas=json.getJSONArray("data");

response.setHeader("Content-Disposition", "attachment;filename="+java.net.URLEncoder.encode(json.getString("title"),"UTF-8")+".xls");

		
int row_num=datas.length();

JSONArray colNames=json.getJSONArray("col_names");
   		
int col_num=colNames.length();

%>
<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<%@page import="java.net.URLEncoder"%>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Author></Author>
  <LastAuthor></LastAuthor>
  <LastPrinted>2009-06-04T20:32:44Z</LastPrinted>
  <Created>2009-06-04T20:22:55Z</Created>
  <Company>Microsoft</Company>
  <Version>11.9999</Version>
 </DocumentProperties>
 <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
  <WindowHeight>9570</WindowHeight>
  <WindowWidth>18195</WindowWidth>
  <WindowTopX>480</WindowTopX>
  <WindowTopY>120</WindowTopY>
  <ProtectStructure>False</ProtectStructure>
  <ProtectWindows>False</ProtectWindows>
 </ExcelWorkbook>
 <Styles>
  <Style ss:ID="Default" ss:Name="Normal">
   <Alignment ss:Vertical="Center"/>
   <Borders/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="12"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s25">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
   <Font ss:FontName="华文行楷" x:CharSet="134" ss:Size="18"/>
  </Style>
  <Style ss:ID="s31">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="11" ss:Bold="1"/>
   <Interior ss:Color="#969696" ss:Pattern="Solid"/>
  </Style>
  <Style ss:ID="s32">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
  </Style>
 </Styles>
 <Worksheet ss:Name="Sheet1">
  <Names>
   <NamedRange ss:Name="Print_Titles" ss:RefersTo="=Sheet1!R1:R3"/>
  </Names>
  <Table ss:ExpandedColumnCount="<%=col_num%>" ss:ExpandedRowCount="<%=row_num+3%>" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="80" ss:DefaultRowHeight="14.25">
   <Row>
    <Cell ss:MergeAcross="<%=col_num-1%>" ss:MergeDown="1" ss:StyleID="s25"><Data
      ss:Type="String"><%=json.getString("title")%></Data><NamedCell ss:Name="Print_Titles"/></Cell>
   </Row>
   <Row ss:Index="3">
   <% 
   		for(int i=0;i<col_num;i++){
   %>
   <Cell ss:StyleID="s31"><Data ss:Type="String"><%=colNames.getString(i) %></Data><NamedCell
      ss:Name="Print_Titles"/></Cell>
   <% 
   		}
   %>
   </Row>
   <%
		for(int i=0;i<row_num;i++){
	%>
   <Row>
   <%
   		JSONObject col=datas.getJSONObject(i);
   		
   		for(int j=1;j<=col_num;j++){
   	%>
   	<Cell ss:StyleID="s32"><Data ss:Type="String"><%=col.getString("col"+j) %></Data></Cell><%
    	}
    %>
    </Row>
    <%
   		}
   %>
   </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <Print>
    <ValidPrinterInfo/>
    <PaperSizeIndex>9</PaperSizeIndex>
    <HorizontalResolution>200</HorizontalResolution>
    <VerticalResolution>200</VerticalResolution>
   </Print>
   <Selected/>
   <FreezePanes/>
   <FrozenNoSplit/>
   <SplitHorizontal>3</SplitHorizontal>
   <TopRowBottomPane>3</TopRowBottomPane>
   <ActivePane>2</ActivePane>
   <Panes>
    <Pane>
     <Number>3</Number>
    </Pane>
    <Pane>
     <Number>2</Number>
     <ActiveRow>7</ActiveRow>
     <ActiveCol>3</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>