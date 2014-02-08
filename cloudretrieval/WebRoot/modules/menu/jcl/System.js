/** 
 * @fileoverview This file is to be used for frame and base class of AJAX Dev Library
 *
 * @author 
 * @version 1.0 
 */

var isMoz = (typeof document.implementation != 'undefined') && (typeof document.implementation.createDocument != 'undefined');
var isIE = (typeof window.ActiveXObject != 'undefined');

/**
 * Construct a window to ext base api.
 * @class window is the ext window.  
 */
/**
 * ext Package keyword.
 * @param {String} pkname package name
 * 
 */
window.Package=Package;
function Package(pkname) {
  var pkNames   = pkname.split(".");
  var pn,prevpn = "";
  for(var i=0; i<pkNames.length; i++) {
    pn = pkNames[i];
    if (typeof(pn) != "function") {
      var _s = "window."+prevpn+pn+"=new Object();";
	  if(isIE)
		execScript(_s, "JavaScript");
	  if(isMoz)
		window.eval(_s);
    }
	prevpn = pn+".";
  }
}
/**
 * ext Import keyword.
 * @param {String} url file name
 * @param {String} type file type,as .js,.css
 */
window.Import=Import;
function Import(url, type){
  var i, 
      base, 
      src = "System.js", 
      scripts = document.getElementsByTagName("script"); 
  for (i = 0; i < scripts.length; i++) {
      if (scripts[i].src.match(src)) {
          base = scripts[i].src.replace(src, "");
          break;
      }
  }
  if (type == "css") {
      document.write("<" + "link href=\"" + base + url + "\" rel=\"stylesheet\" type=\"text/css\"></" + "link>");
  } else {
      document.write("<" + "script src=\"" + base + url + "\"></" + "script>");
  }
}
/**
 * Construct a package to impl include files.
 * @class FunctionIsExist is the ext keyword FunctionIsExist.  
 * @param {String} url file name
 * @param {String} type file type,as .js,.css
 */
function FunctionIsExist(func_name){
	if(func_name)
		_System.Out(func_name+" is exist.");
}

Package("js.lang");
js.lang.Object=Object;

/**
 * Construct Object.
 * @class Object is the Object class.  
 *
 */
/**
 * inherits superclass.
 * @param {Object} superclass
 * @param {Object} object
 */
Object.prototype.Extends = Object_Extends;
function Object_Extends(superclass, object){
	var obj = object;
	if(!obj) obj = this;
	obj["SuperClass"] = superclass;
	var superobject = new superclass();
	for (var key in superobject) { 
        if (!obj[key] && !(key.indexOf("__") == 0)){
            obj[key] = superobject[key];   
		}
    } 
	superobject = null;
}
/**
 * get super.
 * @return {Object}
 * 
 */
Object.prototype.Super = Object_Super;
function Object_Super() {   
    if (!this.constructor.SuperClass)   
        return null;   
    if (this.constructor.SuperClass) {   
        var SuperConstructor = this.constructor.SuperClass;
        var _super = new SuperConstructor();   
        for (var key in this) {   
	        if (!this[key] && !(key.indexOf("__") == 0) && typeof(this[key])=="function")   
		        _super[key] = this[key];   
        }   

    }   
    return _super;   
}   

/**
 * add a property.
 * @param {String} property_name property name
 * 
 */
Object.prototype.AddProperty = Object_AddProperty;
function Object_AddProperty(property_name){
	if (!this.HasProperty(property_name))
		this[property_name]  = null;
	if(!this["Set"+property_name]) {
		var func_body = "var oldvalue=this."+property_name+";";
		func_body    += "this."+property_name+"=value;";
		func_body    += "this.FirePropertyChange('"+property_name+"',oldvalue,value);";
		this["Set"+property_name]=new Function("value", func_body);
	}
	if(!this["Get"+property_name])
		this["Get"+property_name]=new Function("return this."+property_name+";");
}
/**
 * Reports a property change.
 * @param {String} propertyName property name
 * @param {Object} oldValue 
 * @param {Object} newValue
 */
Object.prototype.FirePropertyChange = function(propertyName, oldValue, newValue){};

