/*
 * <table width="100%" cellspacing="0" cellpadding="0" border="1"
 * bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" style="border-collapse:
 * collapse;" id="table1" class="GridView"> <thead>
 * <tr class="GridHead" id="gridTreeTrid-1"> <td width="20%"><a
 * href="javascript:clickNode('-1',gridTree)" onfocus="this.blur()"
 * style="border: medium none ;"><img border="0" align="absmiddle"
 * src="images/minusbottom.gif" id="gridTreeNodimg-1" /></a><a
 * href="javascript:clickNode('-1',gridTree)" onmouseout="window.status='
 * ';return true;" onmouseover="window.status='header status text';return true;"
 * title="This is a tipTitle of head href!" onfocus="this.blur()">模块名</a></td>
 * <td width="40%">创建时间</td> <td width="10%">状态</td>
 * <td width="30%" class="centerClo">操作</td> </tr> </thead>
 */
if (TableTree == null)
	var TableTree = {}

TableTree.init = function(params) {

	/*
	 * 参数格式： { divID:显示层ID iconPath:图片位置 width:整体宽度 height:整体高度 headerCols:[
	 * 表头中每项列信息
	 *  { col_name:列名 align:对齐方式 } ] rootNode:[ 头节点没列信息
	 *  { col_content:列内容 col_align:列对齐方式 } ] colsWidth:[width]列宽集合
	 * removeParentNode:false 是否允许<bean:message key="button.delete" bundle="${language}"/>父节点（默认不允许） nodeEvent:function 节点事件 }
	 */

	var obj = this;

	// 初始化状态
	obj.status = false;

	// 表格列数
	obj.colsNum = 0;

	// 存储节点对象
	obj.map = new HashMap("node_");

	// 存储节点ID
	obj.nodeIDs = new Array();

	if (arguments.length == 1 && typeof(params) == "object") {

		if (typeof(params.divID) != "string") {

			alert("TableTree.init方法中divID参数必须设置有效信息。");

			return false;
		}

		obj.divID = params.divID;

		if (typeof(params.iconPath) != "string") {

			alert("TableTree.init方法中iconPath参数必须设置有效信息。");

			return false;
		}

		obj.iconPath = params.iconPath;

		if (typeof(params.width) != "string") {

			obj.width = "500px";
		} else {

			obj.width = params.width;
		}

		if (typeof(params.height) != "string") {

			obj.height = "400px";
		} else {

			obj.height = params.height;
		}

		if (typeof(params.removeParentNode) != "boolean") {

			obj.removeParentNode = false;
		} else {

			obj.removeParentNode = params.removeParentNode;
		}

		if (typeof(params.headerCols) == "object"
				&& (params.headerCols instanceof Array)
				&& params.headerCols.length > 0) {

			obj.headerCols = params.headerCols;

			obj.colsNum = params.headerCols.length;
		} else {

			alert("TableTree.init方法中必须定义有效headerCols参数。");

			return false;
		}

		if (typeof(params.rootNode) == "object"
				&& (params.rootNode instanceof Array)) {

			obj.rootNode = params.rootNode;
		} else {

			var tmp = new StringBuffer();

			tmp.append("[{col_content:\"※根节点※\",col_align:\"left\"}");

			for (var i = 0; i < obj.colsNum - 1; i++) {

				tmp.append(",null");
			}

			tmp.append("]");

			obj.rootNode = window.eval("(" + tmp.toString() + ")");
		}

		if (obj.colsNum == 0) {

			obj.colsNum = params.rootNode.length;
		}

		if (typeof(params.colsWidth) == "object"
				&& (params.colsWidth instanceof Array)) {

			obj.colsWidth = params.colsWidth;
		} else {

			alert("请定义每列宽度参数。");

			return;
		}

		if (typeof(params.nodeEvent) == "function") {

			obj.nodeEvent = params.nodeEvent;
		}
	} else {

		alert("TableTree.init方法中icon_path参数必须设置。");

		return;
	}

	// 存储节点图片
	obj.icons = {
		empty : obj.iconPath + "empty.gif",
		line : obj.iconPath + "line.gif",
		joinBottom : obj.iconPath + "joinbottom.gif",
		join : obj.iconPath + "join.gif",
		minusBottom : obj.iconPath + "minusbottom.gif",
		minus : obj.iconPath + "minus.gif",
		plusBottom : obj.iconPath + "plusbottom.gif",
		plus : obj.iconPath + "plus.gif"
	}

	// 开始初始化样式
	var tmpSB = new StringBuffer();

	tmpSB.append("<div id=\"table_tree_div\" style=\"width:").append(obj.width)
			.append(";height:").append(obj.height).append(";\">");
	tmpSB
			.append("<table id=\"table_tree_header\" cellspacing=\"0\" cellpadding=\"0\">");
	tmpSB.append("<thead>");
	tmpSB.append("<tr>");

	for (var i = 0; i < obj.colsNum; i++) {

		tmpSB.append("<th width=\"").append(obj.colsWidth[i]
				? obj.colsWidth[i]
				: "").append("\" align=\"").append(obj.headerCols[i].align
				? obj.headerCols[i].align
				: "left");
		tmpSB.append("\">").append(obj.headerCols[i].col_name).append("</th>");
	}
	tmpSB.append("</tr>");
	tmpSB.append("</thead>");
	tmpSB.append("</table>");

	tmpSB.append("<div style=\"overflow-y:auto;height:").append(obj.height)
			.append("\">");

	tmpSB
			.append("<table id=\"node_root\" cellspacing=\"0\" cellpadding=\"0\">");

	tmpSB.append("<tbody>");
	tmpSB.append("<tr>");

	for (var i = 0; i < obj.colsNum; i++) {

		tmpSB.append("<td width=\"").append(obj.colsWidth[i]
				? obj.colsWidth[i]
				: "").append("\" align=\"")
				.append((obj.rootNode[i] != null && obj.rootNode[i].col_align)
						? obj.rootNode[i].col_align
						: "left");
		tmpSB.append("\">");

		// alert(obj.rootNode[i].col_content);
		if (i == 0) {// 节点列

			tmpSB
					.append("&nbsp;<span id=\"node_root_span\"><img border=\"0\" align=\"absmiddle\" src=\"")
					.append(obj.icons.plusBottom).append("\" ");
			tmpSB
					.append("id=\"node_root_img\"></span><span id=\"node_root_col0\">");
			tmpSB.append(obj.rootNode[i].col_content
					? obj.rootNode[i].col_content
					: "&nbsp;").append("</span>");
		} else {

			tmpSB
					.append("<span id=\"node_root_col0\">")
					.append((obj.rootNode[i] != null && obj.rootNode[i].col_content)
							? obj.rootNode[i].col_content
							: "&nbsp;").append("</span>");
		}

		tmpSB.append("</td>");
	}

	tmpSB
			.append("</tr></tbody></table><div id=\"node_root_div\"></div></div></div>");

	$("#" + obj.divID).html(tmpSB.toString());

	// 增加根节点事件及样式
	$("#node_root_span").click(function() {

				obj.clickNode("root");
			}).hover(function() {

				$(this).css("color", "#2662DF").css("cursor", "pointer");

			}, function() {

				$(this).css("color", "#000000");

			});

	// 初始化根节点信息并添加到map中
	var rootNode = new Node();

	rootNode.id = "root";
	rootNode.level = 0;
	rootNode.isFirstOpen = true;// 是否第一次打开(如果用户设置事件，便调用；反之，照旧执行。)
	rootNode.curOpenStatus = false;// 节点当前是否打开
	// rootNode.curVisiableStatus="";//节点当前是否显示(""为显示；none为隐藏)
	rootNode.isRootNode = true;// 是否为根节点
	rootNode.isLeafNode = false;// 是否为叶节点（就是本身没有子节点的节点）
	rootNode.isLastNode = true;// 是否为最后节点
	rootNode.childNodes = [];// 子节点ID集合
	rootNode.hasChildNode = false;// 是否存在子节点
	rootNode.iconBeforeInfo = "&nbsp;";
	rootNode.haveClickEvent = true;// 是否具有节点单击事件

	obj.map.put("root", rootNode);

	obj.status = true;
}

