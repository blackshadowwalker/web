


function TableObject() {
	// 显示Table的DIV id值
	this.tableDivID = "";
	// Table宽度，默认500
	this.tableWidth = 500;
	// Table高度，默认350
	this.tableHeight = 350;
	// 导出报表名称
	this.reportTitle = "XXXX-信息记录表";
	// 表格颜色
	this.tableBorderCss = "";
	// 是否同步列宽，默认不同步
	this.isSyncColWidth = false;
	// 淡入时间（毫秒）,默认直接显示
	this.fadeIn = 0;
	// 用户选择行对象
	this.selectRowObject = [];

	// 当前选择行数
	this.curSelectedRow = 0;

	// 初始化状态
	this.status = false;

	if (typeof(TableObject._initStatus) == "undefined")
	{

		TableObject.prototype.init = function(params)
		{

			var tmpHeight = 0;

			if (typeof params != "object")
			{

				alert("TableObject.init()方法参数无效。");

				return;
			}

			// 获得tableDivId值
			if (typeof(params.tableDivId) == "string" && params.tableDivId != "")
			{

				this.tableDivID = params.tableDivId;
			}
			else 
			{

				alert("TableObject.init()方法中tableDivId参数必填，否则无法初始化表格。");

				return;
			}

			// 获得isSyncColWidth值
			if (typeof(params.isSyncColWidth) == "boolean") {

				this.isSyncColWidth = params.isSyncColWidth;
			}

			// 获得tableBorderCss值
			if (typeof(params.tableBorderCss) == "string"
					&& params.tableBorderCss != "") {

				this.tableBorderCss = params.tableBorderCss;
			}

			// 获得reportTitle值
			if (typeof(params.reportTitle) == "string"
					&& params.reportTitle != "") {

				this.reportTitle = params.reportTitle;
			}

			// 获得fadeIn值
			if (typeof(params.fadeIn) == "number" && params.fadeIn > 0) {

				this.fadeIn = params.fadeIn;
			}

			// ColsObject对象必须的，否则无法显示数据
			if (!(typeof(params.cols) == "object" && (params.cols instanceof ColsObject))) {

				alert("TableObject.init()方法中cols参数必填，否则无法初始化表格。");

				return;
			}

			// 获得表格宽度，如无效使用默认值
			if ((typeof(params.tableWidth) == "number" && params.tableWidth > 0)
					|| (typeof(params.tableWidth) == "string" && $
							.trim(params.tableWidth) != "")) {

				this.tableWidth = params.tableWidth;
			}

			// 获得表格高度，如无效使用默认值
			if (typeof(params.tableHeight) == "number"
					&& params.tableHeight > 0) {

				this.tableHeight = params.tableHeight;
			}

			var tmpSB = new StringBuffer();

			tmpSB.append("<div id=\"hx_table_container\" unselectable=\"on\" onselectstart=\"return false;\" style=\"display:none;\">");

			// 设置标题栏模块
			if (typeof(params.header) == "object" && (params.header instanceof TableHeaderObject))
			{

				tmpSB.append(params.header.toHTML());

				this.header = params.header;

				// 将TableObject对象传给TableHeaderObject对象
				params.header.tObject = this;
			} 
			else
			{

				this.header = null;
			}

			tmpSB.append("<div id=\"hx_table_body\">");

			// 设置工具条模块
			if (typeof(params.toolbar) == "object" && (params.toolbar instanceof ToolBarObject)) 
			{

				tmpSB.append(params.toolbar.toHTML());

				this.toolbar = params.toolbar;

				// 将TableObject对象传给ToolBarObject对象
				params.toolbar.tObject = this;
			} 
			else
			{

				this.toolbar = null;
			}

			// 设置信息提示栏

			if (typeof(params.infoTip) == "object" && (params.infoTip instanceof InfoTipObject))
			{
				tmpSB.append(params.infoTip.toHTML());
				this.infoTip = params.infoTip;
				// 将TableObject对象传给InfoTipObject对象
				params.infoTip.tObject = this;
			}
			else 
			{
				this.infoTip = null;
			}

			// 设置网格模块
			if (typeof(params.page) == "object" && (params.page instanceof PageObject))
			{
				tmpSB.append(params.cols.toHTML(params.page.perPage));
				this.page = params.page;
				// 将TableObject对象传给PageObject对象
				params.page.tObject = this;
			}
			else
			{
				tmpSB.append(params.cols.toHTML(params.cols.viewTotalRow));
				this.page = null;
			}

			this.cols = params.cols;
			// 将TableObject对象传给ColsObject对象
			params.cols.tObject = this;

			// 设置分页模块
			if (this.page != null)
			{
				tmpSB.append(params.page.toHTML());
			}
			
			// 设置booterSpeedBar模块
			if (typeof(params.booterSpeedBar) == "object" && (params.booterSpeedBar instanceof BooterSpeedBar))
			{
				tmpSB.append(params.booterSpeedBar.toHTML(params.page.perPage));
				this.booterSpeedBar = params.booterSpeedBar;
				params.booterSpeedBar.tObject = this;
			}
			else
			{
				this.booterSpeedBar = null;
			}
			

			tmpSB.append("</div></div>");

			// 显示
			$("#" + this.tableDivID).html(tmpSB.toString());

			// 为工具栏增加事件
			if (this.toolbar != null)
			{
				this.toolbar.addEvent();
			}

			this.cols.reloadGridHeaderCss(this.tableWidth);

			this.cols.reloadGridClickHandle();

			// 初始化完毕,改变状态
			this.status = true;

			// 显示模式
			if (this.fadeIn == 0)
			{

				//$("#hx_table_container").css("display", "");
				$("#hx_table_container").css("display", "");
			} 
			else 
			{

				$("#hx_table_container").fadeIn(this.fadeIn);
			}

			var tmpHeight = this.tableHeight - $("#hx_table_grid_header").height();

			if (tmpHeight <= 0)
			{

				tmpHeight = 2;
			}

			$("#hx_table_grid_scroll").css("height", tmpHeight);

			$("#hx_table_container").css("width", this.tableWidth);
			$("#hx_table_data_container").css("width", this.tableWidth);

			if (this.tableBorderCss != "")
		    {

				$("#hx_table_container").css("border", this.tableBorderCss);
			}
		}

		// 取消已选行
		TableObject.prototype.cancelSelectedRow = function(params)
	    {

			if (this.status == false)
		    {

				alert("表格未正常初始化，无法调用cancelSelectedRow()方法。");

				return false;
			}

			if (typeof(params) == "number" && params > 0) {

				this.curSelectedRow = 0;

				for (var i = 0; i < this.selectRowObject.length; i++)
				{

					if (this.selectRowObject[i].line_num == row_num)
					{

						this.selectRowObject.splice(i, 1);

						var tmpTrObj = $("#" + this.selectRowObject[i].id);

						tmpTrObj.children("#hx_custom_col").each(function(num) {

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

					tmpTrObj.children("#hx_custom_col").each(function(num) {

								$(this).css("color", "#000000");
							});

					tmpTrObj.removeClass("selected");
				}

				this.selectRowObject.splice(0, this.selectRowObject.length);
			} else {

				return;
			}
		}
		// 设置工具条按钮显示状态（可使用或不可使用）
		TableObject.prototype.setToolbarBtnDisabled = function(btnId, disabled) {

			if (this.status == false) {

				alert("表格未正常初始化，无法调用setToolbarBtnDisabled()方法。");

				return false;
			}

			if (this.toolbar != null) {

				if (this.toolbar.btnArrs == null) {

					alert("工具条中没有功能按钮。");

					return;
				}

				for (var i = 0; i < this.toolbar.btnArrs.length; i++) {

					if (this.toolbar.btnArrs[i].id == btnId) {

						var btnO = $("#" + btnId);

						if (disabled == true) {// 按钮失效

							if (typeof(this.toolbar.btnArrs[i].iconCss) == "string"
									&& $.trim(this.toolbar.btnArrs[i].iconCss) != "") {

								btnO
										.removeClass(this.toolbar.btnArrs[i].iconCss)
										.addClass(this.toolbar.btnArrs[i].iconCss
												+ "_grey");
							}

							btnO.attr("title", "无权限操作");

							btnO.get(0).disabled = true;
						} else {// 按钮正常

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

		TableObject.prototype.hiddenTipInfo = function(hidden) {

			if (typeof(hidden) == "boolean" && hidden == true) {

				$("#hx_table_infobar_div").css("display", "none");
			} else {

				$("#hx_table_infobar_div").css("display", "");
			}
		}

		TableObject.prototype.hiddenToolBar = function(hidden) {

			if (typeof(hidden) == "boolean" && hidden == true) {

				$("#hx_table_toolbar").css("display", "none");
			} else {

				$("#hx_table_toolbar").css("display", "");
			}
		}

		TableObject.prototype.setTipInfo = function(info) {

			if (typeof(info) == "string" && info != "") {

				$("#hx_table_infobar").html(info);
			}
		}
		/*
		 * 更改列名
		 */
		TableObject.prototype.modColProperty = function(params) {

			if (this.status == false) {
				alert("表格未正常初始化，无法调用modColProperty()方法。");
				return false;
			}
			/*
			 * 参数格式： { col_num:int--列索引 col_name:string--列名
			 * col_hide:boolean--是否隐藏 }
			 */

			if (arguments.length == 1 && typeof(params) == "object") {
				var obj = this;
				if (typeof(params.col_num) == "number"
						&& params.col_num > 0
						&& params.col_num <= obj.cols.cols.length
						&& ((typeof(params.col_name) == "string" && params.col_name != "") || typeof(params.col_hide) == "boolean")) {

					$("#hx_table_grid_header_tr").children().each(function(i) {

						if (i == 0)
							return true;

						if (i == params.col_num) {

							if (typeof(params.col_name) == "string"
									&& params.col_name != "") {

								// <bean:message key="button.modify" bundle=""/>列名
								$(this).html(params.col_name);
								obj.cols.cols[params.col_num - 1].name = params.col_name;
							}

							/*
							 * if(typeof(params.col_hide)=="boolean"){
							 * 
							 * if(params.col_hide){//隐藏列
							 * 
							 * alert("隐藏");
							 * 
							 * $(this).css("display","none");
							 * 
							 * obj.cols.cols[params.col_num-1].hiden=true; }
							 * else{//显示列
							 * 
							 * alert("显示"); $(this).css("display","");
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
					 * if(params.col_hide){//隐藏该列
					 * 
					 * $(this).css("display","none"); } else{//显示该列
					 * 
					 * $(this).css("display",""); }
					 * 
					 * return false; } }); }); }
					 */
				}
			}
		}
		/*
		 * 设置数据
		 */
		TableObject.prototype.setData = function(params) {

			/*
			 * 参数格式： { curPage: totalPage: totalRow: data:array--二维数组
			 * cols_align--每列数据对齐方式 }
			 */
			if (this.status == false) {
				alert("表格未正常初始化，显示数据失败。");
				return false;
			}
			var paramObject = arguments[0];
			// 是否应用列对齐属性
			var isColAlign = false;
			if (paramObject.length = 1 && typeof(paramObject) == "object") {

				if (typeof(paramObject.curPage) != "number") {
					alert("setData方法中curPage参数无效，显示数据失败。");
					return false;
				}
				if (typeof(paramObject.totalPage) != "number") {
					alert("setData方法中totalPage参数无效，显示数据失败。");
					return false;
				}
				if (typeof(paramObject.totalRow) != "number") {
					alert("setData方法中totalRow参数无效，显示数据失败。");
					return false;
				}
				if (typeof(paramObject.cols_align) == "object"
						&& (paramObject.cols_align instanceof Array)) {
					isColAlign = true;
				}

				if (typeof(paramObject.data) == "object"
						&& (paramObject.data instanceof Array)) {

					var dataRowNum = paramObject.data.length;

					// 往表格中增加数据
					$("#hx_table_grid_scroll table tbody tr").each(function(i) {

						if (i + 1 > dataRowNum) {

							$(this).children("#hx_check_col").children()
									.val("n");
						} else {

							$(this).children("#hx_check_col").children()
									.val("y");
						}

						$(this).children("#hx_custom_col").each(function(j) {

							if (typeof(paramObject.data[i]) == "undefined"
									|| typeof(paramObject.data[i][j]) == "undefined") {

								$(this).html("&nbsp;");
							} else {

								if (isColAlign == true&& typeof(paramObject.cols_align[j]) == "string") {
									$(this).css("text-align",
											paramObject.cols_align[j]);
								}
								$(this).html(paramObject.data[i][j]);
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

					// 清空表格中所有数据
					$("#hx_table_grid_scroll table tbody tr").each(function(i) {

								$(this).children("#hx_check_col").children()
										.val("n");

								$(this).children("#hx_custom_col").each(
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

					alert("setData方法中data参数无效，显示数据失败。");

					return false;
				}
			} else {

				alert("setData方法参数无效，显示数据失败。");

				return false;
			}
		}
		
		TableObject.prototype.InsertRow = function(params){
			
			var finded = false;
			$("#hx_table_grid_scroll table tbody tr").each(function(i) {

				if($(this).children("#hx_check_col").children().val()!="y" && !finded)
				{
					finded = true;
					$(this).children("#hx_custom_col").each(function(j) {
						if(params.data[j]==null){
							$(this).html("&nbsp;");
						}else if(params.data[j]!="no")
							$(this).html(params.data[j]);
						});
					$(this).children("#hx_check_col").children().val("y");
				}
			});
		}
		
		
		// 获得curpage有效的数据行数
		TableObject.prototype.ValidLines = function() {
			var sumLine = 0;
			$("#hx_table_grid_scroll table tbody tr").each(function(i) {
				if($(this).children("#hx_check_col").children().val()=="y")
				{
					sumLine += 1;
				}
				
			});
			return sumLine;
		}
		
		TableObject.prototype.MaxLineNum = function(){
			var maxNum = -1;
			$("#hx_table_grid_scroll table tbody tr").each(function(i) {

				if($(this).children("#hx_check_col").children().val()=="y")
				{
					maxNum = $(this).children("#hx_grid_num").html();
				}
			});
			return maxNum;
		}
		/*
		 * delete行值
		 */
		TableObject.prototype.delRowValue = function(row_num)
		{

			if (typeof(row_num) != "number") {
				alert("delRowValue方法中row_num参数类型不符。");
				return;
			}
			$("#hx_grid_tr_id" + row_num).removeClass("selected")
					.children("#hx_custom_col").each(function(i) {
								$(this).html("&nbsp;").css("color", "#000000");
							});
			$("#hx_grid_tr_id" + row_num).children("#hx_check_col").children().val("d");

			for (var i = 0; i < this.selectRowObject.length; i++)
			{
				if (this.selectRowObject[i].line_num == row_num)
				{
					this.selectRowObject.splice(i, 1);
					break;
				}
			}
		//	$("#hx_grid_tr_id" + row_num).remove();
		}
		/*
		 * 设定行值
		 */
		TableObject.prototype.setRowValue = function(params)
		{

			/*
			 * 参数格式： { row_num:int--行数 data:array--数据 }
			 */
			if (arguments.length == 1 && typeof(params) == "object") {

				if (typeof(params.row_num) != "number") {
					alert("setRowValue方法中row_num参数类型不符。");
					return;
				}

				if (typeof(params.data) != "object"
						&& !(params.data instanceof Array)) {
					alert("setRowValue方法中data参数类型不符。");
					return;
				}

				// 赋值
				$("#hx_grid_tr_id" + params.row_num).children("#hx_custom_col")
						.each(function(i) {

									if (typeof(params.data[i]) != "string")
										return true;

									if (params.data[i] == "") {

										$(this).html("&nbsp;");
									} else if ($.trim(params.data[i]) != "no") {
										$(this).html(params.data[i]);
									}
								});
			} else {

				alert("setRowValue方法参数格式不符。");

				return;
			}
		}

		/*
		 * 设定列值
		 */
		TableObject.prototype.setColValue = function(params)
		{

			/*
			 * 参数格式： { row_num:int--行数 col_num:int--列数 data:string--数据 }
			 */
			if (arguments.length == 1 && typeof(params) == "object") {

				if (typeof(params.row_num) != "number") {

					alert("setColValue方法中row_num参数类型不符。");

					return;
				}

				if (typeof(params.col_num) != "number") {

					alert("setColValue方法中col_num参数类型不符。");

					return;
				}

				if (typeof(params.data) != "string") {

					alert("setColValue方法中data参数类型不符。");

					return;
				}

				// 赋值
				$("#hx_grid_tr_id" + params.row_num).children("#hx_custom_col")
						.each(function(i) {

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

				alert("setColValue方法参数格式不符。");

				return;
			}
		}

		/*
		 * 设置行Css属性
		 */
		TableObject.prototype.setRowCss = function(row_num, cssName) {

			if (arguments.length != 2 && typeof(row_num) != "number"
					&& typeof(cssName) != "string") {

				alert("请为setRowCss方法设置有效参数。");

				return;
			} else if ((this.page != null && row_num > this.page.perPage)
					|| row_num > this.cols.viewTotalRow) {

				alert("设置的row_num参数超出表格范围。");

				return;
			}

			if (cssName == "")
				return;

			$("#hx_grid_tr_id" + row_num).addClass(cssName);
		}

		/*
		 * 获得每页显示行数
		 */
		TableObject.prototype.getPerPage = function() {

			if (this.status == false) {

				alert("表格未正常初始化，无法获得每页显示行数。");

				return 0;
			}

			if (this.page == null) {

				alert("控件未使用分页功能，无法获得每页显示行数信息。");

				return 0;
			} else {

				return this.page.perPage;
			}
		}

		
		/*
		 * 获得总行数
		 */
		TableObject.prototype.getTotalRow = function() {

			if (this.status == false) {
				alert("表格未正常初始化，无法获得总行数。");
				return 0;
			}
			if (this.page == null) {
				alert("控件未使用分页功能，无法获得总行数信息。");
				return 0;
			} else {
				return this.page.totalRow;
			}
		}

		/*
		 * 获得总页数
		 */
		TableObject.prototype.getTotalPage = function() {

			if (this.status == false) {

				alert("表格未正常初始化，无法获得总页数。");

				return 0;
			}

			if (this.page == null) {

				alert("控件未使用分页功能，无法获得总页数信息。");

				return 0;
			} else {

				return this.page.totalPage;
			}
		}

		/*
		 * 获得当前页数
		 */
		TableObject.prototype.getCurPage = function() {

			if (this.status == false) {

				alert("表格未正常初始化，无法获得当前页数。");

				return 0;
			}

			if (this.page == null) {

				alert("控件未使用分页功能，无法获得当前页数信息。");

				return 0;
			} else {

				return this.page.curPage;
			}
		}
		/*
		 * 获得已选择行的行号 返回值：number || array(多行) || 0
		 */
		TableObject.prototype.getSelectRowNum = function() {

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
		 * 获得行值(所有列值) 返回类型：Object
		 */
		TableObject.prototype.getRowValue = function(rowNUM) {

			if (this.status == false) {

				return null;
			}

			var tmpSB = new StringBuffer();

			tmpSB.append("{");

			var colNum = 0;

			var colO = $("#hx_grid_tr_id" + rowNUM + " td");

			var lastColNum = colO.size();

			var tmpObject = this;

			colO.each(function(i) {

				// 不取‘行号’列与最后列值
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

								if (!isNaN(colVal)) {// 是数字

									tmpSB.append(window
											.eval("(" + colVal + ")"));
								} else {// 不是数字

									tmpSB.append("\"").append(colVal)
											.append("\"");
								}
							}

							break;
						}
						case "boolean" : {

							// 如果内容空，以字符串形式封装
							if (colVal == "" || colVal == "&nbsp;") {

								tmpSB.append("\" \"");
							} else {
								// 判断是否符合boolean值取值范围,如果不符合以字符串形式封装
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
		//	alert(tmpSB.toString());
			if (colNum > 0) {
				return window.eval("(" + tmpSB.toString() + ")");//return json obj
			} else {
				return null;
			}
		}

		/*
		 * 获得第几行第几列值 返回类型：string || number || boolean || null
		 */
		TableObject.prototype.getRowColValue = function(rowNUM, colNUM) {

			if (this.status == false) {

				return null;
			}

			var value;

			var colO = $("#hx_grid_tr_id" + rowNUM + " td");

			var lastColNum = colO.size();

			var tmpObject = this;

			colO.each(function(i) {

						// 不取‘行号’列与最后列值
						if ((i == 0 && tmpObject.cols.viewLineNum)
								|| (i + 1 == lastColNum)) {

							return true;
						} else {

							if (tmpObject.cols.viewLineNum) {

								if (colNUM == i) {

									value = getValue(tmpObject, colNUM - 1,
											this);
								}
							} else {

								if (i + 1 == colNUM) {

									value = getValue(tmpObject, colNUM - 1,
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

		TableObject._initStatus = true;
	}
}

function getValue(table_object, col, colJQueryObject) {

	var value;

	var colVal = $.trim($(colJQueryObject).html());

	switch (table_object.cols.cols[col].dataType) {

		case "number" : {

			if (colVal == "" || colVal == "&nbsp;") {

				value = " ";
			} else {

				if (!isNaN(colVal)) {// 是数字

					value = window.eval("(" + colVal + ")");
				} else {// 不是数字

					value = colVal;
				}
			}

			break;
		}
		case "boolean" : {

			// 如果内容空，以字符串形式封装
			if (colVal == "" || colVal == "&nbsp;") {

				value = " ";
			} else {
				// 判断是否符合boolean值取值范围,如果不符合以字符串形式封装
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

// 工具条对象
function ToolBarObject() {
	/*
	 * { --一般按钮对象 id:'detail_id',按钮ID号 alt:'detail', title:'detail', iconCss:'detail',
	 * font_size:0, font_family:'', font_color:'', select_trigger_mode:true,
	 * handle:function(){
	 * 
	 * alert("触发detail事件"); } }, new ToolSeparatorObject(),//分割条对象 { alt:'delete',
	 * title:'delete', iconCss:'delete', font_size:0, font_family:'', font_color:'',
	 * select_trigger_mode:true, handle:function(){
	 * 
	 * alert("触发delete事件"); } }, new ToolButtonBrObject()//换行对象
	 */

	var paramNum = arguments.length;

	var obj = this;

	if (paramNum > 0) {

		// 获得有效参数
		var paramArrs = new Array();

		for (var i = 0; i < paramNum; i++)
		{

			if ((arguments[i] instanceof ToolSeparatorObject)
					|| (arguments[i] instanceof ToolButtonBrObject)
					|| (arguments[i] instanceof DefaultDataToXlsBtnObject)) {// 工具分隔符、回车符以及导出Excel按钮

				paramArrs[i] = arguments[i];
				
			} 
			else if (typeof(arguments[i]) == "object") 
			{

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

		// 返回组装后的Table ToolBar HTML内容
		obj.toHTML = function()
		{

			// 用户没有设置有效参数
			if (paramArrs.length == 0)
			{

				return "<div id=\"hx_table_toolbar\" title=\"工具条\"></div>";
			}

			var tmpSB = new StringBuffer();

			tmpSB.append("<div id=\"hx_table_toolbar\" title=\"工具条\"><table cellpadding=\"0\" cellspacing=\"0\" style=\"width:auto;height:100%;\"><tr>");

			for (var i = 0; i < paramArrs.length; i++) {

				if (paramArrs[i] instanceof ToolSeparatorObject) {// 分隔符

					tmpSB.append("<td>").append(paramArrs[i].toHTML())
							.append("</td>");
				} else if (paramArrs[i] instanceof ToolButtonBrObject) {// 换行

					tmpSB.append("</tr><tr>");
				} else if (paramArrs[i] instanceof DefaultDataToXlsBtnObject) {// 导出Excel按钮

					tmpSB.append("<td>").append(paramArrs[i].toHTML(i))
							.append("</td>");
				} else {// 按钮

					tmpSB.append("<td><button id=\"");

					if (typeof(paramArrs[i].id) == "string"
							&& $.trim(paramArrs[i].id) != "") {

						tmpSB.append($.trim(paramArrs[i].id))
					} else {

						paramArrs[i].id = "hx_toolbar_event" + i;

						tmpSB.append("hx_toolbar_event").append(i);
					}

					tmpSB.append("\" type=\"button\" class=\"");

					if (paramArrs[i].iconCss != "") {

						if (typeof(paramArrs[i].title) == "string"
								&& paramArrs[i].title != "") {

							tmpSB.append("hx_table_toolbar_btn ");
						} else {

							tmpSB.append("hx_table_toolbar_btn3 ");
						}

						tmpSB.append(paramArrs[i].iconCss)
								.append("\" title=\"");
					} else {// 用户没有设置按钮图标样式

						tmpSB.append("hx_table_toolbar_btn2\" title=\"");
					}

					tmpSB.append(paramArrs[i].alt ? paramArrs[i].alt : "")
							.append("\">");

					// 判断是否设置按钮字体的大小、颜色等信息
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

		// 为按钮设置用户事件(注：表格控件初始化完毕后调用一次即可)
		obj.addEvent = function()
		{

			if (paramArrs.length == 0)
			{
				obj.addEvent = function() {
				};
			}
			else
			{
				for (var i = 0; i < paramArrs.length; i++)
				{

					if (!(paramArrs[i] instanceof ToolSeparatorObject)
							&& !(paramArrs[i] instanceof ToolButtonBrObject))
					{

						if (typeof(paramArrs[i]) == "object"
								&& typeof(paramArrs[i].handle) == "function") {// 用户自定义事件

							// 设置唯一标识符
							// paramArrs[i].toolbar_event_id="hx_toolbar_event"+i;

							$("#" + paramArrs[i].id).click(function() {

								var tmpEventId = $(this).attr("id");

								for (var x = 0; x < paramArrs.length; x++) {

									if (tmpEventId == paramArrs[x].id) {

										if (typeof(paramArrs[x].select_trigger_mode) == "string"
												&& (paramArrs[x].select_trigger_mode == "single" || paramArrs[x].select_trigger_mode == "multi")) {// 选择数据后触发事件

											if (typeof(this) == "object"
													&& obj.tObject.selectRowObject.length > 0) {

												var tmpDataRowNum = 0;

												for (var rowid_i = 0; rowid_i < obj.tObject.selectRowObject.length; rowid_i++) {

													if (obj.tObject.selectRowObject[rowid_i].isDataRow == true) {

														tmpDataRowNum++;
													} else {

														alert("请选择数据且不能包含非数据行。");

														return;
													}
												}

												if (tmpDataRowNum > 1
														&& paramArrs[x].select_trigger_mode == "single") {

													alert("请选择一条数据并操作。");

													return;
												}

												paramArrs[x].handle($(this)
														.get(0));
											} else {

												alert("请选择数据。");
											}
										} else {// 不用选择数据就触发事件

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

		// 返回组装后的Table ToolBar HTML内容
		obj.toHTML = function() {

			return "<div id=\"hx_table_toolbar\" title=\"工具条\"></div>";
		}

		// 为按钮设置用户事件(注：表格控件初始化完毕后调用一次即可)
		obj.addEvent = function() {
		}

		obj.btnArrs = null;
	}
}

// 表格标题对象
function TableHeaderObject()
{
	/*
	 * {title:'测试表格标题信息', font_size:, font_color, font_family}
	 */
	var obj = this;
	if (arguments.length > 0 && typeof(arguments[0]) == "object")
	{
		var tmp = arguments[0];

		if(tmp.rightbutton!=null ){
			obj.rightbutton = tmp.rightbutton;
		}
		// 设置标题名称,默认‘数据展示’
		if (typeof(tmp.title) == "string" && tmp.title != ""){
			obj.title = tmp.title;
		} 
		else 		{
			obj.title = "无标题";
		}

		// 设置标题字体大小（有效范围 6<=font-size<=16）
		if (typeof(tmp.font_size) == "number" && (tmp.font_size >= 6 && tmp.font_size <= 16)){
			obj.font_size = tmp.font_size;
		}
		else{
			obj.font_size = 0;
		}

		// 设置标题字体颜色
		if (typeof(tmp.font_color) == "string" && tmp.font_color != "")		{
			obj.font_color = tmp.font_color;
		}
		else
		{
			obj.font_color = "";
		}
		// 设置标题字体
		if (typeof(tmp.font_family) == "string" && tmp.font_family != "")		{
			obj.font_family = tmp.font_family;
		}
		else 	{
			obj.font_family = "";
		}
	} 
	else
	{
		obj.title = "数据展示";
		obj.font_size = 0;
		obj.font_color = "";
		obj.font_family = "";
	}

	// 返回组装后的Table Header HTML内容
	obj.toHTML = function()
	{

		var tmpSB = new StringBuffer();

		tmpSB.append("<div id=\"hx_table_header\">");
		tmpSB.append("<table style='height:30px;'  style='border:0px #f00 solid;'><tr>");
		tmpSB.append("<td ><span id=\"hx_table_header_text\">");
		if (obj.font_size > 0 || obj.font_color != "" || obj.font_family != "")
		{
			tmpSB.append("<span style=\"");
			if (obj.font_size > 0)
			{
				tmpSB.append("font-size:").append(obj.font_size).append("px;");
			}
			if (obj.font_color != "")
			{
				tmpSB.append("color:").append(obj.font_color).append(";");
			}
			if (obj.font_family != "")
			{
				tmpSB.append("font_family:").append(obj.font_family)
					 .append(";");
			}
			tmpSB.append("\">").append(obj.title).append("</span>");
		} 
		else 
		{

			tmpSB.append(obj.title);
		}
		tmpSB.append("</span>");
		tmpSB.append("</td>");
		
		tmpSB.append("<td style='width:100%;'  valign='middle' align=right > ");
			tmpSB.append("<span style='width:100%; margin-right:5px' >");
			tmpSB.append(obj.rightbutton);
			tmpSB.append("</span>");
		tmpSB.append("</td>");
		tmpSB.append("</tr></table>");
		
		tmpSB.append("</div>");

		return tmpSB.toString();
	}
}
// 分页对象
function PageObject()
{
	var obj = this;
	var isFirst = true;
	if (arguments.length > 0 && typeof(arguments[0]) == "object")
	{
		var tmp = arguments[0];
		if (typeof(tmp.sep) == "object" && (tmp.sep instanceof PageSeparatorObject))
		{
			obj.sep = tmp.sep;
		}
		// 设置每页行数
		if (typeof(tmp.perPage) == "number" && tmp.perPage > 1)
		{
			obj.perPage = tmp.perPage;
		} 
		else
		{

			obj.perPage = 15;
		}

		// 设置是否显示‘跳转’控件（跳转文本框）
		if (typeof(tmp.viewJumpWidget) == "boolean") {
			obj.viewJumpWidget = tmp.viewJumpWidget;
		} else {
			obj.viewJumpWidget = false;
		}
		// 设置是否显示'页信息'控件
		if (typeof(tmp.viewPageInfoWidget) == "boolean") {
			obj.viewPageInfoWidget = tmp.viewPageInfoWidget;
		} else {
			obj.viewPageInfoWidget = false;
		}
		// 设置分页按钮触发事件
		if (typeof(tmp.handle) == "function") {
			obj.handle = tmp.handle;
		}
	} else {
		obj.perPage = 15;
		obj.viewJumpWidget = false;
		obj.viewPageInfoWidget = false;
	}

	// 设置当前页数
	obj.curPage = 0;
	// 设置总页数
	obj.totalPage = 0;
	// 设置总行数
	obj.totalRow = 0;
	obj.display = "none";

	// 返回组装后的Page HTML内容
	obj.toHTML = function() {

		var tmpSB = new StringBuffer();

		tmpSB.append("<div id=\"hx_table_page\" style='display:"+obj.display+";'>");
		tmpSB.append("<table cellpadding=\"0\" cellspacing=\"0\">");
		tmpSB.append("<tbody>");
		tmpSB.append("<tr>");
		tmpSB.append("<td><button type=\"button\" id=\"hx_table_firstpage_btn\" disabled class=\"hx_table_page_tn disabled_first_btn\" title=\"第一页\"></button></td>");

		if (typeof(obj.sep) == "object") {
			tmpSB.append("<td>").append(obj.sep.toHTML()).append("</td>");
		}
		tmpSB.append("<td><button type=\"button\" id=\"hx_table_privpage_btn\" disabled class=\"hx_table_page_tn disabled_priv_btn\" title=\"上一页\"></button></td>");

		if (typeof(obj.sep) == "object") {
			tmpSB.append("<td>").append(obj.sep.toHTML()).append("</td>");
		}
		tmpSB.append("<td><button type=\"button\" id=\"hx_table_nextpage_btn\" disabled class=\"hx_table_page_tn disabled_next_btn\" title=\"下一页\"></button></td>");

		if (typeof(obj.sep) == "object") {
			tmpSB.append("<td>").append(obj.sep.toHTML()).append("</td>");
		}
		tmpSB.append("<td><button type=\"button\" id=\"hx_table_lastpage_btn\" disabled class=\"hx_table_page_tn disabled_last_btn\" title=\"最后页\"></button></td>");

		if (obj.viewJumpWidget) {

			if (typeof(obj.sep) == "object") {

				tmpSB.append("<td>").append(obj.sep.toHTML()).append("</td>");
			}
			tmpSB.append("<td><span class=\"jumpPage\">&nbsp;&nbsp;转到第<input type=\"text\" id=\"hx_table_page_text\" disabled/>页</span></td>");
		}

		if (obj.viewPageInfoWidget) {

			tmpSB.append("<td width=\"100%\" align=\"right\"><span id=\"hx_table_page_info\">共")
					.append(obj.totalRow).append("条记录，当前第").append(obj.curPage)
					.append("页 / 共").append(obj.totalPage)
					.append("页</span></td>");
		}

		tmpSB.append("</tr></tbody>").append("</table></div>");

		return tmpSB.toString();
	}

	// 重设置分页面板内容及事件
	obj.reloadPage = function() {

		// alert("reloadPage");

		// alert("curPage=="+obj.curPage+"\ttotalPage=="+obj.totalPage);

		if (obj.curPage <= 1) {

			// 禁用'首页'按钮
			$("#hx_table_firstpage_btn").removeClass("first_btn")
					.addClass("disabled_first_btn").get(0).disabled = true;
			// 禁用'上一页'按钮
			$("#hx_table_privpage_btn").removeClass("priv_btn")
					.addClass("disabled_priv_btn").get(0).disabled = true;
		} else if (obj.curPage == obj.totalPage) {

			// 启用'首页'按钮
			$("#hx_table_firstpage_btn").removeClass("disabled_first_btn")
					.addClass("first_btn").get(0).disabled = false;
			// 启用'上一页'按钮
			$("#hx_table_privpage_btn").removeClass("disabled_priv_btn")
					.addClass("priv_btn").get(0).disabled = false;
			/*
			 * //禁用'下一页'按钮
			 * $("#hx_table_nextpage_btn").removeClass("next_btn").addClass("disabled_next_btn").get(0).disabled=true;
			 * //禁用'最后页'按钮
			 * $("#hx_table_lastpage_btn").removeClass("last_btn").addClass("disabled_last_btn").get(0).disabled=true;
			 */
		} else {

			// 启用'首页'按钮
			$("#hx_table_firstpage_btn").removeClass("disabled_first_btn")
					.addClass("first_btn").get(0).disabled = false;
			// 启用'上一页'按钮
			$("#hx_table_privpage_btn").removeClass("disabled_priv_btn")
					.addClass("priv_btn").get(0).disabled = false;
			/*
			 * //启用'下一页'按钮
			 * $("#hx_table_nextpage_btn").removeClass("disabled_next_btn").addClass("next_btn").get(0).disabled=false;
			 * //启用'最后页'按钮
			 * $("#hx_table_lastpage_btn").removeClass("disabled_last_btn").addClass("last_btn").get(0).disabled=false;
			 */
		}

		if (obj.totalPage <= 1 || obj.totalPage == obj.curPage) {

			// 禁用'下一页'按钮
			$("#hx_table_nextpage_btn").removeClass("next_btn")
					.addClass("disabled_next_btn").get(0).disabled = true;
			// 禁用'最后页'按钮
			$("#hx_table_lastpage_btn").removeClass("last_btn")
					.addClass("disabled_last_btn").get(0).disabled = true;
		} else {

			// 启用'下一页'按钮
			$("#hx_table_nextpage_btn").removeClass("disabled_next_btn")
					.addClass("next_btn").get(0).disabled = false;
			// 启用'最后页'按钮
			$("#hx_table_lastpage_btn").removeClass("disabled_last_btn")
					.addClass("last_btn").get(0).disabled = false;
		}

		if (obj.totalPage > 1 && obj.viewJumpWidget) {

			// 启用'跳转'文本框
			$("#hx_table_page_text").get(0).disabled = false;
		} else if (obj.totalPage <= 1 && obj.viewJumpWidget) {

			// 禁用'跳转'文本框
			$("#hx_table_page_text").get(0).disabled = true;
		}

		if (obj.viewPageInfoWidget) {

			$("#hx_table_page_info").text("共" + obj.totalRow + "条记录，当前第"
					+ obj.curPage + "页 / 共" + obj.totalPage + "页");
		}

		if (typeof(obj.handle) == "function" && isFirst == true) {

			// '首页'按钮事件
			$("#hx_table_firstpage_btn").click(function() {

						// obj.curPage=1;
						obj.handle(1);
					});

			// '上一页'按钮事件
			$("#hx_table_privpage_btn").click(function() {

						// obj.curPage-=1;
						obj.handle(obj.curPage - 1);
					});

			// '下一页'按钮事件
			$("#hx_table_nextpage_btn").click(function() {

						// obj.curPage+=1
						obj.handle(obj.curPage + 1);
					});

			// '最后页'按钮事件
			$("#hx_table_lastpage_btn").click(function() {

						// obj.curPage=obj.totalPage;
						obj.handle(obj.totalPage);
					});

			if (obj.viewJumpWidget) {

				// 跳转文本框'回车'事件
				$("#hx_table_page_text").keydown(function() {

							if (event.keyCode == 13) {

								if (isNum($(this).val())) {

									var num = window.eval("(" + $(this).val()
											+ ")");

									if (num < 0 || num > obj.totalPage) {

										alert("请输入合法页数(0 - " + obj.totalPage
												+ ")。")
									} else if (num != obj.curPage) {

										// obj.curPage=num;
										obj.handle(num);
									}
								} else {

									alert("请输入合法数字。");
								}
							}
						});
			}

			isFirst = false;
		}
	}
}

// 表格面板对象（包括列标题与数据）
function ColsObject()
{
	if (arguments.length > 0 && typeof(arguments[0]) == "object")
	{
		var obj = this;
		if (typeof(arguments[0].viewLineNum) == "boolean")
		{
			obj.viewLineNum = arguments[0].viewLineNum;
		}
		else 
		{
			obj.viewLineNum = false;
		}
		if(typeof(arguments[0].callbackDblClick) == "function") {// 用户自定义事件
			obj.callbackDblClick = arguments[0].callbackDblClick;
		}
		if (typeof(arguments[0].viewTotalRow) == "number")
		{
			obj.viewTotalRow = arguments[0].viewTotalRow;
		} 
		else 
		{
			// 默认显示300行数据(此属性主要用于没有分页模式下，页面应该显示多少行数据)
			obj.viewTotalRow = 300;
		}
		var tmpColArr = arguments[0].cols;
		if (typeof(tmpColArr) != "object" && !(tmpColArr instanceof Array))
		{
			alert("ColsObject对象参数格式不对，无法初始化。");
			return new Object;
		}
		// 网格宽度
		obj.gridWidth = 0;
		for (var i = 0; i < tmpColArr.length; i++)
		{
			if (typeof(tmpColArr[i]) != "object")
			{
				alert("ColsObject对象参数格式不对，无法初始化。");
				return new Object;
			}
			// 没有定义列别名或没有合法定义列别名，返回
			if (typeof(tmpColArr[i].alias) != "string" || $.trim(tmpColArr[i].alias) == "")
			{
				alert("ColsObject对象参数中alias没有定义或不合法。");
				return new Object;
			}

			// 没有定义列名或没有合法定义列名，使用默认值
			if (typeof(tmpColArr[i].name) != "string")
			{

				tmpColArr[i].name = "列 " + (i + 1);
			}

			// 没有定义列是否隐藏，默认显示
			if (typeof(tmpColArr[i].hide) != "boolean")
			{

				tmpColArr[i].hide = false;
			}

			// 没有定义或没有合法定义列宽，使用默认值
			if (typeof(tmpColArr[i].width) != "number")
			{

				tmpColArr[i].width = 100;
			}

			if (!tmpColArr[i].hide)
			{

				obj.gridWidth += tmpColArr[i].width;
			}

			if (typeof(tmpColArr[i].dataType) != "string")
			{

				tmpColArr[i].dataType = "string";
			}
		}

		// 用户没有定义要显示的列项,不能初始化并返回
		if (obj.gridWidth == 0)
		{

			alert("请定义要显示的列项");

			return new Object;
		}

		if (obj.viewLineNum) {// 行号默认宽度15

			obj.gridWidth += 15;
		}

		obj.cols = tmpColArr;

		// 默认行号
		obj.lineNum = 0;

		// 返回组装后的Grid Container HTML内容
		obj.toHTML = function(viewRowNum)// 显示总行数
		{

			var tmpSB = new StringBuffer();

			tmpSB.append("<div id=\"hx_table_data_container\">");
			tmpSB.append("<div id=\"hx_table_grid_header\">");
			tmpSB.append("<table cellpadding=\"0\" cellspacing=\"0\" style=\"width:")
				 .append(obj.gridWidth).append("px;height:100%;\">");
			tmpSB.append("<tr id=\"hx_table_grid_header_tr\">");

			if (obj.viewLineNum)
			{

				tmpSB.append("<td id=\"header_line_num\">&nbsp;</td>");
			}

			for (var i = 0; i < obj.cols.length; i++)
			{

				if (obj.cols[i].hide)// 列隐藏
				{

					tmpSB.append("<td width=\"").append(obj.cols[i].width)
						 .append("\" style=\"display:none\">")
						 .append(obj.cols[i].name).append("</td>");
				} 
				else
				{

					tmpSB.append("<td width=\"").append(obj.cols[i].width)
						 .append("\">").append(obj.cols[i].name)
						 .append("</td>");
				}
			}

			tmpSB.append("</tr></table></div>");

			tmpSB.append("<div id=\"hx_table_grid_scroll\"><div id=\"hx_scroll_div\" style=\"margin-bottom:0px;\">");
			tmpSB.append("<table cellpadding=\"0\" cellspacing=\"0\" style=\"width:")
				 .append(obj.gridWidth).append("px;\">");
			tmpSB.append("<tbody>");

			for (var i = 1; i <= viewRowNum; i++)
			{

				tmpSB.append("<tr id=\"hx_grid_tr_id").append(i)
					 .append("\" line_num=\"" + i + "\">");

				// 是否显示行号
				if (obj.viewLineNum)
				{

					tmpSB.append("<td id=\"hx_grid_num\">").append(i)
						 .append("</td>");
				}

				// 配置列项
				for (var ii = 0; ii < obj.cols.length; ii++)
				{

					if (obj.cols[ii].hide) // 列隐藏
					{

						tmpSB.append("<td id=\"hx_custom_col\" width=\"")
							 .append(obj.cols[ii].width)
							 .append("\" style=\"display:none\">&nbsp;</td>");
					}
					else  //列不隐藏
					{

						tmpSB.append("<td id=\"hx_custom_col\" width=\"")
							 .append(obj.cols[ii].width)
							 .append("\">&nbsp;</td>");
					}
				}

				// 增加隐藏列，用于判断是否数据行
				tmpSB.append("<td  id=\"hx_check_col\" style=\"display:none\"><input type=\"hidden\" value=\"n\"/></td>");

				tmpSB.append("</tr>");
				
			}

			// 重置新行号
			obj.lineNum = viewRowNum + 1;

			tmpSB.append("</tbody></table><form id=\"hx_t_form\" method=\"POST\" target=\"_hx_iframe\"></form>");
			tmpSB.append("<iframe id=\"_hx_iframe\" name=\"_hx_iframe\" style=\"display:none;\"></iframe></div></div></div>");

			return tmpSB.toString();
		}

		/*
		 * 同步列宽(防止数据长度大于列宽，并不自动换行)
		 */
		obj.syncColWidth = function() {
			/*
			 * $("#hx_table_grid_header table tr").children().each(function(i){
			 * 
			 * alert("header列"+(i+1)+" width = "+$(this).width()); });
			 * $("#hx_grid_tr_id1").children().each(function(i){
			 * 
			 * alert("列"+(i+1)+" width = "+$(this).width()); });
			 */
		}

		// 重设网格头样式(注：表格控件初始化完毕后调用一次即可)
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
		// 加载网格‘单击’事件(注，表格控件初始化完毕后调用一次即可)
		
		
		obj.reloadGridClickHandle = function()
		{
			//dblclick
			$("#hx_table_grid_scroll table tbody tr").dblclick(function(){
				//	alert("dbclick");
					if(obj.callbackDblClick=="")
						return ;
					var text = "hx_table_grid_scroll"; 
					var trObj = $(this);
					if (trObj.children("#hx_check_col").children().val() == "d")//获取当前hx_check_col及其匹配元素的当前值
					{
						return;
					}
					// 检查此行是否已选择
					var line_num = trObj.attr("line_num");
				//	alert(obj.callbackDblClick);
					obj.callbackDblClick(line_num);//callback function
				/*	obj.callbackDblClick += "('"+line_num+"')";
					var cfun= new Function(callbackDblClick); 
					cfun();
					*/
			});

			$("#hx_table_grid_scroll table tbody tr").hover(function() 
				{
					$(this).addClass("highlight");
						
				},
				function()
				{
						$(this).removeClass("highlight");
				}).click(

			    function() 
			    {

				// 不支持ctrl+shift组合键
				// 目前仅支持ctrl+左键单击或shift+左键单击

				if (event.shiftKey == true && event.ctrlKey == true)
					return;

				/*
				 * if(event.shiftKey==true){//shift组合键连选
				 * 
				 * if(obj.tObject.curSelectedRow==0){//左键单选处理
				 * 
				 * var trObj=$(this);
				 * 
				 * if(trObj.children("#hx_check_col").children().val()=="d"){
				 * 
				 * return; }
				 * 
				 * //检查此行是否已选择 var line_num=trObj.attr("line_num");
				 * 
				 * var isSelected=false;
				 * 
				 * //获得当前行状态 for(var i=0;i<obj.tObject.selectRowObject.length;i++){
				 * 
				 * if(obj.tObject.selectRowObject[i].line_num==line_num){
				 * 
				 * isSelected=true; } }
				 * 
				 * 
				 * var trId=trObj.attr("id");
				 * 
				 * //用户选择行是否是数据行 var isDataRow=false;
				 * 
				 * if(trObj.children("#hx_check_col").children().val()=="y"){
				 * 
				 * isDataRow=true; }
				 * 
				 * 
				 * //记录当前选择行数 obj.tObject.curSelectedRow=parseInt(line_num);
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
				 * //<bean:message key="button.delete" bundle=""/>用户所有已选行信息
				 * obj.tObject.selectRowObject.splice(0,obj.tObject.selectRowObject.length);
				 * 
				 * //保存用户当前选择的行信息
				 * obj.tObject.selectRowObject[0]=window.eval("("+("{id:'"+trId+"',isDataRow:"+isDataRow+",line_num:"+line_num+"}")+")");
				 * 
				 * //改变用户当前选择的行样式 trObj.addClass("selected");
				 * 
				 * trObj.children("#hx_custom_col").each(function(i){
				 * 
				 * $(this).css("color","#FFFFFF"); }); } else{
				 * 
				 * var trObj=$(this);
				 * 
				 * //检查此行是否已选择 var line_num=parseInt(trObj.attr("line_num"));
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
				 * //检查此行是否已选择 var line_num=trObj.attr("line_num");
				 * 
				 * var isSelected=false;
				 * 
				 * //获得当前行状态 for(var i=0;i<obj.tObject.selectRowObject.length;i++){
				 * 
				 * if(obj.tObject.selectRowObject[i].line_num==line_num){
				 * 
				 * isSelected=true; } }
				 * 
				 * 
				 * var trId=trObj.attr("id");
				 * 
				 * //用户选择行是否是数据行 var isDataRow=false;
				 * 
				 * if(trObj.children("#hx_check_col").children().val()=="y"){
				 * 
				 * isDataRow=true; }
				 * 
				 * 
				 *  } else{
				 * 
				 * return; } } } else
				 */
				if (event.ctrlKey == false && event.shiftKey == false) {// 左键单选处理

					var trObj = $(this);

					if (trObj.children("#hx_check_col").children().val() == "d")//获取当前hx_check_col及其匹配元素的当前值
					{

						return;
					}

					// 检查此行是否已选择
					var line_num = trObj.attr("line_num");

					var isSelected = false;
					
					
                   
					// 获得当前行状态,obj.tObject.selectRowObject.length为选中的行的数目
					for (var i = 0; i < obj.tObject.selectRowObject.length; i++)
					{

						if (obj.tObject.selectRowObject[i].line_num == line_num)
						{

							isSelected = true;
						}
					}

					var trId = trObj.attr("id");

					// 用户选择行是否是数据行
					var isDataRow = false;

					if (trObj.children("#hx_check_col").children().val() == "y")
					{

						isDataRow = true;
					}

					// 记录当前选择行数
					obj.tObject.curSelectedRow = parseInt(line_num);

					for (var i = 0; i < obj.tObject.selectRowObject.length; i++)
					{

						var tmpTrObj = $("#"
								+ obj.tObject.selectRowObject[i].id);

						tmpTrObj.children("#hx_custom_col").each(function(num) {

									$(this).css("color", "#000000");
								});

						tmpTrObj.removeClass("selected");
					}

					// delete用户所有已选行信息
					obj.tObject.selectRowObject.splice(0,
							obj.tObject.selectRowObject.length);

					// 保存用户当前选择的行信息
					obj.tObject.selectRowObject[0] = window.eval("("
							+ ("{id:'" + trId + "',isDataRow:" + isDataRow
									+ ",line_num:" + line_num + "}") + ")");

					// 改变用户当前选择的行样式
					trObj.addClass("selected");

					trObj.children("#hx_custom_col").each(function(i) {

								$(this).css("color", "#FFFFFF");
							});

				} else if (event.ctrlKey == true) {// ctrl组合键多选处理

					var trObj = $(this);

					if (trObj.children("#hx_check_col").children().val() == "d") {

						return;
					}

					// 检查此行是否已选择
					var line_num = trObj.attr("line_num");

					var isSelected = false;

					// 获得当前行状态
					for (var i = 0; i < obj.tObject.selectRowObject.length; i++)
					{

						if (obj.tObject.selectRowObject[i].line_num == line_num)
						{

							isSelected = true;
						}
					}

					var trId = trObj.attr("id");

					// 用户选择行是否是数据行
					var isDataRow = false;

					if (trObj.children("#hx_check_col").children().val() == "y")
					{

						isDataRow = true;
					}

					// 记录当前选择行数
					obj.tObject.curSelectedRow = parseInt(line_num);

					if (isSelected == true)// 此行之前已被选，反选处理
					{

						for (var i = 0; i < obj.tObject.selectRowObject.length; i++)
						{

							if (line_num == obj.tObject.selectRowObject[i].line_num)
							{

								// 取消行样式
								var tmpTrObj = $("#" + obj.tObject.selectRowObject[i].id);

								tmpTrObj.children("#hx_custom_col").each(
										function(num) {

											$(this).css("color", "#000000");
										});

								tmpTrObj.removeClass("selected");

								// <bean:message key="button.delete" bundle=""/>已保存行信息
								obj.tObject.selectRowObject.splice(i, 1);

								break;
							}

						}
					} else if (isSelected == false) {// 此行之前未被选，反选处理

						// 保存用户当前选择的行信息
						obj.tObject.selectRowObject[obj.tObject.selectRowObject.length] = window
								.eval("("
										+ ("{id:'" + trId + "',isDataRow:"
												+ isDataRow + ",line_num:"
												+ line_num + "}") + ")");

						// 改变用户当前选择的行样式
						trObj.addClass("selected");

						trObj.children("#hx_custom_col").each(function(i) {

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

// 工具条中按钮分割条对象
function ToolSeparatorObject()
{

	this.sepLabelContent = "|";

	this.sepLabelCss = "toolbar-sep";

	if (arguments.length != 0)
	{

		if (typeof(arguments[0]) == "object")
		{

			if (typeof(arguments[0].sep) == "string" && arguments[0].sep != "")
			{

				this.sepLabelContent = arguments[0].sep;
			}

			if (typeof(arguments[0].css) == "string" && arguments[0].css != "")
			{

				this.sepLabelCss = arguments[0].css;
			}
		}
	}

	if (typeof ToolSeparatorObject._initStatus == "undefined")
	{

		ToolSeparatorObject.prototype.toHTML = function()
		{

			var tmp = new StringBuffer();

			tmp.append("<span class=\"").append(this.sepLabelCss).append("\">")
			   .append(this.sepLabelContent).append("</span>");

			return tmp.toString();
		}

		ToolSeparatorObject._initStatus = true;
	}
}

// 分页中按钮分割条对象
function PageSeparatorObject()
{

	this.sepLabelContent = "|";

	this.sepLabelCss = "page-sep";

	if (arguments.length != 0)
	{

		if (typeof(arguments[0]) == "object")
		{

			if (typeof(arguments[0].sep) == "string" && arguments[0].sep != "")
			{

				this.sepLabelContent = arguments[0].sep;
				
			}

			if (typeof(arguments[0].css) == "string" && arguments[0].css != "")
			{

				this.sepLabelCss = arguments[0].css;
			}
		}
	}

	if (typeof PageSeparatorObject._initStatus == "undefined")
	{

		PageSeparatorObject.prototype.toHTML = function()
		{

			var tmp = new StringBuffer();

			tmp.append("<span class=\"").append(this.sepLabelCss).append("\">")
			   .append(this.sepLabelContent).append("</span>");

			return tmp.toString();
		}

		PageSeparatorObject._initStatus = true;
	}
}
/**
 * 用于提示信息栏的信息提示
 * @param {} params
 */
function InfoTipObject(params)
{

	if (arguments.length == 1 && typeof(params) == "object") {

		if (typeof(params.label) == "string" && params.label != "")
		{

			this.label = params.label;
            
			InfoTipObject.prototype.toHTML = function()
			{

				return "<div id=\"hx_table_infobar_div\" title=\"信息提示栏\">&nbsp;&nbsp;"
						+ this.label+":"
						+ "&nbsp;<span id=\"hx_table_infobar\"></span></div>";
			}
		}
		else 
		{

			InfoTipObject.prototype.toHTML = function()
			{

				return "<div id=\"hx_table_infobar_div\" title=\"信息提示栏\"><span id=\"hx_table_infobar\"></span></div>";
			}
		}
	}
	else
	{

		InfoTipObject.prototype.toHTML = function()
		{

			return "<div id=\"hx_table_infobar_div\" title=\"信息提示栏\"><span id=\"hx_table_infobar\"></span></div>";
		}
	}
}

function DefaultDataToXlsBtnObject(params) {

	var obj = this;

	// 默认请求地址/xls_template.jsp
	obj.url = "xls_template.jsp";
	obj.title = "导出Excel"; //导出Excel
	obj.alt = "导出当前页数据到Excel文件";//导出当前页数据到Excel文件
	obj.iconCss = "excel";
	obj.font_color;
	obj.font_size;
	obj.font_family;

	if (arguments.length == 1 && typeof(params) == "object")
	{

		// 获的请求地址（模板文件地址）
		if (typeof(params.url) == "string" && $.trim(params.url) != "")
		{

			obj.url = params.url;
			
		}
		// 获得按钮名称
		if (typeof(params.title) == "string" && $.trim(params.title) != "")
		{

			obj.title = params.title;
			
		}
		// 获得按钮提示信息
		if (typeof(params.alt) == "string" && $.trim(params.alt) != "")
		{

			obj.alt = params.alt;
		}
		// 获得按钮图标样式
		if (typeof(params.iconCss) == "string" && $.trim(params.iconCss) != "")
		{

			obj.iconCss = params.iconCss;
		}
		// 获得按钮字体颜色
		if (typeof(params.font_color) == "string" && $.trim(params.font_color) != "")
		{

			obj.font_color = params.font_color;
		}
		// 获得按钮字体大小
		if (typeof(params.font_size) == "number" && params.font_size >= 10 && params.font_size <= 15)
		{

			obj.font_size = params.font_size;
		}
		// 获得按钮字体名称
		if (typeof(params.font_family) == "string" && $.trim(params.font_family) != "")
		{

			obj.font_family = params.font_family;
			
		}
	}

	// 将DefaultDataToXlsBtnObject转换为HTML 内容
	obj.toHTML = function(i)
	{
        
		var tmpSB = new StringBuffer();

		tmpSB.append("<button id=\"");

		if (typeof(params.id) == "string" && $.trim(params.id) != "")
		{

			tmpSB.append($.trim(params.id))

			obj.id = $.trim(params.id);
		}
		else
		{

			obj.id = "hx_toolbar_event" + i;

			tmpSB.append("hx_toolbar_event").append(i);
		}

		tmpSB.append("\" type=\"button\" class=\"");

		if (obj.iconCss != "")
		{

			if (typeof(obj.title) == "string" && $.trim(obj.title) != "")
			{

				tmpSB.append("hx_table_toolbar_btn ");
			}
			else
			{

				tmpSB.append("hx_table_toolbar_btn3 ");
			}

			tmpSB.append(obj.iconCss).append("\" title=\"");
		} 
		else  // 用户没有设置按钮图标样式
		{

			tmpSB.append("hx_table_toolbar_btn2\" title=\"");
		}

		tmpSB.append(obj.alt ? obj.alt : "").append("\">");

		// 判断是否设置按钮字体的大小、颜色等信息
		if ((typeof(obj.font_size) == "number" && (obj.font_size >= 10 && obj.font_size <= 15))
				|| (typeof(obj.font_color) == "string" && obj.font_color != "")
				|| (typeof(obj.font_family) == "string" && obj.font_family != "")) {

			tmpSB.append("<span style=\"");

			if (typeof(obj.font_size) == "number" && (obj.font_size >= 10 && obj.font_size <= 15))
			{

				tmpSB.append("font-size:").append(obj.font_size).append("px;");
			}

			if (typeof(obj.font_color) == "string" && obj.font_color != "")
			{

				tmpSB.append("color:").append(obj.font_color).append(";");
			}

			if (typeof(obj.font_family) == "string" && obj.font_family != "")
			{

				tmpSB.append("font-family:").append(obj.font_family)
					 .append(";");
			}

			tmpSB.append("\">").append(obj.title ? obj.title : "")
				 .append("</span>");
		} 
		else
		{

			tmpSB.append(obj.title ? obj.title : "");
		}

		tmpSB.append("</button>");
		

		return tmpSB.toString();
	}

	// 事件
	obj.handle = function(toolbarObject)
	{

		var formObj = $("#hx_t_form");//获取ID为hx_t_form的对象

		formObj.attr("action", obj.url)
				.append($("<input id=\"xls_data_input\" type=\"hidden\" name=\"xls_datas\"/>"));

		var gridTotalRow = 0;

		if (toolbarObject.tObject.page == null)// 没有设置分页
		{

			gridTotalRow = toolbarObject.tObject.cols.viewTotalRow;
		}
		else
        {

			gridTotalRow = toolbarObject.tObject.page.perPage;
		}

		// 检查表格内是否包含数据,如果是，封装数据
		if (gridTotalRow > 0)
		{

			var dataSB = new StringBuffer();

			var dataRow = 0;

			/*
			 * 封装格式： { data:[
			 * {col1:'第一行第一列',col2:'第一行第二列',col3:'第一行第三列',col4:'第一行第四列',col5:'第五列'},
			 * {col1:'第一行第一列',col2:'第一行第二列',col3:'第一行第三列',col4:'第一行第四列',col5:'第五列'} ],
			 * title:'表名', col_names:[列名,列名,列名,列名,列名] }
			 */

			// 封装数据
			dataSB.append("{data:[");
			

			for (var i = 1; i <= gridTotalRow; i++)
			{

				var tmpTrObj = $("#hx_grid_tr_id" + i);
				

				if (tmpTrObj.children("#hx_check_col").children().val() == "y") // 是数据行
				{

					dataRow++;

					if (dataRow == 1)
					{

						dataSB.append("{");
					}
					else 
					{

						dataSB.append(",{");
					}

					var col_num = 1;

					// 获得此行没列数据
					tmpTrObj.children("#hx_custom_col").each(function(i)
					{

						if ($(this).get(0).style.display != "none")
						{

							if (col_num == 1)
							{

								dataSB.append("col1:'");
							}
							else
							{

								dataSB.append(",col").append(col_num)
									  .append(":'");
							}
                           
							var value = $.trim($(this).html());

							if (value == "" || value == "&nbsp;")
							{

								dataSB.append(" ");
							}
							else
							{

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

				alert("目前没有数据。");

				return;
			}

			dataSB.append("],");

			// 封装表名
			dataSB.append("title:'").append(toolbarObject.tObject.reportTitle).append("',");
			//alert("封装表名后dataSB="+dataSB);

			// 封装列名
			dataSB.append("col_names:[");
			//alert("封装列名后dataSB="+dataSB);

			// 用户定义列对象中列信息
			var colObjs = toolbarObject.tObject.cols.cols;
			var colObjsLength = colObjs.length;

			var viewColsNum = 0;

			for (var i = 0; i < colObjsLength; i++)
			{

				if (!colObjs[i].hide)
				{

					if (viewColsNum == 0)
					{

						dataSB.append("'").append(colObjs[i].name).append("'");
					}
					else 
					{

						dataSB.append(",'").append(colObjs[i].name).append("'");
					}

					viewColsNum++;
				}
			}

			if (viewColsNum == 0)
			{

				alert("没有可显示列项，无法导出Excel文件。");

				return;
			}

			dataSB.append("]}");

			// 提交数据

			formObj.children("#xls_data_input").val(dataSB.toString());

			formObj.get(0).submit();

			formObj.empty();
		}
		else
		{

			alert("目前没有数据。");
		}
	}
}

function DefaultDataToDocBtnObject(params)
{

	var obj = this;

	// 默认请求地址/doc_template.jsp
	obj.url = "doc_template.jsp";
	obj.title = "导出Word"
	obj.alt = "导出当前页数据到Word文件";
	obj.iconCss = "doc";
	obj.font_color;
	obj.font_size;
	obj.font_family;

	if (arguments.length == 1 && typeof(params) == "object") {

		// 获的请求地址（模板文件地址）
		if (typeof(params.url) == "string" && $.trim(params.url) != "") {

			obj.url = params.url;
		}
		// 获得按钮名称
		if (typeof(params.title) == "string" && $.trim(params.title) != "") {

			obj.title = params.title;
		}
		// 获得按钮提示信息
		if (typeof(params.alt) == "string" && $.trim(params.alt) != "") {

			obj.alt = params.alt;
		}
		// 获得按钮图标样式
		if (typeof(params.iconCss) == "string" && $.trim(params.iconCss) != "") {

			obj.iconCss = params.iconCss;
		}
		// 获得按钮字体颜色
		if (typeof(params.font_color) == "string"
				&& $.trim(params.font_color) != "") {

			obj.font_color = params.font_color;
		}
		// 获得按钮字体大小
		if (typeof(params.font_size) == "number" && params.font_size >= 10
				&& params.font_size <= 15) {

			obj.font_size = params.font_size;
		}
		// 获得按钮字体名称
		if (typeof(params.font_family) == "string"
				&& $.trim(params.font_family) != "") {

			obj.font_family = params.font_family;
		}
	}

	// 将DefaultDataToXlsBtnObject转换为HTML 内容
	obj.toHTML = function(i) {

		var tmpSB = new StringBuffer();

		tmpSB.append("<button id=\"");

		if (typeof(params.id) == "string" && $.trim(params.id) != "") {

			tmpSB.append($.trim(params.id))

			obj.id = $.trim(params.id);
		} else {

			obj.id = "hx_toolbar_event" + i;

			tmpSB.append("hx_toolbar_event").append(i);
		}

		tmpSB.append("\" type=\"button\" class=\"");

		if (obj.iconCss != "") {

			if (typeof(obj.title) == "string" && $.trim(obj.title) != "") {

				tmpSB.append("hx_table_toolbar_btn ");
			} else {

				tmpSB.append("hx_table_toolbar_btn3 ");
			}

			tmpSB.append(obj.iconCss).append("\" title=\"");
		} else {// 用户没有设置按钮图标样式

			tmpSB.append("hx_table_toolbar_btn2\" title=\"");
		}

		tmpSB.append(obj.alt ? obj.alt : "").append("\">");

		// 判断是否设置按钮字体的大小、颜色等信息
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

	// 事件
	obj.handle = function(toolbarObject) {

		var formObj = $("#hx_t_form");

		formObj
				.attr("action", obj.url)
				.append($("<input id=\"doc_data_input\" type=\"hidden\" name=\"doc_datas\"/>"));

		var gridTotalRow = 0;
		if (toolbarObject.tObject.page == null) {// 没有设置分页

			gridTotalRow = toolbarObject.tObject.cols.viewTotalRow;
		} else {

			gridTotalRow = toolbarObject.tObject.page.perPage;
		}

		// 检查表格内是否包含数据,如果是，封装数据
		if (gridTotalRow > 0) {

			var dataSB = new StringBuffer();

			var dataRow = 0;

			/*
			 * 封装格式： { data:[
			 * {col1:'第一行第一列',col2:'第一行第二列',col3:'第一行第三列',col4:'第一行第四列',col5:'第五列'},
			 * {col1:'第一行第一列',col2:'第一行第二列',col3:'第一行第三列',col4:'第一行第四列',col5:'第五列'} ],
			 * title:'表名', col_names:[列名,列名,列名,列名,列名] }
			 */

			// 封装数据
			dataSB.append("{data:[");

			for (var i = 1; i <= gridTotalRow; i++) {

				var tmpTrObj = $("#hx_grid_tr_id" + i);

				if (tmpTrObj.children("#hx_check_col").children().val() == "y") {// 是数据行

					dataRow++;

					if (dataRow == 1) {

						dataSB.append("{");
					} else {

						dataSB.append(",{");
					}

					var col_num = 1;

					// 获得此行没列数据
					tmpTrObj.children("#hx_custom_col").each(function(i) {

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

				alert("目前没有数据。");

				return;
			}

			dataSB.append("],");

			// 封装表名
			dataSB.append("title:'").append(toolbarObject.tObject.reportTitle)
					.append("',");

			// 封装列名
			dataSB.append("col_names:[");

			// 用户定义列对象中列信息
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

				alert("没有可显示列项，无法导出Word文件。");

				return;
			}

			dataSB.append("]}");

			// 提交数据

			formObj.children("#doc_data_input").val(dataSB.toString());

			formObj.get(0).submit();

			formObj.empty();
		} else {

			alert("目前没有数据。");
		}
	}
}
// 工具条中‘换行’对象
function ToolButtonBrObject() {
}

function CustomerBar(params){
	
	obj.toHTML = function() {
		return "<div class=onelinebar > "+params.toString()+"</div>";
		
	}
}
function CloseBtn(params){
	var rightclosebtn = "<span class='close-btn' onclick='"+params.handle+"' title='close' style='width:30px;'>&nbsp;</span>";
}

function BooterSpeedBar(params){
	
	var obj = this;
	
	if (typeof(params.sep) == "object" && (params.sep instanceof PageSeparatorObject))
		obj.sep = params.sep;
	
	if(params.speedBar!=null)
		obj.speedBar = params.speedBar;
	
	if(params.speedLabel!=null)
		obj.speedLabel = params.speedLabel;
	
	if(params.totalFile!=null)
		obj.totalFile = params.totalFile;
	
	if(params.remainTime!=null)
		obj.remainTime = params.remainTime; 
		
	obj.toHTML = function() {
		var tmpSB = new StringBuffer();

		tmpSB.append("<div id=\"booterSpeedBar\" class=onelinebar >");
		tmpSB.append("<table cellpadding=\"0\" cellspacing=\"0\">");
		tmpSB.append("<tbody>");
		tmpSB.append("<tr>");
	
		tmpSB.append("<td >"+obj.speedBar+"</td>");

		if (typeof(obj.sep) == "object")tmpSB.append("<td>").append(obj.sep.toHTML()).append("</td>");
		tmpSB.append("<td>"+obj.speedLabel+"</td>");
		if (typeof(obj.sep) == "object")tmpSB.append("<td>").append(obj.sep.toHTML()).append("</td>");
		tmpSB.append("<td>"+obj.totalFile+"</td>");
		if (typeof(obj.sep) == "object")tmpSB.append("<td>").append(obj.sep.toHTML()).append("</td>");
		tmpSB.append("<td width=\"100%\" align=\"right\">"+obj.remainTime+"</td>");

		tmpSB.append("</tr></tbody>").append("</table></div>");

		return tmpSB.toString();
	}

	
}



/**/