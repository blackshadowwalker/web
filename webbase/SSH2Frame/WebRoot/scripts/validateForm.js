
/*************************************************************************************************************/ 
/*************************************************表单字段校验*************************************************/
/*************************************************************************************************************/
/**
*作者 zhaowentao 2008-05-22
*功能：验证表单数据域入口函数
*说明：页面调用$('#formId').validateForm();
*修改：2011-12-20 zhaowentao
*输出:validateFlag验证结果true、false
*/
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
*作者 zhaowentao 2011-12-22
*功能：单个对象验证入口函数
*说明：对象在onblur="validateObj($(this))"
*修改：
*输出:validateFlag验证结果true、false
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
		messageSpan.append("<img src='"+ctx_path+"/images/main/arrow_left_red.png'/> ");
		messageSpan.append(validateMessage);
		obj.after(messageSpan);
	}
}
/*
*功能：验证表单 逻辑处理函数
*说明：add by zhaowentao 2008-05-20
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
/*************************************************基础数据校验*************************************************/
/*************************************************************************************************************/
/*
*功能：获取字符串长度  
*时间：2007-10-22
*使用说明：传入value；返回true或false
*/
function getLength(str){
   return str.length;
}
/*
*功能：获取输入字符串的字节数，一个中文字为两个字节。
*时间：2008-05-20
*使用说明：传入value；返回length
*/
function getByte(str){
	return str.replace(/[^\x00-\xff]/g,"**").length;
}
/*
*功能：除去字符串前后的回车、空格、换行符 
*时间：2007-10-22
*用法：传入string
*/
function trimSpace(val){  
	return val.replace(/(^[\n\r\s]*)|([\n\r\s]*$)/g, ""); 
}  
/*
*功能：除去字符串前后的空格 
*时间：2007-10-22
*用法：传入string
*/
function trim(val){
    return val.replace(/(^\s*)|(\s*$)/g, "");
} 
/*
*功能：字符串空校验
*时间：2007-10-22
*使用说明：传入String；空返回true否则返回false
*/
function isEmpty(str){
	if(str==null||trim(str.toString())=="") return true;
	else  return false;
}       
/*
*功能：数值验证
*时间：2008-05-20
*使用说明：传入value值；返回true或false
*/
function isNumber(val){
	val = trim(val);
	if(isEmpty(val)){return true; } 
	var testVal=/^\d+$/;
	return testVal.test(val); 
}
/*
*功能：自然数或正整数验证
*时间：2008-05-20
*使用说明：传入value值；返回true或false
*/
function isNatrual(val){
	val = trim(val);	
	if(isEmpty(val)){return true; } 
	var testVal=/^([0-9]|([1-9]\d*))$/;
	return testVal.test(val); 
}
/*
*功能：整数验证
*时间：2008-05-20
*使用说明：传入value值；返回true或false
*/
function isInteger(val){	
	val = trim(val);
	if(isEmpty(val)){return true; } 
	var testVal=/^([-\+]?([0-9]|([1-9]\d*)))$/;
	return testVal.test(val); 
}
/*
*功能：带符号小数验证
*时间：2008-05-20
*使用说明：传入value值；返回true或false
*/
function isSignFloat(val){	 
	val = trim(val);
	if(isEmpty(val)){return true; }
	var testVal=/^([-\+]?([0-9]|([1-9]\d*))(\.\d+)?)$/;
	return testVal.test(val); 
}
/*
*功能：无符号小数验证
*时间：2008-05-20
*使用说明：传入value值；返回true或false
*/
function isFloat(val){	
	val = trim(val); 
	if(isEmpty(val)){return true; }
	var testVal=/^(([0-9]|([1-9]\d*))(\.\d+)?)$/;
	return testVal.test(val); 
}
/*
*功能：英文字符验证
*时间：2008-05-20
*使用说明：传入value值；返回true或false
*/
function isEnglish(val){
	val = trim(val);
	if(isEmpty(val)){return true; }	 
	var testVal=/^[A-Za-z]+$/;
	return testVal.test(val); 
}
/*
*功能：中文字符验证
*时间：2008-05-20
*使用说明：传入value值；返回true或false
*/
function isChinese(val){
	val = trim(val);	
	if(isEmpty(val)){return true; } 
	var testVal=/^[\u0391-\uFFE5]+$/;
	return testVal.test(val); 
}
/*
*功能：英文或数值字符验证 判断是否是0-9或a－z或A－Z的字符
*时间：2008-05-20
*使用说明：传入value值；返回true或false
*/
function isCharOrNum(val){	
	val = trim(val);
	if(isEmpty(val)){return true; } 
	var testVal=/^\w+[\w\.\-]*$/;
	return testVal.test(val); 
} 
/*
*功能：电话号码验证
*时间：2008-05-20
*使用说明：传入value值；返回true或false
*/
function isPhone(val){ 
	val = trim(val);
	if(isEmpty(val)){return true; }
	var testVal=/^(((\(\d{2,3}\))|(\d{2,3}\-))?(\(0\d{2,3}\)|0\d{2,3})?-?[1-9]\d{6,7}(\-\d{1,4})?)$/;
	return testVal.test(val);
} 
/*
*功能：移动电话验证
*时间：2008-05-20
*使用说明：传入value值；返回true或false
*/
function isMobile(val){ 
	val = trim(val);
	if(isEmpty(val)){return true; }
	var testVal=/^((1)|(0\d{1}))\d{10}$/;
	return testVal.test(val);
}                   
/*
*功能：非法字符校验
*时间：2008-05-22
*使用说明：val为验证的目标String；
		  chars为要验证的特殊字符串；注意"\"为"\\"
		  返回true否则返回false
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
*功能：校验Email是否合法  
*时间：2007-10-22
*使用说明：传入value；返回true或false
*/
function isEmail(val){
	val = trim(val);
	if(isEmpty(val)){return true; }
	var testVal=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/; 
	return testVal.test(val);
} 
/*
*功能：校验邮政编码是否合法  
*时间：2007-10-22
*使用说明：传入value；返回true或false
*/
function isPostalcode(val){
	val = trim(val);
	if(isEmpty(val)){return true; }
	var testVal=/^[1-9]\d{5}$/; 
	return testVal.test(val);
} 
/*
*功能：校验url地址是否合法  
*时间：2007-10-22
*使用说明：传入value；返回true或false
*/
function isUrl(val){
	val = trim(val);
	if(isEmpty(val)){return true; }
	var testVal=/^[a-zA-z]+:\/\/[A-Za-z0-9]+(\.[A-Za-z0-9]+)*(:\d+)?[\/=\?%\-&_~`@\[\]\':\+!]*([^<>\'\"])*$/; 
	return testVal.test(val);
}
/* 
*功能：校验时间格式是否合法 00:00:00--23:59:59
*时间：2008-05-22
*使用说明：传入value；验证格式为HH:mm:ss、HH:mm、HH；返回true或false
*/
function isTime(val){
	val = trim(val);
	if(isEmpty(val)){return true; }
	var testVal= /^([0-1]\d|2[0-3])(:[0-5]\d(:[0-5]\d)?)?$/;
	return testVal.test(val); 
} 
/*
*功能：判断val是否是format格式的日期类型
*时间：2008-05-22
*使用说明：val:验证目标日期；msg：对象名称；format：日期校验格式；
		  校验格式有：yyyyMMdd、yyyy-MM-dd、yyyy_MM_dd、yyyy/MM/dd
		  外加时分秒、时分,格式为HH:mm:ss、HH:mm
		  返回true或false
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
				assembleMessage("与yyyyMMdd格式的日期不匹配");
				return false;
			}
	}else if(format=="yyyymmdd hh:mi"){
            var testVal= /^\d{8}\s\d{2}:\d{2}$/;
			if(testVal.test(val)){ 
	            dateStr = val.substring(0,8);
			    timeStr = val.substring(9,14);
			}else{ 
				assembleMessage("与yyyyMMdd HH:mi格式的日期不匹配");
				return false;
			} 
	}else if(format=="yyyymmdd hh:mi:ss"){
            var testVal= /^\d{8}\s\d{2}:\d{2}:\d{2}$/;
			if(testVal.test(val)){ 
	            dateStr = val.substring(0,8);
			    timeStr = val.substring(9,17);
			}else{ 
				assembleMessage("与yyyyMMdd HH:mi:ss格式的日期不匹配");
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
				assembleMessage("与yyyy-MM-dd格式的日期不匹配");
				return false;
			} 
	}else if(format=="yyyy-mm-dd hh:mi"){
			var testVal= /^\d{4}\-\d{2}\-\d{2}\s\d{2}:\d{2}$/;
			if(testVal.test(val)){ 
				dateStr = (val.substring(0,10)).replace(/\-/g, "");
			    timeStr = val.substring(11,16); 
			}else{ 
				assembleMessage("与yyyy-MM-dd HH:mi格式的日期不匹配");
				return false;
			} 
	}else if(format=="yyyy-mm-dd hh:mi:ss"){
			var testVal= /^\d{4}\-\d{2}\-\d{2}\s\d{2}:\d{2}:\d{2}$/;
			if(testVal.test(val)){ 
				dateStr = (val.substring(0,10)).replace(/\-/g, "");
			    timeStr = val.substring(11,19); 
			}else{ 
				assembleMessage("与yyyy-MM-dd HH:mi:ss格式的日期不匹配");
				return false;
			} 
	}else if(format=="yyyy_mm_dd"){
			var testVal= /^\d{4}\_\d{2}\_\d{2}$/;
			if(testVal.test(val)){
				dateStr = val.replace(/\_/g, "");
			}else{ 
				assembleMessage("与yyyy_MM_dd格式的日期不匹配");
				return false;
			} 
	}else if(format=="yyyy_mm_dd hh:mi"){
			var testVal= /^\d{4}\_\d{2}\_\d{2}\s\d{2}:\d{2}$/; 
			if(testVal.test(val)){ 
				dateStr = (val.substring(0,10)).replace(/\_/g, "");
			    timeStr = val.substring(11,16);  
			}else{ 
				assembleMessage("与yyyy_MM_dd HH:mi格式的日期不匹配");
				return false;
			} 
	}else if(format=="yyyy_mm_dd hh:mi:ss"){
			var testVal= /^\d{4}\_\d{2}\_\d{2}\s\d{2}:\d{2}:\d{2}$/;
			if(testVal.test(val)){ 
				dateStr = (val.substring(0,10)).replace(/\_/g, "");
			    timeStr = val.substring(11,19); 
			}else{ 
				assembleMessage("与yyyy_MM_dd HH:mi:ss格式的日期不匹配");
				return false;
			}
	}else if(format=="yyyy/mm/dd"){
			var testVal= /^\d{4}\/\d{2}\/\d{2}$/;
			if(testVal.test(val)){
				dateStr = val.replace(/\//g, "");
			}else{ 
				assembleMessage("与yyyy/MM/dd格式的日期不匹配");
				return false;
			} 
	}else if(format=="yyyy/mm/dd hh:mi"){
			var testVal= /^\d{4}\/\d{2}\/\d{2}\s\d{2}:\d{2}$/;
			if(testVal.test(val)){ 
				dateStr = (val.substring(0,10)).replace(/\//g, "");
			    timeStr = val.substring(11,16); 
			}else{ 
				assembleMessage("与yyyy/MM/dd HH:mi格式的日期不匹配");
				return false;
			} 
	}else if(format=="yyyy/mm/dd hh:mi:ss"){
			var testVal= /^\d{4}\/\d{2}\/\d{2}\s\d{2}:\d{2}:\d{2}$/;
			if(testVal.test(val)){ 
				dateStr = (val.substring(0,10)).replace(/\//g, "");
			    timeStr = val.substring(11,19); 
			}else{ 
				assembleMessage("与yyyy/MM/dd HH:mi:ss格式的日期不匹配");
				return false;
			}  
	}else{
		assembleMessage("中定义的时间格式还不能处理");
		    return false;
	}
	if(!isTime(timeStr)){
		assembleMessage("中时间不正确");
		return false;
	}
	m = dateStr.match(new RegExp("^(\\d{4})(\\d{1,2})(\\d{1,2})$")); 
	if(m==null){
		assembleMessage("请输入"+format+"格式的日期");
		return false;
	} 
    day = m[3]*1; 
    month = m[2]*1; 
    year = m[1]*1;
  	if(parseInt(month)<=0||parseInt(month)>12){
  		assembleMessage("请输入1—12之间的月份");
		return false;
  	}
	if(parseInt(year)<1900||parseInt(year)>2300){
		assembleMessage("请输入1900—2300之间的年份");
		return false;
  	}
  	if(parseInt(day)<1||parseInt(day)>31){
  		assembleMessage("请输入01—31之间的日期");
		return false;
  	}
	month = month==0 ?12:month;
  	var date = new Date(year, month-1, day); 
  	if(!(typeof(date) == "object" && year == date.getFullYear() && month == (date.getMonth()+1) && day == date.getDate())){
  		assembleMessage(year+"年"+month+"月"+"无"+day+"日");
		return false;
	}
	return true;  
 }
/*
*功能：校验val是实数，否是format格式的日期类型
*时间：2008-05-22
*使用说明：val:验证目标数字；intLen：整数部分长度；floatLen：小数部分长度；
		   msg：对象名称；返回true或false
*/
 function isDouble(val,intLen,floatLen,msg) { 
 	 val = trim(val); 
 	 intLen = trim(intLen); 
 	 floatLen = trim(floatLen);   
 	 if(isEmpty(val)){return true; }   
 	 if(!isFloat(val)){
 		assembleMessage("必须是非负实数");
	 	return false; 
 	 }  
     if (isNatrual(val)) { 
     	if(val.length>intLen){ 
     		assembleMessage("整数部分超长(最多"+intLen+"位)");
		 	return false; 
     	}
 	 }else{  
 	 	var arrData = val.split(".");
 	 	var iLen = arrData[0].length;
 	 	var fLen = arrData[1].length;
 	 	if(iLen>intLen&&fLen>floatLen){ 
 	 		assembleMessage("整数部分最多"+intLen+"位，小数部分最多"+floatLen+"位");
		 	return false; 
 	 	}else if(iLen>intLen){ 
 	 		assembleMessage("整数部分超长(最多"+intLen+"位)");
		 	return false; 
 	 	}else if(fLen>floatLen){ 
 	 		assembleMessage("小数部分超长(最多"+floatLen+"位)");
		 	return false; 
 	 	}
	 }   
     return true; 
 } 
/*
*功能：检查身份证号码格式是否正确；
*输入：身份证号码；
*输出：是true；否false；
*算法: 身份证的号码从左至右为六位数字地址码，八位数字出生日期码， 三位数字顺序码和一位数字校验码;
*作者： zhenglz		 
*/
function isValidIdCard(idCardNum){
 	 if(isEmpty(idCardNum)){return true; } 
	//身份证前17位从左到右的权值
	var weight =new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2);
	var sum = 0;
	var checkDigit ='X'; 
	/*身份证长度检查*/
	if(idCardNum.length != 15 && idCardNum.length != 18){ 
		return false;
	} 
	/*15位身份证号码*/
	if(idCardNum.length == 15){
		//出生年月日的合法性 
		if(isNaN(idCardNum.substr(0,14))){ 
			return false;
		}  
		if(!isDate("19" + idCardNum.substr(6,6),"身份证日期","yyyyMMdd")) return false;
		return true;
	} 
	//前17位是否全为数字
	if(isNaN(idCardNum.substr(0,17))){ 
		return false;
	}
	//出生年月日的合法性
	if(!isDate(idCardNum.substr(6,8),"身份证日期","yyyyMMdd")) return false; 
	//计算校验位的值
	for(var i = 0; i < 17; i++){
		sum = sum + idCardNum.substr(i,1)*weight[i];
	} 
	//求余数
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
*功能：校验上传文件格式合法性
*时间：2010-12-02
*说明：val是文件路径,formats是指定的文件格式串 格式如:gif|jpg|jpeg;
*输出：是true；否false；		 
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
*功能：自定义checkbox选择个数
*时间：2008-05-23
*说明：groups是checkbox对象集合;min为最小选中个数max为最大选中个数,max=all为必须全选;
	max>=min,min和max是可选参数
*输出：是true；否false；		 
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
/*************************************************tag校验函数*************************************************/
/*************************************************************************************************************/
/*
/*
*功能：非空验证
*说明：add by zhaowentao 2008-05-20
*	通过notEmpty标签判断是否进行验证
*/
function checkEmpty(obj){
	var value = obj.val();
	if(obj.attr("notEmpty")=="true"){
		if(isEmpty(value)){
			assembleMessage("不能为空");
			return false;
		}
	}
	return true;
}
/*
*功能：字符串最大长度验证
*说明：add by zhaowentao 2008-05-20
*	通过leng标签判断是否进行验证
*/
function checkLeng(obj){ 
	if(obj.attr("leng")==""){ return true; } 
	var value = obj.val(); 
	if(getByte(value)>obj.attr("leng")){
		assembleMessage("长度不能大于"+obj.attr("leng")+"个字符");
		return false;
	} 
	return true;
} 
/*
*功能：字符串最小长度验证
*说明：add by zhaowentao 2008-05-20
*	通过minLeng标签判断是否进行验证
*/
function checkMinLeng(obj){ 
	if(obj.attr("minLeng")==""){ return true; } 
	var value = obj.val();
	if(isEmpty(value)){return true; }
	if(getByte(value)<obj.attr("minLeng")){
		assembleMessage("长度不能小于"+obj.attr("minLeng")+"个字符");
		return false;
	} 
	return true;
} 
/*
*功能：数字校验
*说明：add by zhaowentao 2008-05-20
*	通过isNum标签判断是否进行验证
*/
function checkNum(obj){
	if(obj.attr("isNum")=="false"){ return true; }
	if(!isNumber(obj.val())){
		assembleMessage("必须为数字");
		return false;		
	}
	return true;
}
/*
*功能：数字校验
*说明：add by zhaowentao 2008-05-20
*	通过isEmail标签判断是否进行验证
*/
function checkEmail(obj){
	if(obj.attr("isEmail")=="false"){ return true; }
	if(!isEmail(obj.val())){
		assembleMessage("输入格式不正确");
		return false;		
	} 
	return true;
}
/*
*功能：校验文件格式是否合法
*说明：add by zhaowentao 2010-12-02
*	通过fileFormat标签判断是否进行验证
*/
function checkFileFormat(obj){
	if(obj.attr("fileFormat")==""){ return true; }
	if(!isFileFormat(obj.val(),obj.attr("fileFormat"))){
		assembleMessage("格式只能是"+obj.attr("fileFormat"));
		return false;		
	} 
	return true;
}
/*
*功能：比较两个日期
*说明：add by zhaowentao 2008-05-20
*	通过endDate标签判断是否进行验证
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
			assembleMessage("不能晚于"+$("[name='"+obj.attr("endDate")+"']").attr("msg")+"，请重新输入");
			return false;
		}	
	}
    return true;
}
/*
*功能：英文字符或数字验证
*说明：add by zhaowentao 2008-05-20
*	通过isCharOrNum标签判断是否进行验证
*/
function checkCharOrNum(obj){
    if(obj.attr("isCharOrNum")=="false"){
    	return true;
    }
    if(!isCharOrNum(obj.val())){
    	assembleMessage("只能由数字、英文字母、下划线、圆点、横线组成");
        return false; 
    }
    return true;
}
/*
*功能：日期验证
*说明：add by zhaowentao 2008-05-20
*	通过isDate标签判断是否进行验证,默认日期格式为yyyyMMdd
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
*功能：日期验证
*说明：add by zhaowentao 2008-05-20
*	通过isDate标签判断是否进行验证,默认日期格式为yyyyMMdd
*/
function checkTime(obj){
    if(obj.attr("isTime")=="false"){ return true; } 
    if(!isTime(obj.val())){
    	assembleMessage("格式不正确");
        return false; 
    }
    return true;
}
/*
*功能：自然数验证
*说明：add by zhaowentao 2008-05-20
*	通过isNatrual标签判断是否进行验证
*/
function checkNatrual(obj){
    if(obj.attr("isNatrual")=="false"){
    	return true;
    }
    if(!isNatrual(obj.val())){
    	assembleMessage("只能是自然数");
        return false; 
    }
    return true;
}
/*
*功能：特殊字符验证
*说明：add by zhaowentao 2008-05-20
*	通过isNatrual标签判断是否进行验证，specialChar要验证的字符
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
		assembleMessage("不能有特殊字符["+obj.attr("specialChar")+"]");
       	return false; 
    }	
    return true; 
}
/*
*功能：替换特殊字符为全角字符验证
*说明：add by zhaowentao 2010-12-05
*	通过replaceChar标签判断是否进行验证
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
*功能：电话号码验证
*说明：add by zhaowentao 2008-05-22
*	通过isPhone标签判断是否进行验证
*/
function checkPhone(obj){
    if(obj.attr("isPhone")=="false"){return true; }
	if(!isPhone(obj.val())){
		assembleMessage("格式不正确");
		return false;
	}
	return true;
}
/*
*功能：双精度数字验证
*说明：add by zhaowentao 2008-05-22 
*	通过numberFormat标签验证整数位长度和小数位长度
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
*功能：英文字母验证
*说明： 2008-05-22 
*	通过isEnglish标签验证
*/
function checkEnglish(obj){ 
	if(obj.attr("isEnglish")=="false"){ return true; }  
    if(!isEnglish(obj.val())){
    	assembleMessage("只能为英文字母");
		return false;
	}	
    return true;
}
/*
*功能：英文字母验证
*说明： 2008-05-22 
*	通过isChinese标签验证
*/
function checkChinese(obj){ 
	if(obj.attr("isChinese")=="false"){ return true; }  
	var value = obj.val(); 
    if(!isChinese(value)){
    	assembleMessage("只能为汉字");
		return false;
	}	
    return true;
}
/*
*功能：整数验证验证
*说明： 2008-05-22 
*	通过isInteger标签验证
*/
function checkInteger(obj){ 
	if(obj.attr("isInteger")=="false"){ return true; }  
    if(!isInteger(obj.val())){
    	assembleMessage("只能为整数");
		return false;
	}	
    return true;
}
/*
*功能：身份证验证
*说明： 2008-05-22 
*	通过isIDCard标签验证
*/
function checkIDCard(obj){ 
	if(obj.attr("isIDCard")=="false"){ return true; }  
    if(!isValidIdCard(obj.val())){
    	assembleMessage("格式不正确");
		return false;
	}	
    return true;
}
/*
*功能：邮政编码验证
*说明： 2008-05-22 
*	通过isPost标签验证
*/
function checkPost(obj){ 
	if(obj.attr("isPost")=="false"){ return true; }  
    if(!isPostalcode(obj.val())){
    	assembleMessage("格式不正确");
		return false;
	}	
    return true;
} 
/*
*功能：手机号验证
*说明： 2008-05-22 
*	通过isMobile标签验证
*/
function checkMobile(obj){ 
	if(obj.attr("isMobile")=="false"){ return true; }  
    if(!isMobile(obj.val())){
    	assembleMessage("格式不正确");
		return false;
	}	
    return true;
}
/*
*功能：正实数验证
*说明： 2008-05-22 
*	通过isFloat标签验证
*/
function checkFloat(obj){ 
	if(obj.attr("isFloat")=="false"){ return true; }  
    if(!isFloat(obj.val())){
    	assembleMessage("必须是非负实数");
		return false;
	}	
    return true;
}
/*
*功能：实数验证
*说明： 2008-05-22 
*	通过isSignFloat标签验证
*/
function checkSignFloat(obj){ 
	if(obj.attr("isSignFloat")=="false"){ return true; }  
    if(!isSignFloat(obj.val())){
    	assembleMessage("必须是实数");
		return false;
	}	
    return true;
}
/*
*功能：自定义checkbox选择个数
*时间：2008-05-23
*说明：通过isGroup标签验证，groupName为对相集合的名称  min标签为最小选中个数max标签为最大选中个数;
	max>=min,min和max是可选参数
*输出：是true；否false；		 
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
*功能：自定义checkbox选择个数
*时间：2008-05-23
*说明：调用seleBox方法
*输出：是true；否false；		 
*/
function seleBox(boxName){ 
	var groups = document.getElementsByName(boxName);
	if(groups){ 
		var min =1, max=groups.length; 
	    if(!mustChecked(groups,min,max)){
			msgDiv = $("#div-message");
			msgDiv.text("请至少选择一条记录");
			return false;
		}
	}
    return true;
}
/*
*功能：自定义checkbox选择个数(只能选择一个)
*时间：2008-05-23
*说明：调用seleOneBox方法
*输出：是true；否false；		 
*/
function seleOneBox(boxName,msg){ 
	var groups = document.getElementsByName(boxName);
	if(groups && groups.length && groups.length>0){ 
		var min =1, max=1; 
	    if(!mustChecked(groups,min,max)){
	    	msgDiv = $("#div-message");
			msgDiv.text(msg+"必须选择一条记录");
			return false;
		}
	}
    return true;
}
/*
*功能：url验证
*时间：2008-05-22 
*说明：通过isUrl标签验证
*/
function checkUrl(obj){
	if(obj.attr("isUrl")=="false"){ return true; }  
	var value = obj.val(); 
    if(!isUrl(value)){
    	assembleMessage("格式不正确");
		return false;
	}	
    return true;
}
/*
*功能：旧值与新值一致的验证
*时间：2010-06-5 
*说明：通过confirmSameValue标签验证
*/
function confirmSameValue(obj){ 
	if(obj.attr("confirmSameValue") ==""){ return true; }
    var confirmObj = $("[name='"+obj.attr("confirmSameValue")+"']");
	if(confirmObj){
	    if(obj.val()!=confirmObj.val()){
	    	assembleMessage("与"+confirmObj.attr("msg")+"不一致");
			return false;
		}
    }
    return true;
}

/*
*功能：旧值与新值不能一致的验证
*时间：2010-10-25
*说明：通过confirmDifferValue标签验证
*/
function confirmDifferValue(obj){
	if(obj.attr("confirmDifferValue") ==""){ return true; }
    var confirmObj = $("[name='"+obj.attr("confirmDifferValue")+"']");
	if(confirmObj){
	    if(obj.val()==confirmObj.val()){
	    	assembleMessage("不能与"+confirmObj.attr("msg")+"相同");
			return false;
		}
	}
    return true;
}

/*
*功能：去掉前后空格或空行
*时间：2010-06-5 
*说明：去掉文本域和文本框空格
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
*功能：把一定长度的全角数字转换为半角数字 
*时间：2008-05-22
*描述：输入字符串str，若包含全角字符则转换为半角字符返回
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
*功能：把一定长度的半角字符转换为全角字符 
*时间：2008-05-22
*描述：输入字符串str，若包含半角字符则转换为全角字符返回
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
*功能：把字符串里面的特殊字符替换为全角字符 
*时间：2010-04-01
*描述：输入字符串str，chars 被替换的字符集 若包含半角字符则转换为全角字符返回
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
*功能：字符串左补齐指定位数 
*时间：2010-07-15
*描述：输入字符串str，补位字符ch，补位总长度
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
*功能：字符串左补齐指定位数 
*时间：2010-07-15
*描述：输入字符串str，补位字符ch，补位总长度
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