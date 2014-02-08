function alai_tree_dept(toObject) {
	var path = getScriptPath("alai_tree.js")

	if (path == null) {

		alert("run alai_tree_dept() fail, please load alai_tree.js first!");

		return;
	}

	if (typeof(alai_tree) != "function") {
		alert("run alai_tree_dept() fail, please load alai_tree firt!")
		return
	}

	var icons = new alai_imagelist()
	icons.path = path + "images/"

	icons.add("expand_xp", "default");
	icons.add("collapse_xp")
	icons.add("expand_xp")
	icons.add("folderopen", "home");
	icons.add("folderclose", "home_grey");

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
			nodeImageName, statusImageName, tag) {
		var newNode = this.add(toNode, "last", viewText, "", nodeImageName, "",
				"");

		var tree = this;

		newNode.opened = false;// 判断节点是否打开过

		if (tag == true) {

			var chkBox = document.createElement('<input type="Checkbox">')

			chkBox.value = value;

			newNode.label.insertAdjacentElement("beforeBegin", chkBox);

			newNode.nodeType = "checkbox";// 判断节点类型

			newNode.oncheck = new Function("return true;")
			chkBox.onpropertychange = function() {
				if (newNode.oncheck())
					tree.oncheck(newNode, toNode)
			}

			newNode.module = chkBox;
		} else {

			var hiddenBox = document.createElement('<input type="hidden">')

			hiddenBox.value = value;

			newNode.label.insertAdjacentElement("beforeBegin", hiddenBox);

			newNode.nodeType = "hidden";// 判断节点类型

			newNode.module = hiddenBox;
		}

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

		newNode.label.ondblclick = function() { // 双击机构名称的时候

			tree.run(newNode.select);

			tree.run(newNode.execute);

			tree.onview(newNode);

		}
		return newNode;
	}

	// 单选节点
	alai_tree.prototype.addRadNode = function(toNode, viewText, value,
			nodeImageName, statusImageName) {

		var newNode = this.add(toNode, "last", viewText, "", nodeImageName, "",
				"");

		var radio = document
				.createElement('<input type="radio" name="deptRadio">')

		radio.value = value;

		newNode.label.insertAdjacentElement("beforeBegin", radio);

		newNode.nodeType = "radio";// 判断节点类型
		newNode.opened = false;// 判断节点是否打开过

		newNode.oncheck = new Function("return true;")
		radio.onpropertychange = function() {
			if (newNode.oncheck())
				tree.oncheck(newNode, toNode);
		}
		colNode[colNode.length] = newNode;
		newNode.module = radio;

		if (typeof(statusImageName) == "string"
				&& icons.item[statusImageName] != null) {

			var tmpImage = new Image();

			tmpImage.src = icons.item[statusImageName].src;
			tmpImage.width = 18;
			tmpImage.height = 18;

			newNode.label.ico = tmpImage;
			newNode.label.insertAdjacentElement("beforeBegin", tmpImage);
		}

		newNode.label.onclick = function() {

			tree.run(newNode.select);

			tree.run(newNode.execute);

			tree.onview(newNode);
		}

		return newNode;
	}

	return tree;
}