package modules.cloud.realAnaly;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import modules.base.CustomException;
import modules.base.ResourceClose;
import modules.cloud.fileMgr.fileMgrBean;

public class Medianate extends ResourceClose
{   
	private fileMgrBean fileMgr = null;
	public Medianate(){
	}
	public static void main(String[] args){
		
	}
	public String getFileNameById(String fileId, ServletContext sc,HttpSession session)
		throws CustomException,Exception
	{
		String fileName = "";
		if(fileMgr==null)
			fileMgr = new fileMgrBean();
		fileName = fileMgr.getFilePathById(Integer.parseInt(fileId), false, sc, session);
		return fileName;
	}
	/*
	 * fileIds: 51313</C>51313</C>51313</C>51313</C>51313</C>51313</C>51313</C>
	 * return taskIds: 523131</C>523131</C>523131</C>523131</C>523131</C>523131</C> 
	 */
	public String startProcess(String fileIds, ServletContext sc,HttpSession session)
	throws CustomException,Exception{
		String taskIdsStr="";
		List<String> fileNames=new ArrayList<String>();
		String[] fileIdList = fileIds.split("</C>");
		for(int i=0; i<fileIdList.length; i++){
			String fileName = this.getFileNameById(fileIdList[i], sc, session);
			fileNames.add(fileName);
		}
		taskMgr tm = new taskMgr();
		List<Long>  taskIds = tm.StartProcessEx(fileNames);
		for(int i=0; i<taskIds.size(); i++){
			taskIdsStr += taskIds.get(i)+"</C>";
		}
		return taskIdsStr;
	}
}