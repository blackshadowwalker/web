<%@ page language="java" contentType="text/html; charset=gb2312" %>    

<%
	String thisPath = request.getContextPath();
%>

<%
	String title=request.getParameter("title");
	String dept_name=request.getParameter("dept_name");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Dlg.jsp</TITLE>

</HEAD>
<BODY>


<input type="button" onclick="javascript:window.close();" value="Close">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="BB_button excel" onClick="exportExcel('i_table1')" value="��������">


<br>
<form id="downForm">

<div id="d_msg" name="d_msg"></div>

<input type="hidden" id="hidden_data" name="hidden_data">

<input type="hidden" id="hidden_title" name="hidden_title">

18678633600

<input type="hidden" id="hidden_start" name="hidden_start">
<input type="hidden" id="hidden_end" name="hidden_end">

<input type="hidden" id="hidden_dept" name="hidden_dept">

</form>

<script language="javascript">
	var k=window.dialogArguments; 
		
	
	if(k!=null) 
	{
			var msg = k.document.getElementById("h_msg").value;
			document.getElementById("d_msg").innerHTML =  msg;
			document.forms[0].hidden_title.value="test_tilte";
			var data="";
			data += "title</C></T>";
			data += "<>";
			document.forms[0].hidden_date.value = data;
			
	} 
	
	function pageArgs() {
	
		var title = "";
		var data = "";
		
		var start_date = "";
		var end_date ="";
	
		var dept_name = "";
	
	}
	
	function toExcel(id){
			var args = new pageArgs();
		    args.start_date= 
		    args.end_date= document.forms[0].hidden_end.value;
			args.title = "<%=title%>";
			args.dept_name = "<%=dept_name%>";
			
			
	}
	
	if(DownObject==null) var DownObject={};

//DownObject.first=true;

	DownObject.downData=function(url){
	
		if($.trim($("#hidden_data").val())=="") return;
		
		var formObj;
		
		//if(this.first){
			
			var formObj=$("#downForm").attr("method","POST").attr("action",url).attr("target","_down_iframe");
			
		/*	this.first=false;
		}
		else{
			
			formObj=$("#downForm");
		}*/
		
		formObj.get(0).submit();
	}
	
	$(function(){
		
		$("#downloadCurrExcel").click(function(){
			
			DownObject.downData('<%=thisPath%>'+"/template/sqglzx/msg/msgReport.jsp");
		});
	})
	
	
</script>

</BODY>


