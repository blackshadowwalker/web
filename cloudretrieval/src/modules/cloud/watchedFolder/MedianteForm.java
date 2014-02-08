package modules.cloud.watchedFolder;

import java.util.List;

public class MedianteForm
{
	String 	userCode="";
	int		userID=0;
	String 	authName="";
	String	authPwd="";
	List<String> sourceList = null; 
	List<String> sourceIds = null; 
	List<Long> taskList = null;
	String 	outPutFile="";
	long	curTaskID =0;//
	long 	videoTime = 0;
	String 	location = "";
	
	public MedianteForm()
	{
		System.out.println("MedianteForm created!");
	}
	public static void main(String[] args)
	{

	}

}
