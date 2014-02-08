
/*
 *  使用方法:
<script type="text/javascript" src="dragImg.js"></script>

<div onMouseDown="mouseDown()" onMouseUp="mouseUp()" id="div_img" style="border:1px #ff9966 dashed;width:600;height:500;overflow-x:scroll;overflow-y:scroll">
	<img style="position:relative;" class="dragme" src="http://10.168.1.160:8080/api/producedThumbnail?producedThumbnailId=2176">
</div>

 * 
 * */
var ie=document.all;
var nn6=document.getElementById && !document.all;
var isdrag=false;
var x,y;
var dobj;

function mouseUp()
{
	isdrag=false;
}
function movemouse(e)
{
	if (isdrag)
	{
	dobj.style.left = nn6 ? tx + e.clientX - x : tx + event.clientX - x;
	dobj.style.top  = nn6 ? ty + e.clientY - y : ty + event.clientY - y;
	 return false;
	}
}

function mouseDown(e)
{
	var fobj  = nn6 ? e.target : event.srcElement;
	var topelement = nn6 ? "HTML" : "BODY";
	while (fobj.tagName != topelement  &&  fobj.className != "dragme")
	{
		fobj = nn6 ? fobj.parentNode : fobj.parentElement;
	}
	if (fobj.className=="dragme")
	{
		isdrag = true;
		dobj = fobj;
		tx = parseInt(dobj.style.left+0);
		ty = parseInt(dobj.style.top+0);
		x = nn6 ? e.clientX : event.clientX;
		y = nn6 ? e.clientY : event.clientY;
		document.onmousemove=movemouse;
		return false;
	}
}
