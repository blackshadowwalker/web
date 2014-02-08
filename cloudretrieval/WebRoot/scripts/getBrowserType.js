
function getBrowserOs()  
{  
   var OsObject = "";  
   if(navigator.userAgent.indexOf("MSIE")>0) {  
        return "IE";  
   } 
   if(isFirefox=navigator.userAgent.indexOf("Chrome")>0){  
        return "Chrome";  
   }  
   if(isFirefox=navigator.userAgent.indexOf("Firefox")>0){  
        return "Firefox";  
   }  
   if(isFirefox=navigator.userAgent.indexOf("Opera")>0){  
        return "Opera";  
   } 
   if(isSafari=navigator.userAgent.indexOf("Safari")>0) {  
        return "Safari";  
   }   
   if(isCamino=navigator.userAgent.indexOf("Camino")>0){  
        return "Camino";  
   }  
   if(isMozilla=navigator.userAgent.indexOf("Gecko/")>0){  
        return "Gecko";  
   }  
    
}  

function getBrowserOsEx()
{
        var Sys = {};
        var ua = navigator.userAgent.toLowerCase();
        if (window.ActiveXObject)
            Sys.ie = ua.match(/msie ([\d.]+)/)[1]
        else if (document.getBoxObjectFor)
            Sys.firefox = ua.match(/firefox\/([\d.]+)/)[1]
        else if (window.MessageEvent && !document.getBoxObjectFor)
            Sys.chrome = ua.match(/chrome\/([\d.]+)/)[1]
        else if (window.opera)
            Sys.opera = ua.match(/opera.([\d.]+)/)[1]
        else if (window.openDatabase)
            Sys.safari = ua.match(/version\/([\d.]+)/)[1];
        //以下进行测试
		var ret = "";
		var test = false;
        if(Sys.ie) { 
			if(test) document.write('IE: '+Sys.ie); 
			ret="IE"; }
        if(Sys.firefox) { 
			if(test) document.write('Firefox: '+Sys.firefox);
			ret="Firefox"; }
        if(Sys.chrome) { 
			if(test) document.write('Chrome: '+Sys.chrome);
			ret="Chrome"; }
        if(Sys.opera) { 
			if(test) document.write('Opera: '+Sys.opera);
			ret="Opera"; }
        if(Sys.safari) { 
			if(test) document.write('Safari: '+Sys.safari);
			ret="Safari"; }
		return ret;
}