// 节点单击事件
TableTree.clickNode = function(nodeID) {

	if (this.status == false)
		return false;

	// 获得节点信息
	var node = this.map.get(nodeID);

	if (node == null || !node instanceof Node) {

		alert("请确认节点(" + nodeID + ")是否存在。");

		return;
	}

	// 判断节点目前状态（开启、关闭）
	if (node.isLeafNode == true)
		return;// 叶节点没有事件

	if (node.curOpenStatus == true) {// 当前状态‘开启’，处理逻辑为‘关闭’

		// 改变状态值
		node.curOpenStatus = false;

		// 改变当前节点样式(节点图标)
		this.reloadNodeStyle(node);

		// 隐藏子节点状态
		this.changeChildNodeStatus(node);
	} else {// 当前状态‘关闭’，处理逻辑为‘开启’

		// 改变状态值
		node.curOpenStatus = true;

		if (node.isFirstOpen == true) {// 第一次单击此节点

			// 改变状态
			node.isFirstOpen = false;

			if (typeof(this.nodeEvent) == "function") {// 用户设置了节点单击事件

				// 调用事件
				this.nodeEvent(node);

				// 用户处理完业务逻辑后必须调用reloadNodeStyle()方法，以便更改节点样式是否相应改变(注：为预防用户自定义方法是多线程处理，所以此处不能自动调用，以防不同步。)

			} else {// 显示子节点，如没有，此节点变为叶节点

				// 检查是否具有子节点
				if (node.hasChildNode == true && node.childNodes.length > 0) {

					// 显示子节点
					this.changeChildNodeStatus(node);
				} else {// 没有子节点

					// 改变节点信息
					node.isLeafNode = true;
				}

				// 改变当前节点样式(图标)
				this.reloadNodeStyle(node);
			}
		} else {// 显示子节点

			// 检查是否具有子节点
			if (node.hasChildNode == true && node.childNodes.length > 0) {

				// 显示子节点
				this.changeChildNodeStatus(node);
			} else {// 没有子节点

				// 改变节点信息
				node.isLeafNode = true;
			}

			// 改变当前节点样式(图标)
			this.reloadNodeStyle(node);
		}
	}
}

