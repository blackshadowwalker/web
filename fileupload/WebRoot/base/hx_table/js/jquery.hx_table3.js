function TableObject3() {
	// ��ʾTable��DIV idֵ
	this.tableDivID = "";
	// Table���ȣ�Ĭ��500
	this.tableWidth = 500;
	// Table�߶ȣ�Ĭ��350
	this.tableHeight = 350;
	// ������������
	this.reportTitle = "XXXX-��Ϣ��¼��";
	// ������ɫ
	this.tableBorderCss = "";
	// �Ƿ�ͬ���п���Ĭ�ϲ�ͬ��
	this.isSyncColWidth = false;
	// ����ʱ�䣨���룩,Ĭ��ֱ����ʾ
	this.fadeIn = 0;
	// �û�ѡ���ж���
	this.selectRowObject = [];

	// ��ǰѡ������
	this.curSelectedRow = 0;

	// ��ʼ��״̬
	this.status = false;

	if (typeof(TableObject3._initStatus) == "undefined") {

		TableObject3.prototype.init = function(params) {

			var tmpHeight = 0;

			if (typeof params != "object") {

				alert("TableObject3.init()����������Ч��");

				return;
			}

			// ���tableDivIdֵ
			if (typeof(params.tableDivId) == "string"
					&& params.tableDivId != "") {

				this.tableDivID = params.tableDivId;
			} else {

				alert("TableObject3.init()������tableDivId������������޷���ʼ������");

				return;
			}

			// ���isSyncColWidthֵ
			if (typeof(params.isSyncColWidth) == "boolean") {

				this.isSyncColWidth = params.isSyncColWidth;
			}

			// ���tableBorderCssֵ
			if (typeof(params.tableBorderCss) == "string"
					&& params.tableBorderCss != "") {

				this.tableBorderCss = params.tableBorderCss;
			}

			// ���reportTitleֵ
			if (typeof(params.reportTitle) == "string"
					&& params.reportTitle != "") {

				this.reportTitle = params.reportTitle;
			}

			// ���fadeInֵ
			if (typeof(params.fadeIn) == "number" && params.fadeIn > 0) {

				this.fadeIn = params.fadeIn;
			}

			// ColsObject�������ģ������޷���ʾ����
			if (!(typeof(params.cols) == "object" && (params.cols instanceof ColsObject3))) {

				alert("TableObject3.init()������cols������������޷���ʼ������");

				return;
			}

			// ��ñ�����ȣ�����Чʹ��Ĭ��ֵ
			if ((typeof(params.tableWidth) == "number" && params.tableWidth > 0)
					|| (typeof(params.tableWidth) == "string" && $
							.trim(params.tableWidth) != "")) {

				this.tableWidth = params.tableWidth;
			}

			// ��ñ���߶ȣ�����Чʹ��Ĭ��ֵ
			if (typeof(params.tableHeight) == "number"
					&& params.tableHeight > 0) {

				this.tableHeight = params.tableHeight;
			}

			var tmpSB = new StringBuffer();

			tmpSB
					.append("<div id=\"hx_table_container3\" unselectable=\"on\" onselectstart=\"return false;\" style=\"display:none;\">");

			// ���ñ�����ģ��
			if (typeof(params.header) == "object"
					&& (params.header instanceof TableHeaderObject3)) {

				tmpSB.append(params.header.toHTML());

				this.header = params.header;

				// ��TableObject3���󴫸�TableHeaderObject����
				params.header.tObject = this;
			} else {

				this.header = null;
			}

			tmpSB.append("<div id=\"hx_table_body3\">");

			// ���ù�����ģ��
			if (typeof(params.toolbar) == "object"
					&& (params.toolbar instanceof ToolBarObject3)) {

				tmpSB.append(params.toolbar.toHTML());

				this.toolbar = params.toolbar;

				// ��TableObject3���󴫸�ToolBarObject����
				params.toolbar.tObject = this;
			} else {

				this.toolbar = null;
			}

			// ������Ϣ��ʾ��

			if (typeof(params.infoTip) == "object"
					&& (params.infoTip instanceof InfoTipObject3)) {

				tmpSB.append(params.infoTip.toHTML());

				this.infoTip = params.infoTip;

				// ��TableObject3���󴫸�InfoTipObject����
				params.infoTip.tObject = this;
			} else {

				this.infoTip = null;
			}

			// ��������ģ��
			if (typeof(params.page) == "object"
					&& (params.page instanceof PageObject3)) {

				tmpSB.append(params.cols.toHTML(params.page.perPage));

				this.page = params.page;

				// ��TableObject3���󴫸�PageObject����
				params.page.tObject = this;
			} else {

				tmpSB.append(params.cols.toHTML(params.cols.viewTotalRow));

				this.page = null;
			}

			this.cols = params.cols;

			// ��TableObject3���󴫸�ColsObject����
			params.cols.tObject = this;

			// ���÷�ҳģ��
			if (this.page != null) {

				tmpSB.append(params.page.toHTML());
			}

			tmpSB.append("</div></div>");

			// ��ʾ
			$("#" + this.tableDivID).html(tmpSB.toString());

			// Ϊ�����������¼�
			if (this.toolbar != null) {

				this.toolbar.addEvent();
			}

			this.cols.reloadGridHeaderCss(this.tableWidth);

			this.cols.reloadGridClickHandle();

			// ��ʼ�����,�ı�״̬
			this.status = true;

			// ��ʾģʽ
			if (this.fadeIn == 0) {

				$("#hx_table_container3").css("display", "");
			} else {

				$("#hx_table_container3").fadeIn(this.fadeIn);
			}

			var tmpHeight = this.tableHeight
					- $("#hx_table_grid_header3").height();

			if (tmpHeight <= 0) {

				tmpHeight = 2;
			}

			$("#hx_table_grid_scroll3").css("height", tmpHeight);

			$("#hx_table_container3").css("width", this.tableWidth);
			$("#hx_table_data_container3").css("width", this.tableWidth);

			if (this.tableBorderCss != "") {

				$("#hx_table_container3").css("border", this.tableBorderCss);
			}
		}

		// ȡ����ѡ��
		TableObject3.prototype.cancelSelectedRow = function(params) {

			if (this.status == false) {

				alert("����δ������ʼ�����޷�����cancelSelectedRow()������");

				return false;
			}

			if (typeof(params) == "number" && params > 0) {

				this.curSelectedRow = 0;

				for (var i = 0; i < this.selectRowObject.length; i++) {

					if (this.selectRowObject[i].line_num == row_num) {

						this.selectRowObject.splice(i, 1);

						var tmpTrObj = $("#" + this.selectRowObject[i].id);

						tmpTrObj.children("#hx_custom_col3").each(
								function(num) {

									$(this).css("color", "#000000");
								});

						tmpTrObj.removeClass("selected");

						break;
					}
				}
			} else if (typeof(params) == "string" && params == "all") {

				this.curSelectedRow = 0;

				for (var i = 0; i < this.selectRowObject.length; i++) {

					var tmpTrObj = $("#" + this.selectRowObject[i].id);

					tmpTrObj.children("#hx_custom_col3").each(function(num) {

								$(this).css("color", "#000000");
							});

					tmpTrObj.removeClass("selected");
				}

				this.selectRowObject.splice(0, this.selectRowObject.length);
			} else {

				return;
			}
		}
		// ���ù�������ť��ʾ״̬����ʹ�û򲻿�ʹ�ã�
		TableObject3.prototype.setToolbarBtnDisabled = function(btnId, disabled) {

			if (this.status == false) {

				alert("����δ������ʼ�����޷�����setToolbarBtnDisabled()������");

				return false;
			}

			if (this.toolbar != null) {

				if (this.toolbar.btnArrs == null) {

					alert("��������û�й��ܰ�ť��");

					return;
				}

				for (var i = 0; i < this.toolbar.btnArrs.length; i++) {

					if (this.toolbar.btnArrs[i].id == btnId) {

						var btnO = $("#" + btnId);

						if (disabled == true) {// ��ťʧЧ

							if (typeof(this.toolbar.btnArrs[i].iconCss) == "string"
									&& $.trim(this.toolbar.btnArrs[i].iconCss) != "") {

								btnO
										.removeClass(this.toolbar.btnArrs[i].iconCss)
										.addClass(this.toolbar.btnArrs[i].iconCss
												+ "_grey");
							}

							btnO.attr("title", "��Ȩ�޲���");

							btnO.get(0).disabled = true;
						} else {// ��ť����

							if (typeof(this.toolbar.btnArrs[i].iconCss) == "string"
									&& $.trim(this.toolbar.btnArrs[i].iconCss) != "") {

								btnO
										.removeClass(this.toolbar.btnArrs[i].iconCss
												+ "_grey")
										.addClass(this.toolbar.btnArrs[i].iconCss);
							}

							btnO.attr("title", this.toolbar.btnArrs[i].alt);

							btnO.get(0).disabled = false;
						}

						break;
					}
				}
			}
		}

		TableObject3.prototype.hiddenTipInfo = function(hidden) {

			if (typeof(hidden) == "boolean" && hidden == true) {

				$("#hx_table_infobar_div3").css("display", "none");
			} else {

				$("#hx_table_infobar_div3").css("display", "");
			}
		}

		TableObject3.prototype.hiddenToolBar = function(hidden) {

			if (typeof(hidden) == "boolean" && hidden == true) {

				$("#hx_table_toolbar3").css("display", "none");
			} else {

				$("#hx_table_toolbar3").css("display", "");
			}
		}

		TableObject3.prototype.setTipInfo = function(info) {

			if (typeof(info) == "string" && info != "") {

				$("#hx_table_infobar3").html(info);
			}
		}
		/*
		 * ��������
		 */
		TableObject3.prototype.modColProperty = function(params) {

			if (this.status == false) {

				alert("����δ������ʼ�����޷�����modColProperty()������");

				return false;
			}
			/*
			 * ������ʽ�� { col_num:int--������ col_name:string--����
			 * col_hide:boolean--�Ƿ����� }
			 */

			if (arguments.length == 1 && typeof(params) == "object") {

				var obj = this;

				if (typeof(params.col_num) == "number"
						&& params.col_num > 0
						&& params.col_num <= obj.cols.cols.length
						&& ((typeof(params.col_name) == "string" && params.col_name != "") || typeof(params.col_hide) == "boolean")) {

					$("#hx_table_grid_header_tr3").children().each(function(i) {

						if (i == 0)
							return true;

						if (i == params.col_num) {

							if (typeof(params.col_name) == "string"
									&& params.col_name != "") {

								// <bean:message key="button.modify" bundle="${language}"/>����
								$(this).html(params.col_name);
								obj.cols.cols[params.col_num - 1].name = params.col_name;
							}

							/*
							 * if(typeof(params.col_hide)=="boolean"){
							 * 
							 * if(params.col_hide){//������
							 * 
							 * alert("����");
							 * 
							 * $(this).css("display","none");
							 * 
							 * obj.cols.cols[params.col_num-1].hiden=true; }
							 * else{//��ʾ��
							 * 
							 * alert("��ʾ"); $(this).css("display","");
							 * 
							 * obj.cols.cols[params.col_num-1].hiden=false; } }
							 */
							return false;
						}
					});

					/*
					 * if(typeof(params.col_hide)=="boolean"){
					 * 
					 * $("#hx_table_grid_scroll table tbody
					 * tr").each(function(i){
					 * 
					 * $(this).children("#hx_custom_col").each(function(j){
					 * 
					 * if(j+1==params.col_num){
					 * 
					 * if(params.col_hide){//���ظ���
					 * 
					 * $(this).css("display","none"); } else{//��ʾ����
					 * 
					 * $(this).css("display",""); }
					 * 
					 * return false; } }); }); }
					 */
				}
			}
		}
		/*
		 * ��������
		 */
		TableObject3.prototype.setData = function(params) {

			/*
			 * ������ʽ�� { curPage: totalPage: totalRow: data:array--��ά����
			 * cols_align--ÿ�����ݶ��뷽ʽ }
			 */
			if (this.status == false) {

				alert("����δ������ʼ������ʾ����ʧ�ܡ�");

				return false;
			}

			var paramObject = arguments[0];

			// �Ƿ�Ӧ���ж�������
			var isColAlign = false;

			if (paramObject.length = 1 && typeof(paramObject) == "object") {

				if (typeof(paramObject.curPage) != "number") {

					alert("setData������curPage������Ч����ʾ����ʧ�ܡ�");

					return false;
				}

				if (typeof(paramObject.totalPage) != "number") {

					alert("setData������totalPage������Ч����ʾ����ʧ�ܡ�");

					return false;
				}

				if (typeof(paramObject.totalRow) != "number") {

					alert("setData������totalRow������Ч����ʾ����ʧ�ܡ�");

					return false;
				}

				if (typeof(paramObject.cols_align) == "object"
						&& (paramObject.cols_align instanceof Array)) {

					isColAlign = true;
				}

				if (typeof(paramObject.data) == "object"
						&& (paramObject.data instanceof Array)) {

					var dataRowNum = paramObject.data.length;

					// ����������������
					$("#hx_table_grid_scroll3 table tbody tr").each(
							function(i) {

								if (i + 1 > dataRowNum) {

									$(this).children("#hx_check_col3")
											.children().val("n");
								} else {

									$(this).children("#hx_check_col3")
											.children().val("y");
								}

								$(this).children("#hx_custom_col3").each(
										function(j) {

											if (typeof(paramObject.data[i]) == "undefined"
													|| typeof(paramObject.data[i][j]) == "undefined") {

												$(this).html("&nbsp;");
											} else {

												if (isColAlign == true
														&& typeof(paramObject.cols_align[j]) == "string") {

													$(this)
															.css(
																	"text-align",
																	paramObject.cols_align[j]);
												}

												$(this)
														.html(paramObject.data[i][j]);
											}
										});
							});

					if (this.page != null) {

						this.page.curPage = paramObject.curPage;
						this.page.totalPage = paramObject.totalPage;
						this.page.totalRow = paramObject.totalRow;

						this.page.reloadPage();
					}

					if (this.isSyncColWidth) {

						this.cols.syncColWidth();
					}

					return true;
				} else if (paramObject.data == null) {

					// ��ձ�������������
					$("#hx_table_grid_scroll3 table tbody tr").each(
							function(i) {

								$(this).children("#hx_check_col3").children()
										.val("n");

								$(this).children("#hx_custom_col3").each(
										function(j) {

											$(this).html("&nbsp;");
										});
							});

					if (this.page != null) {

						this.page.curPage = paramObject.curPage;
						this.page.totalPage = paramObject.totalPage;
						this.page.totalRow = paramObject.totalRow;

						this.page.reloadPage();
					}

					if (this.isSyncColWidth) {

						this.cols.syncColWidth();
					}

					return true;
				} else {

					alert("setData������data������Ч����ʾ����ʧ�ܡ�");

					return false;
				}
			} else {

				alert("setData����������Ч����ʾ����ʧ�ܡ�");

				return false;
			}
		}

		/*
		 * <bean:message key="button.delete" bundle="${language}"/>��ֵ
		 */
		TableObject3.prototype.delRowValue = function(row_num) {

			if (typeof(row_num) != "number") {

				alert("delRowValue������row_num�������Ͳ�����");

				return;
			}

			$("#hx_grid_tr_id3_" + row_num).removeClass("selected")
					.children("#hx_custom_col3").each(function(i) {

								$(this).html("&nbsp;").css("color", "#000000");

							});

			$("#hx_grid_tr_id3_" + row_num).children("#hx_check_col3")
					.children().val("d");

			for (var i = 0; i < this.selectRowObject.length; i++) {

				if (this.selectRowObject[i].line_num == row_num) {

					this.selectRowObject.splice(i, 1);

					break;
				}
			}
		}
		/*
		 * �趨��ֵ
		 */
		TableObject3.prototype.setRowValue = function(params) {

			/*
			 * ������ʽ�� { row_num:int--���� data:array--���� }
			 */
			if (arguments.length == 1 && typeof(params) == "object") {

				if (typeof(params.row_num) != "number") {

					alert("setRowValue������row_num�������Ͳ�����");

					return;
				}

				if (typeof(params.data) != "object"
						&& !(params.data instanceof Array)) {

					alert("setRowValue������data�������Ͳ�����");

					return;
				}

				// ��ֵ
				$("#hx_grid_tr_id3_" + params.row_num)
						.children("#hx_custom_col3").each(function(i) {

									if (typeof(params.data[i]) != "string")
										return true;

									if (params.data[i] == "") {

										$(this).html("&nbsp;");
									} else if ($.trim(params.data[i]) != "no") {

										$(this).html(params.data[i]);
									}
								});
			} else {

				alert("setRowValue����������ʽ������");

				return;
			}
		}

		/*
		 * �趨��ֵ
		 */
		TableObject3.prototype.setColValue = function(params) {

			/*
			 * ������ʽ�� { row_num:int--���� col_num:int--���� data:string--���� }
			 */
			if (arguments.length == 1 && typeof(params) == "object") {

				if (typeof(params.row_num) != "number") {

					alert("setColValue������row_num�������Ͳ�����");

					return;
				}

				if (typeof(params.col_num) != "number") {

					alert("setColValue������col_num�������Ͳ�����");

					return;
				}

				if (typeof(params.data) != "string") {

					alert("setColValue������data�������Ͳ�����");

					return;
				}

				// ��ֵ
				$("#hx_grid_tr_id3_" + params.row_num)
						.children("#hx_custom_col3").each(function(i) {

									if (i + 1 == params.col_num) {

										if (params.data[i] == "") {

											$(this).html("&nbsp;");
										} else {

											$(this).html(params[i]);
										}

										return false;
									}
								});
			} else {

				alert("setColValue����������ʽ������");

				return;
			}
		}

		/*
		 * ������Css����
		 */
		TableObject3.prototype.setRowCss = function(row_num, cssName) {

			if (arguments.length != 2 && typeof(row_num) != "number"
					&& typeof(cssName) != "string") {

				alert("��ΪsetRowCss����������Ч������");

				return;
			} else if ((this.page != null && row_num > this.page.perPage)
					|| row_num > this.cols.viewTotalRow) {

				alert("���õ�row_num������������Χ��");

				return;
			}

			if (cssName == "")
				return;

			$("#hx_grid_tr_id3_" + row_num).addClass(cssName);
		}

		/*
		 * ���ÿҳ��ʾ����
		 */
		TableObject3.prototype.getPerPage = function() {

			if (this.status == false) {

				alert("����δ������ʼ�����޷����ÿҳ��ʾ������");

				return 0;
			}

			if (this.page == null) {

				alert("�ؼ�δʹ�÷�ҳ���ܣ��޷����ÿҳ��ʾ������Ϣ��");

				return 0;
			} else {

				return this.page.perPage;
			}
		}

		/*
		 * ���������
		 */
		TableObject3.prototype.getTotalRow = function() {

			if (this.status == false) {

				alert("����δ������ʼ�����޷������������");

				return 0;
			}

			if (this.page == null) {

				alert("�ؼ�δʹ�÷�ҳ���ܣ��޷������������Ϣ��");

				return 0;
			} else {

				return this.page.totalRow;
			}
		}

		/*
		 * �����ҳ��
		 */
		TableObject3.prototype.getTotalPage = function() {

			if (this.status == false) {

				alert("����δ������ʼ�����޷������ҳ����");

				return 0;
			}

			if (this.page == null) {

				alert("�ؼ�δʹ�÷�ҳ���ܣ��޷������ҳ����Ϣ��");

				return 0;
			} else {

				return this.page.totalPage;
			}
		}

		/*
		 * ��õ�ǰҳ��
		 */
		TableObject3.prototype.getCurPage = function() {

			if (this.status == false) {

				alert("����δ������ʼ�����޷���õ�ǰҳ����");

				return 0;
			}

			if (this.page == null) {

				alert("�ؼ�δʹ�÷�ҳ���ܣ��޷���õ�ǰҳ����Ϣ��");

				return 0;
			} else {

				return this.page.curPage;
			}
		}
		/*
		 * �����ѡ���е��к� ����ֵ��number || array(����) || 0
		 */
		TableObject3.prototype.getSelectRowNum = function() {

			var num = this.selectRowObject.length;

			if (num <= 0) {

				return 0;
			} else if (num == 1) {

				return this.selectRowObject[0].line_num;
			} else {

				var lineArr = new Array();

				for (var i = 0; i < this.selectRowObject.length; i++) {

					lineArr[i] = this.selectRowObject[i].line_num;
				}

				return lineArr;
			}
		}
		/*
		 * �����ֵ(������ֵ) �������ͣ�Object
		 */
		TableObject3.prototype.getRowValue = function(rowNUM) {

			if (this.status == false) {

				return null;
			}

			var tmpSB = new StringBuffer();

			tmpSB.append("{");

			var colNum = 0;

			var colO = $("#hx_grid_tr_id3_" + rowNUM + " td");

			var lastColNum = colO.size();

			var tmpObject = this;

			colO.each(function(i) {

				// ��ȡ���кš����������ֵ
				if ((i == 0 && tmpObject.cols.viewLineNum == true)
						|| (i + 1 == lastColNum)) {

					return true;
				} else {

					if (colNum != 0) {

						tmpSB.append(",");
					}

					tmpSB.append(tmpObject.cols.cols[colNum].alias).append(":");

					var colVal = $.trim($(this).html());

					switch (tmpObject.cols.cols[colNum].dataType) {

						case "number" : {

							if (colVal == "" || colVal == "&nbsp;") {

								tmpSB.append("\" \"");
							} else {

								if (!isNaN(colVal)) {// ������

									tmpSB.append(window
											.eval("(" + colVal + ")"));
								} else {// ��������

									tmpSB.append("\"").append(colVal)
											.append("\"");
								}
							}

							break;
						}
						case "boolean" : {

							// ������ݿգ����ַ�����ʽ��װ
							if (colVal == "" || colVal == "&nbsp;") {

								tmpSB.append("\" \"");
							} else {
								// �ж��Ƿ����booleanֵȡֵ��Χ,������������ַ�����ʽ��װ
								switch (colVal.toLowerCase()) {

									case "y" :
									case "yes" :
									case "true" : {

										tmpSB.append("true");
										break;
									}
									case "n" :
									case "no" :
									case "false" : {

										tmpSB.append("false");
										break;
									}
									default : {

										tmpSB.append("\"").append(colVal)
												.append("\"");
									}
								}

							}

							break;
						}
						case "string" :
						default : {

							tmpSB.append("\"");

							if (colVal == "" || colVal == "&nbsp;") {

								tmpSB.append(" ");
							} else {

								tmpSB.append(colVal);
							}

							tmpSB.append("\"");

							break;
						}
					}

					colNum++;
				}
			});

			tmpSB.append("}");

			if (colNum > 0) {

				return window.eval("(" + tmpSB.toString() + ")");
			} else {

				return null;
			}
		}

		/*
		 * ��õڼ��еڼ���ֵ �������ͣ�string || number || boolean || null
		 */
		TableObject3.prototype.getRowColValue = function(rowNUM, colNUM) {

			if (this.status == false) {

				return null;
			}

			var value;

			var colO = $("#hx_grid_tr_id3_" + rowNUM + " td");

			var lastColNum = colO.size();

			var tmpObject = this;

			colO.each(function(i) {

						// ��ȡ���кš����������ֵ
						if ((i == 0 && tmpObject.cols.viewLineNum)
								|| (i + 1 == lastColNum)) {

							return true;
						} else {

							if (tmpObject.cols.viewLineNum) {

								if (colNUM == i) {

									value = getValue3(tmpObject, colNUM - 1,
											this);
								}
							} else {

								if (i + 1 == colNUM) {

									value = getValue3(tmpObject, colNUM - 1,
											this);
								}

							}
						}
					});

			if (typeof(value) == "undefined") {

				return null;
			} else {

				return value;
			}

		}

		TableObject3._initStatus = true;
	}
}

