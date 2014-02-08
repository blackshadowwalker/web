﻿/*
 * FCKeditor - The text editor for internet Copyright (C) 2003-2005 Frederico
 * Caldeira Knabben
 * 
 * Licensed under the terms of the GNU Lesser General Public License:
 * http://www.opensource.org/licenses/lgpl-license.php
 * 
 * For further information visit: http://www.fckeditor.net/
 * 
 * "Support Open Source software. What about a donation today?"
 * 
 * This file has been compacted for best loading performance.
 */
FCK.RedirectNamedCommands = new Object();
FCK.ExecuteNamedCommand = function(A, B, C) {
	FCKUndo.SaveUndoStep();
	if (!C && FCK.RedirectNamedCommands[A] != null)
		FCK.ExecuteRedirectedNamedCommand(A, B);
	else {
		FCK.Focus();
		FCK.EditorDocument.execCommand(A, false, B);
		FCK.Events.FireEvent('OnSelectionChange');
	};
	FCKUndo.SaveUndoStep();
};
FCK.GetNamedCommandState = function(A) {
	try {
		if (!FCK.EditorDocument.queryCommandEnabled(A))
			return FCK_TRISTATE_DISABLED;
		else
			return FCK.EditorDocument.queryCommandState(A)
					? FCK_TRISTATE_ON
					: FCK_TRISTATE_OFF;
	} catch (e) {
		return FCK_TRISTATE_OFF;
	};
};
FCK.GetNamedCommandValue = function(A) {
	var B = '';
	var C = FCK.GetNamedCommandState(A);
	if (C == FCK_TRISTATE_DISABLED)
		return null;
	try {
		B = this.EditorDocument.queryCommandValue(A);
	} catch (e) {
	};
	return B ? B : '';
};
FCK.PasteFromWord = function() {
	FCKDialog.OpenDialog('FCKDialog_Paste', FCKLang.PasteFromWord,
			'dialog/fck_paste.html', 400, 330, 'Word');
};
FCK.Preview = function() {
	var A = FCKConfig.ScreenWidth * 0.8;
	var B = FCKConfig.ScreenHeight * 0.7;
	var C = (FCKConfig.ScreenWidth - A) / 2;
	var D = window
			.open(
					'',
					null,
					'toolbar=yes,location=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width='
							+ A + ',height=' + B + ',left=' + C);
	var E;
	if (FCKConfig.FullPage) {
		if (FCK.TempBaseTag.length > 0)
			E = FCK.GetXHTML().replace(FCKRegexLib.HeadOpener,
					'$&' + FCK.TempBaseTag);
		else
			E = FCK.GetXHTML();
	} else {
		E = FCKConfig.DocType + '<html dir="' + FCKConfig.ContentLangDirection
				+ '">' + '<head><title>' + FCKLang.Preview + '</title>'
				+ '<link href="' + FCKConfig.EditorAreaCSS
				+ '" rel="stylesheet" type="text/css" />' + FCK.TempBaseTag
				+ '</head><body>' + FCK.GetXHTML() + '</body></html>';
	};
	D.document.write(E);
	D.document.close();
};
FCK.SwitchEditMode = function() {
	var A = (FCK.EditMode == FCK_EDITMODE_WYSIWYG);
	document.getElementById('eWysiwyg').style.display = A ? 'none' : '';
	document.getElementById('eSource').style.display = A ? '' : 'none';
	if (A) {
		if (FCKBrowserInfo.IsIE)
			FCKUndo.SaveUndoStep();
		document.getElementById('eSourceField').value = FCK
				.GetXHTML(FCKConfig.FormatSource);
	} else
		FCK.SetHTML(document.getElementById('eSourceField').value, true);
	FCK.EditMode = A ? FCK_EDITMODE_SOURCE : FCK_EDITMODE_WYSIWYG;
	FCKToolbarSet.RefreshModeState();
	FCK.Focus();
};
FCK.CreateElement = function(A) {
	var e = FCK.EditorDocument.createElement(A);
	return FCK.InsertElementAndGetIt(e);
};
FCK.InsertElementAndGetIt = function(e) {
	e.setAttribute('__FCKTempLabel', 1);
	this.InsertElement(e);
	var A = FCK.EditorDocument.getElementsByTagName(e.tagName);
	for (var i = 0; i < A.length; i++) {
		if (A[i].getAttribute('__FCKTempLabel')) {
			A[i].removeAttribute('__FCKTempLabel');
			return A[i];
		};
	};
	return null;
};
FCK.Paste = function() {
	if (FCKConfig.ForcePasteAsPlainText) {
		FCK.PasteAsPlainText();
		return false;
	} else if (FCKConfig.AutoDetectPasteFromWord) {
		var A = FCK.GetClipboardHTML();
		var B = /<\w[^>]*(( class="?MsoNormal"?)|(="mso-))/gi;
		if (B.test(A)) {
			if (confirm(FCKLang["PasteWordConfirm"])) {
				FCK.PasteFromWord();
				return false;
			};
		};
	} else
		return true;
};
FCK.PasteAsPlainText = function() {
	var A = FCKTools.HTMLEncode(clipboardData.getData("Text"));
	A = A.replace(/\n/g, '<BR>');
	this.InsertHtml(A);
};
FCK.InsertElement = function(A) {
	FCK.InsertHtml(A.outerHTML);
};
FCK.GetClipboardHTML = function() {
	var A = document.getElementById('___FCKHiddenDiv');
	if (!A) {
		var A = document.createElement('DIV');
		A.id = '___FCKHiddenDiv';
		A.style.visibility = 'hidden';
		A.style.overflow = 'hidden';
		A.style.position = 'absolute';
		A.style.width = 1;
		A.style.height = 1;
		document.body.appendChild(A);
	};
	A.innerHTML = '';
	var C = document.body.createTextRange();
	C.moveToElementText(A);
	C.execCommand('Paste');
	var D = A.innerHTML;
	A.innerHTML = '';
	return D;
};
FCK.AttachToOnSelectionChange = function(A) {
	this.Events.AttachEvent('OnSelectionChange', A);
};
FCK.CreateLink = function(A) {
	FCK.ExecuteNamedCommand('Unlink');
	if (A.length > 0) {
		var B = 'javascript:void(0);/*' + (new Date().getTime()) + '*/';
		FCK.ExecuteNamedCommand('CreateLink', B);
		var C = this.EditorDocument.links;
		for (i = 0; i < C.length; i++) {
			if (C[i].href == B) {
				C[i].href = A;
				return C[i];
			};
		};
	};
};
var FCKSelection = new Object();
FCK.Selection = FCKSelection;
FCKSelection.GetType = function() {
	return FCK.EditorDocument.selection.type;
};
FCKSelection.GetSelectedElement = function() {
	if (this.GetType() == 'Control') {
		var A = FCK.EditorDocument.selection.createRange();
		if (A && A.item)
			return FCK.EditorDocument.selection.createRange().item(0);
	};
};
FCKSelection.GetParentElement = function() {
	switch (this.GetType()) {
		case 'Control' :
			return FCKSelection.GetSelectedElement().parentElement;
		case 'None' :
			return;
		default :
			return FCK.EditorDocument.selection.createRange().parentElement();
	};
};
FCKSelection.SelectNode = function(A) {
	FCK.Focus();
	FCK.EditorDocument.selection.empty();
	var B = FCK.EditorDocument.selection.createRange();
	B.moveToElementText(A);
	B.select();
};
FCKSelection.Collapse = function(A) {
	FCK.Focus();
	var B = FCK.EditorDocument.selection.createRange();
	B.collapse(A == null || A === true);
	B.select();
};
FCKSelection.HasAncestorNode = function(A) {
	var B;
	if (FCK.EditorDocument.selection.type == "Control") {
		B = this.GetSelectedElement();
	} else {
		var C = FCK.EditorDocument.selection.createRange();
		B = C.parentElement();
	};
	while (B) {
		if (B.tagName == A)
			return true;
		B = B.parentNode;
	};
	return false;
};
FCKSelection.MoveToAncestorNode = function(A) {
	var B;
	if (FCK.EditorDocument.selection.type == "Control") {
		var C = FCK.EditorDocument.selection.createRange();
		for (i = 0; i < C.length; i++) {
			if (C(i).parentNode) {
				B = C(i).parentNode;
				break;
			};
		};
	} else {
		var C = FCK.EditorDocument.selection.createRange();
		B = C.parentElement();
	};
	while (B && B.nodeName != A)
		B = B.parentNode;
	return B;
};
FCKSelection.Delete = function() {
	var A = FCK.EditorDocument.selection;
	if (A.type.toLowerCase() != "none") {
		A.clear();
	};
	return A;
};
var FCKPanel = function(A) {
	this.IsRTL = false;
	this.IsContextMenu = false;
	this._IsOpened = false;
	this._Window = A ? A : window;
	this._Popup = this._Window.createPopup();
	this.Document = this._Popup.document;
	this.PanelDiv = this.Document.body.appendChild(this.Document
			.createElement('DIV'));
	this.PanelDiv.className = 'FCK_Panel';
	this.EnableContextMenu(false);
	this.SetDirection(FCKLang.Dir);
};
FCKPanel.prototype.EnableContextMenu = function(A) {
	this.Document.oncontextmenu = A ? null : FCKTools.CancelEvent;
};
FCKPanel.prototype.AppendStyleSheet = function(A) {
	FCKTools.AppendStyleSheet(this.Document, A);
};
FCKPanel.prototype.SetDirection = function(A) {
	this.IsRTL = (A == 'rtl');
	this.Document.dir = A;
};
FCKPanel.prototype.Load = function(x, y, A) {
	this._Popup.show(x, y, 0, 0, A);
};
FCKPanel.prototype.Show = function(x, y, A, B, C) {
	this.Load(x, y, A);
	this.PanelDiv.style.width = B ? B + 'px' : '';
	this.PanelDiv.style.height = C ? C + 'px' : '';
	if (this.IsRTL) {
		if (this.IsContextMenu)
			x = x - this.PanelDiv.offsetWidth + 1;
		else if (A)
			x = x + (A.offsetWidth - this.PanelDiv.offsetWidth);
	};
	this._Popup.show(x, y, this.PanelDiv.offsetWidth,
			this.PanelDiv.offsetHeight, A);
	if (this._OnHide) {
		if (FCKPanel_ActivePopupInfo.Timer)
			CheckPopupOnHide();
		FCKPanel_ActivePopupInfo.Timer = window.setInterval(CheckPopupOnHide,
				200);
		FCKPanel_ActivePopupInfo.Panel = this;
	};
	this._IsOpened = true;
};
FCKPanel.prototype.Hide = function() {
	this._Popup.hide();
};
FCKPanel.prototype.CheckIsOpened = function() {
	return this._Popup.isOpen;
};
FCKPanel.prototype.AttachToOnHideEvent = function(A) {
	this._OnHide = A;
};
var FCKPanel_ActivePopupInfo = new Object();
function CheckPopupOnHide() {
	var oPanel = FCKPanel_ActivePopupInfo.Panel;
	if (oPanel && !oPanel._Popup.isOpen) {
		window.clearInterval(FCKPanel_ActivePopupInfo.Timer);
		if (oPanel._OnHide)
			oPanel._OnHide(oPanel);
		FCKPanel_ActivePopupInfo.Timer = null;
		FCKPanel_ActivePopupInfo.Panel = null;
	};
}
var FCKTableHandler = new Object();
FCKTableHandler.InsertRow = function() {
	var A = FCKSelection.MoveToAncestorNode("TR");
	if (!A)
		return;
	var B = A.cloneNode(true);
	A.parentNode.insertBefore(B, A);
	FCKTableHandler.ClearRow(A);
};
FCKTableHandler.DeleteRows = function(A) {
	if (!A)
		A = FCKSelection.MoveToAncestorNode("TR");
	if (!A)
		return;
	var B = FCKTools.GetElementAscensor(A, 'TABLE');
	if (B.rows.length == 1) {
		FCKTableHandler.DeleteTable(B);
		return;
	};
	A.parentNode.removeChild(A);
};
FCKTableHandler.DeleteTable = function(A) {
	if (!A) {
		var A = FCKSelection.GetSelectedElement();
		if (!A || A.tagName != 'TABLE')
			A = FCKSelection.MoveToAncestorNode("TABLE");
	};
	if (!A)
		return;
	FCKSelection.SelectNode(A);
	FCKSelection.Collapse();
	A.parentNode.removeChild(A);
};
FCKTableHandler.InsertColumn = function() {
	var A = FCKSelection.MoveToAncestorNode("TD");
	if (!A)
		A = FCKSelection.MoveToAncestorNode("TH");
	if (!A)
		return;
	var B = FCKTools.GetElementAscensor(A, 'TABLE');
	var C = A.cellIndex + 1;
	for (var i = 0; i < B.rows.length; i++) {
		var D = B.rows[i];
		if (D.cells.length < C)
			continue;
		A = D.cells[C - 1].cloneNode(false);
		if (FCKBrowserInfo.IsGecko)
			A.innerHTML = FCKBrowserInfo.IsGecko ? GECKO_BOGUS : '';
		var E = D.cells[C];
		if (E)
			D.insertBefore(A, E);
		else
			D.appendChild(A);
	};
};
FCKTableHandler.DeleteColumns = function() {
	var A = FCKSelection.MoveToAncestorNode('TD')
			|| FCKSelection.MoveToAncestorNode('TH');
	if (!A)
		return;
	var B = FCKTools.GetElementAscensor(A, 'TABLE');
	var C = A.cellIndex;
	for (var i = B.rows.length - 1; i >= 0; i--) {
		var D = B.rows[i];
		if (C == 0 && D.cells.length == 1) {
			FCKTableHandler.DeleteRows(D);
			continue;
		};
		if (D.cells[C])
			D.removeChild(D.cells[C]);
	};
};
FCKTableHandler.InsertCell = function(A) {
	var B = A ? A : FCKSelection.MoveToAncestorNode("TD");
	if (!B)
		return;
	var C = FCK.EditorDocument.createElement("TD");
	if (FCKBrowserInfo.IsGecko)
		C.innerHTML = GECKO_BOGUS;
	if (B.cellIndex == B.parentNode.cells.length - 1) {
		B.parentNode.appendChild(C);
	} else {
		B.parentNode.insertBefore(C, B.nextSibling);
	};
	return C;
};
FCKTableHandler.DeleteCell = function(A) {
	if (A.parentNode.cells.length == 1) {
		FCKTableHandler.DeleteRows(FCKTools.GetElementAscensor(A, 'TR'));
		return;
	};
	A.parentNode.removeChild(A);
};
FCKTableHandler.DeleteCells = function() {
	var A = FCKTableHandler.GetSelectedCells();
	for (var i = A.length - 1; i >= 0; i--) {
		FCKTableHandler.DeleteCell(A[i]);
	};
};
FCKTableHandler.MergeCells = function() {
	var A = FCKTableHandler.GetSelectedCells();
	if (A.length < 2)
		return;
	if (A[0].parentNode != A[A.length - 1].parentNode)
		return;
	var B = isNaN(A[0].colSpan) ? 1 : A[0].colSpan;
	var C = '';
	for (var i = A.length - 1; i > 0; i--) {
		B += isNaN(A[i].colSpan) ? 1 : A[i].colSpan;
		C = A[i].innerHTML + C;
		FCKTableHandler.DeleteCell(A[i]);
	};
	A[0].colSpan = B;
	A[0].innerHTML += C;
};
FCKTableHandler.SplitCell = function() {
	var A = FCKTableHandler.GetSelectedCells();
	if (A.length != 1)
		return;
	var B = this._CreateTableMap(A[0].parentNode.parentNode);
	var C = FCKTableHandler
			._GetCellIndexSpan(B, A[0].parentNode.rowIndex, A[0]);
	var D = this._GetCollumnCells(B, C);
	for (var i = 0; i < D.length; i++) {
		if (D[i] == A[0]) {
			var E = this.InsertCell(A[0]);
			if (!isNaN(A[0].rowSpan) && A[0].rowSpan > 1)
				E.rowSpan = A[0].rowSpan;
		} else {
			if (isNaN(D[i].colSpan))
				D[i].colSpan = 2;
			else
				D[i].colSpan += 1;
		};
	};
};
FCKTableHandler._GetCellIndexSpan = function(A, B, C) {
	if (A.length < B + 1)
		return null;
	var D = A[B];
	for (var c = 0; c < D.length; c++) {
		if (D[c] == C)
			return c;
	};
	return null;
};
FCKTableHandler._GetCollumnCells = function(A, B) {
	var C = new Array();
	for (var r = 0; r < A.length; r++) {
		var D = A[r][B];
		if (D && (C.length == 0 || C[C.length - 1] != D))
			C[C.length] = D;
	};
	return C;
};
FCKTableHandler._CreateTableMap = function(A) {
	var B = A.rows;
	var r = -1;
	var C = new Array();
	for (var i = 0; i < B.length; i++) {
		r++;
		if (!C[r])
			C[r] = new Array();
		var c = -1;
		for (var j = 0; j < B[i].cells.length; j++) {
			var D = B[i].cells[j];
			c++;
			while (C[r][c])
				c++;
			var E = isNaN(D.colSpan) ? 1 : D.colSpan;
			var F = isNaN(D.rowSpan) ? 1 : D.rowSpan;
			for (var G = 0; G < F; G++) {
				if (!C[r + G])
					C[r + G] = new Array();
				for (var H = 0; H < E; H++) {
					C[r + G][c + H] = B[i].cells[j];
				};
			};
			c += E - 1;
		};
	};
	return C;
};
FCKTableHandler.ClearRow = function(A) {
	var B = A.cells;
	for (var i = 0; i < B.length; i++) {
		if (FCKBrowserInfo.IsGecko)
			B[i].innerHTML = GECKO_BOGUS;
		else
			B[i].innerHTML = '';
	};
};
FCKTableHandler.GetSelectedCells = function() {
	var A = new Array();
	var B = FCK.EditorDocument.selection.createRange();
	var C = FCKSelection.GetParentElement();
	if (C && C.tagName == "TD")
		A[0] = C;
	else {
		var C = FCKSelection.MoveToAncestorNode("TABLE");
		if (C) {
			for (var i = 0; i < C.cells.length; i++) {
				var E = FCK.EditorDocument.selection.createRange();
				E.moveToElementText(C.cells[i]);
				if (B.inRange(E)
						|| (B.compareEndPoints('StartToStart', E) >= 0 && B
								.compareEndPoints('StartToEnd', E) <= 0)
						|| (B.compareEndPoints('EndToStart', E) >= 0 && B
								.compareEndPoints('EndToEnd', E) <= 0)) {
					A[A.length] = C.cells[i];
				};
			};
		};
	};
	return A;
};
var FCKXml;
if (!(FCKXml = NS.FCKXml)) {
	FCKXml = NS.FCKXml = function() {
		this.Error = false;
	};
	FCKXml.prototype.LoadUrl = function(A) {
		this.Error = false;
		var B = FCKTools.CreateXmlObject('XmlHttp');
		if (!B) {
			this.Error = true;
			return;
		};
		B.open("GET", A, false);
		B.send(null);
		if (B.status == 200 || B.status == 304)
			this.DOMDocument = B.responseXML;
		else if (B.status == 0 && B.readyState == 4) {
			this.DOMDocument = FCKTools.CreateXmlObject('DOMDocument');
			this.DOMDocument.async = false;
			this.DOMDocument.resolveExternals = false;
			this.DOMDocument.loadXML(B.responseText);
		} else {
			this.Error = true;
			alert('Error loading "' + A + '"');
		};
	};
	FCKXml.prototype.SelectNodes = function(A, B) {
		if (this.Error)
			return new Array();
		if (B)
			return B.selectNodes(A);
		else
			return this.DOMDocument.selectNodes(A);
	};
	FCKXml.prototype.SelectSingleNode = function(A, B) {
		if (this.Error)
			return;
		if (B)
			return B.selectSingleNode(A);
		else
			return this.DOMDocument.selectSingleNode(A);
	};
}
var FCKStyleDef = function(A, B) {
	this.Name = A;
	this.Element = B.toUpperCase();
	this.IsObjectElement = FCKRegexLib.ObjectElements.test(this.Element);
	this.Attributes = new Object();
};
FCKStyleDef.prototype.AddAttribute = function(A, B) {
	this.Attributes[A] = B;
};
FCKStyleDef.prototype.GetOpenerTag = function() {
	var s = '<' + this.Element;
	for (var a in this.Attributes)
		s += ' ' + a + '="' + this.Attributes[a] + '"';
	return s + '>';
};
FCKStyleDef.prototype.GetCloserTag = function() {
	return '</' + this.Element + '>';
};
FCKStyleDef.prototype.RemoveFromSelection = function() {
	if (FCKSelection.GetType() == 'Control')
		this._RemoveMe(FCKSelection.GetSelectedElement());
	else
		this._RemoveMe(FCKSelection.GetParentElement());
}
FCKStyleDef.prototype.ApplyToSelection = function() {
	var A = FCK.EditorDocument.selection;
	if (A.type == 'Text') {
		var B = A.createRange();
		var e = document.createElement(this.Element);
		e.innerHTML = B.htmlText;
		this._AddAttributes(e);
		this._RemoveDuplicates(e);
		B.pasteHTML(e.outerHTML);
	} else if (A.type == 'Control') {
		var C = FCKSelection.GetSelectedElement();
		if (C.tagName == this.Element)
			this._AddAttributes(C);
	};
};
FCKStyleDef.prototype._AddAttributes = function(A) {
	for (var a in this.Attributes) {
		switch (a.toLowerCase()) {
			case 'style' :
				A.style.cssText = this.Attributes[a];
				break;
			case 'class' :
				A.setAttribute('className', this.Attributes[a], 0);
				break;
			default :
				A.setAttribute(a, this.Attributes[a], 0);
		};
	};
};
FCKStyleDef.prototype._RemoveDuplicates = function(A) {
	for (var i = 0; i < A.children.length; i++) {
		var B = A.children[i];
		this._RemoveDuplicates(B);
		if (this.IsEqual(B))
			FCKTools.RemoveOuterTags(B);
	};
};
FCKStyleDef.prototype.IsEqual = function(e) {
	if (e.tagName != this.Element)
		return false;
	for (var a in this.Attributes) {
		switch (a.toLowerCase()) {
			case 'style' :
				if (e.style.cssText.toLowerCase() != this.Attributes[a]
						.toLowerCase())
					return false;
				break;
			case 'class' :
				if (e.getAttribute('className', 0) != this.Attributes[a])
					return false;
				break;
			default :
				if (e.getAttribute(a, 0) != this.Attributes[a])
					return false;
		};
	};
	return true;
};
FCKStyleDef.prototype._RemoveMe = function(A) {
	if (!A)
		return;
	var B = A.parentElement;
	if (this.IsEqual(A)) {
		if (this.IsObjectElement) {
			for (var a in this.Attributes) {
				switch (a.toLowerCase()) {
					case 'class' :
						A.removeAttribute('className', 0);
						break;
					default :
						A.removeAttribute(a, 0);
				};
			};
			return;
		} else
			FCKTools.RemoveOuterTags(A);
	};
	this._RemoveMe(B);
}
var FCKStylesLoader = function() {
	this.Styles = new Object();
	this.StyleGroups = new Object();
	this.Loaded = false;
	this.HasObjectElements = false;
};
FCKStylesLoader.prototype.Load = function(A) {
	var B = new FCKXml();
	B.LoadUrl(A);
	var C = B.SelectNodes('Styles/Style');
	for (var i = 0; i < C.length; i++) {
		var D = C[i].attributes.getNamedItem('element').value.toUpperCase();
		var E = new FCKStyleDef(C[i].attributes.getNamedItem('name').value, D);
		if (E.IsObjectElement)
			this.HasObjectElements = true;
		var F = B.SelectNodes('Attribute', C[i]);
		for (var j = 0; j < F.length; j++) {
			var G = F[j].attributes.getNamedItem('name').value;
			var H = F[j].attributes.getNamedItem('value').value;
			if (G.toLowerCase() == 'style') {
				var I = document.createElement('SPAN');
				I.style.cssText = H;
				H = I.style.cssText;
			};
			E.AddAttribute(G, H);
		};
		this.Styles[E.Name] = E;
		var J = this.StyleGroups[D];
		if (J == null) {
			this.StyleGroups[D] = new Array();
			J = this.StyleGroups[D];
		};
		J[J.length] = E;
	};
	this.Loaded = true;
}
var FCKNamedCommand = function(A) {
	this.Name = A;
};
FCKNamedCommand.prototype.Execute = function() {
	FCK.ExecuteNamedCommand(this.Name);
};
FCKNamedCommand.prototype.GetState = function() {
	return FCK.GetNamedCommandState(this.Name);
};
var FCKDialogCommand = function(A, B, C, D, E, F, G) {
	this.Name = A;
	this.Title = B;
	this.Url = C;
	this.Width = D;
	this.Height = E;
	this.GetStateFunction = F;
	this.GetStateParam = G;
};
FCKDialogCommand.prototype.Execute = function() {
	FCKDialog.OpenDialog('FCKDialog_' + this.Name, this.Title, this.Url,
			this.Width, this.Height);
};
FCKDialogCommand.prototype.GetState = function() {
	if (this.GetStateFunction)
		return this.GetStateFunction(this.GetStateParam);
	else
		return FCK_TRISTATE_OFF;
};
var FCKUndefinedCommand = function() {
	this.Name = 'Undefined';
};
FCKUndefinedCommand.prototype.Execute = function() {
	alert(FCKLang.NotImplemented);
};
FCKUndefinedCommand.prototype.GetState = function() {
	return FCK_TRISTATE_OFF;
};
var FCKFontNameCommand = function() {
	this.Name = 'FontName';
};
FCKFontNameCommand.prototype.Execute = function(A) {
	if (A == null || A == "") {
	} else
		FCK.ExecuteNamedCommand('FontName', A);
};
FCKFontNameCommand.prototype.GetState = function() {
	return FCK.GetNamedCommandValue('FontName');
};
var FCKFontSizeCommand = function() {
	this.Name = 'FontSize';
};
FCKFontSizeCommand.prototype.Execute = function(A) {
	if (typeof(A) == 'string')
		A = parseInt(A);
	if (A == null || A == '') {
		FCK.ExecuteNamedCommand('FontSize', 3);
	} else
		FCK.ExecuteNamedCommand('FontSize', A);
};
FCKFontSizeCommand.prototype.GetState = function() {
	return FCK.GetNamedCommandValue('FontSize');
};
var FCKFormatBlockCommand = function() {
	this.Name = 'FormatBlock';
};
FCKFormatBlockCommand.prototype.Execute = function(A) {
	if (A == null || A == '')
		FCK.ExecuteNamedCommand('FormatBlock', '<P>');
	else if (A == 'div' && FCKBrowserInfo.IsGecko)
		FCK.ExecuteNamedCommand('FormatBlock', 'div');
	else
		FCK.ExecuteNamedCommand('FormatBlock', '<' + A + '>');
};
FCKFormatBlockCommand.prototype.GetState = function() {
	return FCK.GetNamedCommandValue('FormatBlock');
};
var FCKPreviewCommand = function() {
	this.Name = 'Preview';
};
FCKPreviewCommand.prototype.Execute = function() {
	FCK.Preview();
};
FCKPreviewCommand.prototype.GetState = function() {
	return FCK_TRISTATE_OFF;
};
var FCKSaveCommand = function() {
	this.Name = 'Save';
};
FCKSaveCommand.prototype.Execute = function() {
	var A = FCK.LinkedField.form;
	if (typeof(A.onsubmit) == 'function') {
		var B = A.onsubmit();
		if (B != null && B === false)
			return;
	};
	A.submit();
};
FCKSaveCommand.prototype.GetState = function() {
	return FCK_TRISTATE_OFF;
};
var FCKNewPageCommand = function() {
	this.Name = 'NewPage';
};
FCKNewPageCommand.prototype.Execute = function() {
	FCKUndo.SaveUndoStep();
	FCK.SetHTML('');
	FCKUndo.Typing = true;
};
FCKNewPageCommand.prototype.GetState = function() {
	return FCK_TRISTATE_OFF;
};
var FCKSourceCommand = function() {
	this.Name = 'Source';
};
FCKSourceCommand.prototype.Execute = function() {
	if (FCKBrowserInfo.IsGecko) {
		var A = FCKConfig.ScreenWidth * 0.65;
		var B = FCKConfig.ScreenHeight * 0.65;
		FCKDialog.OpenDialog('FCKDialog_Source', FCKLang.Source,
				'dialog/fck_source.html', A, B, null, null, true);
	} else
		FCK.SwitchEditMode();
};
FCKSourceCommand.prototype.GetState = function() {
	return (FCK.EditMode == FCK_EDITMODE_WYSIWYG
			? FCK_TRISTATE_OFF
			: FCK_TRISTATE_ON);
};
var FCKUndoCommand = function() {
	this.Name = 'Undo';
};
FCKUndoCommand.prototype.Execute = function() {
	if (FCKBrowserInfo.IsIE)
		FCKUndo.Undo();
	else
		FCK.ExecuteNamedCommand('Undo');
};
FCKUndoCommand.prototype.GetState = function() {
	if (FCKBrowserInfo.IsIE)
		return (FCKUndo.CheckUndoState()
				? FCK_TRISTATE_OFF
				: FCK_TRISTATE_DISABLED);
	else
		return FCK.GetNamedCommandState('Undo');
};
var FCKRedoCommand = function() {
	this.Name = 'Redo';
};
FCKRedoCommand.prototype.Execute = function() {
	if (FCKBrowserInfo.IsIE)
		FCKUndo.Redo();
	else
		FCK.ExecuteNamedCommand('Redo');
};
FCKRedoCommand.prototype.GetState = function() {
	if (FCKBrowserInfo.IsIE)
		return (FCKUndo.CheckRedoState()
				? FCK_TRISTATE_OFF
				: FCK_TRISTATE_DISABLED);
	else
		return FCK.GetNamedCommandState('Redo');
};
var FCKPageBreakCommand = function() {
	this.Name = 'PageBreak';
};
FCKPageBreakCommand.prototype.Execute = function() {
	var e = FCK.EditorDocument.createElement('DIV');
	e.style.pageBreakAfter = 'always';
	e.innerHTML = '<span style="DISPLAY:none">&nbsp;</span>';
	var A = FCKDocumentProcessors_CreateFakeImage('FCK__PageBreak', e);
	A = FCK.InsertElement(A);
};
FCKPageBreakCommand.prototype.GetState = function() {
	return 0;
}
var FCKSpellCheckCommand = function() {
	this.Name = 'SpellCheck';
	this.IsEnabled = (FCKConfig.SpellChecker == 'ieSpell' || FCKConfig.SpellChecker == 'SpellerPages');
};
FCKSpellCheckCommand.prototype.Execute = function() {
	switch (FCKConfig.SpellChecker) {
		case 'ieSpell' :
			this._RunIeSpell();
			break;
		case 'SpellerPages' :
			FCKDialog.OpenDialog('FCKDialog_SpellCheck', 'Spell Check',
					'dialog/fck_spellerpages.html', 440, 480);
			break;
	};
};
FCKSpellCheckCommand.prototype._RunIeSpell = function() {
	try {
		var A = new ActiveXObject("ieSpell.ieSpellExtension");
		A.CheckAllLinkedDocuments(FCK.EditorDocument);
	} catch (e) {
		if (e.number == -2146827859) {
			if (confirm(FCKLang.IeSpellDownload))
				window.open(FCKConfig.IeSpellDownloadUrl, 'IeSpellDownload');
		} else
			alert('Error Loading ieSpell: ' + e.message + ' (' + e.number + ')');
	};
};
FCKSpellCheckCommand.prototype.GetState = function() {
	return this.IsEnabled ? FCK_TRISTATE_OFF : FCK_TRISTATE_DISABLED;
}
var FCKTextColorCommand = function(A) {
	this.Name = A == 'ForeColor' ? 'TextColor' : 'BGColor';
	this.Type = A;
	this._Panel = new FCKPanel();
	this._Panel.AppendStyleSheet(FCKConfig.SkinPath + 'fck_contextmenu.css');
	this._CreatePanelBody(this._Panel.Document, this._Panel.PanelDiv);
	FCKTools.DisableSelection(this._Panel.Document.body);
};
FCKTextColorCommand.prototype.Execute = function(A, B, C) {
	FCK._ActiveColorPanelType = this.Type;
	this._Panel.Show(A, B, C);
};
FCKTextColorCommand.prototype.SetColor = function(A) {
	if (FCK._ActiveColorPanelType == 'ForeColor')
		FCK.ExecuteNamedCommand('ForeColor', A);
	else if (FCKBrowserInfo.IsGecko)
		FCK.ExecuteNamedCommand('hilitecolor', A);
	else
		FCK.ExecuteNamedCommand('BackColor', A);
	delete FCK._ActiveColorPanelType;
};
FCKTextColorCommand.prototype.GetState = function() {
	return FCK_TRISTATE_OFF;
};
function FCKTextColorCommand_OnMouseOver() {
	this.className = 'ColorSelected';
};
function FCKTextColorCommand_OnMouseOut() {
	this.className = 'ColorDeselected';
};
function FCKTextColorCommand_OnClick() {
	this.className = 'ColorDeselected';
	this.Command.SetColor('#' + this.Color);
	this.Command._Panel.Hide();
};
function FCKTextColorCommand_AutoOnClick() {
	this.className = 'ColorDeselected';
	this.Command.SetColor('');
	this.Command._Panel.Hide();
};
function FCKTextColorCommand_MoreOnClick() {
	this.className = 'ColorDeselected';
	this.Command._Panel.Hide();
	FCKDialog.OpenDialog('FCKDialog_Color', FCKLang.DlgColorTitle,
			'dialog/fck_colorselector.html', 400, 330, this.Command.SetColor);
};
FCKTextColorCommand.prototype._CreatePanelBody = function(A, B) {
	function CreateSelectionDiv() {
		var C = A.createElement("DIV");
		C.className = 'ColorDeselected';
		C.onmouseover = FCKTextColorCommand_OnMouseOver;
		C.onmouseout = FCKTextColorCommand_OnMouseOut;
		return C;
	};
	var D = B.appendChild(A.createElement("TABLE"));
	D.className = 'ForceBaseFont';
	D.style.tableLayout = 'fixed';
	D.cellPadding = 0;
	D.cellSpacing = 0;
	D.border = 0;
	D.width = 150;
	var E = D.insertRow(-1).insertCell(-1);
	E.colSpan = 8;
	var C = E.appendChild(CreateSelectionDiv());
	C.innerHTML = '<table cellspacing="0" cellpadding="0" width="100%" border="0">\<tr>\<td><div class="ColorBoxBorder"><div class="ColorBox" style="background-color: #000000"></div></div></td>\<td nowrap width="100%" align="center">'
			+ FCKLang.ColorAutomatic + '</td>\</tr>\</table>';
	C.Command = this;
	C.onclick = FCKTextColorCommand_AutoOnClick;
	var G = FCKConfig.FontColors.toString().split(',');
	var H = 0;
	while (H < G.length) {
		var I = D.insertRow(-1);
		for (var i = 0; i < 8 && H < G.length; i++, H++) {
			C = I.insertCell(-1).appendChild(CreateSelectionDiv());
			C.Color = G[H];
			C.innerHTML = '<div class="ColorBoxBorder"><div class="ColorBox" style="background-color: #'
					+ G[H] + '"></div></div>';
			C.Command = this;
			C.onclick = FCKTextColorCommand_OnClick;
		};
	};
	E = D.insertRow(-1).insertCell(-1);
	E.colSpan = 8;
	C = E.appendChild(CreateSelectionDiv());
	C.innerHTML = '<table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td nowrap align="center">'
			+ FCKLang.ColorMoreColors + '</td></tr></table>';
	C.Command = this;
	C.onclick = FCKTextColorCommand_MoreOnClick;
}
var FCKPastePlainTextCommand = function() {
	this.Name = 'PasteText';
};
FCKPastePlainTextCommand.prototype.Execute = function() {
	FCK.PasteAsPlainText();
};
FCKPastePlainTextCommand.prototype.GetState = function() {
	return FCK.GetNamedCommandState('Paste');
};
var FCKPasteWordCommand = function() {
	this.Name = 'PasteWord';
};
FCKPasteWordCommand.prototype.Execute = function() {
	FCK.PasteFromWord();
};
FCKPasteWordCommand.prototype.GetState = function() {
	if (FCKConfig.ForcePasteAsPlainText)
		return FCK_TRISTATE_DISABLED;
	else
		return FCK.GetNamedCommandState('Paste');
};
var FCKTableCommand = function(A) {
	this.Name = A;
};
FCKTableCommand.prototype.Execute = function() {
	FCKUndo.SaveUndoStep();
	switch (this.Name) {
		case 'TableInsertRow' :
			FCKTableHandler.InsertRow();
			break;
		case 'TableDeleteRows' :
			FCKTableHandler.DeleteRows();
			break;
		case 'TableInsertColumn' :
			FCKTableHandler.InsertColumn();
			break;
		case 'TableDeleteColumns' :
			FCKTableHandler.DeleteColumns();
			break;
		case 'TableInsertCell' :
			FCKTableHandler.InsertCell();
			break;
		case 'TableDeleteCells' :
			FCKTableHandler.DeleteCells();
			break;
		case 'TableMergeCells' :
			FCKTableHandler.MergeCells();
			break;
		case 'TableSplitCell' :
			FCKTableHandler.SplitCell();
			break;
		case 'TableDelete' :
			FCKTableHandler.DeleteTable();
			break;
		default :
			alert(FCKLang.UnknownCommand.replace(/%1/g, this.Name));
	};
};
FCKTableCommand.prototype.GetState = function() {
	return FCK_TRISTATE_OFF;
}
var FCKStyleCommand = function() {
	this.Name = 'Style';
	this.StylesLoader = new FCKStylesLoader();
	this.StylesLoader.Load(FCKConfig.StylesXmlPath);
	this.Styles = this.StylesLoader.Styles;
};
FCKStyleCommand.prototype.Execute = function(A, B) {
	FCKUndo.SaveUndoStep();
	if (B.Selected)
		B.Style.RemoveFromSelection();
	else
		B.Style.ApplyToSelection();
	FCKUndo.SaveUndoStep();
	FCK.Focus();
	FCK.Events.FireEvent("OnSelectionChange");
};
FCKStyleCommand.prototype.GetState = function() {
	var A = FCK.EditorDocument.selection;
	if (FCKSelection.GetType() == 'Control') {
		var e = FCKSelection.GetSelectedElement();
		if (e)
			return this.StylesLoader.StyleGroups[e.tagName]
					? FCK_TRISTATE_OFF
					: FCK_TRISTATE_DISABLED;
	};
	return FCK_TRISTATE_OFF;
};
FCKStyleCommand.prototype.GetActiveStyles = function() {
	var A = new Array();
	if (FCKSelection.GetType() == 'Control')
		this._CheckStyle(FCKSelection.GetSelectedElement(), A, false);
	else
		this._CheckStyle(FCKSelection.GetParentElement(), A, true);
	return A;
};
FCKStyleCommand.prototype._CheckStyle = function(A, B, C) {
	if (!A)
		return;
	if (A.nodeType == 1) {
		var D = this.StylesLoader.StyleGroups[A.tagName];
		if (D) {
			for (var i = 0; i < D.length; i++) {
				if (D[i].IsEqual(A))
					B[B.length] = D[i];
			};
		};
	};
	if (C)
		this._CheckStyle(A.parentNode, B, C);
}
var FCKCommands = FCK.Commands = new Object();
FCKCommands.LoadedCommands = new Object();
FCKCommands.RegisterCommand = function(A, B) {
	this.LoadedCommands[A] = B;
};
FCKCommands.GetCommand = function(A) {
	var B = FCKCommands.LoadedCommands[A];
	if (B)
		return B;
	switch (A) {
		case 'DocProps' :
			B = new FCKDialogCommand('DocProps', FCKLang.DocProps,
					'dialog/fck_docprops.html', 400, 390,
					FCKCommands.GetFullPageState);
			break;
		case 'Templates' :
			B = new FCKDialogCommand('Templates', FCKLang.DlgTemplatesTitle,
					'dialog/fck_template.html', 380, 450);
			break;
		case 'Link' :
			B = new FCKDialogCommand('Link', FCKLang.DlgLnkWindowTitle,
					'dialog/fck_link.html', 400, 330, FCK.GetNamedCommandState,
					'CreateLink');
			break;
		case 'Anchor' :
			B = new FCKDialogCommand('Anchor', FCKLang.DlgAnchorTitle,
					'dialog/fck_anchor.html', 370, 170);
			break;
		case 'BulletedList' :
			B = new FCKDialogCommand('BulletedList', FCKLang.BulletedListProp,
					'dialog/fck_listprop.html', 370, 170);
			break;
		case 'NumberedList' :
			B = new FCKDialogCommand('NumberedList', FCKLang.NumberedListProp,
					'dialog/fck_listprop.html', 370, 170);
			break;
		case 'About' :
			B = new FCKDialogCommand('About', FCKLang.About,
					'dialog/fck_about.html', 400, 330);
			break;
		case 'Find' :
			B = new FCKDialogCommand('Find', FCKLang.DlgFindTitle,
					'dialog/fck_find.html', 340, 170);
			break;
		case 'Replace' :
			B = new FCKDialogCommand('Replace', FCKLang.DlgReplaceTitle,
					'dialog/fck_replace.html', 340, 200);
			break;
		case 'Image' :
			B = new FCKDialogCommand('Image', FCKLang.DlgImgTitle,
					'dialog/fck_image.html', 450, 400);
			break;
		case 'Flash' :
			B = new FCKDialogCommand('Flash', FCKLang.DlgFlashTitle,
					'dialog/fck_flash.html', 450, 400);
			break;
		case 'SpecialChar' :
			B = new FCKDialogCommand('SpecialChar',
					FCKLang.DlgSpecialCharTitle, 'dialog/fck_specialchar.html',
					400, 320);
			break;
		case 'Smiley' :
			B = new FCKDialogCommand('Smiley', FCKLang.DlgSmileyTitle,
					'dialog/fck_smiley.html', FCKConfig.SmileyWindowWidth,
					FCKConfig.SmileyWindowHeight);
			break;
		case 'Table' :
			B = new FCKDialogCommand('Table', FCKLang.DlgTableTitle,
					'dialog/fck_table.html', 400, 250);
			break;
		case 'TableProp' :
			B = new FCKDialogCommand('Table', FCKLang.DlgTableTitle,
					'dialog/fck_table.html?Parent', 400, 250);
			break;
		case 'TableCellProp' :
			B = new FCKDialogCommand('TableCell', FCKLang.DlgCellTitle,
					'dialog/fck_tablecell.html', 500, 250);
			break;
		case 'UniversalKey' :
			B = new FCKDialogCommand('UniversalKey', FCKLang.UniversalKeyboard,
					'dialog/fck_universalkey.html', 415, 300);
			break;
		case 'Style' :
			B = new FCKStyleCommand();
			break;
		case 'FontName' :
			B = new FCKFontNameCommand();
			break;
		case 'FontSize' :
			B = new FCKFontSizeCommand();
			break;
		case 'FontFormat' :
			B = new FCKFormatBlockCommand();
			break;
		case 'Source' :
			B = new FCKSourceCommand();
			break;
		case 'Preview' :
			B = new FCKPreviewCommand();
			break;
		case 'Save' :
			B = new FCKSaveCommand();
			break;
		case 'NewPage' :
			B = new FCKNewPageCommand();
			break;
		case 'PageBreak' :
			B = new FCKPageBreakCommand();
			break;
		case 'TextColor' :
			B = new FCKTextColorCommand('ForeColor');
			break;
		case 'BGColor' :
			B = new FCKTextColorCommand('BackColor');
			break;
		case 'PasteText' :
			B = new FCKPastePlainTextCommand();
			break;
		case 'PasteWord' :
			B = new FCKPasteWordCommand();
			break;
		case 'TableInsertRow' :
			B = new FCKTableCommand('TableInsertRow');
			break;
		case 'TableDeleteRows' :
			B = new FCKTableCommand('TableDeleteRows');
			break;
		case 'TableInsertColumn' :
			B = new FCKTableCommand('TableInsertColumn');
			break;
		case 'TableDeleteColumns' :
			B = new FCKTableCommand('TableDeleteColumns');
			break;
		case 'TableInsertCell' :
			B = new FCKTableCommand('TableInsertCell');
			break;
		case 'TableDeleteCells' :
			B = new FCKTableCommand('TableDeleteCells');
			break;
		case 'TableMergeCells' :
			B = new FCKTableCommand('TableMergeCells');
			break;
		case 'TableSplitCell' :
			B = new FCKTableCommand('TableSplitCell');
			break;
		case 'TableDelete' :
			B = new FCKTableCommand('TableDelete');
			break;
		case 'Form' :
			B = new FCKDialogCommand('Form', FCKLang.Form,
					'dialog/fck_form.html', 380, 230);
			break;
		case 'Checkbox' :
			B = new FCKDialogCommand('Checkbox', FCKLang.Checkbox,
					'dialog/fck_checkbox.html', 380, 230);
			break;
		case 'Radio' :
			B = new FCKDialogCommand('Radio', FCKLang.RadioButton,
					'dialog/fck_radiobutton.html', 380, 230);
			break;
		case 'TextField' :
			B = new FCKDialogCommand('TextField', FCKLang.TextField,
					'dialog/fck_textfield.html', 380, 230);
			break;
		case 'Textarea' :
			B = new FCKDialogCommand('Textarea', FCKLang.Textarea,
					'dialog/fck_textarea.html', 380, 230);
			break;
		case 'HiddenField' :
			B = new FCKDialogCommand('HiddenField', FCKLang.HiddenField,
					'dialog/fck_hiddenfield.html', 380, 230);
			break;
		case 'Button' :
			B = new FCKDialogCommand('Button', FCKLang.Button,
					'dialog/fck_button.html', 380, 230);
			break;
		case 'Select' :
			B = new FCKDialogCommand('Select', FCKLang.SelectionField,
					'dialog/fck_select.html', 400, 380);
			break;
		case 'ImageButton' :
			B = new FCKDialogCommand('ImageButton', FCKLang.ImageButton,
					'dialog/fck_image.html?ImageButton', 450, 400);
			break;
		case 'SpellCheck' :
			B = new FCKSpellCheckCommand();
			break;
		case 'Undo' :
			B = new FCKUndoCommand();
			break;
		case 'Redo' :
			B = new FCKRedoCommand();
			break;
		case 'Undefined' :
			B = new FCKUndefinedCommand();
			break;
		default :
			if (FCKRegexLib.NamedCommands.test(A))
				B = new FCKNamedCommand(A);
			else {
				alert(FCKLang.UnknownCommand.replace(/%1/g, A));
				return null;
			}
			;
	};
	FCKCommands.LoadedCommands[A] = B;
	return B;
};
FCKCommands.GetFullPageState = function() {
	return FCKConfig.FullPage ? FCK_TRISTATE_OFF : FCK_TRISTATE_DISABLED;
};
var FCKToolbarButton = function(A, B, C, D, E, F) {
	this.Command = FCKCommands.GetCommand(A);
	this.Label = B ? B : A;
	this.Tooltip = C ? C : (B ? B : A);
	this.Style = D ? D : FCK_TOOLBARITEM_ONLYICON;
	this.SourceView = E ? true : false;
	this.ContextSensitive = F ? true : false;
	this.IconPath = FCKConfig.SkinPath + 'toolbar/' + A.toLowerCase() + '.gif';
	this.State = FCK_UNKNOWN;
};
FCKToolbarButton.prototype.CreateInstance = function(A) {
	this.DOMDiv = document.createElement('div');
	this.DOMDiv.className = 'TB_Button_Off';
	this.DOMDiv.FCKToolbarButton = this;
	var B = '<table title="' + this.Tooltip
			+ '" cellspacing="0" cellpadding="0" border="0">' + '<tr>';
	if (this.Style != FCK_TOOLBARITEM_ONLYTEXT)
		B += '<td class="TB_Icon"><img src="' + this.IconPath
				+ '" width="21" height="21"></td>';
	if (this.Style != FCK_TOOLBARITEM_ONLYICON)
		B += '<td class="TB_Text" nowrap>' + this.Label + '</td>';
	B += '</tr>' + '</table>';
	this.DOMDiv.innerHTML = B;
	var C = A.DOMRow.insertCell(-1);
	C.appendChild(this.DOMDiv);
	this.RefreshState();
};
FCKToolbarButton.prototype.RefreshState = function() {
	var A = this.Command.GetState();
	if (A == this.State)
		return;
	this.State = A;
	switch (this.State) {
		case FCK_TRISTATE_ON :
			this.DOMDiv.className = 'TB_Button_On';
			this.DOMDiv.onmouseover = FCKToolbarButton_OnMouseOnOver;
			this.DOMDiv.onmouseout = FCKToolbarButton_OnMouseOnOut;
			this.DOMDiv.onclick = FCKToolbarButton_OnClick;
			break;
		case FCK_TRISTATE_OFF :
			this.DOMDiv.className = 'TB_Button_Off';
			this.DOMDiv.onmouseover = FCKToolbarButton_OnMouseOffOver;
			this.DOMDiv.onmouseout = FCKToolbarButton_OnMouseOffOut;
			this.DOMDiv.onclick = FCKToolbarButton_OnClick;
			break;
		default :
			this.Disable();
			break;
	};
};
function FCKToolbarButton_OnMouseOnOver() {
	this.className = 'TB_Button_On TB_Button_On_Over';
};
function FCKToolbarButton_OnMouseOnOut() {
	this.className = 'TB_Button_On';
};
function FCKToolbarButton_OnMouseOffOver() {
	this.className = 'TB_Button_On TB_Button_Off_Over';
};
function FCKToolbarButton_OnMouseOffOut() {
	this.className = 'TB_Button_Off';
};
function FCKToolbarButton_OnClick(e) {
	this.FCKToolbarButton.Click(e);
	return false;
};
FCKToolbarButton.prototype.Click = function() {
	this.Command.Execute();
};
FCKToolbarButton.prototype.Enable = function() {
	this.RefreshState();
};
FCKToolbarButton.prototype.Disable = function() {
	this.State = FCK_TRISTATE_DISABLED;
	this.DOMDiv.className = 'TB_Button_Disabled';
	this.DOMDiv.onmouseover = null;
	this.DOMDiv.onmouseout = null;
	this.DOMDiv.onclick = null;
}
var FCKSpecialCombo = function(A, B, C, D, E) {
	this.FieldWidth = B || 100;
	this.PanelWidth = C || 150;
	this.PanelMaxHeight = D || 150;
	this.Label = '&nbsp;';
	this.Caption = A;
	this.Tooltip = A;
	this.Style = FCK_TOOLBARITEM_ICONTEXT;
	this.Enabled = true;
	this.Items = new Object();
	this._Panel = new FCKPanel(E);
	this._Panel.AppendStyleSheet(FCKConfig.SkinPath + 'fck_contextmenu.css');
	this._PanelBox = this._Panel.PanelDiv.appendChild(this._Panel.Document
			.createElement('DIV'));
	this._PanelBox.className = 'SC_Panel';
	this._PanelBox.style.width = this.PanelWidth + 'px';
	this._PanelBox.innerHTML = '<table cellpadding="0" cellspacing="0" width="100%" style="TABLE-LAYOUT: fixed"><tr><td nowrap></td></tr></table>';
	this._ItemsHolderEl = this._PanelBox.getElementsByTagName('TD')[0];
};
function FCKSpecialCombo_ItemOnMouseOver() {
	this.className += ' SC_ItemOver';
};
function FCKSpecialCombo_ItemOnMouseOut() {
	this.className = this.originalClass;
};
function FCKSpecialCombo_ItemOnClick() {
	this.FCKSpecialCombo._Panel.Hide();
	this.FCKSpecialCombo.SetLabel(this.FCKItemLabel);
	if (typeof(this.FCKSpecialCombo.OnSelect) == 'function')
		this.FCKSpecialCombo.OnSelect(this.FCKItemID, this);
};
FCKSpecialCombo.prototype.AddItem = function(A, B, C) {
	var D = this._ItemsHolderEl.appendChild(this._Panel.Document
			.createElement('DIV'));
	D.className = D.originalClass = 'SC_Item';
	D.innerHTML = B;
	D.FCKItemID = A;
	D.FCKItemLabel = C ? C : A;
	D.FCKSpecialCombo = this;
	D.Selected = false;
	D.onmouseover = FCKSpecialCombo_ItemOnMouseOver;
	D.onmouseout = FCKSpecialCombo_ItemOnMouseOut;
	D.onclick = FCKSpecialCombo_ItemOnClick;
	this.Items[A.toString().toLowerCase()] = D;
	return D;
};
FCKSpecialCombo.prototype.SelectItem = function(A) {
	A = A ? A.toString().toLowerCase() : '';
	var B = this.Items[A];
	if (B) {
		B.className = B.originalClass = 'SC_ItemSelected';
		B.Selected = true;
	};
};
FCKSpecialCombo.prototype.SelectItemByLabel = function(A, B) {
	for (var C in this.Items) {
		var D = this.Items[C];
		if (D.FCKItemLabel == A) {
			D.className = D.originalClass = 'SC_ItemSelected';
			D.Selected = true;
			if (B)
				this.SetLabel(A);
		};
	};
};
FCKSpecialCombo.prototype.DeselectAll = function(A) {
	for (var i in this.Items) {
		this.Items[i].className = this.Items[i].originalClass = 'SC_Item';
		this.Items[i].Selected = false;
	};
	if (A)
		this.SetLabel('');
};
FCKSpecialCombo.prototype.SetLabelById = function(A) {
	A = A ? A.toString().toLowerCase() : '';
	var B = this.Items[A];
	this.SetLabel(B ? B.FCKItemLabel : '');
};
FCKSpecialCombo.prototype.SetLabel = function(A) {
	this.Label = A.length == 0 ? '&nbsp;' : A;
	if (this._LabelEl)
		this._LabelEl.innerHTML = this.Label;
};
FCKSpecialCombo.prototype.SetEnabled = function(A) {
	this.Enabled = A;
	this._OuterTable.className = A ? '' : 'SC_FieldDisabled';
};
FCKSpecialCombo.prototype.Create = function(A) {
	this._OuterTable = A.appendChild(document.createElement('TABLE'));
	this._OuterTable.cellPadding = 0;
	this._OuterTable.cellSpacing = 0;
	this._OuterTable.insertRow(-1);
	var B;
	var C;
	switch (this.Style) {
		case FCK_TOOLBARITEM_ONLYICON :
			B = 'TB_ButtonType_Icon';
			C = false;
			break;
		case FCK_TOOLBARITEM_ONLYTEXT :
			B = 'TB_ButtonType_Text';
			C = false;
			break;
		case FCK_TOOLBARITEM_ICONTEXT :
			C = true;
			break;
	};
	if (this.Caption && this.Caption.length > 0 && C) {
		var D = this._OuterTable.rows[0].insertCell(-1);
		D.innerHTML = this.Caption;
		D.className = 'SC_FieldCaption';
	};
	var E = this._OuterTable.rows[0].insertCell(-1).appendChild(document
			.createElement('DIV'));
	if (C) {
		E.className = 'SC_Field';
		E.style.width = this.FieldWidth + 'px';
		E.innerHTML = '<table width="100%" cellpadding="0" cellspacing="0" style="TABLE-LAYOUT: fixed;"><tbody><tr><td class="SC_FieldLabel"><label>&nbsp;</label></td><td class="SC_FieldButton">&nbsp;</td></tr></tbody></table>';
		this._LabelEl = E.getElementsByTagName('label')[0];
		this._LabelEl.innerHTML = this.Label;
	} else {
		E.className = 'TB_Button_Off';
		E.innerHTML = '<table cellpadding="0" cellspacing="0" style="TABLE-LAYOUT: fixed;"><tbody><tr><td class="SC_FieldButton" style="border-left: none;">&nbsp;</td></tr></tbody></table>';
		E.innerHTML = '<table title="' + this.Tooltip + '" class="' + B
				+ '" cellspacing="0" cellpadding="0" border="0">' + '<tr>'
				+ '<td class="TB_Text">' + this.Caption + '</td>'
				+ '<td class="TB_ButtonArrow"><img src="' + FCKConfig.SkinPath
				+ 'images/toolbar.buttonarrow.gif" width="5" height="3"></td>'
				+ '</tr>' + '</table>';
	};
	E.SpecialCombo = this;
	E.onmouseover = FCKSpecialCombo_OnMouseOver;
	E.onmouseout = FCKSpecialCombo_OnMouseOut;
	E.onclick = FCKSpecialCombo_OnClick;
	FCKTools.DisableSelection(this._Panel.Document.body);
};
function FCKSpecialCombo_OnMouseOver() {
	if (this.SpecialCombo.Enabled) {
		switch (this.SpecialCombo.Style) {
			case FCK_TOOLBARITEM_ONLYICON :
				this.className = 'TB_Button_On';
				break;
			case FCK_TOOLBARITEM_ONLYTEXT :
				this.className = 'TB_Button_On';
				break;
			case FCK_TOOLBARITEM_ICONTEXT :
				this.className = 'SC_Field SC_FieldOver';
				break;
		};
	};
};
function FCKSpecialCombo_OnMouseOut() {
	switch (this.SpecialCombo.Style) {
		case FCK_TOOLBARITEM_ONLYICON :
			this.className = 'TB_Button_Off';
			break;
		case FCK_TOOLBARITEM_ONLYTEXT :
			this.className = 'TB_Button_Off';
			break;
		case FCK_TOOLBARITEM_ICONTEXT :
			this.className = 'SC_Field';
			break;
	};
};
function FCKSpecialCombo_OnClick(e) {
	var oSpecialCombo = this.SpecialCombo;
	if (oSpecialCombo.Enabled) {
		var oPanel = oSpecialCombo._Panel;
		var oPanelBox = oSpecialCombo._PanelBox;
		var oItemsHolder = oSpecialCombo._ItemsHolderEl;
		var iMaxHeight = oSpecialCombo.PanelMaxHeight;
		if (oSpecialCombo.OnBeforeClick)
			oSpecialCombo.OnBeforeClick(oSpecialCombo);
		oPanel.Load(0, this.offsetHeight, this);
		if (oItemsHolder.offsetHeight > iMaxHeight)
			oPanelBox.style.height = iMaxHeight + 'px';
		else
			oPanelBox.style.height = oItemsHolder.offsetHeight + 'px';
		if (FCKBrowserInfo.IsGecko)
			oPanelBox.style.overflow = '-moz-scrollbars-vertical';
		oPanel.Show(0, this.offsetHeight, this);
	};
	return false;
};
var FCKToolbarSpecialCombo = function() {
	this.SourceView = false;
	this.ContextSensitive = true;
};
function FCKToolbarSpecialCombo_OnSelect(itemId, item) {
	this.Command.Execute(itemId, item);
};
FCKToolbarSpecialCombo.prototype.CreateInstance = function(A) {
	this._Combo = new FCKSpecialCombo(this.GetLabel(), this.FieldWidth,
			this.PanelWidth, this.PanelMaxHeight);
	this._Combo.Tooltip = this.Tooltip;
	this._Combo.Style = this.Style;
	this.CreateItems(this._Combo);
	this._Combo.Create(A.DOMRow.insertCell(-1));
	this._Combo.Command = this.Command;
	this._Combo.OnSelect = FCKToolbarSpecialCombo_OnSelect;
};
function FCKToolbarSpecialCombo_RefreshActiveItems(combo, value) {
	combo.DeselectAll();
	combo.SelectItem(value);
	combo.SetLabelById(value);
};
FCKToolbarSpecialCombo.prototype.RefreshState = function() {
	var A;
	var B = this.Command.GetState();
	if (B != FCK_TRISTATE_DISABLED) {
		A = FCK_TRISTATE_ON;
		if (this.RefreshActiveItems)
			this.RefreshActiveItems(this._Combo, B);
		else {
			if (this._LastValue == B)
				return;
			this._LastValue = B;
			FCKToolbarSpecialCombo_RefreshActiveItems(this._Combo, B);
		};
	} else
		A = FCK_TRISTATE_DISABLED;
	if (A == this.State)
		return;
	if (A == FCK_TRISTATE_DISABLED) {
		this._Combo.DeselectAll();
		this._Combo.SetLabel('');
	};
	this.State = A;
	this._Combo.SetEnabled(A != FCK_TRISTATE_DISABLED);
};
FCKToolbarSpecialCombo.prototype.Enable = function() {
	this.RefreshState();
};
FCKToolbarSpecialCombo.prototype.Disable = function() {
	this.State = FCK_TRISTATE_DISABLED;
	this._Combo.DeselectAll();
	this._Combo.SetLabel('');
	this._Combo.SetEnabled(false);
}
var FCKToolbarFontsCombo = function(A, B) {
	this.Command = FCKCommands.GetCommand('FontName');
	this.Label = this.GetLabel();
	this.Tooltip = A ? A : this.Label;
	this.Style = B ? B : FCK_TOOLBARITEM_ICONTEXT;
};
FCKToolbarFontsCombo.prototype = new FCKToolbarSpecialCombo;
FCKToolbarFontsCombo.prototype.GetLabel = function() {
	return FCKLang.Font;
};
FCKToolbarFontsCombo.prototype.CreateItems = function(A) {
	var B = FCKConfig.FontNames.split(';');
	for (var i = 0; i < B.length; i++)
		this._Combo.AddItem(B[i], '<font face="' + B[i]
						+ '" style="font-size: 12px">' + B[i] + '</font>');
}
var FCKToolbarFontSizeCombo = function(A, B) {
	this.Command = FCKCommands.GetCommand('FontSize');
	this.Label = this.GetLabel();
	this.Tooltip = A ? A : this.Label;
	this.Style = B ? B : FCK_TOOLBARITEM_ICONTEXT;
};
FCKToolbarFontSizeCombo.prototype = new FCKToolbarSpecialCombo;
FCKToolbarFontSizeCombo.prototype.GetLabel = function() {
	return FCKLang.FontSize;
};
FCKToolbarFontSizeCombo.prototype.CreateItems = function(A) {
	A.FieldWidth = 70;
	var B = FCKConfig.FontSizes.split(';');
	for (var i = 0; i < B.length; i++) {
		var C = B[i].split('/');
		this._Combo.AddItem(C[0], '<font size="' + C[0] + '">' + C[1]
						+ '</font>', C[1]);
	};
}
var FCKToolbarFontFormatCombo = function(A, B) {
	this.Command = FCKCommands.GetCommand('FontFormat');
	this.Label = this.GetLabel();
	this.Tooltip = A ? A : this.Label;
	this.Style = B ? B : FCK_TOOLBARITEM_ICONTEXT;
	this.NormalLabel = 'Normal';
	this.PanelWidth = 190;
};
FCKToolbarFontFormatCombo.prototype = new FCKToolbarSpecialCombo;
FCKToolbarFontFormatCombo.prototype.GetLabel = function() {
	return FCKLang.FontFormat;
};
FCKToolbarFontFormatCombo.prototype.CreateItems = function(A) {
	var B = FCKLang['FontFormats'].split(';');
	var C = {
		p : B[0],
		pre : B[1],
		address : B[2],
		h1 : B[3],
		h2 : B[4],
		h3 : B[5],
		h4 : B[6],
		h5 : B[7],
		h6 : B[8],
		div : B[9]
	};
	var D = FCKConfig.FontFormats.split(';');
	for (var i = 0; i < D.length; i++) {
		var E = D[i];
		var F = C[E];
		if (E == 'p')
			this.NormalLabel = F;
		this._Combo.AddItem(E, '<div class="BaseFont"><' + E + '>' + F + '</'
						+ E + '></div>', F);
	};
};
if (FCKBrowserInfo.IsIE) {
	FCKToolbarFontFormatCombo.prototype.RefreshActiveItems = function(A, B) {
		if (B == this.NormalLabel) {
			if (A.Label != '&nbsp;')
				A.DeselectAll(true);
		} else {
			if (this._LastValue == B)
				return;
			A.SelectItemByLabel(B, true);
		};
		this._LastValue = B;
	};
}
var FCKToolbarStyleCombo = function(A, B) {
	this.Command = FCKCommands.GetCommand('Style');
	this.Label = this.GetLabel();
	this.Tooltip = A ? A : this.Label;
	this.Style = B ? B : FCK_TOOLBARITEM_ICONTEXT;
};
FCKToolbarStyleCombo.prototype = new FCKToolbarSpecialCombo;
FCKToolbarStyleCombo.prototype.GetLabel = function() {
	return FCKLang.Style;
};
FCKToolbarStyleCombo.prototype.CreateItems = function(A) {
	FCKTools.AppendStyleSheet(A._Panel.Document, FCKConfig.EditorAreaCSS);
	A._Panel.Document.body.className += ' ForceBaseFont';
	if (!FCKBrowserInfo.IsGecko)
		A.OnBeforeClick = this.RefreshVisibleItems;
	for (var s in this.Command.Styles) {
		var B = this.Command.Styles[s];
		var C;
		if (B.IsObjectElement)
			C = A.AddItem(s, s);
		else
			C = A.AddItem(s, B.GetOpenerTag() + s + B.GetCloserTag());
		C.Style = B;
	};
};
FCKToolbarStyleCombo.prototype.RefreshActiveItems = function(A) {
	A.DeselectAll();
	var B = this.Command.GetActiveStyles();
	if (B.length > 0) {
		for (var i = 0; i < B.length; i++)
			A.SelectItem(B[i].Name);
		A.SetLabelById(B[0].Name);
	} else
		A.SetLabel('');
};
FCKToolbarStyleCombo.prototype.RefreshVisibleItems = function(A) {
	if (FCKSelection.GetType() == 'Control')
		var B = FCKSelection.GetSelectedElement().tagName;
	for (var i in A.Items) {
		var C = A.Items[i];
		if ((B && C.Style.Element == B) || (!B && !C.Style.IsObjectElement))
			C.style.display = '';
		else
			C.style.display = 'none';
	};
}
var FCKToolbarPanelButton = function(A, B, C, D) {
	this.Command = FCKCommands.GetCommand(A);
	this.Label = B ? B : A;
	this.Tooltip = C ? C : (B ? B : A);
	this.Style = D ? D : FCK_TOOLBARITEM_ONLYICON;
	this.State = FCK_UNKNOWN;
	this.IconPath = FCKConfig.SkinPath + 'toolbar/' + A.toLowerCase() + '.gif';
};
FCKToolbarPanelButton.prototype.Click = function(e) {
	if (this.State != FCK_TRISTATE_DISABLED) {
		this.Command.Execute(0, this.DOMDiv.offsetHeight, this.DOMDiv);
	};
	return false;
};
FCKToolbarPanelButton.prototype.CreateInstance = function(A) {
	this.DOMDiv = document.createElement('div');
	this.DOMDiv.className = 'TB_Button_Off';
	this.DOMDiv.FCKToolbarButton = this;
	var B = '<table title="' + this.Tooltip
			+ '" cellspacing="0" cellpadding="0" border="0">' + '<tr>';
	if (this.Style != FCK_TOOLBARITEM_ONLYTEXT)
		B += '<td class="TB_Icon"><img src="' + this.IconPath
				+ '" width="21" height="21"></td>';
	if (this.Style != FCK_TOOLBARITEM_ONLYICON)
		B += '<td class="TB_Text" nowrap>' + this.Label + '</td>';
	B += '<td class="TB_ButtonArrow"><img src="' + FCKConfig.SkinPath
			+ 'images/toolbar.buttonarrow.gif" width="5" height="3"></td>'
			+ '</tr>' + '</table>';
	this.DOMDiv.innerHTML = B;
	var C = A.DOMRow.insertCell(-1);
	C.appendChild(this.DOMDiv);
	this.RefreshState();
};
FCKToolbarPanelButton.prototype.RefreshState = FCKToolbarButton.prototype.RefreshState;
FCKToolbarPanelButton.prototype.Enable = FCKToolbarButton.prototype.Enable;
FCKToolbarPanelButton.prototype.Disable = FCKToolbarButton.prototype.Disable;
var FCKToolbarItems = new Object();
FCKToolbarItems.LoadedItems = new Object();
FCKToolbarItems.RegisterItem = function(A, B) {
	this.LoadedItems[A] = B;
};
FCKToolbarItems.GetItem = function(A) {
	var B = FCKToolbarItems.LoadedItems[A];
	if (B)
		return B;
	switch (A) {
		case 'Source' :
			B = new FCKToolbarButton('Source', FCKLang.Source, null,
					FCK_TOOLBARITEM_ICONTEXT, true, true);
			break;
		case 'DocProps' :
			B = new FCKToolbarButton('DocProps', FCKLang.DocProps);
			break;
		case 'Templates' :
			B = new FCKToolbarButton('Templates', FCKLang.Templates);
			break;
		case 'Save' :
			B = new FCKToolbarButton('Save', FCKLang.Save, null, null, true);
			break;
		case 'NewPage' :
			B = new FCKToolbarButton('NewPage', FCKLang.NewPage, null, null,
					true);
			break;
		case 'Preview' :
			B = new FCKToolbarButton('Preview', FCKLang.Preview, null, null,
					true);
			break;
		case 'About' :
			B = new FCKToolbarButton('About', FCKLang.About, null, null, true);
			break;
		case 'Cut' :
			B = new FCKToolbarButton('Cut', FCKLang.Cut, null, null, false,
					true);
			break;
		case 'Copy' :
			B = new FCKToolbarButton('Copy', FCKLang.Copy, null, null, false,
					true);
			break;
		case 'Paste' :
			B = new FCKToolbarButton('Paste', FCKLang.Paste, null, null, false,
					true);
			break;
		case 'PasteText' :
			B = new FCKToolbarButton('PasteText', FCKLang.PasteText, null,
					null, false, true);
			break;
		case 'PasteWord' :
			B = new FCKToolbarButton('PasteWord', FCKLang.PasteWord, null,
					null, false, true);
			break;
		case 'Print' :
			B = new FCKToolbarButton('Print', FCKLang.Print, null, null, false,
					true);
			break;
		case 'SpellCheck' :
			B = new FCKToolbarButton('SpellCheck', FCKLang.SpellCheck);
			break;
		case 'Undo' :
			B = new FCKToolbarButton('Undo', FCKLang.Undo, null, null, false,
					true);
			break;
		case 'Redo' :
			B = new FCKToolbarButton('Redo', FCKLang.Redo, null, null, false,
					true);
			break;
		case 'SelectAll' :
			B = new FCKToolbarButton('SelectAll', FCKLang.SelectAll);
			break;
		case 'RemoveFormat' :
			B = new FCKToolbarButton('RemoveFormat', FCKLang.RemoveFormat,
					null, null, false, true);
			break;
		case 'Bold' :
			B = new FCKToolbarButton('Bold', FCKLang.Bold, null, null, false,
					true);
			break;
		case 'Italic' :
			B = new FCKToolbarButton('Italic', FCKLang.Italic, null, null,
					false, true);
			break;
		case 'Underline' :
			B = new FCKToolbarButton('Underline', FCKLang.Underline, null,
					null, false, true);
			break;
		case 'StrikeThrough' :
			B = new FCKToolbarButton('StrikeThrough', FCKLang.StrikeThrough,
					null, null, false, true);
			break;
		case 'Subscript' :
			B = new FCKToolbarButton('Subscript', FCKLang.Subscript, null,
					null, false, true);
			break;
		case 'Superscript' :
			B = new FCKToolbarButton('Superscript', FCKLang.Superscript, null,
					null, false, true);
			break;
		case 'OrderedList' :
			B = new FCKToolbarButton('InsertOrderedList',
					FCKLang.NumberedListLbl, FCKLang.NumberedList, null, false,
					true);
			break;
		case 'UnorderedList' :
			B = new FCKToolbarButton('InsertUnorderedList',
					FCKLang.BulletedListLbl, FCKLang.BulletedList, null, false,
					true);
			break;
		case 'Outdent' :
			B = new FCKToolbarButton('Outdent', FCKLang.DecreaseIndent, null,
					null, false, true);
			break;
		case 'Indent' :
			B = new FCKToolbarButton('Indent', FCKLang.IncreaseIndent, null,
					null, false, true);
			break;
		case 'Link' :
			B = new FCKToolbarButton('Link', FCKLang.InsertLinkLbl,
					FCKLang.InsertLink, null, false, true);
			break;
		case 'Unlink' :
			B = new FCKToolbarButton('Unlink', FCKLang.RemoveLink, null, null,
					false, true);
			break;
		case 'Anchor' :
			B = new FCKToolbarButton('Anchor', FCKLang.Anchor);
			break;
		case 'Image' :
			B = new FCKToolbarButton('Image', FCKLang.InsertImageLbl,
					FCKLang.InsertImage);
			break;
		case 'Flash' :
			B = new FCKToolbarButton('Flash', FCKLang.InsertFlashLbl,
					FCKLang.InsertFlash);
			break;
		case 'Table' :
			B = new FCKToolbarButton('Table', FCKLang.InsertTableLbl,
					FCKLang.InsertTable);
			break;
		case 'SpecialChar' :
			B = new FCKToolbarButton('SpecialChar',
					FCKLang.InsertSpecialCharLbl, FCKLang.InsertSpecialChar);
			break;
		case 'Smiley' :
			B = new FCKToolbarButton('Smiley', FCKLang.InsertSmileyLbl,
					FCKLang.InsertSmiley);
			break;
		case 'PageBreak' :
			B = new FCKToolbarButton('PageBreak', FCKLang.PageBreakLbl,
					FCKLang.PageBreak);
			break;
		case 'UniversalKey' :
			B = new FCKToolbarButton('UniversalKey', FCKLang.UniversalKeyboard);
			break;
		case 'Rule' :
			B = new FCKToolbarButton('InsertHorizontalRule',
					FCKLang.InsertLineLbl, FCKLang.InsertLine, null, false,
					true);
			break;
		case 'JustifyLeft' :
			B = new FCKToolbarButton('JustifyLeft', FCKLang.LeftJustify, null,
					null, false, true);
			break;
		case 'JustifyCenter' :
			B = new FCKToolbarButton('JustifyCenter', FCKLang.CenterJustify,
					null, null, false, true);
			break;
		case 'JustifyRight' :
			B = new FCKToolbarButton('JustifyRight', FCKLang.RightJustify,
					null, null, false, true);
			break;
		case 'JustifyFull' :
			B = new FCKToolbarButton('JustifyFull', FCKLang.BlockJustify, null,
					null, false, true);
			break;
		case 'Style' :
			B = new FCKToolbarStyleCombo();
			break;
		case 'FontName' :
			B = new FCKToolbarFontsCombo();
			break;
		case 'FontSize' :
			B = new FCKToolbarFontSizeCombo();
			break;
		case 'FontFormat' :
			B = new FCKToolbarFontFormatCombo();
			break;
		case 'TextColor' :
			B = new FCKToolbarPanelButton('TextColor', FCKLang.TextColor);
			break;
		case 'BGColor' :
			B = new FCKToolbarPanelButton('BGColor', FCKLang.BGColor);
			break;
		case 'Find' :
			B = new FCKToolbarButton('Find', FCKLang.Find);
			break;
		case 'Replace' :
			B = new FCKToolbarButton('Replace', FCKLang.Replace);
			break;
		case 'Form' :
			B = new FCKToolbarButton('Form', FCKLang.Form);
			break;
		case 'Checkbox' :
			B = new FCKToolbarButton('Checkbox', FCKLang.Checkbox);
			break;
		case 'Radio' :
			B = new FCKToolbarButton('Radio', FCKLang.RadioButton);
			break;
		case 'TextField' :
			B = new FCKToolbarButton('TextField', FCKLang.TextField);
			break;
		case 'Textarea' :
			B = new FCKToolbarButton('Textarea', FCKLang.Textarea);
			break;
		case 'HiddenField' :
			B = new FCKToolbarButton('HiddenField', FCKLang.HiddenField);
			break;
		case 'Button' :
			B = new FCKToolbarButton('Button', FCKLang.Button);
			break;
		case 'Select' :
			B = new FCKToolbarButton('Select', FCKLang.SelectionField);
			break;
		case 'ImageButton' :
			B = new FCKToolbarButton('ImageButton', FCKLang.ImageButton);
			break;
		default :
			alert(FCKLang.UnknownToolbarItem.replace(/%1/g, A));
			return null;
	};
	FCKToolbarItems.LoadedItems[A] = B;
	return B;
}
var FCKToolbar = function() {
	this.Items = new Array();
	var e = this.DOMTable = document.createElement('table');
	e.className = 'TB_Toolbar';
	e.style.styleFloat = e.style.cssFloat = FCKLang.Dir == 'rtl'
			? 'right'
			: 'left';
	e.cellPadding = 0;
	e.cellSpacing = 0;
	e.border = 0;
	this.DOMRow = e.insertRow(-1);
	var A = this.DOMRow.insertCell(-1);
	A.className = 'TB_Start';
	A.innerHTML = '<img src="'
			+ FCKConfig.SkinPath
			+ 'images/toolbar.start.gif" width="7" height="21" style="VISIBILITY: hidden" onload="this.style.visibility = \'\';">';
	FCKToolbarSet.DOMElement.appendChild(e);
};
FCKToolbar.prototype.AddItem = function(A) {
	this.Items[this.Items.length] = A;
	A.CreateInstance(this);
};
FCKToolbar.prototype.AddSeparator = function() {
	var A = this.DOMRow.insertCell(-1);
	A.innerHTML = '<img src="'
			+ FCKConfig.SkinPath
			+ 'images/toolbar.separator.gif" width="5" height="21" style="VISIBILITY: hidden" onload="this.style.visibility = \'\';">';
};
FCKToolbar.prototype.AddTerminator = function() {
	var A = this.DOMRow.insertCell(-1);
	A.className = 'TB_End';
	A.innerHTML = '<img src="'
			+ FCKConfig.SkinPath
			+ 'images/toolbar.end.gif" width="12" height="21" style="VISIBILITY: hidden" onload="this.style.visibility = \'\';">';
};
var FCKToolbarBreak = function() {
	var A = document.createElement('div');
	A.className = 'TB_Break';
	A.style.clear = FCKLang.Dir == 'rtl' ? 'left' : 'right';
	FCKToolbarSet.DOMElement.appendChild(A);
}
var FCKToolbarSet = FCK.ToolbarSet = new Object();
document.getElementById('ExpandHandle').title = FCKLang.ToolbarExpand;
document.getElementById('CollapseHandle').title = FCKLang.ToolbarCollapse;
FCKToolbarSet.Toolbars = new Array();
FCKToolbarSet.ItemsWysiwygOnly = new Array();
FCKToolbarSet.ItemsContextSensitive = new Array();
FCKToolbarSet.Expand = function() {
	document.getElementById('Collapsed').style.display = 'none';
	document.getElementById('Expanded').style.display = '';
	if (!FCKBrowserInfo.IsIE) {
		window.setTimeout("window.onresize()", 1);
	};
};
FCKToolbarSet.Collapse = function() {
	document.getElementById('Collapsed').style.display = '';
	document.getElementById('Expanded').style.display = 'none';
	if (!FCKBrowserInfo.IsIE) {
		window.setTimeout("window.onresize()", 1);
	};
};
FCKToolbarSet.Restart = function() {
	if (!FCKConfig.ToolbarCanCollapse || FCKConfig.ToolbarStartExpanded)
		this.Expand();
	else
		this.Collapse();
	document.getElementById('CollapseHandle').style.display = FCKConfig.ToolbarCanCollapse
			? ''
			: 'none';
};
FCKToolbarSet.Load = function(A) {
	this.DOMElement = document.getElementById('eToolbar');
	var B = FCKConfig.ToolbarSets[A];
	if (!B) {
		alert(FCKLang.UnknownToolbarSet.replace(/%1/g, A));
		return;
	};
	this.Toolbars = new Array();
	for (var x = 0; x < B.length; x++) {
		var C = B[x];
		var D;
		if (typeof(C) == 'string') {
			if (C == '/')
				D = new FCKToolbarBreak();
		} else {
			D = new FCKToolbar();
			for (var j = 0; j < C.length; j++) {
				var E = C[j];
				if (E == '-')
					D.AddSeparator();
				else {
					var F = FCKToolbarItems.GetItem(E);
					if (F) {
						D.AddItem(F);
						if (!F.SourceView)
							this.ItemsWysiwygOnly[this.ItemsWysiwygOnly.length] = F;
						if (F.ContextSensitive)
							this.ItemsContextSensitive[this.ItemsContextSensitive.length] = F;
					};
				};
			};
			D.AddTerminator();
		};
		this.Toolbars[this.Toolbars.length] = D;
	};
};
FCKToolbarSet.RefreshModeState = function() {
	if (FCK.EditMode == FCK_EDITMODE_WYSIWYG) {
		for (var i = 0; i < FCKToolbarSet.ItemsWysiwygOnly.length; i++)
			FCKToolbarSet.ItemsWysiwygOnly[i].Enable();
		FCKToolbarSet.RefreshItemsState();
	} else {
		FCKToolbarSet.RefreshItemsState();
		for (var i = 0; i < FCKToolbarSet.ItemsWysiwygOnly.length; i++)
			FCKToolbarSet.ItemsWysiwygOnly[i].Disable();
	};
};
FCKToolbarSet.RefreshItemsState = function() {
	for (var i = 0; i < FCKToolbarSet.ItemsContextSensitive.length; i++)
		FCKToolbarSet.ItemsContextSensitive[i].RefreshState();
};
var FCKDialog = new Object();
FCKDialog.OpenDialog = function(A, B, C, D, E, F, G, H) {
	var I = new Object();
	I.Title = B;
	I.Page = C;
	I.Editor = window;
	I.CustomValue = F;
	var J = FCKConfig.BasePath + 'fckdialog.html';
	this.Show(I, A, J, D, E, G, H);
};
FCKDialog.Show = function(A, B, C, D, E, F) {
	if (!F)
		F = window;
	this.IsOpened = true;
	F.showModalDialog(C, A, "dialogWidth:" + D + "px;dialogHeight:" + E
					+ "px;help:no;scroll:no;status:no");
	this.IsOpened = false;
};
var FCKContextMenuItem = function(A, B, C, D) {
	this.ContextMenu = A;
	this.Command = FCKCommands.GetCommand(B);
	this.Label = C ? C : B;
	this.HasIcon = D ? true : false;
};
function FCKContextMenuItem_OnMouseOver() {
	if (this.className != 'CM_Disabled')
		this.className = 'CM_Over';
};
function FCKContextMenuItem_OnMouseOut() {
	if (this.className != 'CM_Disabled')
		this.className = 'CM_Option';
};
function FCKContextMenuItem_OnClick() {
	if (this.className != 'CM_Disabled') {
		this.FCKContextMenuItem.ContextMenu.Hide();
		this.FCKContextMenuItem.Command.Execute();
	};
	return false;
};
FCKContextMenuItem.prototype.CreateTableRow = function(A) {
	this._Row = A.insertRow(-1);
	this._Row.className = 'CM_Disabled';
	this._Row.FCKContextMenuItem = this;
	this._Row.onmouseover = FCKContextMenuItem_OnMouseOver;
	this._Row.onmouseout = FCKContextMenuItem_OnMouseOut;
	this._Row.onclick = FCKContextMenuItem_OnClick;
	var B = this._Row.insertCell(-1);
	B.className = 'CM_Icon';
	if (this.HasIcon)
		B.innerHTML = '<img alt="" src="' + FCKConfig.SkinPath + 'toolbar/'
				+ this.Command.Name.toLowerCase()
				+ '.gif" width="21" height="20">';
	B = this._Row.insertCell(-1);
	B.className = 'CM_Label';
	B.noWrap = true;
	B.innerHTML = this.Label;
};
FCKContextMenuItem.prototype.SetVisible = function(A) {
	this._Row.style.display = A ? '' : 'none';
};
FCKContextMenuItem.prototype.RefreshState = function() {
	switch (this.Command.GetState()) {
		case FCK_TRISTATE_ON :
		case FCK_TRISTATE_OFF :
			this._Row.className = 'CM_Option';
			break;
		default :
			this._Row.className = 'CM_Disabled';
			break;
	};
};
var FCKContextMenuSeparator = function() {
};
FCKContextMenuSeparator.prototype.CreateTableRow = function(A) {
	this._Row = A.insertRow(-1);
	this._Row.className = 'CM_Separator';
	var B = this._Row.insertCell(-1);
	B.className = 'CM_Icon';
	var C = A.ownerDocument || A.document;
	B = this._Row.insertCell(-1);
	B.className = 'CM_Label';
	B.appendChild(C.createElement('DIV')).className = 'CM_Separator_Line';
};
FCKContextMenuSeparator.prototype.SetVisible = function(A) {
	this._Row.style.display = A ? '' : 'none';
};
FCKContextMenuSeparator.prototype.RefreshState = function() {
};
var FCKContextMenuGroup = function(A, B, C, D, E) {
	this.IsVisible = true;
	this.Items = new Array();
	if (A)
		this.Add(new FCKContextMenuSeparator());
	if (B && C && D)
		this.Add(new FCKContextMenuItem(B, C, D, E));
	this.ValidationFunction = null;
};
FCKContextMenuGroup.prototype.Add = function(A) {
	this.Items[this.Items.length] = A;
};
FCKContextMenuGroup.prototype.CreateTableRows = function(A) {
	for (var i = 0; i < this.Items.length; i++) {
		this.Items[i].CreateTableRow(A);
	};
};
FCKContextMenuGroup.prototype.SetVisible = function(A) {
	for (var i = 0; i < this.Items.length; i++) {
		this.Items[i].SetVisible(A);
	};
	this.IsVisible = A;
};
FCKContextMenuGroup.prototype.RefreshState = function() {
	if (!this.IsVisible)
		return;
	for (var i = 0; i < this.Items.length; i++) {
		this.Items[i].RefreshState();
	};
}
var FCKContextMenu = new Object();
FCKContextMenu._Panel = new FCKPanel(FCKBrowserInfo.IsIE
		? window
		: window.parent);
FCKContextMenu._Panel.PanelDiv.className = 'CM_ContextMenu';
FCKContextMenu._Panel.AppendStyleSheet(FCKConfig.SkinPath
		+ 'fck_contextmenu.css');
FCKContextMenu._Panel.IsContextMenu = true;
FCKContextMenu._Document = FCKContextMenu._Panel.Document;
FCKContextMenu._IsLoaded = false;
FCKContextMenu.Show = function(x, y) {
	if (!this._IsLoaded)
		this.Reload();
	this.RefreshState();
	if (!FCKBrowserInfo.IsIE) {
		var A = FCKTools.GetElementPosition(FCK.EditorWindow.frameElement,
				this._Panel._Window);
		x += A.X;
		y += A.Y;
	};
	this._Panel.Show(x, y);
};
FCKContextMenu.Hide = function() {
	this._Panel.Hide();
};
FCKContextMenu.Reload = function() {
	var A = this._Document.createElement('TABLE');
	A.cellSpacing = 0;
	A.cellPadding = 0;
	this._Panel.PanelDiv.appendChild(A);
	this.Groups = new Object();
	for (var i = 0; i < FCKConfig.ContextMenu.length; i++) {
		var B = FCKConfig.ContextMenu[i];
		this.Groups[B] = this._GetGroup(B);
		this.Groups[B].CreateTableRows(A);
	};
	FCKTools.DisableSelection(this._Panel.Document.body);
	this._IsLoaded = true;
};
FCKContextMenu._GetGroup = function(A) {
	var B;
	switch (A) {
		case 'Generic' :
			B = new FCKContextMenuGroup();
			B.Add(new FCKContextMenuItem(this, 'Cut', FCKLang.Cut, true));
			B.Add(new FCKContextMenuItem(this, 'Copy', FCKLang.Copy, true));
			B.Add(new FCKContextMenuItem(this, 'Paste', FCKLang.Paste, true));
			break;
		case 'Link' :
			B = new FCKContextMenuGroup();
			B.Add(new FCKContextMenuSeparator());
			B.Add(new FCKContextMenuItem(this, 'Link', FCKLang.EditLink, true));
			B.Add(new FCKContextMenuItem(this, 'Unlink', FCKLang.RemoveLink,
					true));
			break;
		case 'TableCell' :
			B = new FCKContextMenuGroup();
			B.Add(new FCKContextMenuSeparator());
			B.Add(new FCKContextMenuItem(this, 'TableInsertRow',
					FCKLang.InsertRow, true));
			B.Add(new FCKContextMenuItem(this, 'TableDeleteRows',
					FCKLang.DeleteRows, true));
			B.Add(new FCKContextMenuSeparator());
			B.Add(new FCKContextMenuItem(this, 'TableInsertColumn',
					FCKLang.InsertColumn, true));
			B.Add(new FCKContextMenuItem(this, 'TableDeleteColumns',
					FCKLang.DeleteColumns, true));
			B.Add(new FCKContextMenuSeparator());
			B.Add(new FCKContextMenuItem(this, 'TableInsertCell',
					FCKLang.InsertCell, true));
			B.Add(new FCKContextMenuItem(this, 'TableDeleteCells',
					FCKLang.DeleteCells, true));
			B.Add(new FCKContextMenuItem(this, 'TableMergeCells',
					FCKLang.MergeCells, true));
			B.Add(new FCKContextMenuItem(this, 'TableSplitCell',
					FCKLang.SplitCell, true));
			B.Add(new FCKContextMenuSeparator());
			B.Add(new FCKContextMenuItem(this, 'TableDelete',
					FCKLang.TableDelete, false));
			B.Add(new FCKContextMenuSeparator());
			B.Add(new FCKContextMenuItem(this, 'TableCellProp',
					FCKLang.CellProperties, true));
			B.Add(new FCKContextMenuItem(this, 'TableProp',
					FCKLang.TableProperties, true));
			break;
		case 'Table' :
			B = new FCKContextMenuGroup();
			B.Add(new FCKContextMenuSeparator());
			B.Add(new FCKContextMenuItem(this, 'TableDelete',
					FCKLang.TableDelete, false));
			B.Add(new FCKContextMenuSeparator());
			B.Add(new FCKContextMenuItem(this, 'Table',
					FCKLang.TableProperties, true));
			break;
		case 'Image' :
			return new FCKContextMenuGroup(true, this, 'Image',
					FCKLang.ImageProperties, true);
		case 'Flash' :
			return new FCKContextMenuGroup(true, this, 'Flash',
					FCKLang.FlashProperties, true);
		case 'Form' :
			return new FCKContextMenuGroup(true, this, 'Form',
					FCKLang.FormProp, true);
		case 'Checkbox' :
			return new FCKContextMenuGroup(true, this, 'Checkbox',
					FCKLang.CheckboxProp, true);
		case 'Radio' :
			return new FCKContextMenuGroup(true, this, 'Radio',
					FCKLang.RadioButtonProp, true);
		case 'TextField' :
			return new FCKContextMenuGroup(true, this, 'TextField',
					FCKLang.TextFieldProp, true);
		case 'HiddenField' :
			return new FCKContextMenuGroup(true, this, 'HiddenField',
					FCKLang.HiddenFieldProp, true);
		case 'ImageButton' :
			return new FCKContextMenuGroup(true, this, 'ImageButton',
					FCKLang.ImageButtonProp, true);
		case 'Button' :
			return new FCKContextMenuGroup(true, this, 'Button',
					FCKLang.ButtonProp, true);
		case 'Select' :
			return new FCKContextMenuGroup(true, this, 'Select',
					FCKLang.SelectionFieldProp, true);
		case 'Textarea' :
			return new FCKContextMenuGroup(true, this, 'Textarea',
					FCKLang.TextareaProp, true);
		case 'BulletedList' :
			return new FCKContextMenuGroup(true, this, 'BulletedList',
					FCKLang.BulletedListProp, true);
		case 'NumberedList' :
			return new FCKContextMenuGroup(true, this, 'NumberedList',
					FCKLang.NumberedListProp, true);
		case 'Anchor' :
			return new FCKContextMenuGroup(true, this, 'Anchor',
					FCKLang.AnchorProp, true);
	};
	return B;
};
FCKContextMenu.RefreshState = function() {
	var A = FCKSelection.GetSelectedElement();
	var B;
	if (A)
		B = A.tagName;
	if (this.Groups['Link'])
		this.Groups['Link']
				.SetVisible(FCK.GetNamedCommandState('Unlink') != FCK_TRISTATE_DISABLED);
	if (this.Groups['TableCell'])
		this.Groups['TableCell'].SetVisible(B != 'TABLE'
				&& FCKSelection.HasAncestorNode('TABLE'));
	if (this.Groups['Table'])
		this.Groups['Table'].SetVisible(B == 'TABLE');
	if (this.Groups['Image'])
		this.Groups['Image'].SetVisible(B == 'IMG'
				&& !A.getAttribute('_fckfakelement'));
	if (this.Groups['Flash'])
		this.Groups['Flash'].SetVisible(B == 'IMG'
				&& A.getAttribute('_fckflash'));
	if (this.Groups['Anchor'])
		this.Groups['Anchor'].SetVisible(B == 'IMG'
				&& A.getAttribute('_fckanchor'));
	if (this.Groups['BulletedList'])
		this.Groups['BulletedList'].SetVisible(FCKSelection
				.HasAncestorNode('UL'));
	if (this.Groups['NumberedList'])
		this.Groups['NumberedList'].SetVisible(FCKSelection
				.HasAncestorNode('OL'));
	if (this.Groups['Select'])
		this.Groups['Select'].SetVisible(B == 'SELECT');
	if (this.Groups['Textarea'])
		this.Groups['Textarea'].SetVisible(B == 'TEXTAREA');
	if (this.Groups['Form'])
		this.Groups['Form'].SetVisible(FCKSelection.HasAncestorNode('FORM'));
	if (this.Groups['Checkbox'])
		this.Groups['Checkbox']
				.SetVisible(B == 'INPUT' && A.type == 'checkbox');
	if (this.Groups['Radio'])
		this.Groups['Radio'].SetVisible(B == 'INPUT' && A.type == 'radio');
	if (this.Groups['TextField'])
		this.Groups['TextField'].SetVisible(B == 'INPUT'
				&& (A.type == 'text' || A.type == 'password'));
	if (this.Groups['HiddenField'])
		this.Groups['HiddenField'].SetVisible(B == 'INPUT'
				&& A.type == 'hidden');
	if (this.Groups['ImageButton'])
		this.Groups['ImageButton']
				.SetVisible(B == 'INPUT' && A.type == 'image');
	if (this.Groups['Button'])
		this.Groups['Button']
				.SetVisible(B == 'INPUT'
						&& (A.type == 'button' || A.type == 'submit' || A.type == 'reset'));
	for (var o in this.Groups) {
		this.Groups[o].RefreshState();
	};
};
if (!FCKConfig.PluginsPath.endsWith('/'))
	FCKConfig.PluginsPath += '/';
var FCKPlugin = function(A, B, C) {
	this.Name = A;
	this.BasePath = C ? C : FCKConfig.PluginsPath;
	this.Path = this.BasePath + A + '/';
	if (!B || B.length == 0)
		this.AvailableLangs = new Array();
	else
		this.AvailableLangs = B.split(',');
};
FCKPlugin.prototype.Load = function() {
	if (this.AvailableLangs.length > 0) {
		var A;
		if (this.AvailableLangs.indexOf(FCKLanguageManager.ActiveLanguage.Code) >= 0)
			A = FCKLanguageManager.ActiveLanguage.Code;
		else
			A = this.AvailableLangs[0];
		FCKScriptLoader.AddScript(this.Path + 'lang/' + A + '.js');
	};
	FCKScriptLoader.AddScript(this.Path + 'fckplugin.js');
}
var FCKPlugins = FCK.Plugins = new Object();
FCKPlugins.ItemsCount = 0;
FCKPlugins.Loaded = false;
FCKPlugins.Items = new Object();
for (var i = 0; i < FCKConfig.Plugins.Items.length; i++) {
	var oItem = FCKConfig.Plugins.Items[i];
	FCKPlugins.Items[oItem[0]] = new FCKPlugin(oItem[0], oItem[1], oItem[2]);
	FCKPlugins.ItemsCount++;
};
FCKPlugins.Load = function() {
	for (var s in this.Items)
		this.Items[s].Load();
	this.Loaded = true;
	FCKPlugins.Load = null;
}
if (FCKLang && window.document.dir.toLowerCase() != FCKLang.Dir.toLowerCase())
	window.document.dir = FCKLang.Dir;
if (FCKConfig.ForcePasteAsPlainText || FCKConfig.AutoDetectPasteFromWord)
	FCK.Events.AttachEvent("OnPaste", FCK.Paste);
if (FCKPlugins.ItemsCount > 0) {
	FCKScriptLoader.OnEmpty = CompleteLoading;
	FCKPlugins.Load();
} else
	CompleteLoading();
function CompleteLoading() {
	FCKToolbarSet.Name = FCKURLParams['Toolbar'] || 'Default';
	FCKToolbarSet.Load(FCKToolbarSet.Name);
	FCKToolbarSet.Restart();
	FCK.AttachToOnSelectionChange(FCKToolbarSet.RefreshItemsState);
	FCKTools.DisableSelection(document.body);
	FCK.SetStatus(FCK_STATUS_COMPLETE);
	if (typeof(window.parent.FCKeditor_OnComplete) == 'function')
		window.parent.FCKeditor_OnComplete(FCK);
}
