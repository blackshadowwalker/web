$(document).ready(function(){

              
			//初始化xhEditor编辑器插件
			$('#editor').xheditor({
				tools:'Bold,Italic,Underline,Strikethrough,about',
				skin:'nostyle'
			});
			
			$('TD.pagetd a').mouseover(function(){
			 
			     $(this).addClass("onCurrent");
			     
			});
			$('TD.pagetd a').mouseout(function(){
			 
			     $(this).removeClass("onCurrent");
			     
			});
			$('#goTo').click(function(){
			 var  reg =/^[0-9]*$/;			 
			 var val = document.getElementById('gotoText').value;
			  var maxPage = $('#maxPage').val();
			 		  
			   if(val == null || val == ""|| val == undefined){
			      ymPrompt.alert(('跳转的页面不能为空'),'350','180','提示');
			       return;
			   }if(!reg.test(val)){
			    ymPrompt.alert(('只能输入数字'),'350','180','提示');
			    return;
			   }
			   if(parseInt(val)>parseInt(maxPage)||parseInt(val)<0){
			      ymPrompt.alert(('跳转页面输入值错误'),'350','180','提示');
			       return;
			   }
			   else{
			 		     
			     goToPage(val);
			   }
			
			});
		    
		
			
			});	
			
	  /**
     * 取消置顶本贴
     */
	   function removeHeadNote(){
		var topicId = document.opForm.param_topicId.value;
	    var tbid    = document.opForm.param_tbid.value;
	     $.ajax({
         type: "POST",
         url: "TextEditorAction?method=removeHeadNote",
         data: "topicId="+topicId+"&tbid="+tbid,
         success: function(msg){     
           ymPrompt.alert((msg),'350','180','提示');
          $("#removeHeadBtn").css("display","none");
          $("#pushHeadBtn").css("display","block");
          $(".topImg").css("display","none")
                }
            });
		
		}
	/**
     * 置顶本贴
     */	
		function pushHeadNote(){
		var topicId = document.opForm.param_topicId.value;
	    var tbid    = document.opForm.param_tbid.value;
	     $.ajax({
         type: "POST",
         url: "TextEditorAction?method=pushHeadNote",
         data: "topicId="+topicId+"&tbid="+tbid,
         success: function(msg){     
           ymPrompt.alert((msg),'350','180','提示');
          $("#pushHeadBtn").css("display","none");
          $("#removeHeadBtn").css("display","block"); 
          $("#topImgId").css("display","block")
                }
            });
		
		}
	/**
     * 取消推荐本贴
     */	
	 function removeRecommendNote(){
	   var topicId = document.opForm.param_topicId.value;
	   var tbid    = document.opForm.param_tbid.value;
	   $.ajax({
         type: "POST",
         url: "TextEditorAction?method=removeRecommendNote",
         data: "topicId="+topicId+"&tbid="+tbid,
         success: function(msg){
         
           ymPrompt.alert((msg),'350','180','提示');
          $("#removeRecommonedBtn").css("display","none");
          $("#recommonedBtn").css("display","block");
          $(".reImg").css("display","none");
                }
            });
	  }
					
	 /**
     * 推荐本贴
     */	
	 function recommendNote(){
	   var topicId = document.opForm.param_topicId.value;
	   var tbid    = document.opForm.param_tbid.value;
	   $.ajax({
         type: "POST",
         url: "TextEditorAction?method=recommendNote",
         data: "topicId="+topicId+"&tbid="+tbid,
         success: function(msg){
         
           ymPrompt.alert((msg),'350','180','提示');
          $("#recommonedBtn").css("display","none");
          $("#removeRecommonedBtn").css("display","block");
          $("#reImgId").css("display","block");
                }
            });
	  }
	 
	 /**
     * 屏蔽该楼
     */	
	 function blockNote(noteId){
	     document.opForm.action="TextEditorAction?method=blockNote&noteId="+noteId;
	     document.opForm.submit();
	 
	 }	
	  /**
     * 显示已屏蔽的帖子
     */	
	 function showNote(noteId){
	     document.opForm.action="TextEditorAction?method=showNote&noteId="+noteId;
	     document.opForm.submit();
	 
	 }		
			
	 /**
     * 引用该楼层
     */							
	function quoteNote(rn,tuser){
	    var htmlstr;
	    var content;
	   var content;
	   for(var i = 0;i <document.opForm.length;i++){
       if(document.opForm.elements[i].name == rn){
          content = document.opForm.elements[i].value;             
        }
        } 
	  
	 $("#quickDiv").slideDown("fast",function(){ 
	           
      
            $('#quickNote').val("点击收起");
            
         
            
            htmlstr = "<div class='quoteDiv' style='margin-top:3px;width:100%;height:90%;border:1px;border-style:solid;border-color:#CCFF00'><h5>"+"引用&nbsp;&nbsp;"+rn+"楼:&nbsp;&nbsp"+tuser+"</h5>&nbsp;&nbsp"+content+"</div>";
	        
	       
	      
	      $('.quoteDiv img').detach();
	      
	      $("#editor").val(htmlstr);
    
    });
	    
	}		
   
   /**
    * 直接回复该楼层
    */
   function getRe(rn,tcnn){
   
    var rcnn = "回复"+rn+"楼:"+""+tcnn;
    $("#quickDiv").slideDown("fast",function(){ 
      
            $('#quickNote').val("点击收起");
            
             $('#noteName').val(rcnn);
    
    });
    
   }
   
    /**
   * 显示快速发帖
   */
   function showQuick(){
   
    $("#quickDiv").slideToggle("normal",function(){
 
    
         if($("#quickDiv").css("display")!='block'){
          
            $('#quickNote').val("快速发帖");
         }
         else{
            
            $('#quickNote').val("点击收起");
         }
    
    });
   
   }
 
   /**
   * 班级发帖
   */
   function edit(){
      window.frames["board"].opForm.target="_parent";
      window.frames["board"].opForm.action="TextEditorAction?method=enterEditNote";  
      window.frames["board"].opForm.submit();
   }
   /**
   * 发表新主题
   */
  function saveNote(){ 
         var content =$('#editor').val(); 
         document.opForm.target="_parent";
         document.opForm.param_content.value  =content;
 		 document.opForm.action = "TextEditorAction?method=saveNote";
 		 document.opForm.submit();		
 	}
 	/**
   * 跟帖
   */
  function replyNote(){ 
         var content =$('#editor').val(); 
         document.opForm.param_content.value  =content;
        
 		 document.opForm.action = "TextEditorAction?method=replyNote";
 		 document.opForm.submit();		
 	}
 	
 	
 	/**
   * 查看我的帖子
   */
 // function queryMyNotes(){
          
 		// document.opForm.action = "TextEditorAction?method=queryMyNotes";
 		// document.opForm.submit();		
 	//}

 	
 	
 	