/**
 * ishas a property.
 * @param {String} property_name property name
 * @return {Boolean}
 */
Object.prototype.HasProperty  = Object_HasProperty;
function Object_HasProperty(property_name, object) {
  var obj = object;
  if(!obj)
	  obj = this;
  for (var i in obj) if (property_name==i) return true;
  return false;
}
/**
 * ishas a Function.
 * @param {String} func func body
 * @return {Boolean}
 */
Object.prototype.HasFunction  = Object_HasFunction;
function Object_HasFunction(func, object) {
  var obj = object;
  if(!obj)
	  obj = this;
  for (var i in obj) if (func==i.toString()) return true;
  return false;
}
/**
 * get class name.
 *
 * @return {String}
 */
Object.prototype.GetClassName = Object_GetClassName;
function Object_GetClassName(object){
	var obj = object;
	if(obj==null)
		obj = this;
	if(!obj.constructor) 
		return typeof(object);
	var s   = obj.constructor.toString();
	s       = s.replace("function", "").Trim();
	var pos = s.indexOf("(");
	if(pos!=-1)
		s   = s.substring(0, pos);
	return s;
}
/**
 * Indicates whether some other object is "equal to" this one.
 * @param {object}  the  other object to compare with . 
 * @return {Boolean}
 */
Object.prototype.Equals= Object_Equals;
function Object_Equals(obj) {
	if(this == obj) return true;
	if(typeof(obj)=="undefined"||obj==null||typeof(obj)!="object") return false;
	var length  = 0;
	var length1 = 0;
	for(var ele in this) length++;
	for(var ele in  obj) length1++;
	if(length!=length1) return false;
	if(obj.constructor==this.constructor) {
		for(var ele in this){
			if(typeof(this[ele])=="object") {if(!this[ele].Equals(obj[ele]))return false;}
			else if(typeof(this[ele])=="function") {if(!this[ele].toString().Equals(obj[ele].toString())) return false;}
			else if(this[ele]!=obj[ele]) return false;
	     }
	    return true;
	}
	return false;
}
/**
 * Construct String.inherits from Object.
 * @class String is the String class.  
 *
 * @see Object Object is the base class for this
 */

js.lang.String=String;
Object_Extends(Object, String);

/**
 * Trim space of string.
 * @param {String} str
 * @return {String}
 */
 String.prototype.Trim = function(str) 
{ 
	return this.replace(/(^\str*)|(\str*$)/g, ""); 
} 
/**
 * LeftTrim space of string.
 * @param {String} str
 * @return {String}
 */
String.prototype.LeftTrim = function(str) 
{ 
	return this.replace(/(^\str*)/g, ""); 
} 
/**
 * RightTrim space of string.
 * @param {String} str
 * @return {String}
 */
String.prototype.RightTrim = function(str) 
{ 
	return this.replace(/(\str*$)/g, ""); 
} 
/**
 * Indicates whether some other string is "equal to" this one.
 * @param {String}  the  other string to compare with . 
 * @return {Boolean}
 */
String.prototype.Equals = function(str){
	if(this == str) return true;
	return false;
}
/**
 * Construct System.inherits from Object.
 * @class System is the System class.  
 *
 * @see Object Object is the base class for this
 */
js.lang.System   = System;
Object_Extends(Object, System);
function System(){
}
/**
 * input.
 * @param {String} title
 * @param {String} default_value
 * @return {String}
 */
System.prototype.In = function(title, default_value) 
{ 
	return prompt(title, default_value);
}
/**
 * output.
 * @param {String} message
 */
System.prototype.Out = function(message) 
{ 
	alert(message);
}
/**
 * Err output error message.
 * @param {String} message
 */
System.prototype.Err = function(message) 
{ 
	alert(message);
}
/**
 * Show messagebox.
 * @param {String} message
 */
System.prototype.MessageBox = function(message) 
{ 
	alert(message);
}
/**
 * Exit and close window.
 * 
 */
System.prototype.Exit = function(message) 
{ 
	window.close();
}
/**
 * Get browser type.
 * @return {String}
 */
