function displayCondition(imgObj,trId){
	var trObj = document.getElementById(trId);
	var trs = trObj.parentNode.children;
	if(trs[1].style.display=="none"){
		for(var i=1;i<trs.length;i++)trs[i].style.display="";
		imgObj.src="images/main/display_on.gif";
	}else{
		for(var i=1;i<trs.length;i++)trs[i].style.display="none";
		imgObj.src="images/main/display_off.gif";
	}
}

/*
*功能：隐藏TD样式   
*作者：zhaowentao
*时间：2010-04-22
*使用说明：obj是当前鼠标指针所在的TD对象
*/
function show_style(tdObj){
	tdObj.title = tdObj.innerText;
}

/*
*功能：复选框全选或全部取消功能   
*作者：zhaowentao
*时间：2010-04-22
*使用说明：allbox传入全选框对象；boxname 被选择或取消的选择框名称
*/
function checkAll(allbox,boxname){
	var boxes = document.getElementsByName(boxname);
    var length = boxes == undefined ? 0 : boxes.length == undefined ? 1 : boxes.length;
    for( i = 0 ; i < length ; i ++ )boxes[i].checked = allbox.checked;
}
/*
*功能：复选框全部取消功能   
*作者：zhaowentao
*时间：2010-04-22
*使用说明：allbox传入全选框对象；boxname 被选择或取消的选择框名称
*/
function unCheckAll(boxname){
	var boxes = document.getElementsByName(boxname);
    var length = boxes == undefined ? 0 : boxes.length == undefined ? 1 : boxes.length;
    for( i = 0 ; i < length ; i ++ )boxes[i].checked = false;
}

/*
*功能：左右多选下拉框选择和移除功能
*作者：zhaowentao
*时间：2010-04-22
*使用说明：leftSelect要移除的select对象，rightSelect要添加的select对象
*/
function moveOp(leftSelect,rightSelect) { 
    //loop the leftList if there are items that selected,
    //move the selected items to the rightList
    for (i = 0; i < leftSelect.options.length; i++) {
        if (leftSelect.options[i].selected)
        {//move the selected item to the rightList
            var oneItem  = new Option('newText','newValue');
            oneItem.text = leftSelect.options[i].text;
            oneItem.value = leftSelect.options[i].value;
          	rightSelect.options[rightSelect.options.length]=oneItem;
          	leftSelect.remove(i);
            i--;
        }
    }
}
/*
*功能：左右多选下拉框选择和移除功能，初始化已选中的选项  
*作者：zhaowentao
*时间：2010-04-22
*使用说明：leftSelect要移除的select对象，rightSelect要添加的select对象
*/
function initRightSelect(leftSelect,rightSelect){ 
    for (i = 0; i < rightSelect.options.length; i++) {
    	for(var j = 0;j < leftSelect.options.length; j++){ 
    		if (leftSelect.options[j].value == rightSelect.options[i].value){
    			leftSelect.remove(j);
    			j--;
    		}
    	}
    }
}
/*
*功能：多选下拉框-选中全部选项功能  
*作者：zhaowentao
*时间：2010-04-22
*使用说明：传入多选下拉框对象
*/
function selectAll(selObj){
	var length = selObj?(selObj.length?selObj.length:0):0;
  	for(var i = 0; i < length; i++){
    	selObj.options[i].selected = true;
	}
}


/*
*功能：克隆TR  
*作者：zhaowentao
*时间：2010-04-22
*使用说明：传入被克隆的TR和新TR所在的父节点
*/
function addTR(cloneTR,newTRParentNode){
	var elm = cloneObj.cloneNode(true);
	newObjParentNode.insertBefore(elm);
}

/*
*功能：删除TR  
*作者：zhaowentao
*时间：2010-04-22
*使用说明：TR所在的父节点，删除的TR对象
*/
function deleteTR(TRParentNode,TRObj){
	TRParentNode.removeChild(TRObj); 
}


/*
*功能：初始化选中下拉菜单
*用法：传入select对象selObj和要选中的值val
*/ 
function initSelect(selObj,val){ 
	for(i=0;i<selObj.length;i++){
		if(val==selObj[i].value){
			selObj.selectedIndex=i;
		}
	}
}
/*
*功能：初始化选中单选框
*用法：传入radio对象radioObj和要选中的值val
*/ 
function initRadio(radioObj,val){ 
	for(i=0;i<radioObj.length;i++){
		if(val==radioObj[i].value){
			radioObj[i].checked=true;
		}
	}
}
/*
*功能：初始化选中下拉菜单
*作者：zhaowentao
*时间：2010-07-07
*用法：传入select对象selObj和要选中的值val
*/ 
function quickSearch(searchText,selectObj){
  	searchText = searchText.replace(" ", "");
  	if(selectObj && selectObj.length && selectObj.length>0 
  	   && searchText.length>0 && searchText!="快速查找"){
		var optionBak = selectObj.options[0];
		var i = 0;
		if(selectObj.options[0].value==""){
			optionBak = selectObj.options[1];
			i = 1;
		}
		for(;i<selectObj.length;i++){
			if(selectObj.options[i].text.search(searchText)!=-1) {
		    	selectObj.insertBefore(selectObj.options[i],optionBak);       
			}
		}
	}
}
/*
*功能：将选中的checkbox的value拼串返回
*时间：2010-11-02
*说明：传入checkbox的name
*输出：用/拼接的串		 
*/
function getBoxsValue(boxName){ 
	var groups = document.getElementsByName(boxName);
	var ids = "";
	if(groups && groups.length && groups.length>0){ 
		for(var i=groups.length-1;i>=0;i--)
		if(groups[i].checked) ids=ids+groups[i].value+"/";
	}
	if(ids != "" && ids.length > 0){
	  ids = "/"+ids;
	}
    return ids;
}
/**********************windowPopup*****************************/
/*
*功能：通过window popup显示跟多内容 
*作者：zhaowentao
*时间：2010-06-22
*使用说明：obj 被显示内容的父节点 必须的 [popWidth] 弹出框宽度 不是必须的
*/
var windowPopup ;

