<%@ page language="java" contentType="text/html; charset=gb2312" %>    
<%@ page import="com.jspsmart.upload.SmartUpload"%>    
<%@ page import="java.util.*"%>    
<%@ page import="modules.base.*"%>    
<%@ page import="java.io.*"%>   

<%
    SmartUpload su = new SmartUpload();  //�½�һ��SmartUpload����    
    su.initialize(pageContext);  //�ϴ���ʼ��   
    
    String callback = request.getParameter("callback");
    String savePath = request.getParameter("savePath");
    String fileTypes = request.getParameter("fileTypes");
    
    System.out.println("callback:"+callback);
    System.out.println("savePath:"+savePath);
    System.out.println("fileTypes:"+fileTypes);
    //"doc,docx,xls,xlsx,ppt,pptx,rar,zip,7z,text"
   
    // �趨�ϴ�����    
    su.setMaxFileSize(100000000);  //1.����ÿ���ϴ��ļ�����󳤶ȡ� 
    su.setTotalMaxFileSize(200000000);  //2.�������ϴ����ݵĳ��ȡ�   
    su.setAllowedFilesList(fileTypes);  //3.�趨�����ϴ����ļ���ͨ����չ�����ƣ�

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
        su.setDeniedFilesList("exe,bat,jsp,asp,php,htm,html");  //4.�趨��ֹ�ϴ����ļ���ͨ����չ�����ƣ�,��ֹ�ϴ�����exe,bat,jsp,htm,html��չ�����ļ���û����չ�����ļ���    
        su.upload(); //�ϴ��ļ�   
        com.jspsmart.upload.File myFile  = null;
         
        Enumeration enum1 = su.getFiles().getEnumeration();
         
        while (enum1.hasMoreElements())
        {
          	myFile = (com.jspsmart.upload.File)enum1.nextElement();
         	
         	if (!myFile.isMissing())
			{
	         	file_name.delete(0, file_name.length());
	         	
	         	file_name.append(savePath).append("_").append(TimeBean.getCurrentTime()).append(cnt).append(".").append(myFile.getFileExt());
	         	
	            //���ϴ��ļ����浽ָ��Ŀ¼
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