function getValue3(table_object, col, colJQueryObject) {

	var value;

	var colVal = $.trim($(colJQueryObject).html());

	switch (table_object.cols.cols[col].dataType) {

		case "number" : {

			if (colVal == "" || colVal == "&nbsp;") {

				value = " ";
			} else {

				if (!isNaN(colVal)) {// ������

					value = window.eval("(" + colVal + ")");
				} else {// ��������

					value = colVal;
				}
			}

			break;
		}
		case "boolean" : {

			// ������ݿգ����ַ�����ʽ��װ
			if (colVal == "" || colVal == "&nbsp;") {

				value = " ";
			} else {
				// �ж��Ƿ����booleanֵȡֵ��Χ,������������ַ�����ʽ��װ
				switch (colVal.toLowerCase()) {

					case "y" :
					case "yes" :
					case "true" : {

						value = true;
						break;
					}
					case "n" :
					case "no" :
					case "false" : {

						value = false;
						break;
					}
					default : {

						value = colVal;
					}
				}

			}

			break;
		}
		case "string" :
		default : {

			if (colVal == "" || colVal == "&nbsp;") {

				value = " ";
			} else {

				value = colVal;
			}

			break;
		}
	}

	return value;
}

// ����������
function ToolBarObject3() {
	/*
	 * { --һ�㰴ť���� id:'detail_id',��ťID�� alt:'<bean:message key="button.detail" bundle="${language}"/>', title:'<bean:message key="button.detail" bundle="${language}"/>', iconCss:'detail',
	 * font_size:0, font_family:'', font_color:'', select_trigger_mode:true,
	 * handle:function(){
	 * 
	 * alert("����<bean:message key="button.detail" bundle="${language}"/>�¼�"); } }, new ToolSeparatorObject(),//�ָ������� { alt:'<bean:message key="button.delete" bundle="${language}"/>',
	 * title:'<bean:message key="button.delete" bundle="${language}"/>', iconCss:'delete', font_size:0, font_family:'', font_color:'',
	 * select_trigger_mode:true, handle:function(){
	 * 
	 * alert("����<bean:message key="button.delete" bundle="${language}"/>�¼�"); } }, new ToolButtonBrObject()//���ж���
	 */

	var paramNum = arguments.length;

	var obj = this;

	if (paramNum > 0) {

		// �����Ч����
		var paramArrs = new Array();

		for (var i = 0; i < paramNum; i++) {

			if ((arguments[i] instanceof ToolSeparatorObject3)
					|| (arguments[i] instanceof ToolButtonBrObject3)
					|| (arguments[i] instanceof DefaultDataToXlsBtnObject3)) {// ���߷ָ������س����Լ�����Excel��ť

				paramArrs[i] = arguments[i];
			} else if (typeof(arguments[i]) == "object") {

				if (typeof(arguments[i].title) == "string"
						&& arguments[i].title != "") {

					paramArrs[i] = arguments[i];
				} else if (typeof(arguments[i].iconCss) == "string"
						&& arguments[i].iconCss != "") {

					paramArrs[i] = arguments[i];
				}
			}
		}

		obj.btnArrs = paramArrs;

		// ������װ���Table ToolBar HTML����
		obj.toHTML = function() {

			// �û�û��������Ч����
			if (paramArrs.length == 0) {

				return "<div id=\"hx_table_toolbar3\" title=\"������\"></div>";
			}

			var tmpSB = new StringBuffer();

			tmpSB
					.append("<div id=\"hx_table_toolbar3\" title=\"������\"><table cellpadding=\"0\" cellspacing=\"0\" style=\"width:auto;height:100%;\"><tr>");

			for (var i = 0; i < paramArrs.length; i++) {

				if (paramArrs[i] instanceof ToolSeparatorObject3) {// �ָ���

					tmpSB.append("<td>").append(paramArrs[i].toHTML())
							.append("</td>");
				} else if (paramArrs[i] instanceof ToolButtonBrObject3) {// ����

					tmpSB.append("</tr><tr>");
				} else if (paramArrs[i] instanceof DefaultDataToXlsBtnObject3) {// ����Excel��ť

					tmpSB.append("<td>").append(paramArrs[i].toHTML(i))
							.append("</td>");
				} else {// ��ť

					tmpSB.append("<td><button id=\"");

					if (typeof(paramArrs[i].id) == "string"
							&& $.trim(paramArrs[i].id) != "") {

						tmpSB.append($.trim(paramArrs[i].id))
					} else {

						paramArrs[i].id = "hx_toolbar_event3_" + i;

						tmpSB.append("hx_toolbar_event3_").append(i);
					}

					tmpSB.append("\" type=\"button\" class=\"");

					if (paramArrs[i].iconCss != "") {

						if (typeof(paramArrs[i].title) == "string"
								&& paramArrs[i].title != "") {

							tmpSB.append("hx_table_toolbar_btn3 ");
						} else {

							tmpSB.append("hx_table_toolbar_btn3_3 ");
						}

						tmpSB.append(paramArrs[i].iconCss)
								.append("\" title=\"");
					} else {// �û�û�����ð�ťͼ����ʽ

						tmpSB.append("hx_table_toolbar_btn3_2\" title=\"");
					}

					tmpSB.append(paramArrs[i].alt ? paramArrs[i].alt : "")
							.append("\">");

					// �ж��Ƿ����ð�ť����Ĵ�С����ɫ����Ϣ
					if ((typeof(paramArrs[i].font_size) == "number" && (paramArrs[i].font_size >= 10 && paramArrs[i].font_size <= 15))
							|| (typeof(paramArrs[i].font_color) == "string" && paramArrs[i].font_color != "")
							|| (typeof(paramArrs[i].font_family) == "string" && paramArrs[i].font_family != "")) {

						tmpSB.append("<span style=\"");

						if (typeof(paramArrs[i].font_size) == "number"
								&& (paramArrs[i].font_size >= 10 && paramArrs[i].font_size <= 15)) {

							tmpSB.append("font-size:")
									.append(paramArrs[i].font_size)
									.append("px;");
						}

						if (typeof(paramArrs[i].font_color) == "string"
								&& paramArrs[i].font_color != "") {

							tmpSB.append("color:")
									.append(paramArrs[i].font_color)
									.append(";");
						}

						if (typeof(paramArrs[i].font_family) == "string"
								&& paramArrs[i].font_family != "") {

							tmpSB.append("font-family:")
									.append(paramArrs[i].font_family)
									.append(";");
						}

						tmpSB.append("\">").append(paramArrs[i].title
								? paramArrs[i].title
								: "").append("</span>");
					} else {

						tmpSB.append(paramArrs[i].title
								? paramArrs[i].title
								: "");
					}

					tmpSB.append("</button></td>");
				}
			}

			tmpSB.append("</tr></table>").append("</div>");

			return tmpSB.toString();
		}

		// Ϊ��ť�����û��¼�(ע������ؼ���ʼ����Ϻ����һ�μ���)
		obj.addEvent = function() {

			if (paramArrs.length == 0) {

				obj.addEvent = function() {
				};
			} else {
				for (var i = 0; i < paramArrs.length; i++) {

					if (!(paramArrs[i] instanceof ToolSeparatorObject3)
							&& !(paramArrs[i] instanceof ToolButtonBrObject3)) {

						if (typeof(paramArrs[i]) == "object"
								&& typeof(paramArrs[i].handle) == "function") {// �û��Զ����¼�

							// ����Ψһ��ʶ��
							// paramArrs[i].toolbar_event_id="hx_toolbar_event"+i;

							$("#" + paramArrs[i].id).click(function() {

								var tmpEventId = $(this).attr("id");

								for (var x = 0; x < paramArrs.length; x++) {

									if (tmpEventId == paramArrs[x].id) {

										if (typeof(paramArrs[x].select_trigger_mode) == "string"
												&& (paramArrs[x].select_trigger_mode == "single" || paramArrs[x].select_trigger_mode == "multi")) {// ѡ�����ݺ󴥷��¼�

											if (typeof(this) == "object"
													&& obj.tObject.selectRowObject.length > 0) {

												var tmpDataRowNum = 0;

												for (var rowid_i = 0; rowid_i < obj.tObject.selectRowObject.length; rowid_i++) {

													if (obj.tObject.selectRowObject[rowid_i].isDataRow == true) {

														tmpDataRowNum++;
													} else {

														alert("��ѡ�������Ҳ��ܰ����������С�");

														return;
													}
												}

												if (tmpDataRowNum > 1
														&& paramArrs[x].select_trigger_mode == "single") {

													alert("��ѡ��һ�����ݲ�������");

													return;
												}

												paramArrs[x].handle($(this)
														.get(0));
											} else {

												alert("��ѡ�����ݡ�");
											}
										} else {// ����ѡ�����ݾʹ����¼�

											paramArrs[x].handle(obj, $(this)
															.get(0));
										}

										break;
									}
								}

							});
						}
					}
				}
			}
		}
	} else {

		// ������װ���Table ToolBar HTML����
		obj.toHTML = function() {

			return "<div id=\"hx_table_toolbar3\" title=\"������\"></div>";
		}

		// Ϊ��ť�����û��¼�(ע������ؼ���ʼ����Ϻ����һ�μ���)
		obj.addEvent = function() {
		}

		obj.btnArrs = null;
	}
}

