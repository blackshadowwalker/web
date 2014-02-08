package modules.nav;

import java.sql.*;
import java.io.UnsupportedEncodingException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import modules.base.*;


public class navBean extends ResourceClose{

	public navBean(){

	}
	public String getMenu(String ruler_level,String ruler_code,ServletContext ctx,HttpSession session) throws CustomException,Exception 
	{
		//�жϻ���ʵ���Ƿ�Ϊ��
		if (ctx == null){
			throw new CustomException("ServletContext Ϊ�գ�����");
		}
		//�жϻỰʵ���Ƿ�Ϊ��
		if(session==null){
			throw new CustomException("HttpSession Ϊ�գ�����");
		}
		//�ж��û��Ƿ��¼
		baseForm bform=(baseForm)session.getAttribute("baseuser");
		if(bform==null){
			throw new CustomException("����ʧЧ�������µ�¼ϵͳ��");
		}
		//�����ѯ�����Ϣ
		StringBuffer infoSB=null;
		//����SQL���
		Connection con=null;//�������ݿ�����
		PreparedStatement pstm=null;//����Ԥ�������
		ResultSet rs=null;//�����ѯ�Ľ����
		
		PreparedStatement pstm2=null;//����Ԥ�������
		ResultSet rs2=null;//�����ѯ�Ľ����

		String sql="";
		String role_code=null;//��ɫ����
		try{
			con= ((DataSource)ctx.getAttribute("basedb")).getConnection();
			//�ж����ݿ������Ƿ����ӳɹ�
			if (con == null){
				throw new CustomException("���ݿ�����ConnectionΪ�գ�����ʧ�ܡ�");
			}
			role_code=bform.role_code;
			String dept_code = bform.dept_code;
			String role_codes = baseBean.getAllRole(role_code);//���ɫ����֮��
			infoSB=new StringBuffer();
		
			if (role_code == null)
			{
				//role_code==0 for test
				sql = "select distinct a.id,a.ruler_code,(c.ruler_name),ruler_desc,ruler_page,sffq,target,xuhao  from t_s_ruler a,t_s_rulerValue c ";
				if (ruler_level.equals("0"))
				{
					sql += " where ruler_level=?  and a.ruler_code=c.ruler_code and c.language=? and ruler_echo=0 and a.status=1 order by a.xuhao ";
					pstm = con.prepareStatement(sql);
					pstm.setObject(1,Integer.valueOf(ruler_level));
					pstm.setObject(2, bform.language);
				}
				else
				{	
					sql += " where ruler_level=? and  a.ruler_code=c.ruler_code and c.language=? and ruler_manager=? and ruler_echo=0 and status=1 order by xuhao ";
					pstm = con.prepareStatement(sql);
					pstm.setObject(1, Integer.valueOf(ruler_level));
					pstm.setObject(2, bform.language);
					pstm.setObject(3, ruler_code);
				}
			}
			else
			{
				sql = "select distinct a.id, a.ruler_code as ruler_code, (c.ruler_name) as ruler_name,a.ruler_desc as ruler_desc," +
					"a.ruler_page as ruler_page,a.sffq as sffq,a.target as target,a.xuhao as xuhao " +
					"from t_s_ruler a,t_s_rolevalue b, t_s_rulerValue c ";
				
				if (ruler_level.equals("0"))
				{
					//֧��һ���ʺŶ��ɫ��ѯ
					sql += "where b.role_code in ("+role_codes+") " +
							"and a.ruler_level=? and  a.ruler_code=c.ruler_code and c.language=? and a.ruler_code=b.ruler_code and a.ruler_echo=0 and a.status=1 and b.status=1 order by a.xuhao";
					pstm = con.prepareStatement(sql);
					pstm.setObject(1, Integer.valueOf(ruler_level));
					pstm.setObject(2, bform.language);
				}
				else
				{
					sql += " where b.role_code in ("+role_codes+") and a.ruler_level=? and  a.ruler_code=c.ruler_code and c.language=? and a.ruler_manager=? and a.ruler_code=b.ruler_code and a.ruler_echo=0 and a.status=1 and b.status=1 order by a.id";
					pstm = con.prepareStatement(sql);
					pstm.setObject(1, Integer.valueOf(ruler_level));
					pstm.setObject(2, bform.language);
					pstm.setObject(3, ruler_code);
				}
			}
			System.out.println(sql);
			//��ò�ѯ�Ľ����
			rs = pstm.executeQuery();
			while (rs!=null && rs.next())
			{
				//��ò���װ����
				infoSB.append(rs.getString("ruler_code")).append(",");
				infoSB.append(basePublic.out(rs.getString("ruler_name"))).append(",");
				infoSB.append(basePublic.out(rs.getString("ruler_desc"))).append(",");
				infoSB.append(basePublic.out(rs.getString("ruler_page"))).append(",");
				infoSB.append(rs.getInt("sffq")).append(",");
				infoSB.append(rs.getString("target")).append(",");
				infoSB.append(dept_code).append(";");
			
			}
			System.out.println(infoSB.toString());
		}
		catch(SQLException e){

			e.printStackTrace();

			throw new CustomException("���ִ���"+e.getMessage());
		}
		catch(UnsupportedEncodingException ue){

			ue.printStackTrace();

			throw new CustomException("���ִ���"+ue.getMessage());
		}
		catch(Exception ce){

			ce.printStackTrace();

			throw new CustomException("���ִ���"+ce.getMessage());
		}
		finally{
			//�ر����п�����Դ
			close(rs,pstm,null,null);
			
			close(rs2,pstm2,null,con);
		}
		return infoSB.toString();
	}

}


