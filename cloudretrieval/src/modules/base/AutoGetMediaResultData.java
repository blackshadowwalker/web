/*
 * @(#)modules.xsbmglBean.java
 *
 * Copyright (C) ZXD Technologies. All rights reserved.
 *
 * ��������ʱ�䣺[Wed Oct 18 14:56:02 CST 2006]
 */
package modules.base;

import com.medianate.schlitter.api.TaskEndpoint;
import com.medianate.schlitter.api.data.ProducedAnalysis;
import com.medianate.schlitter.api.data.ProducedAnalysisStepReport;
import com.medianate.schlitter.api.data.TaskDetail;
import com.medianate.schlitter.api.impl.TaskEndpointImpl;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.net.URL;
import java.sql.*;
import java.util.List;

import javax.servlet.ServletContext;
import javax.sql.DataSource;


/**
 * ����:��վ������Ϣ���ݵ�Bean��
 *
 * @author  �������д
 * @date    [Wed Oct 18 14:56:02 CST 2006]
 *
 * $Id: xsbmglBean.java,v 1.1 2012/09/30 01:54:28 Administrator Exp $
 */
public class AutoGetMediaResultData extends ResourceClose
{
    private DataSource dataSource;

    public AutoGetMediaResultData()
    {
    	
    }

    
    public AutoGetMediaResultData(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
    /*
     * ��վ������Ϣ���ݲ�ѯ
     */
    
    static String SOAP_WS_BASE_URL = "http://10.168.1.160:8080/api/services/soap/";    
    static TaskEndpoint service=null;
    public void callBackResultData(ServletContext sc)
    throws CustomException,Exception
    {
//    	�жϻ���ʵ���Ƿ�Ϊ��
        if (sc == null)
        {
            System.out.println("ServletContext Ϊ�գ����ء�");
            throw new CustomException("ServletContext Ϊ�գ�����");
        }
        
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
               return new PasswordAuthentication("admin", "resonate".toCharArray());
            }
        };
    	Authenticator.setDefault(auth);
        