function create_popup() {
	if(windowPopup){
		return windowPopup;
	}
	windowPopup = window.createPopup();
	var oPopupBody = windowPopup.document.body;
	oPopupBody.style.backgroundColor = "lightyellow";
	oPopupBody.style.border = "solid black 1px";
	oPopupBody.style.overflow = "auto";
	oPopupBody.style.font = "13px Times, TimesNR, 'New Century Schoolbook'";
	return windowPopup;
}
function popup_show(obj,popWidth) {
	if(!obj||obj.innerText==""){
		return ;
	}
	windowPopup = create_popup();
	var oPopupBody = windowPopup.document.body;
	var msg = obj.innerText;
	oPopupBody.innerHTML = msg;
	if(!popWidth){
		popWidth = 300;
	}
	var popHight = 30+(msg.length/(popWidth/3))*30;
	windowPopup.show(0, 20, popWidth, popHight, obj);
}
function popup_show_text(obj,text,popWidth) {
	if(text==null||text==""){
		return ;
	}
	windowPopup = create_popup();
	var oPopupBody = windowPopup.document.body;
	oPopupBody.innerHTML = text;
	if(!popWidth){
		popWidth = 300;
	}
	var popHight = 30+(text.length/(popWidth/3))*30;
	windowPopup.show(0, 20, popWidth, popHight, obj);
}
function popup_hide() {
	if(windowPopup){
		windowPopup.hide();
	}
}
/*************json联动 开始********************/
/*
*功能：json实现下拉框联动  
*作者：zhaowentao
*时间：2010-06-22
*使用说明：url:请求的action，
		 params：请求参数集合，如
		 var params = { "pass":pass, "email":email, "address":address }; 
		 var params = Form.serialize('form1');
         selectObj:被联动的目标select对象,
         firstOptionVale:联动后是否需要有全部选项或请选择选项，自定义value
         firstOptionText:联动后是否需要有全部选项或请选择选项，自定义text
*/
var ajaxSelectObj;
var ajaxFirstOptionVale;
var ajaxFirstOptionText;
var ajaxSelectedValue;
function JSONLinkage(url,params,selectObj,firstOptionVale,firstOptionText){
    ajaxFirstOptionVale = firstOptionVale;
    ajaxFirstOptionText = firstOptionText;
    ajaxSelectObj = selectObj;
    ajaxSelectedValue = params.selectedValue;
    $.ajax( {
        type :"POST",
        url :url,
        async:false,
        data: params,
        success : processResponseText
    }); 
}
 


function processResponseText(msg){
		var optionArray = msg;
		ajaxSelectObj.options.length=0;
		var pos = 0;
		if(ajaxFirstOptionText && ajaxFirstOptionText != null && ajaxFirstOptionText != ""){
			ajaxSelectObj.options[0] = new Option(ajaxFirstOptionText,"");
			pos++;
		}
		if(optionArray==null||optionArray==""){
			return;
		}
		var arrayJson =	eval(optionArray);
		if(arrayJson && arrayJson.length){
			var index = arrayJson.length;
			var tempArray;
			for(var i=0;i<index;i++){
				tempArray = arrayJson[i];
				var tempOption  = new Option(tempArray.name,tempArray.code);
				tempOption.setAttribute("ptype",tempArray.ptype);
				ajaxSelectObj.options[i+pos]=tempOption;
				if(ajaxSelectedValue == tempArray.code){
					ajaxSelectObj.selectedIndex = i+pos;
				}
			}
		}
		ajaxSelectObj = null;
}
/*
*功能：json局部刷新，返回文本  
*作者：zhaowentao
*时间：2010-10-01
*使用说明：url:请求的action，
		 params：请求参数集合，如
		 var params = { "pass":pass, "email":email, "address":address }; 
		 var params = Form.serialize('form1');
         obj:接收返回文本的对象 var obj = new Object();返回obj.text
*/
var ajaxObj;
function JSONResponseText(url,params,obj){
    ajaxObj = obj;
    $.ajax( {
        type :"POST",
        url :url,
        async:false,
        data: params,
        success : processResponseText2
    }); 
}
function processResponseText2(msg){
	ajaxObj.text = msg;
}
/*************json联动 结束**********************/