// 改变子节点显示状态
TableTree.changeChildNodeStatus = function(pNode) {

	if (this.status == false)
		return;

	// 获得子节点ID集合
	// var cNodes=pNode.childNodes;

	// alert("子节点ID集合："+cNodes);

	// 当前节点状态
	if (pNode.curOpenStatus == false) {// 关闭--隐藏子节点

		$("#node_" + pNode.id + "_div").css("display", "none");
		/*
		 * for(var i=0;i<cNodes.length;i++){ //获得子节点对象 var
		 * nodeObject=this.map.get(cNodes[i]);
		 * 
		 * nodeObject.curVisiableStatus="none";
		 * 
		 * document.getElementById("node_"+nodeObject.id).style.display=nodeObject.curVisiableStatus;
		 * 
		 * if(nodeObject.isLeafNode==false &&
		 * nodeObject.hasChildNode==true){//还有子节点
		 * 
		 * this.changeChildNodeStatus(nodeObject); }
		 *  }
		 */
	} else if (pNode.curOpenStatus == true) {// 开启--显示子节点

		$("#node_" + pNode.id + "_div").css("display", "");
		/*
		 * if(pNode.curVisiableStatus==""){
		 * 
		 * for(var i=0;i<cNodes.length;i++){ //获得子节点对象 var
		 * nodeObject=this.map.get(cNodes[i]);
		 * 
		 * nodeObject.curVisiableStatus="";
		 * 
		 * document.getElementById("node_"+nodeObject.id).style.display=nodeObject.curVisiableStatus;
		 * 
		 * if(nodeObject.isLeafNode==false &&
		 * nodeObject.hasChildNode==true){//还有子节点
		 * 
		 * this.changeChildNodeStatus(nodeObject); } } }
		 */
	}
}