System.prototype.GetBrowserType = function() 
{ 
	if(isIE)
		return "IE";
	else if(isMoz)
		return "Moz";
	return "Other";
}
window._System = new System();
window.In   = _System.In;
window.Out  = _System.Out;
window.Err  = _System.Err;
window.Exit = _System.Exit;
/**
 * Get browser type.
 * @return {String}
 */
window.GetBrowserType = _System.GetBrowserType;

var Err_HasDets='Master table has detail data.please do it after while you delete details.';
var Err_OpenErr=':DataSet open error.:';
var Err_NoOpen='DataSet is not opened.';
var Err_Null="Data can't be empty.";
var Err_Long='Data exceed the limit length.';
var Err_Number='Invalid number.';
var Err_DateTime='Invalid date/time.';
var Err_NoURL="The URL not found,or URL service error£¬return null.";
var Err_ReadOnly="Readonly state.";
var Err_NoField="Field not found.";
var Err_NoDataSet="No dataset.";
var clBlack = "#000000";
var clMaroon = "#000080";
var clGreen = "#008000";
var clOlive = "#008080";
var clNavy = "#800000";
var clPurple = "#800080";
var clTeal = "#808000";
var clGray = "#808080";
var clSilver = "#C6C3C6";
var clRed = "#FF0000";
var clLime = "#00FF00";
var clYellow = "#00FFFF";
var clBlue = "#0000FF";
var clFuchsia = "#FF00FF";
var clAqua = "#FFFF00";
var clLtGray = "#C0C0C0";
var clDkGray = "#808080";
var clWhite = "#FFFFFF";

var clMoneyGreen = "#C0DCC0";
var clSkyBlue = "#F0CAA6";
var clCream = "#F0FBFF";
var clMedGray = "#A4A0A0";

var clNone = "#FFFFFF";
var clDefault = "#CCCCFF";
var StandardColorsCount = 16;
var ExtendedColorsCount = 4;
var clBlue0='#9CBEE7';
var clButton='#CECFCE';
var clShadow="#ADAAAD";
var clHightGray = "#F7F3F7";
var clBorder = "#9C9A9C";


var DecPoint=".";

var home_path="PT/";

var jcl_ResourceURL = "image/";
var image_AppendRecord = "newrecord.gif";
var image_DeleteRecord = "deleterecord.gif";
var image_SaveRecord = "saverecord.gif";

var image_First = "image_first.gif";
var image_First_Disable = "image_first_disable.gif";

var isMoz = (typeof document.implementation != 'undefined') && (typeof document.implementation.createDocument != 'undefined');
var isIE = (typeof window.ActiveXObject != 'undefined');
var isInspect=false;

window.VirtualPath="";
window.Exception=true;
if(window.opener)window.Parent=window.opener;
if(window.dialogArguments){window.Parent=window.dialogArguments;}

function Color(){
	var obj=new Object();
	obj.XP_LowBlue='#A5C7F7';
	obj.XP_SilverWhite='#F7F7F7';
	obj.XP_LowWhite='#FFEFC6';
	obj.XP_Purple='#6B6984';
	obj.Blue=clBlue;
	obj.White=clWhite;
	obj.Red=clRed;
	obj.Black=clBlack;
	obj.Gray=clGray;
	obj.Silver=clSilver;
	obj.Lime=clLime;
	obj.Yellow=clYellow;
	obj.Fuchsia=clFuchsia;
	obj.Aqua=clAqua;
	obj.LtGray=clLtGray;

	return obj;
}

window.Color=new Color();

XP_Style.prototype.SetStyle=function(obj){};
XP_Style.prototype.SetFont=function(obj){};
function XP_Style(){
	var obj=new Object();
	obj.BorderColor='#94A6B5';
	obj.BgColor=Color.XP_LowBlue;
    obj.MenuBorderColor='#002C94';	
	obj.SelectedColor='#FFEFC6';
	obj.HighlightColor=Color.White;
	obj.PanelColor="#F7F7F7";
	obj.DefaultColor=Color.White;
	obj.GridLineColor="#E7E7E7";
	obj.SelectedRowColor="#FFE7B5"
	obj.BorderStyle='solid';
	obj.BorderWidth=1;
	obj.SetFont=XP_Style_setFont;
	obj.SetStyle=XP_Style_setStyle;
	return obj;
}

