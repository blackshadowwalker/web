(function() {
	var st = window.setTimeout;
	window.setTimeout = function(fn, mDelay) {
		var t = new Date().getTime();
		if (typeof fn == 'function') {
			var args = Array.prototype.slice.call(arguments, 2);
			var f = function() {
				// args.push(new Date().getTime()-t-mDelay);
				// //��������ʵ�ֶ�ʵ���ӳٺ��趨�ӳٵĲ�ֵ��ͬFF�����һ����������ʵ������
				fn.apply(null, args)
			};
			return st(f, mDelay);
		}
		return st(fn, mDelay);
	}
})();

var temp = 0;
var doNumber = 0;
var timeout = null;

function tempValueChange(treeN, newN, toN) {

	doNumber += 1;

	timeout = setTimeout(tempValueChange, 280, treeN, newN, toN);

	if (doNumber >= 2 && temp == 1) {
		temp = 0;
		doNumber = 0;
		clearTimeout(timeout);

		treeN.run(newN.select);

	}
	if (temp == 0) {
		clearTimeout(timeout);
		doNumber = 0;
	}
}

function alai_tree_zxjt(toObject) {
	var path = getScriptPath("alai_tree.js")

	if (path == null) {

		alert("run alai_tree_zxjt() fail, please load alai_tree.js first!");

		return;
	}

	if (typeof(alai_tree) != "function") {

		alert("run alai_tree_zxjt() fail, please load alai_tree firt!")

		return;
	}

	var icons = new alai_imagelist()
	icons.path = path + "images/"

	icons.add("expand_xp", "default");
	icons.add("collapse_xp")
	icons.add("expand_xp")
	icons.add("collapse_xp", "leaf");
	icons.add("folderopen", "home");
	icons.add("folderclose", "home_grey");
	icons.add("note", "user");
	icons.add("note", "user_grey");

	var tree = new alai_tree(icons, 18, toObject)
	tree.afteradd = function(srcNode) {
		if (srcNode.parent != tree.root) {

			srcNode.parent.icon.src = icons.item["collapse_xp"].src

		}
	}
	tree.onexpand = function(srcNode) {
		srcNode.icon.src = icons.item["collapse_xp"].src

		srcNode.label.ico.src = icons.item["home"].src;
	}
	tree.oncollapse = function(srcNode) {

		srcNode.icon.src = icons.item["expand_xp"].src

		srcNode.label.ico.src = icons.item["home_grey"].src;
	}

	var colNode = [];

	alai_tree.prototype.colNode = colNode;

	// ��ѡ�ڵ�
	alai_tree.prototype.addChkNode = function(toNode, viewText, value,
			nodeImageName, statusImageName) {
		var newNode = this.add(toNode, "last", viewText, value, nodeImageName,
				"", "");

		var tree = this;

		newNode.nodeType = "checkbox";// �жϽڵ�����
		newNode.opened = true;// �жϽڵ��Ƿ�򿪹�(��Ա�ڵ�Ĭ�����¼��ڵ�)

		if (typeof(statusImageName) == "string"
				&& icons.item[statusImageName] != null) {

			var tmpImage = new Image();

			tmpImage.src = icons.item[statusImageName].src;
			tmpImage.width = 16;
			tmpImage.height = 16;

			newNode.label.ico = tmpImage;
			newNode.label.insertAdjacentElement("beforeBegin", tmpImage);
		}

		newNode.icon.onclick = function() {

			tree.run(newNode.execute);

			tree.onview(newNode);

		}

		newNode.label.onclick = function() {

			tree.run(newNode.select);

			tree.oncheck(newNode, toNode);
		}

		return newNode;
	}

	// ��ѡ�ڵ�
	alai_tree.prototype.addRadNode = function(toNode, viewText, value,
			nodeImageName, statusImageName) {

		var newNode = this.add(toNode, "last", viewText, value, nodeImageName,
				"", "");

		newNode.nodeType = "radio";// �жϽڵ�����
		newNode.opened = true;// �жϽڵ��Ƿ�򿪹�(��Ա�ڵ�Ĭ�����¼��ڵ�)

		if (typeof(statusImageName) == "string"
				&& icons.item[statusImageName] != null) {

			var tmpImage = new Image();

			tmpImage.src = icons.item[statusImageName].src;
			tmpImage.width = 16;
			tmpImage.height = 16;

			newNode.label.ico = tmpImage;
			newNode.label.insertAdjacentElement("beforeBegin", tmpImage);
		}

		newNode.icon.onclick = function() {

			tree.run(newNode.execute);

			tree.onview(newNode);

		}

		newNode.label.onclick = function() {

			tree.run(newNode.select);

			tree.oncheck(newNode, toNode);
		}

		return newNode;
	}

	// һ����ʽ�ڵ㣨���޶�ѡ����ѡ��ť��
	alai_tree.prototype.addDefaultNode = function(toNode, viewText, value,
			nodeImageName, statusImageName) {

		var newNode = this.add(toNode, "last", viewText, value, nodeImageName,
				"", "");

		var hidden_textfield = document
				.createElement('<input type="hidden" name="dept_textfield">')

		hidden_textfield.value = value;

		newNode.label.insertAdjacentElement("beforeBegin", hidden_textfield);

		newNode.nodeType = "general";// �жϽڵ�����
		newNode.opened = false;// �жϽڵ��Ƿ�򿪹�

		colNode[colNode.length] = newNode;
		newNode.module = hidden_textfield;

		if (typeof(statusImageName) == "string"
				&& icons.item[statusImageName] != null) {

			var tmpImage = new Image();

			tmpImage.src = icons.item[statusImageName].src;
			tmpImage.width = 18;
			tmpImage.height = 18;

			newNode.label.ico = tmpImage;
			newNode.label.insertAdjacentElement("beforeBegin", tmpImage);
		}

		newNode.icon.onclick = function() {

			tree.run(newNode.execute);

			tree.onview(newNode);

		}

		newNode.label.onclick = function() { // �����������ֻѡ��

			temp += 1;
			tempValueChange(tree, newNode, toNode);
		};

		newNode.label.ondblclick = function() { // ˫���������Ƶ�ʱ��չ��

			temp = 0;
			doNumber = 0;

			tree.run(newNode.select);

			tree.run(newNode.execute);

			tree.onview(newNode);

		}

		return newNode;
	}

	return tree;
}