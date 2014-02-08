function showText(Div1, id, text,path)
{
    Image1 = new Img(Div1);//由于与树中的Image()方法名冲突，特改动：将Image改为Img,liuwenhu 2010-08-16
    Image1.Name='Image'+id;
    Image1.value='Image'+id;
    Image1.style.height='22';
    Image1.style.width='22';
    Image1.style.position='absolute';
    Image1.style.left='5';
    Image1.style.top=6+25*(id-1);
	Image1.src=path+'/modules/menu/image/q2.gif';
	
	
    Link1 = new Link(Div1);
    Link1.Name='Link'+id;
    Link1.style.height='21';
    Link1.style.width='233';
    Link1.style.position='absolute';
    Link1.style.left='32';
    Link1.style.top=13+25*(id-1);
    Link1.innerHTML=text;
    Link1.target="pad";
}

function showLink(Div1, id, text,url,isSign,path,target)
{
    Image1 = new Img(Div1);//由于与树中的Image()方法名冲突，特改动：将Image改为Img,liuwenhu 2010-08-16
    Image1.Name='Image'+id;
    Image1.value='Image'+id;
    Image1.style.height='22';
    Image1.style.width='22';
    Image1.style.position='absolute';
    Image1.style.left='5';
    Image1.style.top=6+25*(id-1);
    Image1.src=path+'/modules/menu//image/q2.gif';
	//Image1.src='images/new.gif';
	
    Link1 = new Link(Div1);
    Link1.Name='Link'+id;
    Link1.style.height='21';
    Link1.style.width='233';
    Link1.style.position='absolute';
    Link1.style.left='32';
    Link1.style.top=13+25*(id-1);
    Link1.innerHTML=text;
  
    if(url.indexOf("?qx=online_exam")>-1)
	{
		Link1.href="javascript:top.menu.onlineExam('"+path+"','onlineExam')";
	}
	else if(url.indexOf("?qx=online_test")>-1)
	{
		Link1.href="javascript:top.menu.onlineExam2('"+path+"','onlineTest')";
	}
	else if(url.indexOf("?qx=online_kaoshi")>-1)
	{
		Link1.href="javascript:top.menu.onlineExam2('"+path+"','onlineExam')";
	}
	else
	{
	    Link1.href=url;
	}
    
    if(isSign){
    	
    	Image2 = new Img(Div1);//由于与树中的Image()方法名冲突，特改动：将Image改为Img,liuwenhu 2010-08-16
	    Image2.Name='Image'+id;
	    Image2.value='Image'+id;
	    Image2.style.height='22';
	    Image2.style.width='280';
	    Image2.style.position='absolute';
	    Image2.style.left='-24';
	    Image2.style.top=22+25*(id-1);
	    Image2.src=path+'/modules/menu/image/Line.gif';
    }
	 ///Image1.src='images/new.gif';
    
    //Link1.style.onclick="javascript:window.alert('跳转')";
    //Link1.onclick=alert('跳转');
    
    Link1.target=target;
}

function showLinkSign(Div1)
{
    Image1 = new Img(Div1);//由于与树中的Image()方法名冲突，特改动：将Image改为Img,liuwenhu 2010-08-16
    Image1.Name='Image'+id;
    Image1.value='Image'+id;
    Image1.style.height='22';
    Image1.style.width='22';
    Image1.style.position='absolute';
    Image1.style.left='5';
    Image1.style.top=6+25*(id-1);
    Image1.src='../../images/left/q.gif';
	//Image1.src='images/new.gif';
	
    Link1 = new Link(Div1);
    Link1.Name='Link'+id;
    Link1.style.height='21';
    Link1.style.width='233';
    Link1.style.position='absolute';
    Link1.style.left='32';
    Link1.style.top=13+25*(id-1);
    Link1.innerHTML=text;
    Link1.href=target;
}

function showDiv()
{
    Div1=new Div();
    Div1.style.width=233;
    Div1.style.position='absolute';
    Div1.style.left=2;
    Div1.style.top=34;
    Div1.style.backgroundImage='url(images/group_bg.gif)';
    Div1.style.overflowY="auto";
    return Div1;
}

function showNavBar()
{
    NavBar1 = new NavBar();
    NavBar1.style.height='100%';//二级菜单的高度
    NavBar1.style.width='180';
    NavBar1.style.position='absolute';
    NavBar1.style.left='0';
    NavBar1.style.top='0';
    NavBar1.style.overflowY="hidden";
    return NavBar1;
}