function XP_Style_setFont(obj)
{
  obj.style.fontFamily='Arial';//Tahoma
  obj.style.fontSize='11';
  obj.style.color=clBlack;
}
function XP_Style_setStyle(obj)
{
  obj.style.borderStyle=this.BorderStyle;
  obj.style.borderColor=this.BorderColor;
  obj.style.borderWidth=this.BorderWidth;
}


window.XP_Style=new XP_Style();

window.DefaultStyle=XP_Style;

MouseEvent.prototype.LeftButton=1;
MouseEvent.prototype.RightButton=2;
MouseEvent.MiddleButton=4;
function MouseEvent(){
	var obj=new Object();
	if(isIE){
		obj.LeftButton=1;
		obj.RightButton=2;
		obj.MiddleButton=4;
	}
	if(isMoz){
		obj.LeftButton=0;
		obj.RightButton=2;
		obj.MiddleButton=1;
	}
	return obj;
}
window.MouseEvent=new MouseEvent();
	
function array_has(val)
 {
  var i;
  for(i = 0; i < this.length; i++)
  {
   if(this[i] == val)
   {
    return true;
   }
  }
  return false;
 }
 Array.prototype.has = array_has;
 
 
 function array_remove(val)
 {
  var i;
  var j;
  for(i = 0; i < this.length; i++)
  {
   if(this[i] == val)
   {
    for(j = i; j < this.length - 1; j++)
    {
     this[j] = this[j + 1];
    }
    this.length = this.length - 1;
   }
  }
 }
 Array.prototype.remove = array_remove;
 
 function array_removeAt(index)
 {
  var i;
  if(index < this.length)
  {
   for(i = index; i < this.length - 1; i++)
   {
    this[i] = this[i + 1];
   }
   this.length = this.length - 1;
  }
 }
 Array.prototype.removeAt = array_removeAt;
function getPosLeft(oElement, parent) { 
   var x=0; 
   el=oElement; 
   while(el){ 
	  if(el.offsetParent==parent) break;
      x += el.offsetLeft; 
      el=el.offsetParent; 
   }
   return x;
} 
function getPosTop(oElement, parent) { 
   var y=0; 
   el=oElement; 
   while(el){ 
	  if(el.offsetParent==parent) break;
      y += el.offsetTop; 
      el=el.offsetParent; 
   }
   return y;
} 

window.Show=function(url,title,ops){var bars;if(ops)bars=ops;else bars='menubar=yes,status=yes,toolbar=yes,scrollbars=yes,resizable=yes';return open(url,title,bars);}
window.ShowModal=function(url,ops){var o;if(ops)o=ops;else o='resizable:no';window.showModalDialog(url,window,o);}

function getDocument(object) {
  var doc;
  if(object)
	 doc=object.ownerDocument
  else doc=window.document;
  return doc;
}
function GetXMLDOM() {
  var xmlDoc;
  if (isIE) {
     xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
  } else if (isMoz) {
     xmlDoc = document.implementation.createDocument("","",null);
  }
  return xmlDoc; 
}
function GetXMLHTTP() 
{ 
	var xmlhttp=null;
	try 
	{ 
		xmlhttp=new ActiveXObject("Msxml2.XMLHTTP"); 
	} catch(e) { 
		try 
		{ 
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); 
		} catch(ex) { 
			xmlhttp=null;	
		} 
	} 
	if ( !xmlhttp && typeof XMLHttpRequest != "undefined" ) 
	{ 
		xmlhttp=new XMLHttpRequest(); 
	} 
	return xmlhttp; 
} 

function parseXML(st){
	var result;
    if(isIE){
        result = GetXMLDOM();
        result.loadXML(st);
    }else{
        var parser = new DOMParser();
        result = parser.parseFromString(st, "text/xml");
    }
    return result;
}
function XMLToStr(xml){
	if(isIE){
		return xml.xml;
	}
	else{
		var xmls = new XMLSerializer(); 
		var s = xmls.serializeToString(xml);
		return s;
	}
}
function DateTimeToStr(d)
{
if(isNaN(d))return;
var s = d.toLocaleString() ;
return s;
}
function DateToStr(d)
{
if(isNaN(d))return;
var s = d.toLocaleString();
return s;
}
function StrToTimeLong(value) {
  var r=/[\u4e00-\u9fa5]/;
  value=value.replace(r, "/");
  value=value.replace(r, "/");
  value=value.replace(r, "");
  var v=Date.parse(value);
  return v;
}