// 添加节点
TableTree.addNode = function(params) {

	/*
	 * 参数格式 { id:节点ID pid:父节点ID cols:[每列信息 { col_content:列显示内容 col_align:列对齐方式 } ]
	 * hasChild:false//是否存在子节点 }
	 */
	var obj = this;

	if (obj.status == false) {

		alert("TableTree控件未初始化完毕，不能添加节点。");

		return false;
	}

	if (arguments.length == 1 && typeof(params) == "object") {

		// 获得父节点信息
		var pNode = this.map.get(params.pid);

		if (pNode == null) {

			// alert("父节点("+params.pid+")不存在，子节点添加无效。");

			return false;
		}

		if (this.map.get(params.id) != null) {

			// alert("节点ID:"+params.id+"也存在，添加无效。");

			return false;
		}

		var node = new Node();

		node.id = params.id;// 节点ID号
		node.pid = pNode.id;// 父节点ID号
		node.level = pNode.level + 1;// 节点级别(层级--根节点默认0级)
		node.isFirstOpen = true;// 是否第一次打开(如果用户设置事件，便调用；反之，照旧执行。)
		node.curOpenStatus = false;// 节点当前是否打开
		// node.curVisiableStatus="";//节点当前是否显示
		node.isRootNode = false;// 是否为根节点

		node.childNodes = [];// 所有下级子节点ID集合

		node.hasClickEvent = false;// 增加节点是否具有单击事件(默认没有，没有子节点)

		if (params.hasChild == true) {

			node.hasChildNode = true;// 是否存在子节点
			node.isLeafNode = false;// 是否为叶节点（就是本身没有子节点的节点）
		} else {

			node.hasChildNode = false;// 是否存在子节点
			node.isLeafNode = true;// 是否为叶节点（就是本身没有子节点的节点）
		}

		// 增加子节点后，父节点处于曾经打开过状态
		pNode.isFirstOpen = false;
		// 这是父节点为开启状态
		pNode.curOpenStatus = true;
		// 父节点改为枝节点
		pNode.isLeafNode = false;

		// 将子节点信息添加到父节点中
		if (pNode.hasChildNode == true && pNode.childNodes.length > 0) {

			pNode.childNodes[pNode.childNodes.length] = node.id;

			node.isLastNode = false;
		} else {

			pNode.hasChildNode = true;

			pNode.childNodes[0] = node.id;

			node.isLastNode = true;// 是否为最后节点

			// 改变父节点图标
			this.reloadNodeStyle(pNode);
		}

		this.map.put(node.id, node);

		// alert("显示层：node_"+pNode.id+"_div");

		// 添加节点HTML对象
		this.addNodeHTML(node, pNode, params.cols);

		// 新增加节点默认没有事件
		/*
		 * $("#node_"+node.id+"_a").click(function(){
		 * 
		 * obj.clickNode(node.id); });
		 */
		// alert(document.getElementById("node_root_div").innerHTML);
		return true;
	} else {

		return false;
	}
}

// 获得节点数目
TableTree.size = function() {

	return this.map.size();
}

// 获得节点所有ID
TableTree.getNodeIDs = function(nodeID) {

	if (this.status == false) {

		alert("TableTree控件未初始化完毕，不能添加节点。");

		return null;
	}

	var node = this.map.get(nodeID);

	if (node == null || !(node instanceof Node)) {

		alert("请确认节点(" + nodeID + ")是否存在。");

		return null;
	}

	this.getNodeIDs2(nodeID, true);

	return this.nodeIDs;
}