// ����������
function TableHeaderObject3() {

	/*
	 * {title:'���Ա��������Ϣ', font_size:, font_color, font_family}
	 */
	var obj = this;

	if (arguments.length > 0 && typeof(arguments[0]) == "object") {

		var tmp = arguments[0];

		// ���ñ�������,Ĭ�ϡ�����չʾ��
		if (typeof(tmp.title) == "string" && tmp.title != "") {

			obj.title = tmp.title;
		} else {

			obj.title = "����չʾ";
		}

		// ���ñ��������С����Ч��Χ 6<=font-size<=16��
		if (typeof(tmp.font_size) == "number"
				&& (tmp.font_size >= 6 && tmp.font_size <= 16)) {

			obj.font_size = tmp.font_size;
		} else {

			obj.font_size = 0;
		}

		// ���ñ���������ɫ
		if (typeof(tmp.font_color) == "string" && tmp.font_color != "") {

			obj.font_color = tmp.font_color;
		} else {

			obj.font_color = "";
		}

		// ���ñ�������
		if (typeof(tmp.font_family) == "string" && tmp.font_family != "") {

			obj.font_family = tmp.font_family;
		} else {

			obj.font_family = "";
		}
	} else {

		obj.title = "����չʾ";
		obj.font_size = 0;
		obj.font_color = "";
		obj.font_family = "";
	}

	// ������װ���Table Header HTML����
	obj.toHTML = function() {

		var tmpSB = new StringBuffer();

		tmpSB
				.append("<div id=\"hx_table_header3\"><span id=\"hx_table_header_text\">");

		if (obj.font_size > 0 || obj.font_color != "" || obj.font_family != "") {

			tmpSB.append("<span style=\"");

			if (obj.font_size > 0) {

				tmpSB.append("font-size:").append(obj.font_size).append("px;");
			}

			if (obj.font_color != "") {

				tmpSB.append("color:").append(obj.font_color).append(";");
			}

			if (obj.font_family != "") {

				tmpSB.append("font_family:").append(obj.font_family)
						.append(";");
			}

			tmpSB.append("\">").append(obj.title).append("</span>");
		} else {

			tmpSB.append(obj.title);
		}

		tmpSB.append("</span></div>");

		return tmpSB.toString();
	}
}
// ��ҳ����
function PageObject3() {

	var obj = this;

	var isFirst = true;

	if (arguments.length > 0 && typeof(arguments[0]) == "object") {

		var tmp = arguments[0];

		if (typeof(tmp.sep) == "object"
				&& (tmp.sep instanceof PageSeparatorObject3)) {

			obj.sep = tmp.sep;
		}

		// ����ÿҳ����
		if (typeof(tmp.perPage) == "number" && tmp.perPage > 1) {

			obj.perPage = tmp.perPage;
		} else {

			obj.perPage = 15;
		}

		// �����Ƿ���ʾ����ת���ؼ�����ת�ı���
		if (typeof(tmp.viewJumpWidget) == "boolean") {

			obj.viewJumpWidget = tmp.viewJumpWidget;
		} else {

			obj.viewJumpWidget = false;
		}

		// �����Ƿ���ʾ��ҳ��Ϣ���ؼ�
		if (typeof(tmp.viewPageInfoWidget) == "boolean") {

			obj.viewPageInfoWidget = tmp.viewPageInfoWidget;
		} else {

			obj.viewPageInfoWidget = false;
		}

		// ���÷�ҳ��ť�����¼�
		if (typeof(tmp.handle) == "function") {

			obj.handle = tmp.handle;
		}
	} else {

		obj.perPage = 15;
		obj.viewJumpWidget = false;
		obj.viewPageInfoWidget = false;
	}

	// ���õ�ǰҳ��
	obj.curPage = 0;
	// ������ҳ��
	obj.totalPage = 0;
	// ����������
	obj.totalRow = 0;

	// ������װ���Page HTML����
	obj.toHTML = function() {

		var tmpSB = new StringBuffer();

		tmpSB.append("<div id=\"hx_table_page3\">");
		tmpSB.append("<table cellpadding=\"0\" cellspacing=\"0\">");
		tmpSB.append("<tbody>");
		tmpSB.append("<tr>");
		tmpSB
				.append("<td><button type=\"button\" id=\"hx_table_firstpage_btn3\" disabled class=\"hx_table_page_tn3 disabled_first_btn3\" title=\"��һҳ\"></button></td>");

		if (typeof(obj.sep) == "object") {

			tmpSB.append("<td>").append(obj.sep.toHTML()).append("</td>");
		}

		tmpSB
				.append("<td><button type=\"button\" id=\"hx_table_privpage_btn3\" disabled class=\"hx_table_page_tn3 disabled_priv_btn3\" title=\"��һҳ\"></button></td>");

		if (typeof(obj.sep) == "object") {

			tmpSB.append("<td>").append(obj.sep.toHTML()).append("</td>");
		}
		tmpSB
				.append("<td><button type=\"button\" id=\"hx_table_nextpage_btn3\" disabled class=\"hx_table_page_tn3 disabled_next_btn3\" title=\"��һҳ\"></button></td>");

		if (typeof(obj.sep) == "object") {

			tmpSB.append("<td>").append(obj.sep.toHTML()).append("</td>");
		}
		tmpSB
				.append("<td><button type=\"button\" id=\"hx_table_lastpage_btn3\" disabled class=\"hx_table_page_tn3 disabled_last_btn3\" title=\"���ҳ\"></button></td>");

		if (obj.viewJumpWidget) {

			if (typeof(obj.sep) == "object") {

				tmpSB.append("<td>").append(obj.sep.toHTML()).append("</td>");
			}

			tmpSB
					.append("<td><span class=\"jumpPage3\">&nbsp;&nbsp;ת����<input type=\"text\" id=\"hx_table_page_text3\" disabled/>ҳ</span></td>");
		}

		if (obj.viewPageInfoWidget) {

			tmpSB
					.append("<td width=\"100%\" align=\"right\"><span id=\"hx_table_page_info3\">��")
					.append(obj.totalRow).append("����¼����ǰ��").append(obj.curPage)
					.append("ҳ / ��").append(obj.totalPage)
					.append("ҳ</span></td>");
		}

		tmpSB.append("</tr></tbody>").append("</table></div>");

		return tmpSB.toString();
	}

	// �����÷�ҳ������ݼ��¼�
	obj.reloadPage = function() {

		// alert("reloadPage");

		// alert("curPage=="+obj.curPage+"\ttotalPage=="+obj.totalPage);

		if (obj.curPage <= 1) {

			// ����'��ҳ'��ť
			$("#hx_table_firstpage_btn3").removeClass("first_btn3")
					.addClass("disabled_first_btn3").get(0).disabled = true;
			// ����'��һҳ'��ť
			$("#hx_table_privpage_btn3").removeClass("priv_btn3")
					.addClass("disabled_priv_btn3").get(0).disabled = true;
		} else if (obj.curPage == obj.totalPage) {

			// ����'��ҳ'��ť
			$("#hx_table_firstpage_btn3").removeClass("disabled_first_btn3")
					.addClass("first_btn3").get(0).disabled = false;
			// ����'��һҳ'��ť
			$("#hx_table_privpage_btn3").removeClass("disabled_priv_btn3")
					.addClass("priv_btn3").get(0).disabled = false;
			/*
			 * //����'��һҳ'��ť
			 * $("#hx_table_nextpage_btn").removeClass("next_btn").addClass("disabled_next_btn").get(0).disabled=true;
			 * //����'���ҳ'��ť
			 * $("#hx_table_lastpage_btn").removeClass("last_btn").addClass("disabled_last_btn").get(0).disabled=true;
			 */
		} else {

			// ����'��ҳ'��ť
			$("#hx_table_firstpage_btn3").removeClass("disabled_first_btn3")
					.addClass("first_btn3").get(0).disabled = false;
			// ����'��һҳ'��ť
			$("#hx_table_privpage_btn3").removeClass("disabled_priv_btn3")
					.addClass("priv_btn3").get(0).disabled = false;
			/*
			 * //����'��һҳ'��ť
			 * $("#hx_table_nextpage_btn").removeClass("disabled_next_btn").addClass("next_btn").get(0).disabled=false;
			 * //����'���ҳ'��ť
			 * $("#hx_table_lastpage_btn").removeClass("disabled_last_btn").addClass("last_btn").get(0).disabled=false;
			 */
		}

		if (obj.totalPage <= 1 || obj.totalPage == obj.curPage) {

			// ����'��һҳ'��ť
			$("#hx_table_nextpage_btn3").removeClass("next_btn3")
					.addClass("disabled_next_btn3").get(0).disabled = true;
			// ����'���ҳ'��ť
			$("#hx_table_lastpage_btn3").removeClass("last_btn3")
					.addClass("disabled_last_btn3").get(0).disabled = true;
		} else {

			// ����'��һҳ'��ť
			$("#hx_table_nextpage_btn3").removeClass("disabled_next_btn3")
					.addClass("next_btn3").get(0).disabled = false;
			// ����'���ҳ'��ť
			$("#hx_table_lastpage_btn3").removeClass("disabled_last_btn3")
					.addClass("last_btn3").get(0).disabled = false;
		}

		if (obj.totalPage > 1 && obj.viewJumpWidget) {

			// ����'��ת'�ı���
			$("#hx_table_page_text3").get(0).disabled = false;
		} else if (obj.totalPage <= 1 && obj.viewJumpWidget) {

			// ����'��ת'�ı���
			$("#hx_table_page_text3").get(0).disabled = true;
		}

		if (obj.viewPageInfoWidget) {

			$("#hx_table_page_info3").text("��" + obj.totalRow + "����¼����ǰ��"
					+ obj.curPage + "ҳ / ��" + obj.totalPage + "ҳ");
		}

		if (typeof(obj.handle) == "function" && isFirst == true) {

			// '��ҳ'��ť�¼�
			$("#hx_table_firstpage_btn3").click(function() {

						// obj.curPage=1;
						obj.handle(1);
					});

			// '��һҳ'��ť�¼�
			$("#hx_table_privpage_btn3").click(function() {

						// obj.curPage-=1;
						obj.handle(obj.curPage - 1);
					});

			// '��һҳ'��ť�¼�
			$("#hx_table_nextpage_btn3").click(function() {

						// obj.curPage+=1
						obj.handle(obj.curPage + 1);
					});

			// '���ҳ'��ť�¼�
			$("#hx_table_lastpage_btn3").click(function() {

						// obj.curPage=obj.totalPage;
						obj.handle(obj.totalPage);
					});

			if (obj.viewJumpWidget) {

				// ��ת�ı���'�س�'�¼�
				$("#hx_table_page_text3").keydown(function() {

							if (event.keyCode == 13) {

								if (isNum($(this).val())) {

									var num = window.eval("(" + $(this).val()
											+ ")");

									if (num < 0 || num > obj.totalPage) {

										alert("������Ϸ�ҳ��(0 - " + obj.totalPage
												+ ")��")
									} else if (num != obj.curPage) {

										// obj.curPage=num;
										obj.handle(num);
									}
								} else {

									alert("������Ϸ����֡�");
								}
							}
						});
			}

			isFirst = false;
		}
	}
}

