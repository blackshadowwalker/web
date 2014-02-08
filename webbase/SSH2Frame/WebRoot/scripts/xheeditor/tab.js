$(document).ready(function(){

		//默认第一个为选中		 		   
	 $("li").eq(0).css("background-color","#f2fddb");				   
		//选中的LI变色 				   
          $("li").click( function () {
			 
		 $("li").each(function(){
               $(this).css("background-color","#FFFFFF")
           });
	    $(this).css("background-color","#f2fddb");	
		 
		});
		
		/**
		*点击 我的发帖时 发表主题按钮隐藏
		*/
     $("#myNote").click( function () {		 
		 $("#editDiv").css('display','none');
		});
		
			/**
		*点击 我的发帖时 发表主题按钮隐藏
		*/
     $("#myreplys").click( function () {
		 
		 $("#editDiv").css('display','none');
		});
	   /**
		*点击 我的发帖时 发表主题按钮隐藏
		*/
     $(".atab").click(function () {
		 
		 $("#editDiv").css('display','block');
		});
		
		
		

     
         var arrayli = document.getElementsByTagName("li");
         if(arrayli.length>6){
           for(var i=5;i<=arrayli.length;i++){
          
               $("li").eq(i).addClass("hiddenlastli");
           }
          
           $("#right").css("display","block");
           $("#left").css("display","block");
           
         }
         
        $("#left").click(function(){
          var leftLen =$('li').not(".hiddenli").length;        
           if(leftLen > 5){
            $('li').not(".hiddenli").first().addClass("hiddenli");
            $('li.hiddenlastli').first().removeClass("hiddenlastli");
           }else{          
             alert("已经到最后了");
           }          
        });
        
          $("#right").click(function(){
            var rightLen =$('li').not(".hiddenlastli").length; 
             
             if(rightLen > 5){
             $("li.hiddenli").last().removeClass("hiddenli");          
            $("li").not(".hiddenli").not(".hiddenlastli").last().addClass("hiddenlastli");
            }else{          
              alert("已经到最前了");
           }  
           
           
        });
        
		});
		