// 获得节点所有ID
TableTree.getNodeIDs2 = function(nodeID, isFirst) {

	var node = this.map.get(nodeID);

	if (isFirst == true) {

		if (this.nodeIDs.length > 0) {

			// 清空
			this.nodeIDs.splice(0, this.nodeIDs.length);
		}

		this.nodeIDs[0] = node.id;
	}

	if (node.hasChildNode == true && node.childNodes.length > 0) {

		for (var i = 0; i < node.childNodes.length; i++) {

			var tmp = this.map.get(node.childNodes[i]);

			if (tmp.hasChildNode == true && tmp.childNodes.length > 0) {

				this.getNodeIDs2(tmp.id, false);
			}

			this.nodeIDs[this.nodeIDs.length] = tmp.id;
		}
	}
}
// <bean:message key="button.delete" bundle="${language}"/>节点
TableTree.delNode = function(nodeID) {

	var obj = this;

	if (obj.status == false) {

		alert("TableTree控件未初始化完毕，不能添加节点。");

		return false;
	}

	// alert("del nodeID==="+nodeID);

	// 获得节点对象
	var node = obj.map.get(nodeID);

	if (node == null || !(node instanceof Node)) {

		alert("请确认节点(" + nodeID + ")是否存在。");

		return false;
	}

	// 检查是否含有子节点
	if ((node.hasChildNode == true && node.childNodes.length > 0)
			&& obj.removeParentNode == false) {

		alert("节点(" + nodeID + ")下含有子节点，不能<bean:message key="button.delete" bundle="${language}"/>。");

		return false;
	}

	// 获得父节点对象
	if (node.id != "root") {// 根节点没有父节点

		var pNode = obj.map.get(node.pid);

		// 父节点<bean:message key="button.delete" bundle="${language}"/>此节点信息
		if (pNode.childNodes.length == 1) {

			// <bean:message key="button.delete" bundle="${language}"/>子节点信息
			pNode.hasChildNode = false;

			pNode.childNodes.splice(0, 1);

			// 改变父节点图标及样式
			obj.reloadNodeStyle(pNode);
		} else {

			if (node.isLastNode == true) {// <bean:message key="button.delete" bundle="${language}"/>的节点为父节点的最后子节点

				pNode.childNodes.splice(0, 1);

				// 更改倒数第二个子节点为最后节点
				var tmpNode = obj.map.get(pNode.childNodes[0]);

				tmpNode.isLastNode = true;

				// <bean:message key="button.modify" bundle="${language}"/>节点样式
				obj.reloadNodeStyle(tmpNode);

				obj.reloadNodeStyle(pNode);
			} else {

				var nodeLen = pNode.childNodes.length;

				for (var i = 0; i < nodeLen; i++) {

					if (pNode.childNodes[i] == node.id) {

						pNode.childNodes.splice(i, 1);

						break;
					}
				}
			}
		}
	}

	// <bean:message key="button.delete" bundle="${language}"/>子节点信息
	if (node.hasChildNode == true && node.childNodes.length > 0) {

		// 通过递归方式<bean:message key="button.delete" bundle="${language}"/>所有子节点
		obj.delChildNodes(node.childNodes);
	}

	if (node.id != "root" && node.level > 0) {// <bean:message key="button.delete" bundle="${language}"/>此节点,根节点不能<bean:message key="button.delete" bundle="${language}"/>

		// <bean:message key="button.delete" bundle="${language}"/>节点信息
		obj.map.remove(node.id);

		// <bean:message key="button.delete" bundle="${language}"/>节点HTML内容
		$("#node_" + node.id + "_t").remove();

		$("#node_" + node.id + "_div").remove();
	} else {

		// <bean:message key="button.delete" bundle="${language}"/>子节点信息
		var root = obj.map.get("root");

		root.hasChildNode = false;

		root.childNodes.splice(0, root.childNodes.length);

		// 改变父节点图标及样式
		obj.reloadNodeStyle(root);

		$("#node_root_div").html("");
	}
}

TableTree.delChildNodes = function(nodes) {

	var subChildLen = nodes.length;

	for (var i = 0; i < subChildLen; i++) {

		if (this.map.get(nodes[i]).hasChildNode == true) {

			this.delChildNodes(this.map.get(nodes[i]).childNodes);
		}

		this.map.remove(nodes[i]);
	}
}

// <bean:message key="button.modify" bundle="${language}"/>节点内容
TableTree.modNode = function(params) {

	/*
	 * 参数格式 { id:节点ID cols:[每列信息 col_content列显示内容 ] }
	 */
	if (this.status == false) {

		alert("TableTree控件未初始化完毕，不能添加节点。");

		return false;
	}

	if (typeof(params) != "object") {

		alert("TableTree.modNode()方法参数无效。");

		return false;
	}

	if (typeof(params.id) != "string") {

		alert("TableTree.modNode()方法参数无效。");

		return false;
	}

	// 获得节点对象
	var node = this.map.get(params.id);

	if (node == null || !(node instanceof Node)) {

		alert("节点(" + params.id + ")不存在，<bean:message key="button.modify" bundle="${language}"/>无效。");

		return false;
	}

	if (typeof(params.cols) == "object" && params.cols instanceof Array) {

		for (var i = 0; i < params.cols.length; i++) {

			if (typeof(params.cols[i]) == "string"
					&& $.trim(params.cols[i]) != "") {

				$("#node_" + node.id + "_col" + i).html(params.cols[i]);
			}
		}
	}

	return true;
}

