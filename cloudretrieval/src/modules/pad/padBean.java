package modules.pad;

import java.sql.*;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.io.UnsupportedEncodingException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import modules.base.*;


/*
 * ��ҳ��Ϣ��java��
 *
 */
public class padBean extends ResourceClose{

	private NumberFormat nf;

	public padBean()
	{

		nf=NumberFormat.getPercentInstance();
	}
	/**
	 * @author Administrator xianlin �޸� 2010/05/31
	 * ���ڻ�ȡ��ҳ�и�������ͳ�����ݣ����а�����������ʡ����������ʡ������ʡ��ֽ𱸸��ʡ��˻��Ϲ��ʡ���ԱȨ�޺Ϲ��� 
	 * @param dept_code ��������
	 * @param sortType  �������ͣ�����������Ǽ������򷽷�
	 * @param ctx 
	 * @param session
	 * @return  
	 * @throws CustomException
	 * @throws Exception
	 */

//	���message�б�
	public String getxtxx(String user_code,ServletContext sc,HttpSession session)
	throws CustomException,Exception
	{

		//�жϻ���ʵ���Ƿ�Ϊ��
		if (sc == null)
		{
			//////System.out.println("ServletContext Ϊ�գ����ء�");
			throw new CustomException("ServletContext Ϊ�գ�����");
		}

		//�жϻỰʵ���Ƿ�Ϊ��
		if (session==null)
		{
			//////System.out.println("HttpSession Ϊ�գ����ء�");
			throw new CustomException("HttpSession Ϊ�գ�����");
		}

		//�ж��û��Ƿ��¼
		baseForm bform=(baseForm)session.getAttribute("baseuser");

		if (bform==null)
		{
			throw new CustomException("����ʧЧ�������µ�¼ϵͳ��");
		}

		Connection con=null;//�������ݿ�����
		PreparedStatement pstm=null;//����Ԥ�������
		ResultSet rs=null;//�����ѯ�Ľ����

		StringBuffer infoSB = new StringBuffer();

		try
		{
			con=((DataSource)sc.getAttribute("basedb")).getConnection();

			if (con==null)
			{
				throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
			}

			con.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);

			infoSB=new StringBuffer();

			int i =1;   
			while(i<10)
			{	
				if(i==1)
				{	
					infoSB.append("<br><table width='100%' border='1' bordercolor='#000000' align='center' cellpadding='0' cellspacing='0' >");
					infoSB.append("<tr bgcolor='#ffffff'>");
					infoSB.append("<td colspan='4'> <div align='center'><font color='#000000' ><strong>����֪ͨ</strong></font></div></td>");
					infoSB.append("</tr>");
					infoSB.append("<tr bgcolor='#0060f9'>");
					infoSB.append("<td > <div align='center'><font color='#ffffff'><strong>������</strong></font></div></td>");
					infoSB.append("<td > <div align='center'><font color='#ffffff'><strong>ʱ��</strong></font></div></td>");
					infoSB.append("<td > <div align='center'><font color='#ffffff'><strong>֪ͨ����</strong></font></div></td>");
					infoSB.append("<td > <div align='center'><font color='#ffffff'><strong>����</strong></font></div></td>");
					infoSB.append("</tr>");
				}

				if(i%2==0)
				{
					infoSB.append("<tr bgcolor='#FFFFFF' align='center'>");
				}
				else
				{
					infoSB.append("<tr align='center'>");
				}

		//		infoSB.append("<td > <div align='center'>"+rs.getString("rwmc")+"</div></td>");
		
				infoSB.append("<td > <div align='center'>��Ϣ���ԣ������� "+i+"</div></td>");
				infoSB.append("<td > <div align='center'>2012-09-01 15:30 </div></td>");
				infoSB.append("<td > <div align='center'>���ڱ�ϵͳʵʩ��֪ͨ</div></td>");
				infoSB.append("<td > <div align='center'><a href=\"javascript:forjwrw('45123')\">�鿴</a></div></td>");
				//infoSB.append("<td > <div align='center'><a href=\"javascript:forjwrw('"+rs.getString("id")+"')\">�鿴</a></div></td>");
				infoSB.append("</tr>");
				i++;

			}

			infoSB.append("</table>");

			close(rs,pstm,null,null);

			infoSB.append("</tr>");
			i++;
		}
		catch (SQLException sql)
		{
			sql.printStackTrace();
			throw new CustomException("�������ݿ����ӷ���Ĵ���...");
		}
		catch (Exception ce)
		{
			ce.printStackTrace();
			throw new CustomException("����δ֪�쳣����");
		}
		finally
		{

			//�ر����п�����Դ
			close(rs,pstm,null,con);
		}

		return infoSB.toString();

	}
	
}

