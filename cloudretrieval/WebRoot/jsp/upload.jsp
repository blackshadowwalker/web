<%@ page language="java" contentType="text/html; charset=gb2312" %>    
<%@ page import="com.jspsmart.upload.SmartUpload"%>    
<%@ page import="java.util.*"%>    
<%@ page import="modules.base.*"%>    
<%@ page import="java.io.*"%>   

<%
    SmartUpload su = new SmartUpload();  //新建一个SmartUpload对象    
    su.initialize(pageContext);  //上传初始化   
    
    String callback = request.getParameter("callback");
    String savePath = request.getParameter("savePath");
    String fileTypes = request.getParameter("fileTypes");
    
    System.out.println("callback:"+callback);
    System.out.println("savePath:"+savePath);
    System.out.println("fileTypes:"+fileTypes);
    //"doc,docx,xls,xlsx,ppt,pptx,rar,zip,7z,text"
   
    // 设定上传限制    
    su.setMaxFileSize(100000000);  //1.限制每个上传文件的最大长度。 
    su.setTotalMaxFileSize(200000000);  //2.限制总上传数据的长度。   
    su.setAllowedFilesList(fileTypes);  //3.设定允许上传的文件（通过扩展名限制）

    StringBuffer file_name = new StringBuffer();
    StringBuffer files = new StringBuffer();

    String filePath =  application.getInitParameter("uploadPath");
    if(filePath==null || filePath=="")
   	 filePath = request.getRealPath("/") + "/upload";
    
    File file = new File(filePath+"/"+savePath+"/");
    file.mkdirs();
    
    boolean sign = false;    
    int cnt = 0;
    try 
    {    
        su.setDeniedFilesList("exe,bat,jsp,asp,php,htm,html");  //4.设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,jsp,htm,html扩展名的文件和没有扩展名的文件。    
        su.upload(); //上传文件   
        com.jspsmart.upload.File myFile  = null;
         
        Enumeration enum1 = su.getFiles().getEnumeration();
         
        while (enum1.hasMoreElements())
        {
          	myFile = (com.jspsmart.upload.File)enum1.nextElement();
         	
         	if (!myFile.isMissing())
			{
	         	file_name.delete(0, file_name.length());
	         	
	         	file_name.append(savePath).append("_").append(TimeBean.getCurrentTime()).append(cnt).append(".").append(myFile.getFileExt());
	         	
	            //将上传文件保存到指定目录
	       System.out.println(filePath+"/"+savePath+"/" + file_name.toString());
	         	myFile.saveAs(filePath+"/"+savePath+"/" + file_name.toString());
	         	
	         	files.append( filePath +"/"+ savePath+"/"+file_name+"</C>");
	         	cnt ++;
			}
        }
        sign = true;
       
     } catch (Exception e) 
     { 
         e.printStackTrace(); 
         sign = false; 
     } 
     
     
     //System.out.println("files="+files.toString().replace("\\", "/").replace("//", "/"));
     out.println("<script>parent."+callback+"("+sign + ","+cnt+", '"+files.toString().replace("\\", "/").replace("//", "/")+"')</script>"); 
%>    





