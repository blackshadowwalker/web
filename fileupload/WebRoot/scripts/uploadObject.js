	var tObject = new TableObject();

	var speedBar = "<div class=progress style='width:150px;'><div id=progress_total  class='bar' style='width:0%'></div></div>";
	var speedLabel = "<div id=speedLabel style='width:180px;'>&nbsp; Speed: 0 byte/s</div>";
	var totalFile = "<div id=totalFile style='width:150px;'>Total 0 File</div>";
	var remainTime = "<div id=remainTime >Remained: 0s &nbsp;&nbsp;</div>";
	var rightclosebtn = "<span class='close-btn' onclick='closeWin()' title='close' style='width:30px;height:27px;'>&nbsp;</span>";
	
	$(function() {
		var gd = $("#tablediv").height()-90;
		tObject.init( {
			header : new TableHeaderObject({
				title:'FileUpload', 
				font_size:'8px',
				rightbutton : rightclosebtn
			}),
			reportTitle : '',
			tableDivId : 'hx_table_div',
			tableWidth : "100%",
			tableHeight : gd,
			infoTip : new InfoTipObject({
				label : 'Info'
			}),
			tableBorderCss : "#ACA899 solid 1px",
			toolbar : new ToolBarObject( 
			{
				id : 'i_btaddfile',
				alt : 'AddFile',
				title : 'AddFile',
				iconCss : 'add',
				handle : addFile
			}, 
			new ToolSeparatorObject(), 
			{
				id : 'i_btcancel',
				alt : 'Stop Upload',
				title : 'Stop Upload',
				iconCss : 'delete',
				handle : StopUpload
			}, 
			new ToolSeparatorObject(), 
			{
				id : 'i_clearTable',
				alt : 'Clear All',
				title : 'Clear All',
				iconCss : 'delete2',
				handle : ClearAll
			}, 
			new ToolSeparatorObject(), 
			{
				id : 'i_saveExit',
				alt : 'Save & Exit',
				title : 'Save & Exit',
				iconCss : 'save',
				handle : saveExit
			}
			
	//		new DefaultDataToXlsBtnObject({		url:$("#this_path_id").val()+'/modules/base/hx_table/xls_template.jsp'	})
			),
			cols : new ColsObject( {
				viewLineNum : true,
				viewTotalRow : 8,
				cols : [ {
					name : 'ID',
					alias : 'id',
					width : 160,
					hide : true
				}, {
					name : 'index',
					alias : 'index',
					width : 100,
					hide : false
				}, {
					name : 'name',
					alias : 'name',
					width : 200
				}, {
					name : 'size',
					alias : 'size',
					width : 80
				}, {
					name : 'progress',
					alias : 'progress',
					width : 200
				}, {
					name : 'state',
					alias : 'state',
					width : 100
				}, {
					name : 'operate',
					alias : 'operate',
					width : 60
				}

				]
			}),
			page : new PageObject( {
				perPage : 15
			}),
			booterSpeedBar :  new BooterSpeedBar({
				sep : new PageSeparatorObject(),
				speedBar : speedBar,
				speedLabel : speedLabel,
				totalFile :totalFile,
				remainTime : remainTime
			})
		});
	});

