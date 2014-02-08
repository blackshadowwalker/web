
function forSubmenu(thispath, ruler_code,per_card)
{
	//alert(thispath+" "+ruler_code+" "+per_card)
	var thispath=document.getElementById("this_path_id").value;
    dwr.engine.setAsync(false);
    var str="";
    //二级菜单
    navBean.getMenu("1",ruler_code,{
        callback:function(data){
        	if(data!=""){//有二级菜单
	            var data_arrays=data.split(";");
	            var length=data_arrays.length;
	            for(var i=0;i<length-1;i++){
	                var sub_data_array=data_arrays[i].split(",");  
	                
	                if(sub_data_array[3]==""){
	                	//alert(sub_data_array[1])
	                	str+="<h1 class='type'>";
	                	str+="<a href='javascript:void(0)'>"+sub_data_array[1]+"</a>";
	                	str+="</h1>";
	                	str+="<div class='content'>";
	                	str+="<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
	                	str+="<tr>";
	                	str+="<td><img src='"+thispath+"/modules/menu/image/menu_topline.gif' width='182' height='5' /></td>";
	                	str+="</tr>";
	                	str+="</table>";
	                	navBean.getMenu("2",sub_data_array[0],{
		                	
		                    callback:function(two_data){
		                        //创建层
		    
		                        var arrays=two_data.split(";");
		                        var len=arrays.length;
		                        for(var k=0;k<len-1;k++){
		                            var sub_arrays=arrays[k].split(",");
		                            
		                            if(sub_arrays[3]!=""){
		                                if(sub_arrays[4]=="1"){
		                                	
		                                }
		                                else{
		                                	
		                                	if(sub_arrays[5]=="1"){
		                                		
		                                	}
		                                	else{
		                                		//alert(sub_arrays[0]+" "+sub_arrays[1]+" "+sub_arrays[2]+" "+sub_arrays[3]);
		                                		str+="<ul class='MM'>";
		                                		str+="<li><a href='"+thispath+sub_arrays[3]+"?qx="+sub_arrays[0]+"&fgj_bm="+sub_arrays[6]+"&fgj_mc="+sub_data_array[7]+"' target='pad'>"+sub_arrays[1]+"</a></li>";
		                                		str+="</ul>";
		                                	}
		                                }
		                            }
		                        }
		                    },
		                    exceptionHandler:function(err_info){ alert(err_info) }
		                });
	                	str+="</div>";
	                }
	            } 
	            
	            var div=document.getElementById("container");
	            div.innerHTML=str;
	            abc();
        	}
        },
        
        exceptionHandler:function(err_info){
            
            if(err_info!=""){
                    
                alert(err_info);
                
                window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
            }
            else{
                window.open(thispath+"/logoffAction.do?"+new Date(),"_parent");
            }
        }
    });
     dwr.engine.setAsync(true);
    
}
