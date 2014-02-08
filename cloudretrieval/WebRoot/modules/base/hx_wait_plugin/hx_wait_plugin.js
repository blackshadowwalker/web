

function hx_wait(path) {

	// 组件初始化状态
	this.status = false;

	if (typeof(path) == "string" && $.trim(path).length > 0) {
	} else {

		alert("hx_wait控件没有有效定义path参数，控件无法初始化。");

		return;
	}

	var waitObject = $("<div unselectable=\"on\" onselectstart=\"return false;\"></div>");

	waitObject.attr("id", "wait_plugin_id");
	waitObject.css("position", "absolute");
	waitObject.css("display", "none");
	waitObject.css("background-color", "#C1D3FB");
	waitObject.css("z-index", "10002");

	var tmpSB = new StringBuffer();

	tmpSB
			.append("<table title=\"后台正在处理，请等待...\" style=\"border:1 dashed black;margin:0px;padding:0px;width:100%;height:100%;\">");

	tmpSB
			.append("<tr><td width=\"50\" style=\"padding-left:10px;\"><img id=\"hx_wait_img_id\" src=\"")
			.append(path)
			.append("/wait.gif\" border=0/></td><td id=\"hx_wait_info_id\"></td></tr>");

	tmpSB.append("</table>");

	waitObject.html(tmpSB.toString());

	document.body.appendChild(waitObject.get(0));

	hx_wait.prototype.show = function(params) {

		if (this.status == false) {

			alert("hx_wait控件未正常初始化。");

			return;
		}

		var right = "";
		var left = "";
		var top = "";
		var bottom = "";
		var margin_right = "";
		var margin_left = "";
		var margin_top = "";
		var margin_bottom = "";
		var width = "400px";
		var height = "300px";
		var text_align = "center";
		var msg = "后台正在处理，请等待...";

		var tmp = arguments[0];

		if (typeof(tmp.right) == "string" && $.trim(tmp.right).length > 0) {

			right = tmp.right;
		}

		if (typeof(tmp.left) == "string" && $.trim(tmp.left).length > 0) {

			left = tmp.left;
		}

		if (typeof(tmp.top) == "string" && $.trim(tmp.top).length > 0) {

			top = tmp.top;
		}

		if (typeof(tmp.bottom) == "string" && $.trim(tmp.bottom).length > 0) {

			bottom = tmp.bottom;
		}

		if (typeof(tmp.margin_right) == "string"
				&& $.trim(tmp.margin_right).length > 0) {

			nargin_right = tmp.margin_right;
		}

		if (typeof(tmp.margin_left) == "string"
				&& $.trim(tmp.margin_left).length > 0) {

			margin_left = tmp.margin_left;
		}

		if (typeof(tmp.margin_top) == "string"
				&& $.trim(tmp.margin_top).length > 0) {

			margin_top = tmp.margin_top;
		}

		if (typeof(tmp.margin_bottom) == "string"
				&& $.trim(tmp.margin_bottom).length > 0) {

			margin_bottom = tmp.margin_bottom;
		}

		if (typeof(tmp.width) == "string" && $.trim(tmp.width).length > 0) {

			width = tmp.width;
		}

		if (typeof(tmp.height) == "string" && $.trim(tmp.height).length > 0) {

			height = tmp.height;
		}

		if (typeof(tmp.align) == "string" && $.trim(tmp.align).length > 0) {

			text_align = tmp.align;
		}

		if (typeof(tmp.msg) == "string" && $.trim(tmp.msg).length > 0) {

			msg = tmp.msg;
		}

		this.waitObject.css({

					"right" : right,
					"left" : left,
					"top" : top,
					"bottom" : bottom,
					"margin-right" : margin_right,
					"margin-left" : margin_left,
					"margin-top" : margin_top,
					"margin-bottom" : margin_bottom,
					"width" : width,
					"height" : height,
					"text-align" : text_align
				});

		this.waitObject.css("display", "");

		$("#hx_wait_info_id").html(msg);

		// 等待组件获得焦点
		// waitObject.get(0).focus();
	}

	hx_wait.prototype.hide = function() {

		if (this.status == false) {

			alert("hx_wait控件未正常初始化。");

			return;
		}

		this.waitObject.css("display", "none");
	}

	// 保存等待组件
	this.waitObject = waitObject;

	// 组件初始化完毕
	this.status = true;
}