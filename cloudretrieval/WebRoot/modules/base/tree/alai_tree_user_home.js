function alai_tree_user(toObject) {
	var path = getScriptPath("alai_tree.js")

	if (path == null) {

		alert("run alai_tree_user() fail, please load alai_tree.js first!");

		return;
	}

	if (typeof(alai_tree) != "function") {

		alert("run alai_tree_user() fail, please load alai_tree firt!")

		return;
	}

	var icons = new alai_imagelist()
	icons.path = path + "images/"

	icons.add("expand_xp", "default");
	icons.add("expand_xp")
	icons.add("collapse_xp")
	icons.add("expand_xp")
	icons.add("", "expand")
	icons.add("", "collapse")
	icons.add("collapse_xp", "leaf");
	icons.add("home", "home");
	icons.add("home_grey", "home_grey");
	icons.add("user", "user");
	icons.add("user_grey", "user_grey");

	var tree = new alai_tree(icons, 18, toObject)
	tree.afteradd = function(srcNode) {
		if (srcNode.parent != tree.root)
			srcNode.parent.icon.src = icons.item["collapse_xp"].src
	}
	tree.onexpand = function(srcNode) {
		srcNode.icon.src = icons.item["collapse_xp"].src
	}
	tree.oncollapse = function(srcNode) {
		srcNode.icon.src = icons.item["expand_xp"].src
	}

	var colNode = [];

	alai_tree.prototype.colNode = colNode;

	// 多选节点
	alai_tree.prototype.addChkNode = function(toNode, viewText, value,
			nodeImageName, statusImageName) {
		var newNode = this.add(toNode, "last", viewText, "", nodeImageName, "",
				"");

		var chkBox = document.createElement('<input type="Checkbox">')

		chkBox.value = value;

		var tree = this;

		newNode.label.insertAdjacentElement("beforeBegin", chkBox);

		newNode.nodeType = "checkbox";// 判断节点类型
		newNode.opened = true;// 判断节点是否打开过(人员节点默认无下级节点)

		newNode.oncheck = new Function("return true;")
		chkBox.onpropertychange = function() {
			if (newNode.oncheck())
				tree.oncheck(newNode, toNode)
		}
		colNode[colNode.length] = newNode;
		newNode.module = chkBox;

		if (typeof(statusImageName) == "string"
				&& icons.item[statusImageName] != null) {

			var tmpImage = new Image();

			tmpImage.src = icons.item[statusImageName].src;
			tmpImage.width = 16;
			tmpImage.height = 16;

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

	// 单选节点
	alai_tree.prototype.addRadNode = function(toNode, viewText, value,
			nodeImageName, statusImageName) {

		var newNode = this.add(toNode, "last", viewText, "", nodeImageName, "",
				"");

		var radio = document
				.createElement('<input type="radio" name="userRadio">')

		radio.value = value;

		newNode.label.insertAdjacentElement("beforeBegin", radio);

		newNode.nodeType = "radio";// 判断节点类型
		newNode.opened = true;// 判断节点是否打开过(人员节点默认无下级节点)

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
			tmpImage.width = 16;
			tmpImage.height = 16;

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

	// 一般样式节点（即无多选、单选按钮）
	alai_tree.prototype.addDefaultNode = function(toNode, viewText, value,
			nodeImageName, statusImageName) {

		var newNode = this.add(toNode, "last", viewText, "", nodeImageName, "",
				"");

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
			tmpImage.width = 22;
			tmpImage.height = 17;

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