package modules.cloud.realAnaly;

import java.util.ArrayList;
import java.util.List;

import modules.base.ResourceClose;

public class reportMgr extends ResourceClose
{   
	List<reportDetail> reportList = null;
	String	producedFileUrl = "";
	String 	OriginalMediafileUri = "";
	String 	inputVideoName = "";
	
	public reportMgr(){
		reportList = new ArrayList<reportDetail>();
	}
	public List<reportDetail> getReportList(){
		return reportList;
	}
	public reportDetail getReportDetail(int i){
		return reportList.get(i);
	}
	public static void main(String[] args){
		
	}
	public String getProducedFileUrl()
	{
		return producedFileUrl;
	}
	public void setProducedFileUrl(String producedFileUrl)
	{
		this.producedFileUrl = producedFileUrl;
	}
	public String getOriginalMediafileUri()
	{
		return OriginalMediafileUri;
	}
	public void setOriginalMediafileUri(String originalMediafileUri)
	{
		OriginalMediafileUri = originalMediafileUri;
	}
	public String getInputVideoName()
	{
		return inputVideoName;
	}
	public void setInputVideoName(String inputVideoName)
	{
		this.inputVideoName = inputVideoName;
	}
	public void addReportDetail(reportDetail rd){
		reportList.add(rd);
	}
	public List<Integer> getReportIds(long taskId){
		
		return null;
	}
	public List<reportDetail> getReport(long taskId){
		
		return null;
	}
	public List<reportDetail> getReportByIds(List<Integer> taskIds){
		return null;
	}
}