// ���������󣨰����б��������ݣ�
function ColsObject3() {

	if (arguments.length > 0 && typeof(arguments[0]) == "object") {

		var obj = this;

		if (typeof(arguments[0].viewLineNum) == "boolean") {

			obj.viewLineNum = arguments[0].viewLineNum;
		} else {

			obj.viewLineNum = false;
		}

		if (typeof(arguments[0].viewTotalRow) == "number") {

			obj.viewTotalRow = arguments[0].viewTotalRow;
		} else {
			// Ĭ����ʾ300������(��������Ҫ����û�з�ҳģʽ�£�ҳ��Ӧ����ʾ����������)
			obj.viewTotalRow = 300;
		}

		var tmpColArr = arguments[0].cols;

		if (typeof(tmpColArr) != "object" && !(tmpColArr instanceof Array)) {

			alert("ColsObject3���������ʽ���ԣ��޷���ʼ����");

			return new Object;
		}

		// �������
		obj.gridWidth = 0;

		for (var i = 0; i < tmpColArr.length; i++) {

			if (typeof(tmpColArr[i]) != "object") {

				alert("ColsObject3���������ʽ���ԣ��޷���ʼ����");

				return new Object;
			}

			// û�ж����б�����û�кϷ������б���������
			if (typeof(tmpColArr[i].alias) != "string"
					|| $.trim(tmpColArr[i].alias) == "") {

				alert("ColsObject3���������aliasû�ж���򲻺Ϸ���");

				return new Object;
			}

			// û�ж���������û�кϷ�����������ʹ��Ĭ��ֵ
			if (typeof(tmpColArr[i].name) != "string") {

				tmpColArr[i].name = "�� " + (i + 1);
			}

			// û�ж������Ƿ����أ�Ĭ����ʾ
			if (typeof(tmpColArr[i].hide) != "boolean") {

				tmpColArr[i].hide = false;
			}

			// û�ж����û�кϷ������п���ʹ��Ĭ��ֵ
			if (typeof(tmpColArr[i].width) != "number") {

				tmpColArr[i].width = 100;
			}

			if (!tmpColArr[i].hide) {

				obj.gridWidth += tmpColArr[i].width;
			}

			if (typeof(tmpColArr[i].dataType) != "string") {

				tmpColArr[i].dataType = "string";
			}
		}

		// �û�û�ж���Ҫ��ʾ������,���ܳ�ʼ��������
		if (obj.gridWidth == 0) {

			alert("�붨��Ҫ��ʾ������");

			return new Object;
		}

		if (obj.viewLineNum) {// �к�Ĭ�Ͽ���15

			obj.gridWidth += 15;
		}

		obj.cols = tmpColArr;

		// Ĭ���к�
		obj.lineNum = 0;

		// ������װ���Grid Container HTML����
		obj.toHTML = function(viewRowNum) {// ��ʾ������

			var tmpSB = new StringBuffer();

			tmpSB.append("<div id=\"hx_table_data_container3\">");
			tmpSB.append("<div id=\"hx_table_grid_header3\">");
			tmpSB
					.append("<table cellpadding=\"0\" cellspacing=\"0\" style=\"width:")
					.append(obj.gridWidth).append("px;height:100%;\">");
			tmpSB.append("<tr id=\"hx_table_grid_header_tr3\">");

			if (obj.viewLineNum) {

				tmpSB.append("<td id=\"header_line_num3\">&nbsp;</td>");
			}

			for (var i = 0; i < obj.cols.length; i++) {

				if (obj.cols[i].hide) {// ������

					tmpSB.append("<td width=\"").append(obj.cols[i].width)
							.append("\" style=\"display:none\">")
							.append(obj.cols[i].name).append("</td>");
				} else {

					tmpSB.append("<td width=\"").append(obj.cols[i].width)
							.append("\">").append(obj.cols[i].name)
							.append("</td>");
				}
			}

			tmpSB.append("</tr></table></div>");

			tmpSB
					.append("<div id=\"hx_table_grid_scroll3\"><div id=\"hx_scroll_div3\" style=\"margin-bottom:0px;\">");
			tmpSB
					.append("<table cellpadding=\"0\" cellspacing=\"0\" style=\"width:")
					.append(obj.gridWidth).append("px;\">");
			tmpSB.append("<tbody>");

			for (var i = 1; i <= viewRowNum; i++) {

				tmpSB.append("<tr id=\"hx_grid_tr_id3_").append(i)
						.append("\" line_num=\"" + i + "\">");

				// �Ƿ���ʾ�к�
				if (obj.viewLineNum) {

					tmpSB.append("<td id=\"hx_grid_num3\">").append(i)
							.append("</td>");
				}

				// ��������
				for (var ii = 0; ii < obj.cols.length; ii++) {

					if (obj.cols[ii].hide) {// ������

						tmpSB
								.append("<td id=\"hx_custom_col3\" width=\"")
								.append(obj.cols[ii].width)
								.append("\" style=\"display:none\">&nbsp;</td>");
					} else {

						tmpSB.append("<td id=\"hx_custom_col3\" width=\"")
								.append(obj.cols[ii].width)
								.append("\">&nbsp;</td>");
					}
				}

				// ���������У������ж��Ƿ�������
				tmpSB
						.append("<td  id=\"hx_check_col3\" style=\"display:none\"><input type=\"hidden\" value=\"n\"/></td>");

				tmpSB.append("</tr>");
			}

			// �������к�
			obj.lineNum = viewRowNum + 1;

			tmpSB
					.append("</tbody></table><form id=\"hx_t_form3\" method=\"POST\" target=\"_hx_iframe3\"></form>");
			tmpSB
					.append("<iframe id=\"_hx_iframe3\" name=\"_hx_iframe3\" style=\"display:none;\"></iframe></div></div></div>");

			return tmpSB.toString();
		}

		/*
		 * ͬ���п�(��ֹ���ݳ��ȴ����п��������Զ�����)
		 */
		obj.syncColWidth = function() {
			/*
			 * $("#hx_table_grid_header table tr").children().each(function(i){
			 * 
			 * alert("header��"+(i+1)+" width = "+$(this).width()); });
			 * $("#hx_grid_tr_id1").children().each(function(i){
			 * 
			 * alert("��"+(i+1)+" width = "+$(this).width()); });
			 */
		}

		// ��������ͷ��ʽ(ע������ؼ���ʼ����Ϻ����һ�μ���)
		obj.reloadGridHeaderCss = function(tmpContainerWidth) {

			/*
			 * if(obj.gridWidth<tmpContainerWidth){
			 * 
			 * if(tmpContainerWidth-obj.gridWidth<15){
			 * 
			 * $("#hx_table_grid_header").width(obj.gridWidth+15); } else{
			 * 
			 * $("#hx_table_grid_header").width(tmpContainerWidth); } } else{
			 * 
			 * $("#hx_table_grid_header").width(obj.gridWidth+15); }
			 */
		}

		// �������񡮵������¼�(ע������ؼ���ʼ����Ϻ����һ�μ���)
		obj.reloadGridClickHandle = function() {

			$("#hx_table_grid_scroll3 table tbody tr").hover(

			function() {
						$(this).addClass("highlight");
					}, function() {
						$(this).removeClass("highlight");
					}).click(

			function() {

				// ��֧��ctrl+shift��ϼ�
				// Ŀǰ��֧��ctrl+���������shift+�������

				if (event.shiftKey == true && event.ctrlKey == true)
					return;

				/*
				 * if(event.shiftKey==true){//shift��ϼ���ѡ
				 * 
				 * if(obj.tObject.curSelectedRow==0){//�����ѡ����
				 * 
				 * var trObj=$(this);
				 * 
				 * if(trObj.children("#hx_check_col").children().val()=="d"){
				 * 
				 * return; }
				 * 
				 * //�������Ƿ���ѡ�� var line_num=trObj.attr("line_num");
				 * 
				 * var isSelected=false;
				 * 
				 * //��õ�ǰ��״̬ for(var i=0;i<obj.tObject.selectRowObject.length;i++){
				 * 
				 * if(obj.tObject.selectRowObject[i].line_num==line_num){
				 * 
				 * isSelected=true; } }
				 * 
				 * 
				 * var trId=trObj.attr("id");
				 * 
				 * //�û�ѡ�����Ƿ��������� var isDataRow=false;
				 * 
				 * if(trObj.children("#hx_check_col").children().val()=="y"){
				 * 
				 * isDataRow=true; }
				 * 
				 * 
				 * //��¼��ǰѡ������ obj.tObject.curSelectedRow=parseInt(line_num);
				 * 
				 * for(var i=0;i<obj.tObject.selectRowObject.length;i++){
				 * 
				 * var tmpTrObj=$("#"+obj.tObject.selectRowObject[i].id);
				 * 
				 * tmpTrObj.children("#hx_custom_col").each(function(num){
				 * 
				 * $(this).css("color","#000000"); });
				 * 
				 * tmpTrObj.removeClass("selected"); }
				 * 
				 * //<bean:message key="button.delete" bundle="${language}"/>�û�������ѡ����Ϣ
				 * obj.tObject.selectRowObject.splice(0,obj.tObject.selectRowObject.length);
				 * 
				 * //�����û���ǰѡ�������Ϣ
				 * obj.tObject.selectRowObject[0]=window.eval("("+("{id:'"+trId+"',isDataRow:"+isDataRow+",line_num:"+line_num+"}")+")");
				 * 
				 * //�ı��û���ǰѡ�������ʽ trObj.addClass("selected");
				 * 
				 * trObj.children("#hx_custom_col").each(function(i){
				 * 
				 * $(this).css("color","#FFFFFF"); }); } else{
				 * 
				 * var trObj=$(this);
				 * 
				 * //�������Ƿ���ѡ�� var line_num=parseInt(trObj.attr("line_num"));
				 * 
				 * 
				 * if(obj.tObject.curSelectedRow>line_num){
				 * 
				 * 
				 * for(var tmp=line_num;tmp<obj.tObject.curSelectedRow;tmp++){
				 * 
				 * var tmpTrObj=$("#hx_grid_tr_id"+tmp);
				 * 
				 * if(tmpTrObj.children("#hx_check_col").children().val()=="d")
				 * continue;
				 * 
				 * 
				 * //var }
				 *  } else if(obj.tObject.curSelectedRow<line_num){
				 * 
				 * 
				 * 
				 * 
				 * var trObj=$(this);
				 * 
				 * if(trObj.children("#hx_check_col").children().val()=="d"){
				 * 
				 * return; }
				 * 
				 * //�������Ƿ���ѡ�� var line_num=trObj.attr("line_num");
				 * 
				 * var isSelected=false;
				 * 
				 * //��õ�ǰ��״̬ for(var i=0;i<obj.tObject.selectRowObject.length;i++){
				 * 
				 * if(obj.tObject.selectRowObject[i].line_num==line_num){
				 * 
				 * isSelected=true; } }
				 * 
				 * 
				 * var trId=trObj.attr("id");
				 * 
				 * //�û�ѡ�����Ƿ��������� var isDataRow=false;
				 * 
				 * if(trObj.children("#hx_check_col").children().val()=="y"){
				 * 
				 * isDataRow=true; }
				 * 
				 * 
				 *  } else{
				 * 
				 * return; } } } else
				 */if (event.ctrlKey == false && event.shiftKey == false) {// �����ѡ����

					var trObj = $(this);

					if (trObj.children("#hx_check_col3").children().val() == "d") {

						return;
					}

					// �������Ƿ���ѡ��
					var line_num = trObj.attr("line_num");

					var isSelected = false;

					// ��õ�ǰ��״̬
					for (var i = 0; i < obj.tObject.selectRowObject.length; i++) {

						if (obj.tObject.selectRowObject[i].line_num == line_num) {

							isSelected = true;
						}
					}

					var trId = trObj.attr("id");

					// �û�ѡ�����Ƿ���������
					var isDataRow = false;

					if (trObj.children("#hx_check_col3").children().val() == "y") {

						isDataRow = true;
					}

					// ��¼��ǰѡ������
					obj.tObject.curSelectedRow = parseInt(line_num);

					for (var i = 0; i < obj.tObject.selectRowObject.length; i++) {

						var tmpTrObj = $("#"
								+ obj.tObject.selectRowObject[i].id);

						tmpTrObj.children("#hx_custom_col3").each(
								function(num) {

									$(this).css("color", "#000000");
								});

						tmpTrObj.removeClass("selected");
					}

					// <bean:message key="button.delete" bundle="${language}"/>�û�������ѡ����Ϣ
					obj.tObject.selectRowObject.splice(0,
							obj.tObject.selectRowObject.length);

					// �����û���ǰѡ�������Ϣ
					obj.tObject.selectRowObject[0] = window.eval("("
							+ ("{id:'" + trId + "',isDataRow:" + isDataRow
									+ ",line_num:" + line_num + "}") + ")");

					// �ı��û���ǰѡ�������ʽ
					trObj.addClass("selected");

					trObj.children("#hx_custom_col3").each(function(i) {

								$(this).css("color", "#FFFFFF");
							});

				} else if (event.ctrlKey == true) {// ctrl��ϼ���ѡ����

					var trObj = $(this);

					if (trObj.children("#hx_check_col3").children().val() == "d") {

						return;
					}

					// �������Ƿ���ѡ��
					var line_num = trObj.attr("line_num");

					var isSelected = false;

					// ��õ�ǰ��״̬
					for (var i = 0; i < obj.tObject.selectRowObject.length; i++) {

						if (obj.tObject.selectRowObject[i].line_num == line_num) {

							isSelected = true;
						}
					}

					var trId = trObj.attr("id");

					// �û�ѡ�����Ƿ���������
					var isDataRow = false;

					if (trObj.children("#hx_check_col3").children().val() == "y") {

						isDataRow = true;
					}

					// ��¼��ǰѡ������
					obj.tObject.curSelectedRow = parseInt(line_num);

					if (isSelected == true) {// ����֮ǰ�ѱ�ѡ����ѡ����

						for (var i = 0; i < obj.tObject.selectRowObject.length; i++) {

							if (line_num == obj.tObject.selectRowObject[i].line_num) {

								// ȡ������ʽ
								var tmpTrObj = $("#"
										+ obj.tObject.selectRowObject[i].id);

								tmpTrObj.children("#hx_custom_col3").each(
										function(num) {

											$(this).css("color", "#000000");
										});

								tmpTrObj.removeClass("selected");

								// <bean:message key="button.delete" bundle="${language}"/>�ѱ�������Ϣ
								obj.tObject.selectRowObject.splice(i, 1);

								break;
							}

						}
					} else if (isSelected == false) {// ����֮ǰδ��ѡ����ѡ����

						// �����û���ǰѡ�������Ϣ
						obj.tObject.selectRowObject[obj.tObject.selectRowObject.length] = window
								.eval("("
										+ ("{id:'" + trId + "',isDataRow:"
												+ isDataRow + ",line_num:"
												+ line_num + "}") + ")");

						// �ı��û���ǰѡ�������ʽ
						trObj.addClass("selected");

						trObj.children("#hx_custom_col3").each(function(i) {

									$(this).css("color", "#FFFFFF");
								});
					}
				}
			});
		}
	} else {

		return new Object;
	}
}

