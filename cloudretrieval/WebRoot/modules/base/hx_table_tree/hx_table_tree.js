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
 * title="This is a tipTitle of head href!" onfocus="this.blur()">ģ����</a></td>
 * <td width="40%">����ʱ��</td> <td width="10%">״̬</td>
 * <td width="30%" class="centerClo">����</td> </tr> </thead>
 */
if (TableTree == null)
	var TableTree = {}

TableTree.init = function(params) {

	/*
	 * ������ʽ�� { divID:��ʾ��ID iconPath:ͼƬλ�� width:������ height:����߶� headerCols:[
	 * ��ͷ��ÿ������Ϣ
	 *  { col_name:���� align:���뷽ʽ } ] rootNode:[ ͷ�ڵ�û����Ϣ
	 *  { col_content:������ col_align:�ж��뷽ʽ } ] colsWidth:[width]�п���
	 * removeParentNode:false �Ƿ�����<bean:message key="button.delete" bundle="${language}"/>���ڵ㣨Ĭ�ϲ����� nodeEvent:function �ڵ��¼� }
	 */

	var obj = this;

	// ��ʼ��״̬
	obj.status = false;

	// �������
	obj.colsNum = 0;

	// �洢�ڵ����
	obj.map = new HashMap("node_");

	// �洢�ڵ�ID
	obj.nodeIDs = new Array();

	if (arguments.length == 1 && typeof(params) == "object") {

		if (typeof(params.divID) != "string") {

			alert("TableTree.init������divID��������������Ч��Ϣ��");

			return false;
		}

		obj.divID = params.divID;

		if (typeof(params.iconPath) != "string") {

			alert("TableTree.init������iconPath��������������Ч��Ϣ��");

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

			alert("TableTree.init�����б��붨����ЧheaderCols������");

			return false;
		}

		if (typeof(params.rootNode) == "object"
				&& (params.rootNode instanceof Array)) {

			obj.rootNode = params.rootNode;
		} else {

			var tmp = new StringBuffer();

			tmp.append("[{col_content:\"�����ڵ��\",col_align:\"left\"}");

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

			alert("�붨��ÿ�п�Ȳ�����");

			return;
		}

		if (typeof(params.nodeEvent) == "function") {

			obj.nodeEvent = params.nodeEvent;
		}
	} else {

		alert("TableTree.init������icon_path�����������á�");

		return;
	}

	// �洢�ڵ�ͼƬ
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

	// ��ʼ��ʼ����ʽ
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
		if (i == 0) {// �ڵ���

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

	// ���Ӹ��ڵ��¼�����ʽ
	$("#node_root_span").click(function() {

				obj.clickNode("root");
			}).hover(function() {

				$(this).css("color", "#2662DF").css("cursor", "pointer");

			}, function() {

				$(this).css("color", "#000000");

			});

	// ��ʼ�����ڵ���Ϣ����ӵ�map��
	var rootNode = new Node();

	rootNode.id = "root";
	rootNode.level = 0;
	rootNode.isFirstOpen = true;// �Ƿ��һ�δ�(����û������¼�������ã���֮���վ�ִ�С�)
	rootNode.curOpenStatus = false;// �ڵ㵱ǰ�Ƿ��
	// rootNode.curVisiableStatus="";//�ڵ㵱ǰ�Ƿ���ʾ(""Ϊ��ʾ��noneΪ����)
	rootNode.isRootNode = true;// �Ƿ�Ϊ���ڵ�
	rootNode.isLeafNode = false;// �Ƿ�ΪҶ�ڵ㣨���Ǳ���û���ӽڵ�Ľڵ㣩
	rootNode.isLastNode = true;// �Ƿ�Ϊ���ڵ�
	rootNode.childNodes = [];// �ӽڵ�ID����
	rootNode.hasChildNode = false;// �Ƿ�����ӽڵ�
	rootNode.iconBeforeInfo = "&nbsp;";
	rootNode.haveClickEvent = true;// �Ƿ���нڵ㵥���¼�

	obj.map.put("root", rootNode);

	obj.status = true;
}

// �ڵ㵥���¼�
TableTree.clickNode = function(nodeID) {

	if (this.status == false)
		return false;

	// ��ýڵ���Ϣ
	var node = this.map.get(nodeID);

	if (node == null || !node instanceof Node) {

		alert("��ȷ�Ͻڵ�(" + nodeID + ")�Ƿ���ڡ�");

		return;
	}

	// �жϽڵ�Ŀǰ״̬���������رգ�
	if (node.isLeafNode == true)
		return;// Ҷ�ڵ�û���¼�

	if (node.curOpenStatus == true) {// ��ǰ״̬���������������߼�Ϊ���رա�

		// �ı�״ֵ̬
		node.curOpenStatus = false;

		// �ı䵱ǰ�ڵ���ʽ(�ڵ�ͼ��)
		this.reloadNodeStyle(node);

		// �����ӽڵ�״̬
		this.changeChildNodeStatus(node);
	} else {// ��ǰ״̬���رա��������߼�Ϊ��������

		// �ı�״ֵ̬
		node.curOpenStatus = true;

		if (node.isFirstOpen == true) {// ��һ�ε����˽ڵ�

			// �ı�״̬
			node.isFirstOpen = false;

			if (typeof(this.nodeEvent) == "function") {// �û������˽ڵ㵥���¼�

				// �����¼�
				this.nodeEvent(node);

				// �û�������ҵ���߼���������reloadNodeStyle()�������Ա���Ľڵ���ʽ�Ƿ���Ӧ�ı�(ע��ΪԤ���û��Զ��巽���Ƕ��̴߳������Դ˴������Զ����ã��Է���ͬ����)

			} else {// ��ʾ�ӽڵ㣬��û�У��˽ڵ��ΪҶ�ڵ�

				// ����Ƿ�����ӽڵ�
				if (node.hasChildNode == true && node.childNodes.length > 0) {

					// ��ʾ�ӽڵ�
					this.changeChildNodeStatus(node);
				} else {// û���ӽڵ�

					// �ı�ڵ���Ϣ
					node.isLeafNode = true;
				}

				// �ı䵱ǰ�ڵ���ʽ(ͼ��)
				this.reloadNodeStyle(node);
			}
		} else {// ��ʾ�ӽڵ�

			// ����Ƿ�����ӽڵ�
			if (node.hasChildNode == true && node.childNodes.length > 0) {

				// ��ʾ�ӽڵ�
				this.changeChildNodeStatus(node);
			} else {// û���ӽڵ�

				// �ı�ڵ���Ϣ
				node.isLeafNode = true;
			}

			// �ı䵱ǰ�ڵ���ʽ(ͼ��)
			this.reloadNodeStyle(node);
		}
	}
}

// �ı��ӽڵ���ʾ״̬
TableTree.changeChildNodeStatus = function(pNode) {

	if (this.status == false)
		return;

	// ����ӽڵ�ID����
	// var cNodes=pNode.childNodes;

	// alert("�ӽڵ�ID���ϣ�"+cNodes);

	// ��ǰ�ڵ�״̬
	if (pNode.curOpenStatus == false) {// �ر�--�����ӽڵ�

		$("#node_" + pNode.id + "_div").css("display", "none");
		/*
		 * for(var i=0;i<cNodes.length;i++){ //����ӽڵ���� var
		 * nodeObject=this.map.get(cNodes[i]);
		 * 
		 * nodeObject.curVisiableStatus="none";
		 * 
		 * document.getElementById("node_"+nodeObject.id).style.display=nodeObject.curVisiableStatus;
		 * 
		 * if(nodeObject.isLeafNode==false &&
		 * nodeObject.hasChildNode==true){//�����ӽڵ�
		 * 
		 * this.changeChildNodeStatus(nodeObject); }
		 *  }
		 */
	} else if (pNode.curOpenStatus == true) {// ����--��ʾ�ӽڵ�

		$("#node_" + pNode.id + "_div").css("display", "");
		/*
		 * if(pNode.curVisiableStatus==""){
		 * 
		 * for(var i=0;i<cNodes.length;i++){ //����ӽڵ���� var
		 * nodeObject=this.map.get(cNodes[i]);
		 * 
		 * nodeObject.curVisiableStatus="";
		 * 
		 * document.getElementById("node_"+nodeObject.id).style.display=nodeObject.curVisiableStatus;
		 * 
		 * if(nodeObject.isLeafNode==false &&
		 * nodeObject.hasChildNode==true){//�����ӽڵ�
		 * 
		 * this.changeChildNodeStatus(nodeObject); } } }
		 */
	}
}

// ��ӽڵ�
TableTree.addNode = function(params) {

	/*
	 * ������ʽ { id:�ڵ�ID pid:���ڵ�ID cols:[ÿ����Ϣ { col_content:����ʾ���� col_align:�ж��뷽ʽ } ]
	 * hasChild:false//�Ƿ�����ӽڵ� }
	 */
	var obj = this;

	if (obj.status == false) {

		alert("TableTree�ؼ�δ��ʼ����ϣ�������ӽڵ㡣");

		return false;
	}

	if (arguments.length == 1 && typeof(params) == "object") {

		// ��ø��ڵ���Ϣ
		var pNode = this.map.get(params.pid);

		if (pNode == null) {

			// alert("���ڵ�("+params.pid+")�����ڣ��ӽڵ������Ч��");

			return false;
		}

		if (this.map.get(params.id) != null) {

			// alert("�ڵ�ID:"+params.id+"Ҳ���ڣ������Ч��");

			return false;
		}

		var node = new Node();

		node.id = params.id;// �ڵ�ID��
		node.pid = pNode.id;// ���ڵ�ID��
		node.level = pNode.level + 1;// �ڵ㼶��(�㼶--���ڵ�Ĭ��0��)
		node.isFirstOpen = true;// �Ƿ��һ�δ�(����û������¼�������ã���֮���վ�ִ�С�)
		node.curOpenStatus = false;// �ڵ㵱ǰ�Ƿ��
		// node.curVisiableStatus="";//�ڵ㵱ǰ�Ƿ���ʾ
		node.isRootNode = false;// �Ƿ�Ϊ���ڵ�

		node.childNodes = [];// �����¼��ӽڵ�ID����

		node.hasClickEvent = false;// ���ӽڵ��Ƿ���е����¼�(Ĭ��û�У�û���ӽڵ�)

		if (params.hasChild == true) {

			node.hasChildNode = true;// �Ƿ�����ӽڵ�
			node.isLeafNode = false;// �Ƿ�ΪҶ�ڵ㣨���Ǳ���û���ӽڵ�Ľڵ㣩
		} else {

			node.hasChildNode = false;// �Ƿ�����ӽڵ�
			node.isLeafNode = true;// �Ƿ�ΪҶ�ڵ㣨���Ǳ���û���ӽڵ�Ľڵ㣩
		}

		// �����ӽڵ�󣬸��ڵ㴦�������򿪹�״̬
		pNode.isFirstOpen = false;
		// ���Ǹ��ڵ�Ϊ����״̬
		pNode.curOpenStatus = true;
		// ���ڵ��Ϊ֦�ڵ�
		pNode.isLeafNode = false;

		// ���ӽڵ���Ϣ��ӵ����ڵ���
		if (pNode.hasChildNode == true && pNode.childNodes.length > 0) {

			pNode.childNodes[pNode.childNodes.length] = node.id;

			node.isLastNode = false;
		} else {

			pNode.hasChildNode = true;

			pNode.childNodes[0] = node.id;

			node.isLastNode = true;// �Ƿ�Ϊ���ڵ�

			// �ı丸�ڵ�ͼ��
			this.reloadNodeStyle(pNode);
		}

		this.map.put(node.id, node);

		// alert("��ʾ�㣺node_"+pNode.id+"_div");

		// ��ӽڵ�HTML����
		this.addNodeHTML(node, pNode, params.cols);

		// �����ӽڵ�Ĭ��û���¼�
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

// ��ýڵ���Ŀ
TableTree.size = function() {

	return this.map.size();
}

// ��ýڵ�����ID
TableTree.getNodeIDs = function(nodeID) {

	if (this.status == false) {

		alert("TableTree�ؼ�δ��ʼ����ϣ�������ӽڵ㡣");

		return null;
	}

	var node = this.map.get(nodeID);

	if (node == null || !(node instanceof Node)) {

		alert("��ȷ�Ͻڵ�(" + nodeID + ")�Ƿ���ڡ�");

		return null;
	}

	this.getNodeIDs2(nodeID, true);

	return this.nodeIDs;
}

// ��ýڵ�����ID
TableTree.getNodeIDs2 = function(nodeID, isFirst) {

	var node = this.map.get(nodeID);

	if (isFirst == true) {

		if (this.nodeIDs.length > 0) {

			// ���
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
// <bean:message key="button.delete" bundle="${language}"/>�ڵ�
TableTree.delNode = function(nodeID) {

	var obj = this;

	if (obj.status == false) {

		alert("TableTree�ؼ�δ��ʼ����ϣ�������ӽڵ㡣");

		return false;
	}

	// alert("del nodeID==="+nodeID);

	// ��ýڵ����
	var node = obj.map.get(nodeID);

	if (node == null || !(node instanceof Node)) {

		alert("��ȷ�Ͻڵ�(" + nodeID + ")�Ƿ���ڡ�");

		return false;
	}

	// ����Ƿ����ӽڵ�
	if ((node.hasChildNode == true && node.childNodes.length > 0)
			&& obj.removeParentNode == false) {

		alert("�ڵ�(" + nodeID + ")�º����ӽڵ㣬����<bean:message key="button.delete" bundle="${language}"/>��");

		return false;
	}

	// ��ø��ڵ����
	if (node.id != "root") {// ���ڵ�û�и��ڵ�

		var pNode = obj.map.get(node.pid);

		// ���ڵ�<bean:message key="button.delete" bundle="${language}"/>�˽ڵ���Ϣ
		if (pNode.childNodes.length == 1) {

			// <bean:message key="button.delete" bundle="${language}"/>�ӽڵ���Ϣ
			pNode.hasChildNode = false;

			pNode.childNodes.splice(0, 1);

			// �ı丸�ڵ�ͼ�꼰��ʽ
			obj.reloadNodeStyle(pNode);
		} else {

			if (node.isLastNode == true) {// <bean:message key="button.delete" bundle="${language}"/>�Ľڵ�Ϊ���ڵ������ӽڵ�

				pNode.childNodes.splice(0, 1);

				// ���ĵ����ڶ����ӽڵ�Ϊ���ڵ�
				var tmpNode = obj.map.get(pNode.childNodes[0]);

				tmpNode.isLastNode = true;

				// <bean:message key="button.modify" bundle="${language}"/>�ڵ���ʽ
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

	// <bean:message key="button.delete" bundle="${language}"/>�ӽڵ���Ϣ
	if (node.hasChildNode == true && node.childNodes.length > 0) {

		// ͨ���ݹ鷽ʽ<bean:message key="button.delete" bundle="${language}"/>�����ӽڵ�
		obj.delChildNodes(node.childNodes);
	}

	if (node.id != "root" && node.level > 0) {// <bean:message key="button.delete" bundle="${language}"/>�˽ڵ�,���ڵ㲻��<bean:message key="button.delete" bundle="${language}"/>

		// <bean:message key="button.delete" bundle="${language}"/>�ڵ���Ϣ
		obj.map.remove(node.id);

		// <bean:message key="button.delete" bundle="${language}"/>�ڵ�HTML����
		$("#node_" + node.id + "_t").remove();

		$("#node_" + node.id + "_div").remove();
	} else {

		// <bean:message key="button.delete" bundle="${language}"/>�ӽڵ���Ϣ
		var root = obj.map.get("root");

		root.hasChildNode = false;

		root.childNodes.splice(0, root.childNodes.length);

		// �ı丸�ڵ�ͼ�꼰��ʽ
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

// <bean:message key="button.modify" bundle="${language}"/>�ڵ�����
TableTree.modNode = function(params) {

	/*
	 * ������ʽ { id:�ڵ�ID cols:[ÿ����Ϣ col_content����ʾ���� ] }
	 */
	if (this.status == false) {

		alert("TableTree�ؼ�δ��ʼ����ϣ�������ӽڵ㡣");

		return false;
	}

	if (typeof(params) != "object") {

		alert("TableTree.modNode()����������Ч��");

		return false;
	}

	if (typeof(params.id) != "string") {

		alert("TableTree.modNode()����������Ч��");

		return false;
	}

	// ��ýڵ����
	var node = this.map.get(params.id);

	if (node == null || !(node instanceof Node)) {

		alert("�ڵ�(" + params.id + ")�����ڣ�<bean:message key="button.modify" bundle="${language}"/>��Ч��");

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

		if (i == 0) {// �ڵ��У�����¼�

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

		// ���ӽڵ��¼�����ʽ
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

// �������ýڵ���ʽ���ڵ�ͼ��ȣ�
TableTree.reloadNodeStyle = function(node) {

	// alert("���Ľڵ�ͼ�꣺"+node.id);

	var obj = this;

	if (obj.status == false)
		return false;

	// ��ýڵ����
	// var node=this.map.get(nodeID);

	if (typeof(node) != "object" || !node instanceof Node) {

		alert("��ȷ�Ͻڵ�(" + node.id + ")�Ƿ���ڡ�");

		return;
	}
	// alert("isRootNode=="+node.isRootNode);

	var $nodeImg = $("#node_" + node.id + "_img");

	if (node.isRootNode == true) {// ���ڵ�

		if (node.isLeafNode == true || node.hasChildNode == false) {// û���ӽڵ�

			$nodeImg.attr("src", obj.icons.joinBottom);

			// <bean:message key="button.delete" bundle="${language}"/>�ڵ��¼�����ʽ
			node.hasClickEvent = false;

			$("#node_" + node.id + "_span").unbind();
		} else {

			if (node.hasClickEvent == false) {

				// ���ӽڵ��¼�����ʽ
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

			if (node.curOpenStatus == true) {// �ڵ㿪��

				$nodeImg.attr("src", obj.icons.minusBottom);
			} else {// �ڵ�ر�

				$nodeImg.attr("src", obj.icons.plusBottom);
			}
		}
	} else {// һ��ڵ�

		// alert(node.id+"�Ƿ����ӽڵ㣺"+node.hasChildNode);

		if (node.isLeafNode == true || node.hasChildNode == false) {// û���ӽڵ�

			// <bean:message key="button.delete" bundle="${language}"/>�ڵ��¼�����ʽ
			node.hasClickEvent = false;

			$("#node_" + node.id + "_span").unbind();

			if (node.isLastNode == true) {// ���ڵ�

				$nodeImg.attr("src", obj.icons.joinBottom);
			} else {

				$nodeImg.attr("src", obj.icons.join);
			}
		} else {// �����ӽڵ�

			if (node.hasClickEvent == false) {

				// ���ӽڵ��¼�����ʽ
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

			// �жϽڵ㵱ǰ����״̬
			if (node.curOpenStatus == true) {// ��ǰ����

				if (node.isLastNode == true) {// ���ڵ�

					$nodeImg.attr("src", obj.icons.minusBottom);
				} else {

					$nodeImg.attr("src", obj.icons.minus);
				}
			} else {// ��ǰ�ر�

				if (node.isLastNode == true) {// ���ڵ�

					$nodeImg.attr("src", obj.icons.plusBottom);
				} else {

					$nodeImg.attr("src", obj.icons.plus);
				}
			}
		}
	}
}

// �ڵ����
function Node() {

	this.id;// �ڵ�ID��
	this.pid;// ���ڵ�ID��
	this.level;// �ڵ㼶��(�㼶--���ڵ�Ĭ��0��)
	this.isFirstOpen;// �Ƿ��һ�δ�(����û������¼�������ã���֮���վ�ִ�С�)
	this.curOpenStatus;// �ڵ㵱ǰ�Ƿ��
	// this.curVisiableStatus;//�ڵ㵱ǰ�Ƿ���ʾ
	this.isRootNode;// �Ƿ�Ϊ���ڵ�
	this.isLeafNode;// �Ƿ�ΪҶ�ڵ㣨���Ǳ���û���ӽڵ�Ľڵ㣩
	this.isLastNode;// �Ƿ�Ϊ���ڵ�
	this.childNodes;// �����¼��ӽڵ�ID����
	this.hasChildNode;// �Ƿ�����ӽڵ�
	this.iconBeforeInfo;// �ڵ�ͼ��֮ǰ����
	this.haveClickEvent;// �Ƿ���нڵ㵥���¼�
}

function HashMap() {

	this.length = 0;

	if (arguments > 1 && typeof(arguments[0]) == "string") {// ����ǰ׺

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