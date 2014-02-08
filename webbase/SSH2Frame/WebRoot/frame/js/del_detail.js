// JavaScript Document
function del(id,string){
	var id=id;
	var hrf=string;
	if(confirm("确认删除此条记录?")){
		
	window.location.href=hrf+"="+id+"";
	return true;
	}else{
		
   return false;
	}
	
	}
function detail(id,string){
	var id=id;
	var hrf=string;
	window.location.href=hrf+"="+id+"";
	}