// �������а�ť�ָ�������
function ToolSeparatorObject3() {

	this.sepLabelContent = "|";

	this.sepLabelCss = "toolbar-sep3";

	if (arguments.length != 0) {

		if (typeof(arguments[0]) == "object") {

			if (typeof(arguments[0].sep) == "string" && arguments[0].sep != "") {

				this.sepLabelContent = arguments[0].sep;
			}

			if (typeof(arguments[0].css) == "string" && arguments[0].css != "") {

				this.sepLabelCss = arguments[0].css;
			}
		}
	}

	if (typeof ToolSeparatorObject3._initStatus == "undefined") {

		ToolSeparatorObject3.prototype.toHTML = function() {

			var tmp = new StringBuffer();

			tmp.append("<span class=\"").append(this.sepLabelCss).append("\">")
					.append(this.sepLabelContent).append("</span>");

			return tmp.toString();
		}

		ToolSeparatorObject3._initStatus = true;
	}
}

// ��ҳ�а�ť�ָ�������
function PageSeparatorObject3() {

	this.sepLabelContent = "|";

	this.sepLabelCss = "page-sep3";

	if (arguments.length != 0) {

		if (typeof(arguments[0]) == "object") {

			if (typeof(arguments[0].sep) == "string" && arguments[0].sep != "") {

				this.sepLabelContent = arguments[0].sep;
			}

			if (typeof(arguments[0].css) == "string" && arguments[0].css != "") {

				this.sepLabelCss = arguments[0].css;
			}
		}
	}

	if (typeof PageSeparatorObject3._initStatus == "undefined") {

		PageSeparatorObject3.prototype.toHTML = function() {

			var tmp = new StringBuffer();

			tmp.append("<span class=\"").append(this.sepLabelCss).append("\">")
					.append(this.sepLabelContent).append("</span>");

			return tmp.toString();
		}

		PageSeparatorObject3._initStatus = true;
	}
}

