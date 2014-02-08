// 构造函数
/*
 * width--->提示框宽度 height-->提示框高度 caption->提示框标题 speed--->提示框定时器毫秒数
 * time---->访问数据定时器毫秒数
 */
function Dbsx_Message(width, height, caption, speed, time, thispath, addr) {

	this.width = width ? width : 300;
	this.height = height ? height : 500;
	this.caption = caption;
	this.speed = speed;
	this.time = time;
	this.step = 3;
	this.message;

	this.thispath = thispath;
	this.addr = addr;

	this.right = screen.width - 5;
	this.oper;
	this.isClose = true;

	this.bottom = screen.Height;
}

// 自定义隐藏函数
Dbsx_Message.prototype.hide = function(type) {

	if (type != "undifned" && type == "all") {

		if (this.infoTime) {

			window.clearInterval(this.infoTime);
		}

		this.pop.hide();

		if (this.timer) {

			window.clearInterval(this.timer);
		}
	} else {

		if (this.infoTime) {

			window.clearInterval(this.infoTime);
		}

		// if(this.onunload()){

		this.oper = "close";
		// }
	}
}

// 自定义显示提示信息函数
Dbsx_Message.prototype.showInfo = function(num) {

	var infoTime;

	var me = this;

	var clickEvent = arguments[1];

	var getInfo = function() {

		dbsxBean.getInfo({

					callback : function(data) {

						var arrays = data.split("↓");

						if (arrays[0] != "0") {// 含有信息

							me.message = arrays[1];

							me.status_num = parseInt(arrays[0], 10);

							if (me.isClose) {

								// 显示
								me.showTip(me.thispath);
							} else {
								// 刷新
								me.refreshTip();
							}
						} else {

							// 显示短信总条数
							//document.getElementById("note_num_id").innerHTML = "（0条）";

							if (clickEvent == true) {

								//alert("目前没有短信息。");
							}
						}
					},
					exceptionHandler : function(err_info) {

						if (err_info != "") {

							//alert(err_info);

							window.open(me.thispath + "/logoffAction.do?"
											+ new Date(), "_top");
						} else {

							window.open(me.thispath + "/logoffAction.do?"
											+ new Date(), "_top");
						}
					}
				});
	}

	// infoTime=window.setInterval(function(){ getInfo(thispath,me);
	// },this.time);
	if (num > 1) {

		infoTime = window.setInterval(getInfo, this.time);
	} else {

		infoTime = window.setTimeout(getInfo, this.time);
	}

	this.infoTime = infoTime;
}

Dbsx_Message.prototype.modifyDBSX = function(id, _status) {

	// alert("id=="+id+"\t_status=="+_status);
	var me = this;

	dbsxBean.modifyDBSX(id, _status, {

				callback : function(data) {

					if (data == "0") {

						alert("修改失败，请重新操作。");
					} else {

						var arrays = data.split("↓");

						if (arrays[0] != "0") {// 含有信息

							// 隐藏
							me.hide('all');

							me.message = arrays[1];

							me.status_num = parseInt(arrays[0], 10);

							// 显示
							me.showTip();
						}
					}
				}
			});
}

Dbsx_Message.prototype.jumpURL = function(url) {

	if (url.indexOf("http://") < 0) {

		window.open(this.addr + url + "&t=" + new Date(), "pad");
	} else {

		window.open(url + "&t=" + new Date(), "pad");
	}

	this.hide();
}