function FormatFloat(value,mask)
{
	return BasicFormat(value,mask,'FormatNumber')
}
function FormatDate(varDate, bstrFormat, varDestLocale)
{
	return BasicFormat(varDate,bstrFormat,'FormatDate',varDestLocale);
}
function FormatTime(varTime, bstrFormat, varDestLocale)
{
	return BasicFormat(varTime,bstrFormat,'FormatTime',varDestLocale);
}
function BasicFormat(value,mask,action,param)
{
	var xmlDoc;
	var xslDoc;
	var v='<formats><format><value>'+value+'</value><mask>'+mask+'</mask></format></formats>';
	xmlDoc=parseXML(v);

	var x; 
	if(isIE)
		x='<xsl:stylesheet xmlns:xsl="uri:xsl">'
	else
		x='<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">';
	x+='<xsl:template match="/">';
	if(isIE) {
		x+='<xsl:eval>'+action+'('+value+',"'+mask+'"';
		if(param)x+=','+param;
		x+=')</xsl:eval>';
	}
	else
		x+='<xsl:value-of select="format-number('+value+',\''+mask+'\')" />';

	x+='</xsl:template></xsl:stylesheet>';
	xslDoc=parseXML(x);
	var s;
	if(isIE)
	 s= xmlDoc.transformNode(xslDoc)
	else{
		//for mozilla/netscape 
        var processor = new XSLTProcessor(); 
		processor.importStylesheet(xslDoc);
		var result = processor.transformToFragment(xmlDoc, xmlDoc);
        var xmls = new XMLSerializer(); 
        s = xmls.serializeToString(result);
	}
	return s;
}
function isOddNumber(value)
{
  var v = parseInt(value/2);
  if(v*2!=value) return true
  else return false;
}

//new Strings();
function Strings(){
  this.Strings=new Array();
  this.Count=0;
  this.Add=function(v){var a=this.Strings;a[a.length]=v;this.Count=a.length};
  this.Clear=function(){this.Strings.length=0;this.Count=0;};
}

function Items(parent){
  this.Parent=parent;
  this.Item=new Array();
  this.Count=0;
  this.Add=Items_Add;
  this.Clear=Items_Clear;
  this.Delete=Items_Delete;
  return this;
}
function Items_Add(item)
{
  if(this.Parent)this.Parent.appendChild(item);
  this.Item[this.Item.length]=item;
  item.Index=this.Item.length-1;
  item.Parent=this.Parent;
  this.Count=this.Item.length;
}
function Items_Delete(item)
{
  _arrayremove(this.Item,item.Index);
  if(this.Parent)this.Parent.removeChild(item);
  item.removeNode(true);
  this.Count=this.Item.length;
}
function Items_Clear()
{
   for(var i=0;i<this.Item.length;i++){
	   this.Delete(this.Item[i]);
   }
}


new Params();
Params.prototype.Count;
Params.prototype.Add=function(param){this.Param[param.Name]=param;this.Paramx[this.Paramx.length]=param;this.Count=this.Paramx.length;}
Params.prototype.Clear=function(){this.Paramx.length=0;this.Param=new Array();this.Count=0;}
function Params(){
  this.Param=new Array();
  this.Paramx=new Array();
}
new Param(null,null,null);
Param.prototype.Name;
Param.prototype.Value;
Param.prototype.Type;
function Param(name,value,type)
{
  this.Name=name;this.Value=value;this.Type=type;
}
function jcl_err(e)
{
  if(window.Exception){alert(e);}else throw e;
}

function DC_onpropertychange(sender)
{
  var n;
  if(isIE) {
	  n=event.propertyName;
	  sender=this;
  }
  else
	  n='DataSet';
  switch(n){
	case 'DataSet':
	  if(sender.OldDataSet==sender.DataSet)return;
	  if(sender.OldDataSet)sender.OldDataSet.RemoveLink(sender);
      if(sender.DataSet)sender.DataSet.LinkObj(sender);
	  sender.OldDataSet=sender.DataSet;
	  break;
  }
}