function InfoTipObject3(params) {

	if (arguments.length == 1 && typeof(params) == "object") {

		if (typeof(params.label) == "string" && params.label != "") {

			this.label = params.label;

			InfoTipObject3.prototype.toHTML = function() {

				return "<div id=\"hx_table_infobar_div3\" title=\"��Ϣ��ʾ��\">&nbsp;&nbsp;"
						+ this.label
						+ "&nbsp;<span id=\"hx_table_infobar3\"></span></div>";
			}
		} else {

			InfoTipObject3.prototype.toHTML = function() {

				return "<div id=\"hx_table_infobar_div3\" title=\"��Ϣ��ʾ��\"><span id=\"hx_table_infobar3\"></span></div>";
			}
		}
	} else {

		InfoTipObject3.prototype.toHTML = function() {

			return "<div id=\"hx_table_infobar_div3\" title=\"��Ϣ��ʾ��\"><span id=\"hx_table_infobar3\"></span></div>";
		}
	}
}

function DefaultDataToXlsBtnObject3(params) {

	var obj = this;

	// Ĭ�������ַ/xls_template.jsp
	obj.url = "xls_template.jsp";
	obj.title = "����Excel"
	obj.alt = "������ǰҳ���ݵ�Excel�ļ�";
	obj.iconCss = "excel";
	obj.font_color;
	obj.font_size;
	obj.font_family;

	if (arguments.length == 1 && typeof(params) == "object") {

		// ��������ַ��ģ���ļ���ַ��
		if (typeof(params.url) == "string" && $.trim(params.url) != "") {

			obj.url = params.url;
		}
		// ��ð�ť����
		if (typeof(params.title) == "string" && $.trim(params.title) != "") {

			obj.title = params.title;
		}
		// ��ð�ť��ʾ��Ϣ
		if (typeof(params.alt) == "string" && $.trim(params.alt) != "") {

			obj.alt = params.alt;
		}
		// ��ð�ťͼ����ʽ
		if (typeof(params.iconCss) == "string" && $.trim(params.iconCss) != "") {

			obj.iconCss = params.iconCss;
		}
		// ��ð�ť������ɫ
		if (typeof(params.font_color) == "string"
				&& $.trim(params.font_color) != "") {

			obj.font_color = params.font_color;
		}
		// ��ð�ť�����С
		if (typeof(params.font_size) == "number" && params.font_size >= 10
				&& params.font_size <= 15) {

			obj.font_size = params.font_size;
		}
		// ��ð�ť��������
		if (typeof(params.font_family) == "string"
				&& $.trim(params.font_family) != "") {

			obj.font_family = params.font_family;
		}
	}

	// ��DefaultDataToXlsBtnObjectת��ΪHTML ����
	obj.toHTML = function(i) {

		var tmpSB = new StringBuffer();

		tmpSB.append("<button id=\"");

		if (typeof(params.id) == "string" && $.trim(params.id) != "") {

			tmpSB.append($.trim(params.id))

			obj.id = $.trim(params.id);
		} else {

			obj.id = "hx_toolbar_event3_" + i;

			tmpSB.append("hx_toolbar_event3_").append(i);
		}

		tmpSB.append("\" type=\"button\" class=\"");

		if (obj.iconCss != "") {

			if (typeof(obj.title) == "string" && $.trim(obj.title) != "") {

				tmpSB.append("hx_table_toolbar_btn3 ");
			} else {

				tmpSB.append("hx_table_toolbar_btn3_3 ");
			}

			tmpSB.append(obj.iconCss).append("\" title=\"");
		} else {// �û�û�����ð�ťͼ����ʽ

			tmpSB.append("hx_table_toolbar_btn3_2\" title=\"");
		}

		tmpSB.append(obj.alt ? obj.alt : "").append("\">");

		// �ж��Ƿ����ð�ť����Ĵ�С����ɫ����Ϣ
		if ((typeof(obj.font_size) == "number" && (obj.font_size >= 10 && obj.font_size <= 15))
				|| (typeof(obj.font_color) == "string" && obj.font_color != "")
				|| (typeof(obj.font_family) == "string" && obj.font_family != "")) {

			tmpSB.append("<span style=\"");

			if (typeof(obj.font_size) == "number"
					&& (obj.font_size >= 10 && obj.font_size <= 15)) {

				tmpSB.append("font-size:").append(obj.font_size).append("px;");
			}

			if (typeof(obj.font_color) == "string" && obj.font_color != "") {

				tmpSB.append("color:").append(obj.font_color).append(";");
			}

			if (typeof(obj.font_family) == "string" && obj.font_family != "") {

				tmpSB.append("font-family:").append(obj.font_family)
						.append(";");
			}

			tmpSB.append("\">").append(obj.title ? obj.title : "")
					.append("</span>");
		} else {

			tmpSB.append(obj.title ? obj.title : "");
		}

		tmpSB.append("</button>");

		return tmpSB.toString();
	}

	// �¼�
	obj.handle = function(toolbarObject) {

		var formObj = $("#hx_t_form3");

		formObj
				.attr("action", obj.url)
				.append($("<input id=\"xls_data_input3\" type=\"hidden\" name=\"xls_datas\"/>"));

		var gridTotalRow = 0;

		if (toolbarObject.tObject.page == null) {// û�����÷�ҳ

			gridTotalRow = toolbarObject.tObject.cols.viewTotalRow;
		} else {

			gridTotalRow = toolbarObject.tObject.page.perPage;
		}

		// ���������Ƿ��������,����ǣ���װ����
		if (gridTotalRow > 0) {

			var dataSB = new StringBuffer();

			var dataRow = 0;

			/*
			 * ��װ��ʽ�� { data:[
			 * {col1:'��һ�е�һ��',col2:'��һ�еڶ���',col3:'��һ�е�����',col4:'��һ�е�����',col5:'������'},
			 * {col1:'��һ�е�һ��',col2:'��һ�еڶ���',col3:'��һ�е�����',col4:'��һ�е�����',col5:'������'} ],
			 * title:'����', col_names:[����,����,����,����,����] }
			 */

			// ��װ����
			dataSB.append("{data:[");

			for (var i = 1; i <= gridTotalRow; i++) {

				var tmpTrObj = $("#hx_grid_tr_id3_" + i);

				if (tmpTrObj.children("#hx_check_col3").children().val() == "y") {// ��������

					dataRow++;

					if (dataRow == 1) {

						dataSB.append("{");
					} else {

						dataSB.append(",{");
					}

					var col_num = 1;

					// ��ô���û������
					tmpTrObj.children("#hx_custom_col3").each(function(i) {

						if ($(this).get(0).style.display != "none") {

							if (col_num == 1) {

								dataSB.append("col1:'");
							} else {

								dataSB.append(",col").append(col_num)
										.append(":'");
							}

							var value = $.trim($(this).html());

							if (value == "" || value == "&nbsp;") {

								dataSB.append(" ");
							} else {

								dataSB.append(value);
							}

							dataSB.append("'");

							col_num++;
						}
					});

					dataSB.append("}");
				}
			}

			if (dataRow == 0) {

				alert("Ŀǰû�����ݡ�");

				return;
			}

			dataSB.append("],");

			// ��װ����
			dataSB.append("title:'").append(toolbarObject.tObject.reportTitle)
					.append("',");

			// ��װ����
			dataSB.append("col_names:[");

			// �û������ж���������Ϣ
			var colObjs = toolbarObject.tObject.cols.cols;
			var colObjsLength = colObjs.length;

			var viewColsNum = 0;

			for (var i = 0; i < colObjsLength; i++) {

				if (!colObjs[i].hide) {

					if (viewColsNum == 0) {

						dataSB.append("'").append(colObjs[i].name).append("'");
					} else {

						dataSB.append(",'").append(colObjs[i].name).append("'");
					}

					viewColsNum++;
				}
			}

			if (viewColsNum == 0) {

				alert("û�п���ʾ����޷�����Excel�ļ���");

				return;
			}

			dataSB.append("]}");

			// �ύ����

			formObj.children("#xls_data_input3").val(dataSB.toString());

			formObj.get(0).submit();

			formObj.empty();
		} else {

			alert("Ŀǰû�����ݡ�");
		}
	}
}

