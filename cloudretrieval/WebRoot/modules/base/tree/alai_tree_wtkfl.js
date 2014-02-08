function alai_tree_wtkfl(toObject) {
	var path = getScriptPath("alai_tree.js")

	if (path == null) {

		alert("run alai_tree_wtkfl() fail, please load alai_tree.js first!");

		return;
	}

	if (typeof(alai_tree) != "function") {

		alert("run alai_tree_wtkfl() fail, please load alai_tree firt!")

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

	// �Զ���ڵ�
	alai_tree.prototype.addCustomNode = function(toNode, viewText, value,
			nodeImageName, statusImageName) {
		var newNode = this.add(toNode, "last", viewText, "", nodeImageName, "",
				"");

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

	// һ����ʽ�ڵ�
	alai_tree.prototype.addDefaultNode = function(toNode, viewText, value,
			nodeImageName, statusImageName) {

		var newNode = this.add(toNode, "last", viewText, "", nodeImageName, "",
				"");

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