// 刷新
//刷新
Dbsx_Message.prototype.refreshTip=function(){
    
    
    //alert(this.message);
    
//    var message_arrays=this.message.split("</R>");
    var message_arrays=this.message;
    	
	var color=new Array();
	
	color[0]="black";
	color[1]="red";
	color[2]="#fc9000";
	color[3]="blue";
	color[4]="green";
	
	
	var msg="<table>";
	
	msg+="<tr style=\"width:100%;height:500px;\">";
		
	msg+="<td style=\"width:120px;\" valign=\"middle\"></td>";

	msg+="<td style=\"width:100%;\" algin=\"left\">";
	
	msg+="<DIV style=\"BORDER-RIGHT: #b9c9ef 1px solid; PADDING-RIGHT: 13px; BORDER-TOP: #728eb8 1px solid; PADDING-LEFT: 13px; FONT-SIZE: 12px; PADDING-BOTTOM: 13px; BORDER-LEFT: #728eb8 1px solid; WIDTH: 100%; COLOR: #1f336b; PADDING-TOP: 18px; BORDER-BOTTOM: #b9c9ef 1px solid;overflow-x:auto;overflow-y:auto; HEIGHT:100%;\">";
	
	
	
	if(message_arrays!=""){//有信息
		
		var arrays0=message_arrays.split("</R>");
				
		var length0=arrays0.length-1;
		
		for(var i=0;i<length0;i++){
		//alert(arrays0[i]);
		
			var sub_arrays0=arrays0[i].split("</C>");
			//alert(sub_arrays0[1]);
			msg+="<span style=\"font-size:13px;font-weight:bold;margin-right:4px;\" >"+sub_arrays0[0]+"</span>&nbsp&nbsp&nbsp<!--<span style=\"cursor:hand;color:red;font-size:13px;font-weight:bold;margin-right:4px;\" onclick=\"parent.msg.modifyDBSX('"+sub_arrays0[0]+"','1')\">关闭</span>--><br/>";
			
		}
	}
	
	msg+="</DIV>";
	
	msg+="</td>";
		
	msg+="</tr>";
	
	msg+="</table>";
	
	
	this.pop.document.getElementById('message_div').innerHTML=msg;
}