function addEventTimerListener(obj,func){
	listenerFuncList[listenerFuncList.length]=func;
	listenerObjList[listenerObjList.length]=obj;
	return listenerFuncList.length-1;
}
function removeEventTimerListener(index){
	_arrayremove(listenerFuncList, index);
	_arrayremove(listenerObjList, index);
}
function clearEventTimerListener(index){
	listenerFuncList.length=0;
	listenerObjList.length=0;
}

function processEventTimerListener(){
	for(var i=0;i<window.listenerFuncList.length;i++){
		listenerFuncList[i](listenerObjList[i]);
	}
}
function startEventListener(){
	window.listenerFuncList=new Array();
	window.listenerObjList=new Array();
	window.eventDelay=300;
	window.eventTimer=setInterval(processEventTimerListener, window.eventDelay); 
}
function stopEventListener(){
	clearInterval(window.eventTimer); 
}

if(isMoz){
	startEventListener();
}


function Reflector()
{
	var obj = new Object();
    obj.getProperties=function(obj){
        var props = "";
		var type;
        for (idx in obj)
        {
			type = typeof(obj[idx]);
			if(type!='function')
               props += idx+":"+type+";";
        }
        return props;
    }
    obj.getMethods=function(obj){
        var props = "";
		var type;
        for (idx in obj)
        {
			type = typeof(obj[idx]);
			if(type=='function')
               props += idx+":"+type+";";
        }
        return props;
    }	
    obj.getMembers=function(obj){
        var props = "";
		var type;
		var member;
		var pos;
        for (idx in obj)
        {
			member = obj[idx];
			if(member) {
				type = typeof(obj[idx]);
				if(type=='function') {
					member = member.toString();
					pos = member.indexOf('(');
					if(pos!=-1) {
						member = member.substring(pos);
						pos = member.indexOf(')');
						if(pos!=-1)
							member = member.substring(0,pos+1);
					}
					props += idx+":"+type+member+";";
				}
				else if(type=='object'){
					type = Object_GetClassName(obj[idx]);
					props += idx+":"+type+";";
				}
				else props += idx+":"+type+";";
			}
        }
        return props;
    }	
	return obj;
}
function _arrayremove(changingarray,index){
	if(changingarray)	{

		var newarray1=changingarray.slice(0,index);
		var newarray2=changingarray.slice(index+1,changingarray.length);
		changingarray.length=0;
		changingarray=newarray1.concat(newarray2);
		return changingarray;
	}
}

function _arraypush(changingarray,newarraynode,index) {
   if ( changingarray ) {
     var newarray1 = changingarray.slice(0,index);
     var newarray2 = changingarray.slice(index,changingarray.length);
     newarray1[newarray1.length] = newarraynode;
     changingarray.length = 0;
     changingarray = newarray1.concat(newarray2);
     return changingarray;
  }
}

function _arrayswap(changingarray,indexfirst,index) {
   if ( changingarray ) {
      var m=changingarray[indexfirst];
      changingarray[indexfirst] = changingarray[index];
      changingarray[index] = m;
   }
}

function setStyle(obj)
{
//  obj.style.borderStyle='solid';
//  obj.style.borderWidth=1;
  obj.style.fontFamily='Arial';//Tahoma
  obj.style.fontSize='12';
}
function setFont(obj)
{
  obj.style.fontFamily='Arial';//Tahoma
  obj.style.fontSize='12';
  obj.style.color=clBlack;
}
function unitToValue(value){
	if(value!=null) {
	  var length=value.length;
	  return parseFloat(value.substring(0,length-2));
	}
	else return 0;
}
function Rectangle(x,y,w,h){
  this.x=x;this.y=y;this.width=w;this.height=h;
  this.isContainXY=Rectangle_isContainXY;
}
function Rectangle_isContainXY(x,y){
  var result=false;
  if(x>this.x&&x<(this.x+this.width)&&y>this.y&&y<(this.y+this.height))
	  result=true;
//  alert(x+":"+y+":"+this.x+":"+this.y+"="+result);
  return result;
}
