
//========================ICO��ʾͼƬ============================================
var mailshowed=false; //�Ƿ���ʾ�б�ͼ��
var showDiv="ListSpaces";
var show_num=0;
//===����ҳ��ʾ�����ͼ======
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
//�ر�
function closelisetSpace()
{
	 var sobj= document.getElementById(showDiv);
	 if (sobj!=null)
	 {
		 if(show_num%2==0){
			 sobj.style.display='none';
			 $("#pagespantext").attr("title","���Ҳ�Ԥ��");
		 }else{
			 sobj.style.cssText="border:1px #95CDE6 dashed;width:600;height:500;overflow-x:scroll;overflow-y:scroll";
			 $("#pagespantext").attr("title","�ر��Ҳ�Ԥ��");
		 }
		 show_num++;
	 }
}
