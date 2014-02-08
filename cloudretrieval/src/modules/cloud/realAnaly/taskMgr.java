package modules.cloud.realAnaly;

import java.util.ArrayList;
import java.util.List;

import com.medianate.schlitter.api.TaskEndpoint;
import com.medianate.schlitter.api.data.SimpleSource;
import com.medianate.schlitter.api.data.SimpleTask;
import com.medianate.schlitter.api.data.TaskDetail;
import com.medianate.schlitter.api.exception.TaskValidationException;
import com.medianate.schlitter.api.impl.TaskEndpointImpl;
import com.medianate.schlitter.dao.TaskNotFoundException;
import com.medianate.schlitter.edl.io.exception.EdlParseException;
import com.medianate.schlitter.edl.io.exception.EdlSerializationException;
import com.medianate.schlitter.exception.SchlitterException;

import modules.base.ResourceClose;

public class taskMgr extends ResourceClose
{   
	String AuthName = "admin"; 
    String PASSWORD = "resonate";
    Integer TASK_PRIORITY = 3;
	String SOAP_WS_BASE_URL = "http://10.168.1.160:8080/api/services/soap/";    
	long TF_LPR_PROFILE_ID = 100; // Id of the profile previously created.
	static TaskEndpoint service=null;
	
	public taskMgr(){
		
	}
	public static void main(String[] args){
		
	}
	public List<SimpleSource> setSources(List<String> videoNames)
	{
		List<SimpleSource> sources  = new ArrayList<SimpleSource>();
		for(int i=0; i<videoNames.size(); i++)
		{
			SimpleSource source = new SimpleSource();
			source.setUrl(videoNames.get(i));
			sources.add(source);
		}
		return sources;
	}
	public long createTask(String fileName) throws TaskValidationException{
		long taskId = 0;
		List<String> videoNames = new ArrayList<String>();
		videoNames.add(fileName);
		
		SimpleTask task = new SimpleTask();
        task.setSources(this.setSources(videoNames));
        task.setDestination(fileName+"_out.mp4");
        task.setPriority(TASK_PRIORITY);
        
        TaskDetail taskDetail = null;
        taskDetail = service.createByProfile(TF_LPR_PROFILE_ID, task);
        if (taskDetail == null) {
        	System.out.println("Task detail is null but no exception was raised!");
        	return 0;
        }
        String taskState = taskDetail.getState();
    	taskId = taskDetail.getId();
    	
		return taskId;
	}
	public List<Long> StartProcessEx(List<String> fileNames) {
		List<Long> taskIds = new ArrayList<Long>();
		for(int i=0; i<fileNames.size(); i++){
			long taskId = StartProcess(fileNames.get(i));
			if(taskId>0)
				taskIds.add(taskId);
		}
		return taskIds;
	}
	/*
	 * return : id ->  153
	*/
	public long StartProcess(String fileName) 
	{
		// updateSoapBaseUrl(); //query t_m_baseinfo
		service = new TaskEndpointImpl(SOAP_WS_BASE_URL + "TaskEndpointService");
		if(service==null){
			System.out.println("Create TaskEndpoint Failed!");
			return 0;
		}
		long taskId = 0;
		try
		{
			taskId = this.createTask(fileName);
			if(taskId<1){
				System.out.println("CreateTask Failed!");
				return 0;
			}
			service.start(taskId);
			TaskDetail taskDetail = service.getDetail(taskId);
	    	String taskState = taskDetail.getState();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
    	if(ListenTask(taskId))
    		return taskId;
    	else
    		return 0;
	}
	public boolean ListenTask(long taskId){
		
		return false;
	}
}