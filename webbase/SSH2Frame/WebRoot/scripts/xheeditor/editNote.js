$(document).ready(function(){
			//初始化xhEditor编辑器插件
			$('#editor').xheditor({
				tools:'full',
                skin:'nostyle',
				html5Upload:false,
				//upMultiple:true,
				// upImgUrl: "/xheditor/servlet/UploadFileServlet",
				upImgUrl:"BBSFileAction?method=fileUpLoad",
				upImgExt: "jpg,jpeg,gif,bmp,png",
				//upMultiple:5,
				onUpload:insertUpload
			});
			//xbhEditor编辑器图片上传回调函数
			function insertUpload(msg) {
				var _msg = msg.toString();
				var _picture_name = _msg.substring(_msg.lastIndexOf("/")+1);
				var _picture_path = Substring(_msg);
				alert(_picture_path);
				//var _str = "<input type='checkbox' name='_pictures' value='"+_picture_path+"' checked='checked' onclick='return false'/><label>"+_picture_name+"</label><br/>";
				// $("#editor").append(_msg);
				// $("#uploadList").append(_str);
				alert("<img src='"+_picture_path+"'/>");
                $("#editor").pasteHTML("<img src='<%=path%>/"+_picture_path+"'/>");
			}
			//处理服务器返回到回调函数的字符串内容,格式是JSON的数据格式.
			function Substring(s){
				return s.substring(s.substring(0,s.lastIndexOf("/")).lastIndexOf("/"),s.length);
			}
		});
		
		function submitNote(){
 	    var topicId = document.opForm.param_topicId.value;
 	    var content =$('#editor').val(); 
 	    document.opForm.param_content.value  =content;
 	    if("" == topicId || null == topicId){
 	    
 	       document.opForm.action = "TextEditorAction?method=saveNote";
 	    }else{
 	    document.opForm.action = "TextEditorAction?method=replyNote";
 	    }
 	    
 	    document.opForm.submit();	
 	   }