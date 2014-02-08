
/*************************************************************************************************************/ 
/*************************************************���ֶ�У��*************************************************/
/*************************************************************************************************************/
/**
*���� zhaowentao 2008-05-22
*���ܣ���֤����������ں���
*˵����ҳ�����$('#formId').validateForm();
*���:validateFlag��֤���true��false
*/



<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ page import="java.util.*"%>
<%@ page import="modules.base.*"%>
<%
	baseForm bform=(baseForm)(request.getSession()).getAttribute("baseuser");
	String language = bform.language;
	System.out.println(language);
%>

var validateMessage="";
var msgDiv;
var errorClass="validate-input-error";
var okClass="validate-input-ok";
$.fn.validateForm = function() {
	validateMessage="";
	var validateFlag = true;
	var tempFlag = true;
	var validateFormObj = this;
	var validateObjects = $("#"+validateFormObj.attr('id')+" [isValidate='true']");
    $("#"+validateFormObj.attr('id')+" span").remove(".validate-error-message");
    $.each(validateObjects, function() {
		tempFlag = checkTag($(this));
		changClass($(this),tempFlag);
		if(!tempFlag){
			validateFlag = false;
		}
		
    });
	if(!tempFlag){
		validateFlag = false;
	}
	//window.setTimeout(function(){$("#"+validateFormObj.attr('id')+" span.validate-error-message").hide(3000);}, 6000);
	return validateFlag; 
};
/**
*���� zhaowentao 2011-12-22
*���ܣ�����������֤��ں���
*˵����������onblur="validateObj($(this))"
*���:validateFlag��֤���true��false
*/
function validateObj(obj){
	obj = $(obj);
	var validateFlag = true;
	if(obj.attr("isValidate")=="true"){
		obj.next('span.validate-error-message').remove();
		validateFlag = checkTag(obj);
		changClass(obj,validateFlag);
		//window.setTimeout(function(){obj.next('span.validate-error-message').hide(3000);}, 6000);
	}
	return validateFlag; 
}
function changClass(obj,flag){
	if(flag){
		obj.css({"border":"1px solid #669966"});
		//obj.removeClass(errorClass);
		//obj.addClass(okClass);
	}else{
		obj.css({"border":"1px solid #ee6666"});
		//obj.removeClass(okClass);
		//obj.addClass(errorClass);
		var messageSpan = $("<span id='message_span' class='validate-error-message'></span>");
		//messageSpan.append("<img src='"+ctx_path+"/images/main/arrow_left_red.png'/> ");
		messageSpan.append(validateMessage);
		obj.after(messageSpan);
	}
}
/*
*���ܣ���֤�� �߼�������
*˵����add by zhaowentao 2008-05-20
*/
function checkTag(obj){
	var checkFlag=true;
	trimObjText(obj);
	if(obj.attr("notEmpty") && obj.attr("notEmpty")=="true"){
		if(!checkEmpty(obj))checkFlag=false;
	}
	if(obj.attr("isNum") && obj.attr("isNum")=="true"){
		if(!checkNum(obj))checkFlag=false;
	}
	/*****************************************************************************************************************************************/
	if(obj.attr("isIp")&& obj.attr("isIp")=="true"){
		if(!checkIp(obj))checkFlag=false;
	}
	/*****************************************************************************************************************************************/
	if(obj.attr("isNatrual") && obj.attr("isNatrual")=="true"){
		if(!checkNatrual(obj))checkFlag=false;
	}
	if(obj.attr("isInteger") && obj.attr("isInteger")=="true"){
		if(!checkInteger(obj))checkFlag=false;
	}
	if(obj.attr("isSignFloat") && obj.attr("isSignFloat")=="true"){
		if(!checkSignFloat(obj))checkFlag=false;
	}
	if(obj.attr("isFloat") && obj.attr("isFloat")=="true"){
		if(!checkFloat(obj))checkFlag=false;
	}
	if(obj.attr("isEnglish") && obj.attr("isEnglish")=="true"){
		if(!checkEnglish(obj))checkFlag=false;
	}
	if(obj.attr("isChinese") && obj.attr("isChinese")=="true"){
		if(!checkChinese(obj))checkFlag=false;
	}
	if(obj.attr("isCharOrNum") && obj.attr("isCharOrNum")=="true"){
		if(!checkCharOrNum(obj))checkFlag=false;
	}
	if(obj.attr("isPhone") && obj.attr("isPhone")=="true"){
		if(!checkPhone(obj))checkFlag=false;
	}
	if(obj.attr("isMobile") && obj.attr("isMobile")=="true"){
		if(!checkMobile(obj))checkFlag=false;
	}
	if(obj.attr("isEmail") && obj.attr("isEmail")=="true"){
		if(!checkEmail(obj))checkFlag=false;
	}
	if(obj.attr("isPost") && obj.attr("isPost")=="true"){
		if(!checkPost(obj))checkFlag=false;
	}
	if(obj.attr("isUrl") && obj.attr("isUrl")=="true"){
		if(!checkUrl(obj))checkFlag=false;
	}
	if(obj.attr("fileFormat")){
		if(!checkFileFormat(obj))checkFlag=false;
	}
	if(obj.attr("isTime") && obj.attr("isTime")=="true"){
		if(!checkTime(obj))checkFlag=false;
	}
	if(obj.attr("isDate") && obj.attr("isDate")=="true"){
		if(!checkDate(obj))checkFlag=false;
	}
	if(obj.attr("endDate")){
		if(!compareDate(obj))checkFlag=false;
	}
	if(obj.attr("numberFormat")){
		if(!checkNumberFormat(obj))checkFlag=false;
	}
	if(obj.attr("isIDCard") && obj.attr("isIDCard")=="true"){
		if(!checkIDCard(obj))checkFlag=false;
	}
	if(obj.attr("confirmSameValue")){
		if(!confirmSameValue(obj))checkFlag=false;
	}
	if(obj.attr("confirmDifferValue")){
		if (!confirmDifferValue(obj))checkFlag=false;
	}
	if(obj.attr("isGroup") && obj.attr("isGroup")=="true"){
		if(!checkGroup(obj))checkFlag=false;
	}
	if(obj.attr("notSpecial") && obj.attr("notSpecial")!=null){
		if(!checkSpecial(obj))checkFlag=false;
	}
	if(obj.attr("replaceChar") && obj.attr("replaceChar")=="true"){
		if(!checkReplaceChar(obj))checkFlag=false;
	}
	if(obj.attr("leng") && isNumber(obj.attr("leng"))){
		if(!checkLeng(obj))checkFlag=false;
	}
	if(obj.attr("minLeng") && isNumber(obj.attr("minLeng"))){
		if(!checkMinLeng(obj))checkFlag=false;
	}
	return checkFlag;
}
/*************************************************************************************************************/ 
/*************************************************��������У��*************************************************/
/*************************************************************************************************************/
/*
*���ܣ���ȡ�ַ�������  
*ʱ�䣺2007-10-22
*ʹ��˵��������value������true��false
*/
function getLength(str){
   return str.length;
}
/*
*���ܣ���ȡ�����ַ������ֽ�����һ��������Ϊ�����ֽڡ�
*ʱ�䣺2008-05-20
*ʹ��˵��������value������length
*/
function getByte(str){
	return str.replace(/[^\x00-\xff]/g,"**").length;
}
/*
*���ܣ���ȥ�ַ���ǰ��Ļس����ո񡢻��з� 
*ʱ�䣺2007-10-22
*�÷�������string
*/
function trimSpace(val){  
	return val.replace(/(^[\n\r\s]*)|([\n\r\s]*$)/g, ""); 
}  
/*
*���ܣ���ȥ�ַ���ǰ��Ŀո� 
*ʱ�䣺2007-10-22
*�÷�������string
*/
function trim(val){
    return val.replace(/(^\s*)|(\s*$)/g, "");
} 
/*
*���ܣ��ַ�����У��
*ʱ�䣺2007-10-22
*ʹ��˵��������String���շ���true���򷵻�false
*/
function isEmpty(str){
	if(str==null||trim(str.toString())=="") return true;
	else  return false;
}       
/*
*���ܣ���ֵ��֤
*ʱ�䣺2008-05-20
*ʹ��˵��������valueֵ������true��false
*/
function isNumber(val){
	val = trim(val);
	if(isEmpty(val)){return true; } 
	var testVal=/^\d+$/;
	return testVal.test(val); 
}
/********************************************************************************************************************************************/
/*
*���ܣ�IP��֤
*ʱ�䣺
*ʹ��˵��������valueֵ������true��false
*/
function isIp(val){
	val = trim(val);	
	if(isEmpty(val)){return true; } 
	var testVal=/^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\b$/;
	return testVal.test(val); 
}
/************************************************************************************************************************************************/
/*
*���ܣ���Ȼ������������֤
*ʱ�䣺2008-05-20
*ʹ��˵��������valueֵ������true��false
*/
function isNatrual(val){
	val = trim(val);	
	if(isEmpty(val)){return true; } 
	var testVal=/^([0-9]|([1-9]\d*))$/;
	return testVal.test(val); 
}
/*
*���ܣ�������֤
*ʱ�䣺2008-05-20
*ʹ��˵��������valueֵ������true��false
*/
function isInteger(val){	
	val = trim(val);
	if(isEmpty(val)){return true; } 
	var testVal=/^([-\+]?([0-9]|([1-9]\d*)))$/;
	return testVal.test(val); 
}
/*
*���ܣ�������С����֤
*ʱ�䣺2008-05-20
*ʹ��˵��������valueֵ������true��false
*/
function isSignFloat(val){	 
	val = trim(val);
	if(isEmpty(val)){return true; }
	var testVal=/^([-\+]?([0-9]|([1-9]\d*))(\.\d+)?)$/;
	return testVal.test(val); 
}
/*
*���ܣ��޷���С����֤
*ʱ�䣺2008-05-20
*ʹ��˵��������valueֵ������true��false
*/
function isFloat(val){	
	val = trim(val); 
	if(isEmpty(val)){return true; }
	var testVal=/^(([0-9]|([1-9]\d*))(\.\d+)?)$/;
	return testVal.test(val); 
}
/*
*���ܣ�Ӣ���ַ���֤
*ʱ�䣺2008-05-20
*ʹ��˵��������valueֵ������true��false
*/
function isEnglish(val){
	val = trim(val);
	if(isEmpty(val)){return true; }	 
	var testVal=/^[A-Za-z]+$/;
	return testVal.test(val); 
}
/*
*���ܣ������ַ���֤
*ʱ�䣺2008-05-20
*ʹ��˵��������valueֵ������true��false
*/
function isChinese(val){
	val = trim(val);	
	if(isEmpty(val)){return true; } 
	var testVal=/^[\u0391-\uFFE5]+$/;
	return testVal.test(val); 
}
/*
*���ܣ�Ӣ�Ļ���ֵ�ַ���֤ �ж��Ƿ���0-9��a��z��A��Z���ַ�
*ʱ�䣺2008-05-20
*ʹ��˵��������valueֵ������true��false
*/
function isCharOrNum(val){	
	val = trim(val);
	if(isEmpty(val)){return true; } 
	var testVal=/^\w+[\w\.\-]*$/;
	return testVal.test(val); 
} 
/*
*���ܣ��绰������֤
*ʱ�䣺2008-05-20
*ʹ��˵��������valueֵ������true��false
*/
function isPhone(val){ 
	val = trim(val);
	if(isEmpty(val)){return true; }
	var testVal=/^(((\(\d{2,3}\))|(\d{2,3}\-))?(\(0\d{2,3}\)|0\d{2,3})?-?[1-9]\d{6,7}(\-\d{1,4})?)$/;
	return testVal.test(val);
} 
/*
*���ܣ��ƶ��绰��֤
*ʱ�䣺2008-05-20
*ʹ��˵��������valueֵ������true��false
*/
function isMobile(val){ 
	val = trim(val);
	if(isEmpty(val)){return true; }
	var testVal=/^((1)|(0\d{1}))\d{10}$/;
	return testVal.test(val);
}                   
/*
*���ܣ��Ƿ��ַ�У��
*ʱ�䣺2008-05-22
*ʹ��˵����valΪ��֤��Ŀ��String��
		  charsΪҪ��֤�������ַ�����ע��"\"Ϊ"\\"
		  ����true���򷵻�false
*/
function isSpecial(val,chars){
	val = trim(val);
	chars = trim(chars);
	if(isEmpty(val)||isEmpty(chars)){return true; }
	var oneChar= "";
	var testChars ="";
	for(var i=0;i<chars.length;i++){
		oneChar=chars.charAt(i);
		testChars = testChars + "\\" + oneChar; 
	} 
	testChars = "^[^\\"+testChars+"]*$";
	var testVal=new RegExp(testChars);    
	return testVal.test(val); 
} 
/*
*���ܣ�У��Email�Ƿ�Ϸ�  
*ʱ�䣺2007-10-22
*ʹ��˵��������value������true��false
*/
function isEmail(val){
	val = trim(val);
	if(isEmpty(val)){return true; }
	var testVal=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/; 
	return testVal.test(val);
} 
/*
*���ܣ�У�����������Ƿ�Ϸ�  
*ʱ�䣺2007-10-22
*ʹ��˵��������value������true��false
*/
function isPostalcode(val){
	val = trim(val);
	if(isEmpty(val)){return true; }
	var testVal=/^[1-9]\d{5}$/; 
	return testVal.test(val);
} 
/*
*���ܣ�У��url��ַ�Ƿ�Ϸ�  
*ʱ�䣺2007-10-22
*ʹ��˵��������value������true��false
*/
function isUrl(val){
	val = trim(val);
	if(isEmpty(val)){return true; }
	var testVal=/^[a-zA-z]+:\/\/[A-Za-z0-9]+(\.[A-Za-z0-9]+)*(:\d+)?[\/=\?%\-&_~`@\[\]\':\+!]*([^<>\'\"])*$/; 
	return testVal.test(val);
}
/* 
*���ܣ�У��ʱ���ʽ�Ƿ�Ϸ� 00:00:00--23:59:59
*ʱ�䣺2008-05-22
*ʹ��˵��������value����֤��ʽΪHH:mm:ss��HH:mm��HH������true��false
*/
function isTime(val){
	val = trim(val);
	if(isEmpty(val)){return true; }
	var testVal= /^([0-1]\d|2[0-3])(:[0-5]\d(:[0-5]\d)?)?$/;
	return testVal.test(val); 
} 
/*
*���ܣ��ж�val�Ƿ���format��ʽ����������
*ʱ�䣺2008-05-22
*ʹ��˵����val:��֤Ŀ�����ڣ�msg���������ƣ�format������У���ʽ��
		  У���ʽ�У�yyyyMMdd��yyyy-MM-dd��yyyy_MM_dd��yyyy/MM/dd
		  ���ʱ���롢ʱ��,��ʽΪHH:mm:ss��HH:mm
		  ����true��false
*/
function isDate(val,msg,format){ 
	val = trim(val);
	msg = trim(msg);
	format = trim(format).toLowerCase();
	if(isEmpty(val)||isEmpty(format)){return true; }
  	var m, year, month, day; 	
  	var dateStr = "",timeStr = "";
	if(format=="yyyymmdd"){
			var testVal= /^\d{8}$/;
			if(testVal.test(val)){
				dateStr = val; 
			}else{ 
				assembleMessage("��yyyyMMdd��ʽ�����ڲ�ƥ��");
				return false;
			}
	}else if(format=="yyyymmdd hh:mi"){
            var testVal= /^\d{8}\s\d{2}:\d{2}$/;
			if(testVal.test(val)){ 
	            dateStr = val.substring(0,8);
			    timeStr = val.substring(9,14);
			}else{ 
				assembleMessage("��yyyyMMdd HH:mi��ʽ�����ڲ�ƥ��");
				return false;
			} 
	}else if(format=="yyyymmdd hh:mi:ss"){
            var testVal= /^\d{8}\s\d{2}:\d{2}:\d{2}$/;
			if(testVal.test(val)){ 
	            dateStr = val.substring(0,8);
			    timeStr = val.substring(9,17);
			}else{ 
				assembleMessage("��yyyyMMdd HH:mi:ss��ʽ�����ڲ�ƥ��");
				return false;
			} 
	}else if(format=="yyyy-mm-dd"){
			var testVal= /^\d{4}\-\d{1,2}\-\d{1,2}$/;
			if(testVal.test(val)){
				m = val.match(new RegExp("^(\\d{4})[-](\\d{1,2})[-](\\d{1,2})$")); 
				day = lpad(m[3]*1,"0",2); 
			    month = lpad(m[2]*1,"0",2); 
			    year = lpad(m[1]*1,"0",4);
				dateStr = year+month+day;
			}else{ 
				assembleMessage("��yyyy-MM-dd��ʽ�����ڲ�ƥ��");
				return false;
			} 
	}else if(format=="yyyy-mm-dd hh:mi"){
			var testVal= /^\d{4}\-\d{2}\-\d{2}\s\d{2}:\d{2}$/;
			if(testVal.test(val)){ 
				dateStr = (val.substring(0,10)).replace(/\-/g, "");
			    timeStr = val.substring(11,16); 
			}else{ 
				assembleMessage("��yyyy-MM-dd HH:mi��ʽ�����ڲ�ƥ��");
				return false;
			} 
	}else if(format=="yyyy-mm-dd hh:mi:ss"){
			var testVal= /^\d{4}\-\d{2}\-\d{2}\s\d{2}:\d{2}:\d{2}$/;
			if(testVal.test(val)){ 
				dateStr = (val.substring(0,10)).replace(/\-/g, "");
			    timeStr = val.substring(11,19); 
			}else{ 
				assembleMessage("��yyyy-MM-dd HH:mi:ss��ʽ�����ڲ�ƥ��");
				return false;
			} 
	}else if(format=="yyyy_mm_dd"){
			var testVal= /^\d{4}\_\d{2}\_\d{2}$/;
			if(testVal.test(val)){
				dateStr = val.replace(/\_/g, "");
			}else{ 
				assembleMessage("��yyyy_MM_dd��ʽ�����ڲ�ƥ��");
				return false;
			} 
	}else if(format=="yyyy_mm_dd hh:mi"){
			var testVal= /^\d{4}\_\d{2}\_\d{2}\s\d{2}:\d{2}$/; 
			if(testVal.test(val)){ 
				dateStr = (val.substring(0,10)).replace(/\_/g, "");
			    timeStr = val.substring(11,16);  
			}else{ 
				assembleMessage("��yyyy_MM_dd HH:mi��ʽ�����ڲ�ƥ��");
				return false;
			} 
	}else if(format=="yyyy_mm_dd hh:mi:ss"){
			var testVal= /^\d{4}\_\d{2}\_\d{2}\s\d{2}:\d{2}:\d{2}$/;
			if(testVal.test(val)){ 
				dateStr = (val.substring(0,10)).replace(/\_/g, "");
			    timeStr = val.substring(11,19); 
			}else{ 
				assembleMessage("��yyyy_MM_dd HH:mi:ss��ʽ�����ڲ�ƥ��");
				return false;
			}
	}else if(format=="yyyy/mm/dd"){
			var testVal= /^\d{4}\/\d{2}\/\d{2}$/;
			if(testVal.test(val)){
				dateStr = val.replace(/\//g, "");
			}else{ 
				assembleMessage("��yyyy/MM/dd��ʽ�����ڲ�ƥ��");
				return false;
			} 
	}else if(format=="yyyy/mm/dd hh:mi"){
			var testVal= /^\d{4}\/\d{2}\/\d{2}\s\d{2}:\d{2}$/;
			if(testVal.test(val)){ 
				dateStr = (val.substring(0,10)).replace(/\//g, "");
			    timeStr = val.substring(11,16); 
			}else{ 
				assembleMessage("��yyyy/MM/dd HH:mi��ʽ�����ڲ�ƥ��");
				return false;
			} 
	}else if(format=="yyyy/mm/dd hh:mi:ss"){
			var testVal= /^\d{4}\/\d{2}\/\d{2}\s\d{2}:\d{2}:\d{2}$/;
			if(testVal.test(val)){ 
				dateStr = (val.substring(0,10)).replace(/\//g, "");
			    timeStr = val.substring(11,19); 
			}else{ 
				assembleMessage("��yyyy/MM/dd HH:mi:ss��ʽ�����ڲ�ƥ��");
				return false;
			}  
	}else{
		assembleMessage("�ж����ʱ���ʽ�����ܴ���");
		    return false;
	}
	if(!isTime(timeStr)){
		assembleMessage("��ʱ�䲻��ȷ");
		return false;
	}
	m = dateStr.match(new RegExp("^(\\d{4})(\\d{1,2})(\\d{1,2})$")); 
	if(m==null){
		assembleMessage("������"+format+"��ʽ������");
		return false;
	} 
    day = m[3]*1; 
    month = m[2]*1; 
    year = m[1]*1;
  	if(parseInt(month)<=0||parseInt(month)>12){
  		assembleMessage("������1��12֮����·�");
		return false;
  	}
	if(parseInt(year)<1900||parseInt(year)>2300){
		assembleMessage("������1900��2300֮������");
		return false;
  	}
  	if(parseInt(day)<1||parseInt(day)>31){
  		assembleMessage("������01��31֮�������");
		return false;
  	}
	month = month==0 ?12:month;
  	var date = new Date(year, month-1, day); 
  	if(!(typeof(date) == "object" && year == date.getFullYear() && month == (date.getMonth()+1) && day == date.getDate())){
  		assembleMessage(year+"��"+month+"��"+"��"+day+"��");
		return false;
	}
	return true;  
 }
/*
*���ܣ�У��val��ʵ��������format��ʽ����������
*ʱ�䣺2008-05-22
*ʹ��˵����val:��֤Ŀ�����֣�intLen���������ֳ��ȣ�floatLen��С�����ֳ��ȣ�
		   msg���������ƣ�����true��false
*/
 function isDouble(val,intLen,floatLen,msg) { 
 	 val = trim(val); 
 	 intLen = trim(intLen); 
 	 floatLen = trim(floatLen);   
 	 if(isEmpty(val)){return true; }   
 	 if(!isFloat(val)){
 		assembleMessage("�����ǷǸ�ʵ��");
	 	return false; 
 	 }  
     if (isNatrual(val)) { 
     	if(val.length>intLen){ 
     		assembleMessage("�������ֳ���(���"+intLen+"λ)");
		 	return false; 
     	}
 	 }else{  
 	 	var arrData = val.split(".");
 	 	var iLen = arrData[0].length;
 	 	var fLen = arrData[1].length;
 	 	if(iLen>intLen&&fLen>floatLen){ 
 	 		assembleMessage("�����������"+intLen+"λ��С���������"+floatLen+"λ");
		 	return false; 
 	 	}else if(iLen>intLen){ 
 	 		assembleMessage("�������ֳ���(���"+intLen+"λ)");
		 	return false; 
 	 	}else if(fLen>floatLen){ 
 	 		assembleMessage("С�����ֳ���(���"+floatLen+"λ)");
		 	return false; 
 	 	}
	 }   
     return true; 
 } 
/*
*���ܣ�������֤�����ʽ�Ƿ���ȷ��
*���룺���֤���룻
*�������true����false��
*�㷨: ���֤�ĺ����������Ϊ��λ���ֵ�ַ�룬��λ���ֳ��������룬 ��λ����˳�����һλ����У����;
*���ߣ� zhenglz		 
*/
function isValidIdCard(idCardNum){
 	 if(isEmpty(idCardNum)){return true; } 
	//���֤ǰ17λ�����ҵ�Ȩֵ
	var weight =new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2);
	var sum = 0;
	var checkDigit ='X'; 
	/*���֤���ȼ��*/
	if(idCardNum.length != 15 && idCardNum.length != 18){ 
		return false;
	} 
	/*15λ���֤����*/
	if(idCardNum.length == 15){
		//���������յĺϷ��� 
		if(isNaN(idCardNum.substr(0,14))){ 
			return false;
		}  
		if(!isDate("19" + idCardNum.substr(6,6),"���֤����","yyyyMMdd")) return false;
		return true;
	} 
	//ǰ17λ�Ƿ�ȫΪ����
	if(isNaN(idCardNum.substr(0,17))){ 
		return false;
	}
	//���������յĺϷ���
	if(!isDate(idCardNum.substr(6,8),"���֤����","yyyyMMdd")) return false; 
	//����У��λ��ֵ
	for(var i = 0; i < 17; i++){
		sum = sum + idCardNum.substr(i,1)*weight[i];
	} 
	//������
	var mod = sum - Math.floor(sum/11)*11; 
	switch(mod){
		case 0:
			checkDigit = "1";
			break;
		case 1:
			checkDigit = "0";
			break;
		case 2:
			checkDigit = "X";
			break;
		case 3:
			checkDigit = "9";
			break;
		case 4:
			checkDigit = "8";
			break;
		case 5:
			checkDigit = "7";
			break;
		case 6:
			checkDigit = "6";
			break;
		case 7:
			checkDigit = "5";
			break;
		case 8:
			checkDigit = "4";
			break;
		case 9:
			checkDigit = "3";
			break;
		case 10:
			checkDigit = "2";
			break;
	} 
	if(idCardNum.substr(17,1).toLowerCase() != checkDigit.toString().toLowerCase()){ 
		return false;
	} 
	return true;
}
/*
*���ܣ�У���ϴ��ļ���ʽ�Ϸ���
*ʱ�䣺2010-12-02
*˵����val���ļ�·��,formats��ָ�����ļ���ʽ�� ��ʽ��:gif|jpg|jpeg;
*�������true����false��		 
*/
function isFileFormat(val,formats){

	val = trim(val);
	formats = trim(formats);
	if(isEmpty(val)||isEmpty(formats)){return true; }
	val = val.toLowerCase();
	formats = formats.toLowerCase();
	var chars = formats.split("|");
	var testChars ="";
	for(var i=0;i<chars.length;i++){
		if(!isEmpty(chars[i])){
			testChars = testChars + "(" + chars[i]+")|"; 
		}
	}
	if(testChars.length>1)testChars = testChars.substring(0,testChars.length-1);
	testChars = "(.)+(\\.)+("+testChars+")$";
	var testVal=new RegExp(testChars);    
	return testVal.test(val);
}
/*
*���ܣ��Զ���checkboxѡ�����
*ʱ�䣺2008-05-23
*˵����groups��checkbox���󼯺�;minΪ��Сѡ�и���maxΪ���ѡ�и���,max=allΪ����ȫѡ;
	max>=min,min��max�ǿ�ѡ����
*�������true����false��		 
*/
function mustChecked(groups, min, max){ 
	var hasChecked = 0;  
	min = !min ? 0 : min;
	max = !max ? groups.length : max;
	for(var i=groups.length-1;i>=0;i--)
	if(groups[i].checked) hasChecked++;
	return min <= hasChecked && hasChecked <= max;
}
/*************************************************************************************************************/ 
/*************************************************tagУ�麯��*************************************************/
/*************************************************************************************************************/
/*
/*
*���ܣ��ǿ���֤
*˵����add by zhaowentao 2008-05-20
*	ͨ��notEmpty��ǩ�ж��Ƿ������֤
*/
function checkEmpty(obj){
	var value = obj.val();
	if(obj.attr("notEmpty")=="true"){
		if(isEmpty(value)){
			assembleMessage("<bean:message key='msg.error.notempty' bundle='${language}'/>");
			return false;
		}
	}
	return true;
}
/*
*���ܣ��ַ�����󳤶���֤
*˵����add by zhaowentao 2008-05-20
*	ͨ��leng��ǩ�ж��Ƿ������֤
*/
function checkLeng(obj){ 
	if(obj.attr("leng")==""){ return true; } 
	var value = obj.val(); 
	if(getByte(value)>obj.attr("leng")){
		assembleMessage("���Ȳ��ܴ���"+obj.attr("leng")+"���ַ�");
		return false;
	} 
	return true;
} 
/*
*���ܣ��ַ�����С������֤
*˵����add by zhaowentao 2008-05-20
*	ͨ��minLeng��ǩ�ж��Ƿ������֤
*/
function checkMinLeng(obj){ 
	if(obj.attr("minLeng")==""){ return true; } 
	var value = obj.val();
	if(isEmpty(value)){return true; }
	if(getByte(value)<obj.attr("minLeng")){
		assembleMessage("���Ȳ���С��"+obj.attr("minLeng")+"���ַ�");
		return false;
	} 
	return true;
} 
/*
*���ܣ�����У��
*˵����add by zhaowentao 2008-05-20
*	ͨ��isNum��ǩ�ж��Ƿ������֤
*/
function checkNum(obj){
	if(obj.attr("isNum")=="false"){ return true; }
	if(!isNumber(obj.val())){
		assembleMessage("����Ϊ����");
		return false;		
	}
	return true;
}
/**********************************************************************************************************************************************/
/*
*���ܣ�IP��ַ��֤
*˵����
*
*/
function checkIp(obj){
    if(obj.attr("isIp")=="false"){ return true; } 
    if(!isIp(obj.val())){
    	assembleMessage("��ʽ����ȷ");
        return false; 
    }
    return true;
}

/**********************************************************************************************************************************************/
/*
*���ܣ�����У��
*˵����add by zhaowentao 2008-05-20
*	ͨ��isEmail��ǩ�ж��Ƿ������֤
*/
function checkEmail(obj){
	if(obj.attr("isEmail")=="false"){ return true; }
	if(!isEmail(obj.val())){
		assembleMessage("�����ʽ����ȷ");
		return false;		
	} 
	return true;
}
/*
*���ܣ�У���ļ���ʽ�Ƿ�Ϸ�
*˵����add by zhaowentao 2010-12-02
*	ͨ��fileFormat��ǩ�ж��Ƿ������֤
*/
function checkFileFormat(obj){
	if(obj.attr("fileFormat")==""){ return true; }
	if(!isFileFormat(obj.val(),obj.attr("fileFormat"))){
		assembleMessage("��ʽֻ����"+obj.attr("fileFormat"));
		return false;		
	} 
	return true;
}
/*
*���ܣ��Ƚ���������
*˵����add by zhaowentao 2008-05-20
*	ͨ��endDate��ǩ�ж��Ƿ������֤
*/
function compareDate(obj){
    if(obj.attr("endDate")==""){ return true; }
    var startdate = obj.val();
    var enddate = $("#"+obj.attr("endDate")).val();
    var msg = $("#"+obj.attr("endDate")).attr("msg");
    var format = obj.attr("dateFormat");
    if(!isDate(enddate,msg,format)){
        return false; 
    }
	startdate = startdate.replace(/\-\_\/\.\s\:\\/g, "");  
	enddate = enddate.replace(/\-\_\/\.\s\:\\/g, "");
    if(!isEmpty(startdate)&&!isEmpty(enddate)){
		if(parseInt(startdate)>parseInt(enddate)){
			assembleMessage("��������"+$("[name='"+obj.attr("endDate")+"']").attr("msg")+"������������");
			return false;
		}	
	}
    return true;
}
/*
*���ܣ�Ӣ���ַ���������֤
*˵����add by zhaowentao 2008-05-20
*	ͨ��isCharOrNum��ǩ�ж��Ƿ������֤
*/
function checkCharOrNum(obj){
    if(obj.attr("isCharOrNum")=="false"){
    	return true;
    }
    if(!isCharOrNum(obj.val())){
    	assembleMessage("ֻ�������֡�Ӣ����ĸ���»��ߡ�Բ�㡢�������");
        return false; 
    }
    return true;
}
/*
*���ܣ�������֤
*˵����add by zhaowentao 2008-05-20
*	ͨ��isDate��ǩ�ж��Ƿ������֤,Ĭ�����ڸ�ʽΪyyyyMMdd
*/
function checkDate(obj){
    if(obj.attr("isDate")=="false"){ return true; } 
    var format = "";
    if(obj.attr("dateFormat")==""){ 
		format = "yyyyMMdd";
	}else{
		format = obj.attr("dateFormat");
	}
    if(!isDate(obj.val(),obj.attr("msg"),format)){
        return false; 
    }
    return true;
}
/*
*���ܣ�������֤
*˵����add by zhaowentao 2008-05-20
*	ͨ��isDate��ǩ�ж��Ƿ������֤,Ĭ�����ڸ�ʽΪyyyyMMdd
*/
function checkTime(obj){
    if(obj.attr("isTime")=="false"){ return true; } 
    if(!isTime(obj.val())){
    	assembleMessage("��ʽ����ȷ");
        return false; 
    }
    return true;
}
/*
*���ܣ���Ȼ����֤
*˵����add by zhaowentao 2008-05-20
*	ͨ��isNatrual��ǩ�ж��Ƿ������֤
*/
function checkNatrual(obj){
    if(obj.attr("isNatrual")=="false"){
    	return true;
    }
    if(!isNatrual(obj.val())){
    	assembleMessage("ֻ������Ȼ��");
        return false; 
    }
    return true;
}
/*
*���ܣ������ַ���֤
*˵����add by zhaowentao 2008-05-20
*	ͨ��isNatrual��ǩ�ж��Ƿ������֤��specialCharҪ��֤���ַ�
*/
function checkSpecial(obj){ 
	if(obj.attr("notSpecial")=="false"){
		return true;
	}
	if(!obj.attr("specialChar") || obj.attr("specialChar")==""){
		return true;
	}
	var value = obj.val(); 
	if(!isSpecial(value,obj.attr("specialChar"))){
		assembleMessage("�����������ַ�["+obj.attr("specialChar")+"]");
       	return false; 
    }	
    return true; 
}
/*
*���ܣ��滻�����ַ�Ϊȫ���ַ���֤
*˵����add by zhaowentao 2010-12-05
*	ͨ��replaceChar��ǩ�ж��Ƿ������֤
*/
function checkReplaceChar(obj){
	if(obj.attr("replaceChar")=="false"){
		return true;
	}
	if(!obj.attr("specialChar") || obj.attr("specialChar")==""){
		return true;
	}
	var value = obj.val(); 
	var specialChar = obj.attr("specialChar");
	if(value!="" && obj.attr("replaceChar")=="true"){
		var newChars = replaceSpecialChar(value,specialChar);
		obj.val(newChars);
	}
    return true; 
}
/*
*���ܣ��绰������֤
*˵����add by zhaowentao 2008-05-22
*	ͨ��isPhone��ǩ�ж��Ƿ������֤
*/
function checkPhone(obj){
    if(obj.attr("isPhone")=="false"){return true; }
	if(!isPhone(obj.val())){
		assembleMessage("��ʽ����ȷ");
		return false;
	}
	return true;
}
/*
*���ܣ�˫����������֤
*˵����add by zhaowentao 2008-05-22 
*	ͨ��numberFormat��ǩ��֤����λ���Ⱥ�С��λ����
*/
function checkNumberFormat(obj){ 
	if(obj.attr("numberFormat")=="false"){ return true; }
	var array = obj.attr("numberFormat").split(","); 
	if(!isDouble(obj.val(),array[0],array[1],obj.attr("msg"))){
       return false; 
    }	
    return true;
} 



/*
*���ܣ�Ӣ����ĸ��֤
*˵���� 2008-05-22 
*	ͨ��isEnglish��ǩ��֤
*/
function checkEnglish(obj){ 
	if(obj.attr("isEnglish")=="false"){ return true; }  
    if(!isEnglish(obj.val())){
    	assembleMessage("ֻ��ΪӢ����ĸ");
		return false;
	}	
    return true;
}
/*
*���ܣ�Ӣ����ĸ��֤
*˵���� 2008-05-22 
*	ͨ��isChinese��ǩ��֤
*/
function checkChinese(obj){ 
	if(obj.attr("isChinese")=="false"){ return true; }  
	var value = obj.val(); 
    if(!isChinese(value)){
    	assembleMessage("ֻ��Ϊ����");
		return false;
	}	
    return true;
}
/*
*���ܣ�������֤��֤
*˵���� 2008-05-22 
*	ͨ��isInteger��ǩ��֤
*/
function checkInteger(obj){ 
	if(obj.attr("isInteger")=="false"){ return true; }  
    if(!isInteger(obj.val())){
    	assembleMessage("ֻ��Ϊ����");
		return false;
	}	
    return true;
}
/*
*���ܣ����֤��֤
*˵���� 2008-05-22 
*	ͨ��isIDCard��ǩ��֤
*/
function checkIDCard(obj){ 
	if(obj.attr("isIDCard")=="false"){ return true; }  
    if(!isValidIdCard(obj.val())){
    	assembleMessage("��ʽ����ȷ");
		return false;
	}	
    return true;
}
/*
*���ܣ�����������֤
*˵���� 2008-05-22 
*	ͨ��isPost��ǩ��֤
*/
function checkPost(obj){ 
	if(obj.attr("isPost")=="false"){ return true; }  
    if(!isPostalcode(obj.val())){
    	assembleMessage("��ʽ����ȷ");
		return false;
	}	
    return true;
} 
/*
*���ܣ��ֻ�����֤
*˵���� 2008-05-22 
*	ͨ��isMobile��ǩ��֤
*/
function checkMobile(obj){ 
	if(obj.attr("isMobile")=="false"){ return true; }  
    if(!isMobile(obj.val())){
    	assembleMessage("��ʽ����ȷ");
		return false;
	}	
    return true;
}
/*
*���ܣ���ʵ����֤
*˵���� 2008-05-22 
*	ͨ��isFloat��ǩ��֤
*/
function checkFloat(obj){ 
	if(obj.attr("isFloat")=="false"){ return true; }  
    if(!isFloat(obj.val())){
    	assembleMessage("�����ǷǸ�ʵ��");
		return false;
	}	
    return true;
}
/*
*���ܣ�ʵ����֤
*˵���� 2008-05-22 
*	ͨ��isSignFloat��ǩ��֤
*/
function checkSignFloat(obj){ 
	if(obj.attr("isSignFloat")=="false"){ return true; }  
    if(!isSignFloat(obj.val())){
    	assembleMessage("������ʵ��");
		return false;
	}	
    return true;
}
/*
*���ܣ��Զ���checkboxѡ�����
*ʱ�䣺2008-05-23
*˵����ͨ��isGroup��ǩ��֤��groupNameΪ���༯�ϵ�����  min��ǩΪ��Сѡ�и���max��ǩΪ���ѡ�и���;
	max>=min,min��max�ǿ�ѡ����
*�������true����false��		 
*/
function checkGroup(obj){
	if(obj.attr("isGroup")=="false"){ return true; } 
	var groups = document.getElementsByName(obj.attr("groupName"));

	var min , max; 
	if(obj.attr("min"))min = obj.attr("min");
	if(obj.attr("max"))max = obj.attr("max"); 
    if(!mustChecked(groups,min,max)){
    	assembleMessage(obj.attr("msg"));
		return false;
	}
    return true;
}
/*
*���ܣ��Զ���checkboxѡ�����
*ʱ�䣺2008-05-23
*˵��������seleBox����
*�������true����false��		 
*/
function seleBox(boxName){ 
	var groups = document.getElementsByName(boxName);
	if(groups){ 
		var min =1, max=groups.length; 
	    if(!mustChecked(groups,min,max)){
			msgDiv = $("#div-message");
			msgDiv.text("������ѡ��һ����¼");
			return false;
		}
	}
    return true;
}
/*
*���ܣ��Զ���checkboxѡ�����(ֻ��ѡ��һ��)
*ʱ�䣺2008-05-23
*˵��������seleOneBox����
*�������true����false��		 
*/
function seleOneBox(boxName,msg){ 
	var groups = document.getElementsByName(boxName);
	if(groups && groups.length && groups.length>0){ 
		var min =1, max=1; 
	    if(!mustChecked(groups,min,max)){
	    	msgDiv = $("#div-message");
			msgDiv.text(msg+"����ѡ��һ����¼");
			return false;
		}
	}
    return true;
}
/*
*���ܣ�url��֤
*ʱ�䣺2008-05-22 
*˵����ͨ��isUrl��ǩ��֤
*/
function checkUrl(obj){
	if(obj.attr("isUrl")=="false"){ return true; }  
	var value = obj.val(); 
    if(!isUrl(value)){
    	assembleMessage("��ʽ����ȷ");
		return false;
	}	
    return true;
}
/*
*���ܣ���ֵ����ֵһ�µ���֤
*ʱ�䣺2010-06-5 
*˵����ͨ��confirmSameValue��ǩ��֤
*/
function confirmSameValue(obj){ 
	if(obj.attr("confirmSameValue") ==""){ return true; }
    var confirmObj = $("[name='"+obj.attr("confirmSameValue")+"']");
	if(confirmObj){
	    if(obj.val()!=confirmObj.val()){
	    	assembleMessage("��"+confirmObj.attr("msg")+"��һ��");
			return false;
		}
    }
    return true;
}

/*
*���ܣ���ֵ����ֵ����һ�µ���֤
*ʱ�䣺2010-10-25
*˵����ͨ��confirmDifferValue��ǩ��֤
*/
function confirmDifferValue(obj){
	if(obj.attr("confirmDifferValue") ==""){ return true; }
    var confirmObj = $("[name='"+obj.attr("confirmDifferValue")+"']");
	if(confirmObj){
	    if(obj.val()==confirmObj.val()){
	    	assembleMessage("������"+confirmObj.attr("msg")+"��ͬ");
			return false;
		}
	}
    return true;
}

/*
*���ܣ�ȥ��ǰ��ո�����
*ʱ�䣺2010-06-5 
*˵����ȥ���ı�����ı���ո�
*/
function trimObjText(obj){
	if(obj.attr("type")=="text"){
		obj.val(trim(obj.val()));
	}else if(obj.get(0).tagName=="TEXTAREA"){
		obj.val(trimSpace(trim(obj.val())));
	}
}
/*************************************************************************************************************/ 
/*
*���ܣ���һ�����ȵ�ȫ������ת��Ϊ������� 
*ʱ�䣺2008-05-22
*�����������ַ���str��������ȫ���ַ���ת��Ϊ����ַ�����
*/
function Full2Half(str) {
	var i;
	var result = '';
	for (i = 0; i < str.length; i++) {
		code = str.charCodeAt(i);
		if (code >= 65281 && code < 65373) {
			result += String.fromCharCode(str.charCodeAt(i) - 65248);
		}else {
			result += str.charAt(i);
		}
	}
	return result;
}
/*
*���ܣ���һ�����ȵİ���ַ�ת��Ϊȫ���ַ� 
*ʱ�䣺2008-05-22
*�����������ַ���str������������ַ���ת��Ϊȫ���ַ�����
*/
function Half2Full(onechar) {
	var result = "";
	var code = onechar.charCodeAt(0);
	if (code < 65248) {
		result = String.fromCharCode(code + 65248);
	}else {
		result = onechar;
	}
	return result;
}
/*
*���ܣ����ַ�������������ַ��滻Ϊȫ���ַ� 
*ʱ�䣺2010-04-01
*�����������ַ���str��chars ���滻���ַ��� ����������ַ���ת��Ϊȫ���ַ�����
*/
function replaceSpecialChar(str,chars){
	str = trim(str);
	chars = trim(chars);
	if(isEmpty(str)||isEmpty(chars)){return ""; }
	var halfChar= "";
	var fullChar = "";
	for(var i=0;i<chars.length;i++){
		halfChar=chars.charAt(i);
		fullChar = Half2Full(halfChar);
		str = str.replace(halfChar,fullChar); 
	}
	if(!isSpecial(str,chars))str = replaceSpecialChar(str,chars);
	return str; 
} 
/*
*���ܣ��ַ�������ָ��λ�� 
*ʱ�䣺2010-07-15
*�����������ַ���str����λ�ַ�ch����λ�ܳ���
*/
function lpad(str,ch,leng){
    var charStr = "";
    str = str+"";
	if(str.length>=leng){
		return str; 
	}else{
		for(var i=0;i<leng-str.length;i++){
			charStr = charStr+ ch;
		}
		str = charStr+str;
	}
	return str; 
}
/*
*���ܣ��ַ�������ָ��λ�� 
*ʱ�䣺2010-07-15
*�����������ַ���str����λ�ַ�ch����λ�ܳ���
*/
function rpad(str,ch,leng){
    var charStr = "";
    str = str+"";
	if(str.length>=leng){
		return str; 
	}else{
		for(var i=0;i<leng-str.length;i++){
			charStr = charStr+ ch;
		}
		str = str+charStr;
	}
	return str; 
}
function assembleMessage(msg){
	validateMessage=msg;
}