package modules.cloud.realAnaly;

import java.net.URL;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.medianate.schlitter.api.TaskEndpoint;
import com.medianate.schlitter.api.data.ProducedAnalysis;
import com.medianate.schlitter.api.data.ProducedFile;
import com.medianate.schlitter.api.data.SourceDiffusion;
import com.medianate.schlitter.api.data.TaskDetail;
import com.medianate.schlitter.api.impl.TaskEndpointImpl;
import com.medianate.schlitter.dao.TaskNotFoundException;
import com.medianate.schlitter.edl.Edl;
import com.medianate.schlitter.edl.Source;
import com.medianate.schlitter.edl.io.exception.EdlParseException;

public class Task
{
	long	taskId = 0 ;
	String 	inputVideoName = "";
	String 	inputVideoUrl = "";
	String 	outputVideoUrl = "";
	
	static TaskEndpoint service = null;
	
	public void print(){
		System.out.print(" [taskId="+this.getTaskId()+"]");
		System.out.print(" [inputVideoName="+this.getInputVideoName()+"]");
		System.out.print(" [outputVideoUrl="+this.getOutputVideoUrl()+"]");
		System.out.println(" [inputVideoUrl="+this.getInputVideoUrl()+"]");
	}
	
	Task(){
		
	}
	public String getVideoNameFromUrl(String url, boolean inputVideoUrl){
		String str = "";
		String regex = "";
		if(inputVideoUrl)
			regex = "\\{.*";
		else
			regex = "\\{.*\\}";
		Pattern p = Pattern.compile(regex); //\\{.*
		Matcher m = p.matcher(url);
		if(m.find()){			
			str = m.group();
		}		
		return str;
	}
	
	public boolean setTaskDetail(long taskId, String SOAP_WS_BASE_URL) throws TaskNotFoundException{
		if(service==null)
			service = new TaskEndpointImpl(SOAP_WS_BASE_URL + "TaskEndpointService");
		if(service==null){
			System.out.println("Create TaskEndpoint Service Failed!");
			return false;
		}
		this.setTaskId(taskId);
		TaskDetail taskDetail = service.getDetail(taskId);
		if(taskDetail==null){
			System.out.println("taskDetail==null");
			return false;
		}
		List<ProducedFile> pfile = taskDetail.getFiles();
		if(pfile!=null){
			this.setOutputVideoUrl( URLDecoder.decode(pfile.get(0).getUrl()));
		}
		Edl edl = null;
		List<Source> sc=null;
		SourceDiffusion  source = null;
		List<SourceDiffusion> sourceList = null; 
		try
		{
			sourceList = service.getSourcesDiffusionUrls(taskId);
			if(sourceList!=null && sourceList.size()>0)
				source = sourceList.get(0);
//			edl = service.getEdl(taskId);
//			sc = edl.getSources().getSource();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		this.setInputVideoUrl(URLDecoder.decode(source.getDiffusionUrl()));
		this.setInputVideoName(getVideoNameFromUrl(URLDecoder.decode(source.getDiffusionUrl()), true));
//		this.setInputVideoName(getVideoNameFromUrl(sc.get(0).getInternalLocalPath(), true));
	//	service.getSourcesDiffusionUrls(taskId);
		return true;
	}

	public static void main(String[] args)
	{

	}

	public String getInputVideoName()
	{
		return inputVideoName;
	}
	public void setInputVideoName(String inputVideoName)
	{
		this.inputVideoName = inputVideoName;
	}
	public long getTaskId()
	{
		return taskId;
	}

	public void setTaskId(long taskId)
	{
		this.taskId = taskId;
	}

	public String getInputVideoUrl()
	{
		return inputVideoUrl;
	}

	public void setInputVideoUrl(String inputVideoUrl)
	{
		this.inputVideoUrl = inputVideoUrl;
	}

	public String getOutputVideoUrl()
	{
		return outputVideoUrl;
	}

	public void setOutputVideoUrl(String outputVideoUrl)
	{
		this.outputVideoUrl = outputVideoUrl;
	}

}