<script language="javascript">      
        function TableToExcelUtil(tableID) {
			 this.tableBorder = -1; //�߿����ͣ�-1û�б߿� ��ȡ1/2/3/4
			 this.backGround = 4; //������ɫ����ɫ ��ȡ��ɫ���е���ɫ��� 1/2/3/4....
			 this.fontColor = 0; //������ɫ����ɫ
			 this.fontSize = 10; //�����С
			 this.fontStyle = "����"; //��������
			 this.rowHeight = 20; //�и�
			 this.columnWidth = -1; //�п�
			 this.lineWrap = true; //�Ƿ��Զ�����
			 this.textAlign = -4108; //���ݶ��뷽ʽ Ĭ��Ϊ����
			 this.autoFit = true; //�Ƿ�����Ӧ���
			 this.tableID = tableID;
		}
         TableToExcelUtil.prototype.setTableBorder = function (excelBorder) {
             this.tableBorder = excelBorder ;
         };
         TableToExcelUtil.prototype.setBackGround = function (excelColor) {
             this.backGround = excelColor;
         };
         TableToExcelUtil.prototype.setFontColor = function (excelColor) {
             this.fontColor = excelColor;
         };
         TableToExcelUtil.prototype.setFontSize = function (excelFontSize) {
             this.fontSize = excelFontSize;
         };
         TableToExcelUtil.prototype.setFontStyle = function (excelFont) {
             this.fontStyle = excelFont;
         };
         TableToExcelUtil.prototype.setRowHeight = function (excelRowHeight) {
             this.rowHeight = excelRowHeight;
         };
         TableToExcelUtil.prototype.setColumnWidth = function (excelColumnWidth) {
             this.columnWidth = excelColumnWidth;
         };
         TableToExcelUtil.prototype.isLineWrap = function (lineWrap) {
             if (lineWrap == false || lineWrap == true) {
                 this.lineWrap = lineWrap;
             }
         };
         TableToExcelUtil.prototype.setTextAlign = function (textAlign) {
             this.textAlign = textAlign;
         };
         TableToExcelUtil.prototype.isAutoFit = function(autoFit){
             if(autoFit == true || autoFit == false)this.autoFit = autoFit ;
         }
         //�ļ�ת��������
         TableToExcelUtil.prototype.getExcelFile = function () {
         var jXls, myWorkbook, myWorksheet, myHTMLTableCell, myExcelCell, myExcelCell2;
         var myCellColSpan, myCellRowSpan;
         try {
             jXls = new ActiveXObject('Excel.Application');
         }catch (e) {
             alert("�޷�����Excel!\n\n�����ȷ�����ĵ������Ѿ���װ��Excel��"+"��ô�����IE�İ�ȫ����\n\n���������\n\n"+"���� �� Internetѡ�� �� ��ȫ �� �Զ��弶�� �� ��û�б��Ϊ��ȫ��ActiveX���г�ʼ���ͽű����� �� ����");
             return false;
         }
         jXls.Visible = true;
         myWorkbook = jXls.Workbooks.Add();
         jXls.DisplayAlerts = false;
         myWorkbook.Worksheets(3).Delete();
         myWorkbook.Worksheets(2).Delete();
         jXls.DisplayAlerts = true;
         myWorksheet = myWorkbook.ActiveSheet;
         var readRow = 0, readCol = 0;var totalRow = 0, totalCol = 0;
         var tabNum = 0;
         //�����иߡ��п�
         if(this.columnWidth != -1)
             myWorksheet.Columns.ColumnWidth = this.columnWidth;
         else
             myWorksheet.Columns.ColumnWidth = 7;
         if(this.rowHeight != -1)
             myWorksheet.Rows.RowHeight = this.rowHeight ;
         //������Ҫת����Table���󣬻�ȡ��Ӧ�С�����
         var obj = document.all.tags("table");
         for (x = 0; x < obj.length; x++) {
             if (obj[x].id == this.tableID) {
                 tabNum = x;
                 totalRow = obj[x].rows.length;
                 for (i = 0; i < obj[x].rows[0].cells.length; i++) {
                     myHTMLTableCell = obj[x].rows(0).cells(i);
                     myCellColSpan = myHTMLTableCell.colSpan;
                     totalCol = totalCol + myCellColSpan;
                 }
             }
         }
         //��ʼ����ģ����
         var excelTable = new Array();
         for (i = 0; i <= totalRow; i++) {
             excelTable[i] = new Array();
             for (t = 0; t <= totalCol; t++) {
                 excelTable[i][t] = false;
             }
         }
         //��ʼת�����
         for (z = 0; z < obj[tabNum].rows.length; z++) {
             readRow = z + 1;
             readCol = 0;
             for (c = 0; c < obj[tabNum].rows(z).cells.length; c++) {
                 myHTMLTableCell = obj[tabNum].rows(z).cells(c);
                 myCellColSpan = myHTMLTableCell.colSpan;
                 myCellRowSpan = myHTMLTableCell.rowSpan;
                 for (y = 1; y <= totalCol; y++) {
                     if (excelTable[readRow][y] == false) {
                         readCol = y;
                         break;
                     }
                 }
                 if (myCellColSpan * myCellRowSpan > 1) {
                     myExcelCell = myWorksheet.Cells(readRow, readCol);
                     myExcelCell2 = myWorksheet.Cells(readRow + myCellRowSpan - 1, readCol + myCellColSpan - 1);
                     myWorksheet.Range(myExcelCell, myExcelCell2).Merge();
                     myExcelCell.HorizontalAlignment = this.textAlign;
                     myExcelCell.Font.Size = this.fontSize;
                     myExcelCell.Font.Name = this.fontStyle;
                     myExcelCell.wrapText = this.lineWrap;
                     myExcelCell.Interior.ColorIndex = this.backGround;
                     myExcelCell.Font.ColorIndex = this.fontColor;
                     if(this.tableBorder != -1){
                         myWorksheet.Range(myExcelCell, myExcelCell2).Borders(1).Weight = this.tableBorder ;
                         myWorksheet.Range(myExcelCell, myExcelCell2).Borders(2).Weight = this.tableBorder ;
                         myWorksheet.Range(myExcelCell, myExcelCell2).Borders(3).Weight = this.tableBorder ;
                         myWorksheet.Range(myExcelCell, myExcelCell2).Borders(4).Weight = this.tableBorder ;
                     }
                     myExcelCell.Value = myHTMLTableCell.innerText;
                     for (row = readRow; row <= myCellRowSpan + readRow - 1; row++) {
                         for (col = readCol; col <= myCellColSpan + readCol - 1; col++) {
                             excelTable[row][col] = true;
                         }
                     }
                     readCol = readCol + myCellColSpan;
                 } else {
                     myExcelCell = myWorksheet.Cells(readRow, readCol);
                     myExcelCell.Value = myHTMLTableCell.innerText;
                     myExcelCell.HorizontalAlignment = this.textAlign;
                     myExcelCell.Font.Size = this.fontSize;
                     myExcelCell.Font.Name = this.fontStyle;
                     myExcelCell.wrapText = this.lineWrap;
                     myExcelCell.Interior.ColorIndex = this.backGround;
                     myExcelCell.Font.ColorIndex = this.fontColor;
                     if(this.tableBorder != -1){
                         myExcelCell.Borders(1).Weight = this.tableBorder ;
                         myExcelCell.Borders(2).Weight = this.tableBorder ;
                         myExcelCell.Borders(3).Weight = this.tableBorder ;
                         myExcelCell.Borders(4).Weight = this.tableBorder ;
                     }
                     excelTable[readRow][readCol] = true;readCol = readCol + 1;
                 }
             }
         }
         if(this.autoFit == true)
             myWorksheet.Columns.AutoFit;
         jXls.UserControl = true;
         jXls = null;
         myWorkbook = null;
         myWorksheet = null;
     };
     function exportExcel(tid)
     {
     var tb = new TableToExcelUtil(tid);
     tb.setFontStyle("Courier New");
     tb.setFontSize(10); //�Ƽ�ȡֵ10
     tb.setFontColor(1); //һ�������������
     tb.setBackGround(2); //һ�������������
     tb.setTableBorder(2); //�Ƽ�ȡֵ2
     tb.setColumnWidth(10); //�Ƽ�ȡֵ10
     tb.isLineWrap(false);
     tb.isAutoFit(true);
    
     tb.getExcelFile();
    }
</script>    


</HTML>

