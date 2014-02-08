
//========================ICO显示图片============================================
var mailshowed=false; //是否显示列表图标
var showDiv="ListSpaces";
var show_num=0;
//===例表页显示软件大图======
function setShowSpace(obj,img)
{
  return;
  if (img=='') return;
  var sobj= document.getElementById(showDiv);
  if (sobj==null)
  {  
	var aNode =document.createElement("div");
	aNode.id=showDiv;
	aNode.innerHTML = "";
	aNode.onmouseout = function(){ closelisetSpace() };
	
	var Prean=document.getElementById("top");
	
	if (Prean==null)
	{
		obj.parentNode.insertBefore(aNode);  
	}
	else
	{
		 Prean.parentNode.insertBefore(aNode,Prean);  
	}
   }
		var x=obj.offsetLeft;
		var tempobj;
	        tempobj =obj;
		while(tempobj=tempobj.offsetParent){
          x+=tempobj.offsetLeft;
         }	
		 
		var y= obj.offsetTop;
		 tempobj =obj;
		 
		while(tempobj=tempobj.offsetParent){
           y+=tempobj.offsetTop;
         }
			
		var list=document.getElementById(showDiv);
	    if(list!= null)
		{
		    list.innerHTML="<img src="+img+">";
		    list.style.left= x + "px";
	        list.style.top=y + obj.clientHeight +"px";
			list.style.display='';
			list.style.zIndex=800;
			//alert(list.tagName);
		}
	     //setTimeout("setShowSpace('showList')",100);	 
}
//关闭
function closelisetSpace()
{
	 var sobj= document.getElementById(showDiv);
	 if (sobj!=null)
	 {
		 if(show_num%2==0){
			 sobj.style.display='none';
			 $("#pagespantext").attr("title","打开右侧预览");
		 }else{
			 sobj.style.cssText="border:1px #95CDE6 dashed;width:600;height:500;overflow-x:scroll;overflow-y:scroll";
			 $("#pagespantext").attr("title","关闭右侧预览");
		 }
		 show_num++;
	 }
}