TableTree.addNodeHTML = function(node, pNode, cols) {

	var obj = this;

	var iconSB = new StringBuffer();

	var tmpSB = new StringBuffer();

	tmpSB
			.append("<table id=\"node_")
			.append(node.id)
			.append("_t\" class=\"table_tree_node\" celspacing=\"0\" cellpadding=\"0\">");
	tmpSB.append("<tbody>");
	tmpSB.append("<tr>");

	for (var i = 0; i < obj.colsNum; i++) {

		tmpSB.append("<td width=\"").append(obj.colsWidth[i]
				? obj.colsWidth[i]
				: "").append("\" align=\"")
				.append((cols[i] != null && cols[i].col_align)
						? cols[i].col_align
						: "left").append("\">");

		if (i == 0) {// 节点列，添加事件

			iconSB.append(pNode.iconBeforeInfo);

			if (pNode.isLastNode == true) {

				iconSB.append("<img border=\"0\" align=\"absmiddle\" src=\"")
						.append(obj.icons.empty).append("\"/>");
			} else {

				iconSB.append("<img border=\"0\" align=\"absmiddle\" src=\"")
						.append(obj.icons.line).append("\"/>");
			}

			node.iconBeforeInfo = iconSB.toString();

			tmpSB.append(node.iconBeforeInfo).append("<span id=\"node_")
					.append(node.id).append("_span\">");
			tmpSB.append("<img id=\"node_").append(node.id)
					.append("_img\" border=\"0\" align=\"absmiddle\" src=\"");

			if (node.isLastNode) {

				if (node.isLeafNode == false && node.hasChildNode == true) {

					tmpSB.append(obj.icons.plusBottom);
				} else {

					tmpSB.append(obj.icons.joinBottom);
				}
			} else {

				if (node.isLeafNode == false && node.hasChildNode == true) {

					tmpSB.append(obj.icons.plus);
				} else {

					tmpSB.append(obj.icons.join);
				}
			}

			tmpSB.append("\"/></span><span id=\"node_").append(node.id)
					.append("_col").append(i).append("\">")
					.append(cols[i].col_content).append("</span>");
		} else {

			tmpSB.append("<span id=\"node_").append(node.id).append("_col")
					.append(i).append("\">").append(cols[i].col_content)
					.append("</span>");
		}

		tmpSB.append("</td>");
	}

	// tmpSB.append("</tr></tbody></table><div
	// id=\"node_").append(node.id).append("_div\"></div>");
	tmpSB.append("</tr></tbody></table>");

	document.getElementById("node_" + pNode.id + "_div").insertAdjacentElement(
			"afterBegin", $(tmpSB.toString()).get(0));

	document.getElementById("node_" + node.id + "_t")
			.insertAdjacentElement("afterEnd",
					$("<div id=\"node_" + node.id + "_div\"></div>").get(0));
	// alert(tmpSB.toString());

	// return tmpSB.toString();

	if (node.isLeafNode == false && node.hasChildNode == true) {

		// 增加节点事件及样式
		node.hasClickEvent = true;

		$("#node_" + node.id + "_span").click(function() {

					obj.clickNode(node.id);
				}).hover(function() {

					$(this).css("color", "#2662DF").css("cursor", "pointer");

				}, function() {

					$(this).css("color", "#000000");

				});
	}
}

