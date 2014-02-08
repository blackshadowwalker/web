/**
 * AJAX Dev Library  NavBar
 *
*/
//NavBar

function getScriptPath(js)
{
	js=js.toLowerCase()
	var script=document.getElementsByTagName("SCRIPT");
	for(var i=0;i<script.length;i++)
	{
		var s=script[i].src.toLowerCase()
		if(s.indexOf(js)!=-1)return s.replace(js,"")
	}
	return null
}

var path=getScriptPath("NavBar.js")


NavBar.prototype.Select=null;
NavBar.prototype.OnChange=null;
function NavBar(parent)
{
  var obj=new Div(parent);
  obj.style.width=180;
  obj.style.height=300;
  obj.style.borderStyle='none';
  obj.style.borderWidth=1;
  obj.container=new Div(obj);
  obj.container.style.padding=2;
  obj.Items=new Array();
  obj.Add=NavBar_Add;
  obj.SetSelect=NavBar_SetSelect;
  return obj;
}
//setactive
function NavBar_SetSelect(index){
  this.Items[index].Expand();
}
//add a child
function NavBar_Add(title){
  var item1=new NavBarItem(this.container);
  if(this.Items.length==0){
    this.Select=item1;
	
    //item1.row1.style.backgroundImage='url('+jcl_ResourceURL+'item_selectbg.gif)';

  }
  else{
    item1.row2.parentNode.removeChild(item1.row2);
  }
  item1.style.position='relative';
  item1.style.width='';
  if(title){
    item1.Text.innerHTML=title;
  }
  item1.NavBar=this;
  this.Items[this.Items.length]=item1;
  return item1;
}
//NavBarItem
function NavBarItem(parent){
  var obj=new Table(parent);
  obj.Name='NavBarItem'+Math.random()*1000000000000000000;
  var s='window.'+obj.Name+'=obj';
  eval(s);
  obj.cellSpacing=0;
  obj.style.borderWidth=0;
  obj.row1=obj.AppendRow();
  obj.row1.NavBarItem=obj;
  obj.row1.style.height=30;//菜单的宽度
  obj.Image=obj.AppendCell(obj.row1);
  obj.cell12=obj.AppendCell(obj.row1);
  obj.Text=obj.AppendCell(obj.row1);
  obj.row2=obj.AppendRow();
  obj.cell2=obj.AppendCell(obj.row2);
  obj.cell2.colSpan=3;
  obj.cell2.style.borderWidth=0;
  obj.cell12.style.width="2";
  obj.cell12.innerHTML="&nbsp;";
  obj.cell12.style.borderLeft=0;
  obj.cell12.style.borderRight=0;
  obj.cell12.style.borderStyle='solid';
  obj.cell12.style.borderColor='#FFFFFF';
  obj.Text.style.borderLeft=0;
  obj.Text.style.borderStyle='solid';
  obj.Text.style.borderColor='#FFFFFF';
  DefaultStyle.SetFont(obj.Text);

  obj.Image.style.width='10%';
  obj.Image.style.borderStyle='solid';
  obj.Image.style.borderRight=0;
  obj.Image.style.borderColor='#FFFFFF';

  //obj.row1.style.backgroundRepeat='repeat';
  //obj.row1.style.backgroundImage='url('+jcl_ResourceURL+'item_bg.gif)';
  
  // 菜单的颜色控制
  obj.Text.style.background="url("+path+"menu_bg2.gif)";
  obj.cell12.style.background="url("+path+"menu_bg2.gif)";
  obj.Image.style.background="url("+path+"menu_bg2.gif)";
  
  obj.Text.style.color='#34B0C7';//字体的颜色
  obj.Text.style.fontSize='14px';//字体的大小
  obj.row1.style.cursor='pointer';
  obj.Icon=new Img(obj.Image);//由于与树中的Image()方法名冲突，特改动：将Image改为Img,liuwenhu 2010-08-16
  obj.Icon.src=jcl_ResourceURL+'space.gif';
  obj.number=0;
  //图片的尺寸
  obj.Icon.height=16;
  obj.Collapse=NavBarItem_Collapse;		
  obj.Collapse_Impl=NavBarItem_Collapse_Impl;
  obj.Expand=NavBarItem_Expand;		
  obj.Expand_Impl=NavBarItem_Expand_Impl;
  obj.jyPath='';
  obj.target='pad';
  
  obj.row1.onclick=NavBarItemrow1_onclick;
  obj.row1.onmouseover=NavBarItemrow1_onmouseover;
  obj.row1.onmouseout=NavBarItemrow1_onmouseout;

  obj.Add=NavBarItem_Add;
  return obj;
}
function NavBarItem_Add(child){
  var item=child;
  if(!item) item=new Div();
  item.style.position='relative';
  item.style.left='';
  item.style.top='';
  item.style.width='';
  item.style.height=0;
  this.cell2.appendChild(item);
  this.Control=item;
  var height=this.NavBar.offsetHeight-8;
  this.NavBar.ControlHeight=height-this.NavBar.Items.length*32;
  this.NavBar.Items[0].Control.style.height=this.NavBar.ControlHeight;
}

