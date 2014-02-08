
/**
 * ��װ�ı������
 */

function reportObject() {

	this.tableElem = "";// ��ʾ��table��ID

	this.pageSpan = "";// ��ť��ҳ����Ϣ����

	this.totalPage = 0;// ��ҳ��

	this.currPage = 0;// ��ǰҳ

	this.tmptj = "";// ����

	this.data = ""; // ���ص�����

	this.colsType = [];

	reportObject.prototype.writeData = function(params) {

		/*
		 * ������ʽ�� { currPage: totalPage: data: tmptj: }
		 */

		var paramObject = arguments[0];

		this.totalPage = paramObject.totalPage;

		this.currPage = paramObject.currPage;

		this.data = paramObject.data;

		this.tmptj = paramObject.tmptj;

		this.btnStatus();// ���ð�ť��״̬

		/*
		 * var table =document.getElementById(this.tableElem); //���table����
		 * 
		 * for(var k=table.rows.length-1;k>0;k--){
		 * 
		 * table.deleteRow(k); }
		 * 
		 * var dataElems=paramObject.data.split("</R>");
		 * 
		 * for(var i=0;i<dataElems.length-1;i++){
		 * 
		 * var newRow=table.insertRow();
		 * 
		 * if(i%2!=0){
		 * 
		 * newRow.setAttribute("className",'TrColor'); }
		 * 
		 * newRow.setAttribute("id","row_"+(i+1));
		 * 
		 * var colElems=dataElems[i].split("</C>");
		 * 
		 * for(var j=0;j<colElems.length-1;j++){
		 * 
		 * var newcell=newRow.insertCell();
		 * 
		 * newcell.setAttribute("className",'td');
		 * 
		 * newcell.innerHTML=colElems[j]; }
		 * 
		 *  }
		 */
	}

	reportObject.prototype.btnStatus = function() {

		if (this.pageSpan != "") {

			document.getElementById(this.pageSpan).innerHTML = "��ǰ��"
					+ this.currPage + "ҳ/��" + this.totalPage + "ҳ";
		}

		if (this.data == "" || this.data == "no") {

			document.getElementById("downloadCurrExcel").disabled = true;

			document.getElementById("downloadCurrExcel").className = ("BB_button  excel_grey");

			document.getElementById("downloadAllExcel").disabled = true;

			document.getElementById("downloadAllExcel").className = ("BB_button  excel_grey");
		}

		if (this.currPage == 1) {

			if (typeof(document.getElementById("last_btn")) != "undefined"
					&& document.getElementById("last_btn") != null) {

				document.getElementById("last_btn").disabled = true;

				document.getElementById("last_btn").className = ("BB_button  last_page_grey");
			}

			if (this.totalPage == 1) {

				if (typeof(document.getElementById("next_btn")) != "undefined"
						&& document.getElementById("next_btn") != null) {

					document.getElementById("next_btn").disabled = true;

					document.getElementById("next_btn").className = ("BB_button  next_page_grey");
				}

			} else {

				if (typeof(document.getElementById("next_btn")) != "undefined"
						&& document.getElementById("next_btn") != null) {

					document.getElementById("next_btn").disabled = false;

					document.getElementById("next_btn").className = ("BB_button  next_page");
				}

			}

		} else if (this.currPage == this.totalPage) {

			if (typeof(document.getElementById("next_btn")) != "undefined"
					&& document.getElementById("next_btn") != null) {

				document.getElementById("next_btn").disabled = true;

				document.getElementById("next_btn").className = ("BB_button  next_page_grey");
			}

			if (typeof(document.getElementById("last_btn")) != "undefined"
					&& document.getElementById("last_btn") != null) {

				document.getElementById("last_btn").disabled = false;

				document.getElementById("last_btn").className = ("BB_button  last_page");
			}

		} else {

			if (typeof(document.getElementById("last_btn")) != "undefined"
					&& document.getElementById("last_btn") != null) {

				document.getElementById("last_btn").disabled = false;

				document.getElementById("last_btn").className = ("BB_button  last_page");
			}
			if (typeof(document.getElementById("next_btn")) != "undefined"
					&& document.getElementById("next_btn") != null) {

				document.getElementById("next_btn").disabled = false;

				document.getElementById("next_btn").className = ("BB_button  next_page");
			}

		}
	}
}

function writeBB(obj) {

	var table = document.getElementById("info"); // ���table����

	for (var k = table.rows.length - 1; k > 0; k--) {

		table.deleteRow(k);
	}

	var dataElems = obj.data.split("</R>");

	for (var i = 0; i < dataElems.length - 1; i++) {

		var newRow = table.insertRow();

		if (i % 2 != 0) {

			newRow.setAttribute("className", 'TrColor');
		}

		newRow.setAttribute("id", "row_" + (i + 1));

		var colElems = dataElems[i].split("</C>");

		for (var j = 0; j < colElems.length - 1; j++) {

			var newcell = newRow.insertCell();

			if (obj.colsType[j] == "number") {

				newcell.setAttribute("className", 'TdRight');
			} else {

				newcell.setAttribute("className", 'TD');
			}

			if (colElems[j] == "null" || trim(colElems[j]) == ""
					|| colElems[j] == "null-null") {

				newcell.innerHTML = "&nbsp;";
			} else {

				newcell.innerHTML = colElems[j];
			}
		}

	}
}