function DefaultDataToDocBtnObject3(params) {

	var obj = this;

	// Ĭ�������ַ/doc_template.jsp
	obj.url = "doc_template.jsp";
	obj.title = "����Word"
	obj.alt = "������ǰҳ���ݵ�Word�ļ�";
	obj.iconCss = "doc";
	obj.font_color;
	obj.font_size;
	obj.font_family;

	if (arguments.length == 1 && typeof(params) == "object") {

		// ��������ַ��ģ���ļ���ַ��
		if (typeof(params.url) == "string" && $.trim(params.url) != "") {

			obj.url = params.url;
		}
		// ��ð�ť����
		if (typeof(params.title) == "string" && $.trim(params.title) != "") {

			obj.title = params.title;
		}
		// ��ð�ť��ʾ��Ϣ
		if (typeof(params.alt) == "string" && $.trim(params.alt) != "") {

			obj.alt = params.alt;
		}
		// ��ð�ťͼ����ʽ
		if (typeof(params.iconCss) == "string" && $.trim(params.iconCss) != "") {

			obj.iconCss = params.iconCss;
		}
		// ��ð�ť������ɫ
		if (typeof(params.font_color) == "string"
				&& $.trim(params.font_color) != "") {

			obj.font_color = params.font_color;
		}
		// ��ð�ť�����С
		if (typeof(params.font_size) == "number" && params.font_size >= 10
				&& params.font_size <= 15) {

			obj.font_size = params.font_size;
		}
		// ��ð�ť��������
		if (typeof(params.font_family) == "string"
				&& $.trim(params.font_family) != "") {

			obj.font_family = params.font_family;
		}
	}

	// ��DefaultDataToXlsBtnObjectת��ΪHTML ����
	obj.toHTML = function(i) {

		var tmpSB = new StringBuffer();

		tmpSB.append("<button id=\"");

		if (typeof(params.id) == "string" && $.trim(params.id) != "") {

			tmpSB.append($.trim(params.id))

			obj.id = $.trim(params.id);
		} else {

			obj.id = "hx_toolbar_event3_" + i;

			tmpSB.append("hx_toolbar_event3_").append(i);
		}

		tmpSB.append("\" type=\"button\" class=\"");

		if (obj.iconCss != "") {

			if (typeof(obj.title) == "string" && $.trim(obj.title) != "") {

				tmpSB.append("hx_table_toolbar_btn3 ");
			} else {

				tmpSB.append("hx_table_toolbar_btn3_3 ");
			}

			tmpSB.append(obj.iconCss).append("\" title=\"");
		} else {// �û�û�����ð�ťͼ����ʽ

			tmpSB.append("hx_table_toolbar_btn3_2\" title=\"");
		}

		tmpSB.append(obj.alt ? obj.alt : "").append("\">");

		// �ж��Ƿ����ð�ť����Ĵ�С����ɫ����Ϣ
		if ((typeof(obj.font_size) == "number" && (obj.font_size >= 10 && obj.font_size <= 15))
				|| (typeof(obj.font_color) == "string" && obj.font_color != "")
				|| (typeof(obj.font_family) == "string" && obj.font_family != "")) {

			tmpSB.append("<span style=\"");

			if (typeof(obj.font_size) == "number"
					&& (obj.font_size >= 10 && obj.font_size <= 15)) {

				tmpSB.append("font-size:").append(obj.font_size).append("px;");
			}

			if (typeof(obj.font_color) == "string" && obj.font_color != "") {

				tmpSB.append("color:").append(obj.font_color).append(";");
			}

			if (typeof(obj.font_family) == "string" && obj.font_family != "") {

				tmpSB.append("font-family:").append(obj.font_family)
						.append(";");
			}

			tmpSB.append("\">").append(obj.title ? obj.title : "")
					.append("</span>");
		} else {

			tmpSB.append(obj.title ? obj.title : "");
		}

		tmpSB.append("</button>");

		return tmpSB.toString();
	}

	// �¼�
	obj.handle = function(toolbarObject) {

		var formObj = $("#hx_t_form3");

		formObj
				.attr("action", obj.url)
				.append($("<input id=\"doc_data_input3\" type=\"hidden\" name=\"doc_datas\"/>"));

		var gridTotalRow = 0;

		if (toolbarObject.tObject.page == null) {// û�����÷�ҳ

			gridTotalRow = toolbarObject.tObject.cols.viewTotalRow;
		} else {

			gridTotalRow = toolbarObject.tObject.page.perPage;
		}

		// ���������Ƿ��������,����ǣ���װ����
		if (gridTotalRow > 0) {

			var dataSB = new StringBuffer();

			var dataRow = 0;

			/*
			 * ��װ��ʽ�� { data:[
			 * {col1:'��һ�е�һ��',col2:'��һ�еڶ���',col3:'��һ�е�����',col4:'��һ�е�����',col5:'������'},
			 * {col1:'��һ�е�һ��',col2:'��һ�еڶ���',col3:'��һ�е�����',col4:'��һ�е�����',col5:'������'} ],
			 * title:'����', col_names:[����,����,����,����,����] }
			 */

			// ��װ����
			dataSB.append("{data:[");

			for (var i = 1; i <= gridTotalRow; i++) {

				var tmpTrObj = $("#hx_grid_tr_id3_" + i);

				if (tmpTrObj.children("#hx_check_col3").children().val() == "y") {// ��������

					dataRow++;

					if (dataRow == 1) {

						dataSB.append("{");
					} else {

						dataSB.append(",{");
					}

					var col_num = 1;

					// ��ô���û������
					tmpTrObj.children("#hx_custom_col3").each(function(i) {

						if ($(this).get(0).style.display != "none") {

							if (col_num == 1) {

								dataSB.append("col1:'");
							} else {

								dataSB.append(",col").append(col_num)
										.append(":'");
							}

							var value = $.trim($(this).html());

							if (value == "" || value == "&nbsp;") {

								dataSB.append(" ");
							} else {

								dataSB.append(value);
							}

							dataSB.append("'");

							col_num++;
						}
					});

					dataSB.append("}");
				}
			}

			if (dataRow == 0) {

				alert("Ŀǰû�����ݡ�");

				return;
			}

			dataSB.append("],");

			// ��װ����
			dataSB.append("title:'").append(toolbarObject.tObject.reportTitle)
					.append("',");

			// ��װ����
			dataSB.append("col_names:[");

			// �û������ж���������Ϣ
			var colObjs = toolbarObject.tObject.cols.cols;
			var colObjsLength = colObjs.length;

			var viewColsNum = 0;

			for (var i = 0; i < colObjsLength; i++) {

				if (!colObjs[i].hide) {

					if (viewColsNum == 0) {

						dataSB.append("'").append(colObjs[i].name).append("'");
					} else {

						dataSB.append(",'").append(colObjs[i].name).append("'");
					}

					viewColsNum++;
				}
			}

			if (viewColsNum == 0) {

				alert("û�п���ʾ����޷�����Word�ļ���");

				return;
			}

			dataSB.append("]}");

			// �ύ����

			formObj.children("#doc_data_input3").val(dataSB.toString());

			formObj.get(0).submit();

			formObj.empty();
		} else {

			alert("Ŀǰû�����ݡ�");
		}
	}
}
// �������С����С�����
function ToolButtonBrObject3() {
}