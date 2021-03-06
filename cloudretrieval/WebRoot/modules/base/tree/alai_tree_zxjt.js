(function() {
	var st = window.setTimeout;
	window.setTimeout = function(fn, mDelay) {
		var t = new Date().getTime();
		if (typeof fn == 'function') {
			var args = Array.prototype.slice.call(arguments, 2);
			var f = function() {
				// args.push(new Date().getTime()-t-mDelay);
				// //该行用于实现对实际延迟和设定延迟的差值，同FF的最后一个参数，无实际意义
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

	// 多选节点
	alai_tree.prototype.addChkNode = function(toNode, viewText, value,
			nodeImageName, statusImageName) {
		var newNode = this.add(toNode, "last", viewText, value, nodeImageName,
				"", "");

		var tree = this;

		newNode.nodeType = "checkbox";// 判断节点类型
		newNode.opened = true;// 判断节点是否打开过(人员节点默认无下级节点)

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

	// 单选节点
	alai_tree.prototype.addRadNode = function(toNode, viewText, value,
			nodeImageName, statusImageName) {

		var newNode = this.add(toNode, "last", viewText, value, nodeImageName,
				"", "");

		newNode.nodeType = "radio";// 判断节点类型
		newNode.opened = true;// 判断节点是否打开过(人员节点默认无下级节点)

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

	// 一般样式节点（即无多选、单选按钮）
	alai_tree.prototype.addDefaultNode = function(toNode, viewText, value,
			nodeImageName, statusImageName) {

		var newNode = this.add(toNode, "last", viewText, value, nodeImageName,
				"", "");

		var hidden_textfield = document
				.createElement('<input type="hidden" name="dept_textfield">')

		hidden_textfield.value = value;

		newNode.label.insertAdjacentElement("beforeBegin", hidden_textfield);

		newNode.nodeType = "general";// 判断节点类型
		newNode.opened = false;// 判断节点是否打开过

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

		newNode.label.onclick = function() { // 单击机构结点只选中

			temp += 1;
			tempValueChange(tree, newNode, toNode);
		};

		newNode.label.ondblclick = function() { // 双击机构名称的时候展开

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