        //�����ѯ�����Ϣ
        StringBuffer infoSB=null;
        //����SQL���
        StringBuffer sqlSB = null;
        Connection con=null;//�������ݿ�����
        PreparedStatement pstm=null;//����Ԥ�������
        Statement sta=null;
        ResultSet rs=null;//�����ѯ�Ľ����
        String inputVideo="";
        try
        {
            con=((DataSource)sc.getAttribute("basedb")).getConnection();
              
            if (con==null)
            {
            	System.out.println("���ݿ�����ConnectionΪ�գ�����ʧ��");
                throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
            }
            infoSB=new StringBuffer();
            sqlSB=new StringBuffer();
            sta=con.createStatement();
            con.setAutoCommit(false);
            sqlSB.append("SELECT taskID FROM t_m_tasks t,t_m_videos v WHERE t.inputVideoId=v.id AND v.watchfolderID IS NOT NULL ORDER BY taskID DESC LIMIT 1"); //������е��¼�����
            pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
            rs=pstm.executeQuery();

            if (rs!=null && rs.next())
            {
            	 
            	 
				 service = new TaskEndpointImpl(SOAP_WS_BASE_URL + "TaskEndpointService");
				 List<TaskDetail> list=service.findAll();
				 
				 for(int i=list.size()-1;i>0;i--){
					 if(service.getDetail(list.get(i).getId()).getWatchedFolderId()!=null){
					 if(list.get(i).getId()>rs.getInt(1)){
//						  System.out.println("TaskId="+list.get(i).getId());
//						  System.out.println("MacroState="+list.get(i).getMacroState());
						  if(list.get(i).getMacroState().equals("FAILED")){
							  //String 
//							  System.out.println("TaskId="+list.get(i).getId());
//							  System.out.println("reason="+service.getDetail(list.get(i).getId()).getFailureReasonShort());
							  if(service.getDetail(list.get(i).getId()).getProducedAnalysisReports()!=null){
//								  System.out.println("--------------"+service.getDetail(list.get(i).getId()).getProducedAnalysisReports().get(0).getOriginalMediafileUri());
								  
								  if(service.getDetail(list.get(i).getId()).getProducedAnalysisReports().get(0).getOriginalMediafileUri().split("/").length>2){
									  inputVideo=service.getDetail(list.get(i).getId()).getProducedAnalysisReports().get(0).getOriginalMediafileUri().split("/")[service.getDetail(list.get(i).getId()).getProducedAnalysisReports().get(0).getOriginalMediafileUri().split("/").length-1];
								  }else{
									  service.getDetail(list.get(i).getId()).getProducedAnalysisReports().get(0).getOriginalMediafileUri().split("/");
								  }
							  }
							  sta.addBatch("INSERT INTO t_m_tasks (taskID,state,inputVideoId) values ('"+list.get(i).getId()+"','failed',(SELECT id FROM t_m_videos WHERE value ='"+inputVideo+"'));");
						  }
						  if(list.get(i).getMacroState().equals("COMPLETED")){
							  TaskDetail taskDetail=service.getDetail(list.get(i).getId());
							  List<ProducedAnalysis> listProducedAnalysis=taskDetail.getProducedAnalysisReports();
							  if(listProducedAnalysis!=null){
//								  System.out.println("outputVideoUrl="+taskDetail.getFiles().get(0).getUrl());
//								  System.out.println("inputVideoUrl="+listProducedAnalysis.get(0).getOriginalMediafileUri());
								  
								  if(listProducedAnalysis.get(0).getOriginalMediafileUri().split("/").length>2){
									  inputVideo=listProducedAnalysis.get(0).getOriginalMediafileUri().split("/")[listProducedAnalysis.get(0).getOriginalMediafileUri().split("/").length-1];
								  }else{
									  inputVideo=listProducedAnalysis.get(0).getOriginalMediafileUri();
								  }
								  sta.addBatch("INSERT INTO t_m_tasks (taskID,state,inputVideoId,outputVideoId) values ('"+list.get(i).getId()+"','finished',(SELECT id FROM t_m_videos WHERE value ='"+inputVideo+"'),'"+taskDetail.getFiles().get(0).getUrl().split("/")[taskDetail.getFiles().get(0).getUrl().split("/").length-1]+"');");
								  for(int j=0;j<listProducedAnalysis.size();j++){
									  ProducedAnalysis producedAnalysis=listProducedAnalysis.get(j);
									  //System.out.println(producedAnalysis.getOriginalMediafileTrackId());
									  
									  List<ProducedAnalysisStepReport> listProducedAnalysisStepReports=listProducedAnalysis.get(j).getStepReports();
									  if(producedAnalysis.getProducedThumbnails()!=null&&listProducedAnalysisStepReports!=null){
										  for(int m=0;m<producedAnalysis.getProducedThumbnails().size();m++){
											  
											  URL url = new URL(listProducedAnalysisStepReports.get(m).getReportUrl());
											  byte[] bytes = readBytes(url);
//											  System.out.println(new String(bytes, "UTF8"));	
											  String str1[] = new String(bytes, "UTF8").split("Content=");
											  String str2[] = new String(bytes, "UTF8").split("Type=");
											  String str3[] = new String(bytes, "UTF8").split("x=");
											  String str4[] = new String(bytes, "UTF8").split("y=");
											  String str5[] = new String(bytes, "UTF8").split("width=");
											  String str6[] = new String(bytes, "UTF8").split("height=");
											  String str7[] = new String(bytes, "UTF8").split("Confidence=");
//											  System.out.println("taskId="+list.get(i).getId());
//											  System.out.println("outputVideoUrl="+taskDetail.getFiles().get(0).getUrl());
//											  System.out.println("watchedFolderId="+taskDetail.getWatchedFolderId());
//											  System.out.println("inputVideoUrl="+listProducedAnalysis.get(0).getOriginalMediafileUri());
//											  System.out.println("LPNpicUrl="+producedAnalysis.getProducedThumbnails().get(m).getUrl());
//											  System.out.println("FrameCtsUs="+listProducedAnalysisStepReports.get(m).getFrameCtsUs());
//											  System.out.println("FrameIndex="+listProducedAnalysisStepReports.get(m).getFrameIndex());
//
//											  System.out.println("LPNumber="+str1[1].split(" ")[0]);
//											  System.out.println("Type="+str2[1].split("\n")[0]);
//											  System.out.println("PositionX="+str3[1].split(" ")[0]);
//											  System.out.println("PositionY="+str4[1].split("\n")[0]);
//											  System.out.println("Width="+str5[1].split(" ")[0]);
//											  System.out.println("Height="+str6[1].split("\n")[0]);
//											  System.out.println("Confidence="+str7[1].split(" ")[0]);
											  sta.addBatch("INSERT INTO t_m_report (taskId,LPNumber,frameIndex,frameCTS,confidence,posX,posY,width,height,LPNpicUrl,status) values " +
											  		"('"+list.get(i).getId()+"','"+str1[1].split(" ")[0]+"','"+listProducedAnalysisStepReports.get(m).getFrameIndex()+"'," +
											  				"'"+listProducedAnalysisStepReports.get(m).getFrameCtsUs()+"','"+str7[1].split(" ")[0]+"','"+str3[1].split(" ")[0]+"'," +
											  						"'"+str4[1].split("\n")[0]+"','"+str5[1].split(" ")[0]+"','"+str6[1].split("\n")[0]+"','"+producedAnalysis.getProducedThumbnails().get(m).getUrl()+"'," +
											  								"'"+1+"')");
										  }
									  }
								  }
							  }
						   }
					 }
					 /*else{
						 //System.out.println("stop!!!");
						 //System.out.println(list.get(i).getId()+" "+list.get(i).getWatchedFolderId());
						 break;
					 }*/
			     }
				 }
				 sta.executeBatch();
//				 System.out.println(rs.getInt(1));
            } 
            con.commit();
        }
        catch (SQLException sql)
        {	
        	System.out.println("!!!!!!!!!!!!!!ִ�лع�");
        	con.rollback();  
        	con.setAutoCommit(true);
            sql.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"AutoGetMediaResultData.callBackResultData�������ݿ���󣬲���Ϊ��ϵͳ�Զ�ִ�д����¼���"+sql.getMessage(),AutoGetMediaResultData.class.getName());
            throw new CustomException("�������ݿ����ӷ���Ĵ���...");
        }
        catch (UnsupportedEncodingException ue)
        {
        	con.rollback();
            ue.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"AutoGetMediaResultData.callBackResultData�������ݿ���󣬲���Ϊ��ϵͳ�Զ�ִ�д����¼���"+ue.getMessage(),AutoGetMediaResultData.class.getName());
            throw new CustomException("ת���ַ���ʱ���ִ���");
        }
        catch (Exception ce)
        {
        	con.rollback();
            ce.printStackTrace();
            LogBean.wirte_log(((DataSource)sc.getAttribute("basedb")).getConnection(), "t_s_cwlog","ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"ϵͳ�Զ�ִ��"+"</C>"+"AutoGetMediaResultData.callBackResultData�������ݿ���󣬲���Ϊ��ϵͳ�Զ�ִ�д����¼���"+ce.getMessage(),AutoGetMediaResultData.class.getName());
            throw new CustomException("����δ֪�쳣����");
        }
        finally
        {
            //�ر����п�����Դ
            close(rs,pstm,null,con);
        }
    }
    
    	public static byte[] readBytes(URL url) throws IOException {
    	    ByteArrayOutputStream bais = new ByteArrayOutputStream();
    	    InputStream is = null;
    	    try {
    	      is = url.openStream ();
    	      byte[] byteChunk = new byte[4096];
    	      int n;

    	      while ( (n = is.read(byteChunk)) > 0 ) {
    	        bais.write(byteChunk, 0, n);
    	      }
    	    }
    	    finally {
    	      if (is != null) { is.close(); }
    	    }
    	    
    	    return bais.toByteArray();
    	}	
}