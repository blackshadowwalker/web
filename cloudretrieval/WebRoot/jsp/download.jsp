<%@ page contentType="" %>

<%@ page import="java.util.*"%>    
<%@ page import="modules.base.*"%>    
<%@ page import="java.io.*"%>   


<%

	String serverPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
	System.out.println("serverPath: "+serverPath);
	String realPath = request.getRealPath("/");
	System.out.println("realPath: "+realPath);
	
	String fileName = new String(request.getParameter("fileName").getBytes("iso-8859-1"), "GBK");
	String filePath = new String(request.getParameter("filePath").getBytes("iso-8859-1"), "GBK");
	String clickPath = serverPath + filePath;
	String downPath = realPath + filePath;
	
	System.out.println("fileName:" + fileName);
	System.out.println("filePath:" + filePath);
	System.out.println("clickPath:" + clickPath);
	System.out.println("downPath:" + downPath);
	
	if(fileName.trim().length()==0 || filePath.trim().length()==0)
		return;
	
	String ext=".dat";
	int index= downPath.lastIndexOf('.');
	if(index>0){
		ext = downPath.substring(index);
		if(fileName.endsWith(ext)){  }
		else fileName += ext;
	}
	System.out.println("Save fileName: "+fileName);
	
	response.addHeader("Content-Disposition", "attachment;filename=" + java.net.URLEncoder.encode(fileName, "UTF-8"));
//	response.addHeader("Content-Disposition", "attachment;filename=" + fileName);

//	response.reset();
	
	OutputStream outp = null;
	FileInputStream in = null;
	try{
		outp = response.getOutputStream();
	//	outp = System.out;
		in = new FileInputStream(downPath);
		byte[] b = new byte[1024];
		int i=0; 
		while ( (i=in.read(b))>0 ){
			outp.write(b,0,i);
		}
		outp.flush();
		out.clear();
		out = pageContext.popBody();
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if (in!=null)
		{
			in.close();
			in = null;
		}
	}
	
	System.out.println("this is k");
	
%>

<html>
<head>
<title></title>
  <meta http-equiv="Cache-Control" CONTENT="no-cache">
 </head>
<body>
<iframe name="downLoad_hide" style="width:700;height:600;display:none" ></iframe>

If the browser do not down anto, click  
<a href="#" onclick="down()" >here</a>  
to download by hand.

</body>
</html>

<script>
function down()
{
	var url = "<%=clickPath%>";
	window.open(url,"_blank");
	javascript:history.back();
}
</script>