// 自定义显示提示界面函数
Dbsx_Message.prototype.showTip = function(thispath) {

	//alert("初始化界面...");

	var popup = window.createPopup();

	popup.document.body.style.borderStyle = 'window-inset';

	popup.document.body.style.borderColor = 'activeborder';

	this.pop = popup;

	// alert((((this.height-24)*5)+24));

	var str = "<DIV id=dbsx style=\"BORDER-RIGHT: #455690 1px solid; BORDER-TOP: #a6b4cf 1px solid; Z-INDEX:99999; LEFT: 0px;BORDER-LEFT: #a6b4cf 1px solid; WIDTH: "
			+ this.width
			+ "px; BORDER-BOTTOM: #455690 1px solid; POSITION: absolute; TOP: 0px; HEIGHT: "
			+ (((this.height - 24) * 5) + 24)
			+ "px; BACKGROUND-COLOR: #c9d3f3\">";

	str += "<TABLE style=\"BORDER-TOP: #ffffff 1px solid; BORDER-LEFT: #ffffff 1px solid\" cellSpacing=0 cellPadding=0 width=\"100%\" bgColor=#AFDCF3 border=0>";

	str += "<TBODY>";
//alert(22);
	str += "<TR bgColor=#6699cc >";

	str += "<TD style=\"font-size: 12px; color: #0f2c8c\" width=30 height=24></TD>";

	str += "<TD id='winSmall2' style=\"font-weight: normal; font-size: 15px; color: #ffffff; padding-left: 4px; padding-top: 4px\" vAlign=center width=\"100%\"> <img src='"
			+ thispath
			+ "/images/main/title.gif' width=\"26px\" height=\"26px\" align='absmiddle'/>"
			+ this.caption + "</TD>";

	str += "<TD style=\"padding-right: 2px; padding-top: 2px\" vAlign=center align=right width=6><!--<span title='放大/缩小' style=\"CURSOR: hand;color:white;font-size:12px;font-weight:bold;margin-right:4px;\" id=\"winSmall\" >-</span>--><IMG id='winSmall' alt=缩小 style=\"CURSOR: hand\" hspace=3 src=\""
			+ thispath + "/images/main/small.gif\"></TD>";
	str += "<TD style=\"padding-right: 2px; padding-top: 2px\" vAlign=center align=right width=6><!--<span title=关闭 style=\"CURSOR: hand;color:white;font-size:12px;font-weight:bold;margin-right:4px;\" id=\"winClose\" >×</span>--><IMG id='winClose' alt=关闭 style=\"CURSOR: hand\" hspace=3 src=\""
			+ thispath + "/images/main/close.gif\"></TD>";
	str += "</TR>";
//alert(33);
	// str+="<TR
	// style=\"width:100%;height:"+((this.height-24)*this.status_num)+"px;\">";
	str += "<TR style=\"width:100%;height:" + ((this.height - 24) * 5)
			+ "px;\">";

	// str+="<TD style=\"background-image:
	// url(\'http://pic.tianyaclub.com/images/windty_bg.jpg\'); padding-right:
	// 1px; padding-bottom: 1px\" colSpan=3>";
	str += "<TD style=\"background-image: url("
			+ thispath
			+ "/images/main/bg.jpg); padding-right: 1px; padding-bottom: 1px\" colSpan=4>";

	str += "<DIV id=\"message_div\"></DIV>";
//alert(44);
	str += "</TD>";

	str += "</TR>";

	str += "</TBODY>";

	str += "</TABLE>";

	str += "</DIV>";

	//alert(str);

	popup.document.body.innerHTML = str;
//alert(55);
	this.refreshTip();
////alert(77);
	var timer;
	var docWidth = this.right;
	var docHeight = this.bottom - (((this.height - 24) * 5) + 24);
	var offset = 0;
	var me = this;

	

	me.oper = "open";
	me.isClose = false;
//alert(66);
	var start_run = function() {

		// var offset=screen.height-screen.availHeight;

		me.pop.show(docWidth - me.width, me.bottom - offset, me.width, offset,
				document.body);

		if (me.oper == "close") {

			// //alert("close");

			offset = offset - me.step;

			if (offset == 0) {

				me.pop.hide();

				if (me.timer) {

					window.clearInterval(me.timer);
				}

				me.isClose = true;
			}
		} else if (me.oper == "small") {

			if (offset > 30) {

				offset = offset - me.step;
			}
		} else {

			if (offset < (((me.height - 24) * 5) + 24)) {

				offset = offset + me.step;
			}
		}
	}
//alert(77);
	if (typeof(this.speed) != "number" || this.speed <= 0) {

		this.speed = 20;
	}

	timer = window.setInterval(start_run, this.speed);

	var winClose = popup.document.getElementById("winClose");

	winClose.onclick = function() {

		me.hide();
	}

	var winSmall = popup.document.getElementById("winSmall");

	winSmall.onclick = function() {

		// alert("winSmall---me.oper=="+me.oper);

		if (me.oper == "small") {

			me.oper = "big";

			popup.document.getElementById("winSmall").src = me.thispath
					+ "/images/main/small.gif";
			popup.document.getElementById("winSmall").alt = "缩小";
		} else {

			me.oper = "small";

			popup.document.getElementById("winSmall").src = me.thispath
					+ "/images/main/big.gif";
			popup.document.getElementById("winSmall").alt = "放大";
		}
	}

	var winSmall2 = popup.document.getElementById("winSmall2");

	winSmall2.onclick = function() {

		// alert("winSmall2---me.oper=="+me.oper);

		if (me.oper == "small") {

			me.oper = "big";

			popup.document.getElementById("winSmall").src = me.thispath
					+ "/images/main/small.gif";
			popup.document.getElementById("winSmall").alt = "缩小";
		} else {

			me.oper = "small";

			popup.document.getElementById("winSmall").src = me.thispath
					+ "/images/main/big.gif";
			popup.document.getElementById("winSmall").alt = "放大";
		}
	}

	this.timer = timer;
}

// 自定义退出函数
Dbsx_Message.prototype.onunload = function() {

	return true;
}

// 显示
function viewTip(dm, thispath) {

	if (dm.isClose) {

		dm.showInfo(1, true);
	} else {

		if (dm.oper == "small") {

			dm.oper = "big";

			dm.pop.document.getElementById("winSmall").src = thispath
					+ "/images/main/small.gif";
			dm.pop.document.getElementById("winSmall").alt = "缩小";
		}
	}
}