// 重新设置节点样式（节点图标等）
TableTree.reloadNodeStyle = function(node) {

	// alert("更改节点图标："+node.id);

	var obj = this;

	if (obj.status == false)
		return false;

	// 获得节点对象
	// var node=this.map.get(nodeID);

	if (typeof(node) != "object" || !node instanceof Node) {

		alert("请确认节点(" + node.id + ")是否存在。");

		return;
	}
	// alert("isRootNode=="+node.isRootNode);

	var $nodeImg = $("#node_" + node.id + "_img");

	if (node.isRootNode == true) {// 根节点

		if (node.isLeafNode == true || node.hasChildNode == false) {// 没有子节点

			$nodeImg.attr("src", obj.icons.joinBottom);

			// <bean:message key="button.delete" bundle="${language}"/>节点事件及样式
			node.hasClickEvent = false;

			$("#node_" + node.id + "_span").unbind();
		} else {

			if (node.hasClickEvent == false) {

				// 增加节点事件及样式
				node.hasClickEvent = true;

				$("#node_" + node.id + "_span").click(function() {

							obj.clickNode(node.id);
						}).hover(function() {

							$(this).css("color", "#2662DF").css("cursor",
									"pointer");

						}, function() {

							$(this).css("color", "#000000");

						});
			}

			if (node.curOpenStatus == true) {// 节点开启

				$nodeImg.attr("src", obj.icons.minusBottom);
			} else {// 节点关闭

				$nodeImg.attr("src", obj.icons.plusBottom);
			}
		}
	} else {// 一般节点

		// alert(node.id+"是否有子节点："+node.hasChildNode);

		if (node.isLeafNode == true || node.hasChildNode == false) {// 没有子节点

			// <bean:message key="button.delete" bundle="${language}"/>节点事件及样式
			node.hasClickEvent = false;

			$("#node_" + node.id + "_span").unbind();

			if (node.isLastNode == true) {// 最后节点

				$nodeImg.attr("src", obj.icons.joinBottom);
			} else {

				$nodeImg.attr("src", obj.icons.join);
			}
		} else {// 含有子节点

			if (node.hasClickEvent == false) {

				// 增加节点事件及样式
				node.hasClickEvent = true;

				$("#node_" + node.id + "_span").click(function() {

							obj.clickNode(node.id);
						}).hover(function() {

							$(this).css("color", "#2662DF").css("cursor",
									"pointer");

						}, function() {

							$(this).css("color", "#000000");

						});
			}

			// 判断节点当前开启状态
			if (node.curOpenStatus == true) {// 当前开启

				if (node.isLastNode == true) {// 最后节点

					$nodeImg.attr("src", obj.icons.minusBottom);
				} else {

					$nodeImg.attr("src", obj.icons.minus);
				}
			} else {// 当前关闭

				if (node.isLastNode == true) {// 最后节点

					$nodeImg.attr("src", obj.icons.plusBottom);
				} else {

					$nodeImg.attr("src", obj.icons.plus);
				}
			}
		}
	}
}

// 节点对象
function Node() {

	this.id;// 节点ID号
	this.pid;// 父节点ID号
	this.level;// 节点级别(层级--根节点默认0级)
	this.isFirstOpen;// 是否第一次打开(如果用户设置事件，便调用；反之，照旧执行。)
	this.curOpenStatus;// 节点当前是否打开
	// this.curVisiableStatus;//节点当前是否显示
	this.isRootNode;// 是否为根节点
	this.isLeafNode;// 是否为叶节点（就是本身没有子节点的节点）
	this.isLastNode;// 是否为最后节点
	this.childNodes;// 所有下级子节点ID集合
	this.hasChildNode;// 是否存在子节点
	this.iconBeforeInfo;// 节点图标之前内容
	this.haveClickEvent;// 是否具有节点单击事件
}

function HashMap() {

	this.length = 0;

	if (arguments > 1 && typeof(arguments[0]) == "string") {// 设置前缀

		this.prefix = arguments[0];
	} else {

		this.prefix = "";
	}

	if (typeof(HashMap._initStatus) == "undefined") {

		HashMap.prototype.put = function(key, value) {

			if (typeof(key) != "string")
				return false;

			if (typeof(value) == "undefined")
				return false;

			if (this[this.prefix + key] == null
					|| this[this.prefix + key] == "undefined") {

				this[this.prefix + key] = value;
			} else {

				return false;
			}

			this.length++;

			return true;
		}

		HashMap.prototype.get = function(key) {

			if (typeof(key) != "string")
				return null;

			if (this[this.prefix + key]) {

				return this[this.prefix + key];
			} else {

				return null;
			}
		}

		HashMap.prototype.size = function() {

			return this.length;
		}

		HashMap.prototype.remove = function(key) {

			if (typeof(key) != "string")
				return null;

			if (this[this.prefix + key]) {

				// var tmp=this[this.prefix+key];

				delete this[this.prefix + key];

				this.length--;

				return true;
			} else {

				return false;
			}
		}

		HashMap._initStatus = true;
	}
}

function TopicObject() {

	TopicObject.prototype.add = function(key, value) {

	}

	TopicObject.prototype.del = function(key) {

	}

	TopicObject.prototype.mod = function(key, value) {

	}

	TopicObject.prototype.removeAll = function() {

	}
}