function NavBarItemrow1_onclick(){

  if(this.NavBarItem.jyPath!=""){
  	
  		doJY(this.NavBarItem.jyPath,this.NavBarItem.target);
  }
  else{
  	
  		viewIcon(this.NavBarItem.number);
  	
	  	this.NavBarItem.Expand();
  }
  
}
function NavBarItemrow1_onmouseover(){
/*
  if(this.NavBarItem.Select!=this)
	// this.style.backgroundImage='url('+jcl_ResourceURL+'item_hoverbg.gif)';
	 this.style.backgroundImage='url('+jcl_ResourceURL+'item_hoverbg.gif)';
  else
	// this.style.backgroundImage='url('+jcl_ResourceURL+'item_selectoverbg.gif)';
	 this.style.backgroundImage='url('+jcl_ResourceURL+'item_selectoverbg.gif)';
*/
}
function NavBarItemrow1_onmouseout(){
/*
  if(this.NavBarItem.Select!=this)
	 //this.style.backgroundImage='url('+jcl_ResourceURL+'item_bg.gif)';
	 this.style.backgroundColor='#DDDDDD';
  else
	 //this.style.backgroundImage='url('+jcl_ResourceURL+'item_selectbg.gif)';
	 this.style.backgroundImage='#8EC2F5';
*/
}
function NavBarItem_Collapse(){
//  var script=this.Name+".Collapse_Impl()";
//  this.timer=setInterval(script, 10); 
}
function NavBarItem_Collapse_Impl(){
  if(unitToValue(this.Control.style.height)>49){
	  this.Control.oldoverflow=this.Control.style.overflow;
	  this.Control.style.overflow='hidden';
	  this.Control.style.height=unitToValue(this.Control.style.height)-50;
  }
  else {
	  this.Control.style.overflow=this.Control.oldoverflow;
	  this.Control.style.height=0;
	  if(this.row2.parentNode)
		this.row2.parentNode.removeChild(this.row2);
  }
}
function NavBarItem_Expand(){
  if(this.NavBar.Select==this) return;
  this.Control.style.height=0;
  this.Control.oldoverflow=this.Control.style.overflow;
  this.Control.style.overflow='hidden';
  //this.NavBar.Select.row1.style.backgroundImage='url('+jcl_ResourceURL+'item_bg.gif)';
  this.NavBar.Select.Image.style.backgroundColor='#99CCFF';
  this.NavBar.Select.Text.style.backgroundColor='#99CCFF';
  this.NavBar.Select.cell12.style.backgroundColor='#99CCFF';
 //obj.Text.style.backgroundColor='#99CCFF';
  //obj.cell12.style.backgroundColor='#99CCFF';
 // obj.Image.style.backgroundColor='#99CCFF'
  var script=this.NavBar.Select.Name+".Collapse_Impl();"+this.Name+".Expand_Impl();";
  this.timer=setInterval(script, 5); 
  //this.row1.style.backgroundImage='url('+jcl_ResourceURL+'item_selectbg.gif)';
  this.Image.style.backgroundColor='#99CCFF';
  this.cell12.style.backgroundColor='#99CCFF';
  this.Text.style.backgroundColor='#99CCFF';
  if(this.NavBar.OnChange)
	  this.NavBar.OnChange(this.NavBar,this);

}
function NavBarItem_Expand_Impl(){
  if(unitToValue(this.Control.style.height)<this.NavBar.ControlHeight-49){
    if(unitToValue(this.Control.style.height)==0){
        this.NavBar.Select.Control.style.height=this.NavBar.Select.Control.offsetHeight-2;
		this.tbody.appendChild(this.row2);
	}
	this.Control.style.height=unitToValue(this.Control.style.height)+50;
  }
  else {
	  this.Control.style.overflow=this.Control.oldoverflow;
	  this.Control.style.height=this.NavBar.ControlHeight;
      this.NavBar.Select=this;
	  clearInterval(this.timer);
  }
}
