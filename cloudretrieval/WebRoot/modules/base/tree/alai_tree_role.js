function alai_tree_role(toObject) {
	var path = getScriptPath("alai_tree.js")

	if (path == null) {

		alert("run alai_tree_role() fail, please load alai_tree.js first!");

		return;
	}

	if (typeof(alai_tree) != "function") {

		alert("run alai_tree_role() fail, please load alai_tree.js firt!");

		return false;
	}

	var icons = new alai_imagelist()

	icons.path = path + "images/"
	icons.add("note", "default")
	icons.add("folderclose")
	icons.add("folderopen")
	icons.add("sun", "expand")
	icons.add("sun", "collapse")
	icons.add("navbar_awards", "leaf");
	icons.add("navbar_awards", "twig");

	var tree = new alai_tree(icons, 18, toObject)
	tree.afteradd = function(srcNode) {
		if (srcNode.parent != tree.root)
			srcNode.parent.icon.src = icons.item["folderopen"].src
	}
	tree.onexpand = function(srcNode) {
		srcNode.icon.src = icons.item["folderopen"].src
	}
	tree.oncollapse = function(srcNode) {
		srcNode.icon.src = icons.item["folderclose"].src
	}

	var colChkNode = []
	alai_tree.prototype.colChkNode = colChkNode
	alai_tree.prototype.addChkNode = function(toNode, viewText, value, ico,
			isTextField, defaultTextFieldValue, rulerID) {
		var newNode = this.add(toNode, "last", viewText, "", ico, "", "");

		var rulerElem = document.all(rulerID);

		var chkBox = document.createElement('<input type="Checkbox">')

		chkBox.value = value;

		newNode.label.insertAdjacentElement("beforeBegin", chkBox)
		newNode.isCheck = true
		newNode.oncheck = new Function("return true;")
		chkBox.onpropertychange = function() {
			if (newNode.oncheck())
				tree.oncheck(newNode, rulerElem)
		}
		colChkNode[colChkNode.length] = newNode
		newNode.checkBox = chkBox

		if (isTextField != "" & isTextField == "true") {

			var txtField = document
					.createElement('<input type="text" size="6">');

			txtField.value = defaultTextFieldValue;

			txtField.disabled = true;

			newNode.label.insertAdjacentElement("beforeBegin", txtField);

			txtField.onblur = function() {
				tree.onblur(newNode, rulerElem)
			}

			newNode.textField = txtField;
		}

		newNode.label.onclick = function() {

			tree.run(newNode.select);

			tree.run(newNode.execute);

			// tree.onview(newNode);
		}

		return newNode;

	}

	// alai_tree.prototype.oncheck=new Function("return true;");

	// alai_tree.prototype.onview=new Function("return true;");

	return tree;
}