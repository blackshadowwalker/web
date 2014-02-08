package modules.cloud.baseInformation;

import java.io.FileReader;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Properties;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import modules.base.CustomException;
import modules.base.LogBean;
import modules.base.PageMan;
import modules.base.PageManFactory;
import modules.base.ResourceClose;
import modules.base.baseForm;
import modules.base.basePublic;

public class baseInformationBean extends ResourceClose
{
		private DataSource dataSource;
		
		public baseInformationBean()
		{
	
		}
		public baseInformationBean(DataSource dataSource)
		{
			this.dataSource = dataSource;
		}
	    /*
	    * 基础信息数据删除
	    */        
	   public int deleteTSBaseInfo(String id,ServletContext sc,HttpSession session)
	   throws CustomException,Exception
	   {
		  
	       // 判断环境实例是否为空
	       if (sc == null)
	       {
	           throw new CustomException("ServletContext 为空，返回");
	       }

	       //判断会话实例是否为空
	       if (session==null)
	       {
	           throw new CustomException("HttpSession 为空，返回");
	       }
	       ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

	       //判断用户是否登录
	       baseForm bform=(baseForm)session.getAttribute("baseuser");
	       
	       if (bform==null)
	       {
	    	   throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
	       }
	       
	       //	     保存SQL语句
	       StringBuffer sqlSB = null;
	       
	       Connection con=null;//保存数据库连接
	       PreparedStatement pstm=null;//保存预处理语句

	       try
	       {
	           con=((DataSource)sc.getAttribute("basedb")).getConnection();
	           
	           if (con==null)
	           {
	        	   throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
	           }

	           int num=0;
	           sqlSB=new StringBuffer();
	           sqlSB.append("UPDATE t_m_baseinfo SET ").append("status=0").append(" WHERE id=").append(Integer.parseInt(id));          
	           pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
	           num=pstm.executeUpdate();
	           
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_czlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "删除基础信息成功！",baseInformationBean.class.getName());
	           return num;
	          
	       }
	       catch (SQLException sql)
	       {
	           sql.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.deleteTSEventType出现数据库错误，操作为：" 
						+"删除基础信息失败" + sql.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
	       }
	       catch (UnsupportedEncodingException ue)
	       {
	           ue.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.deleteTSEventType出现转化字符集错误，操作为：" 
						+"删除基础信息失败" + ue.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
	       }
	       catch (Exception ce)
	       {
	           ce.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.deleteTSEventType出现错误，操作为：" 
						+"删除基础信息失败" + ce.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
	       }
	       finally
	       {
	           //关闭所有可用资源
	           close(null,pstm,null,con);
	       }
	   }
	   /*
	    * 根据条件语句查询代码信息AJAX
	    */
	   public String queryTSBaseInfo(int perPage,int curPage,String s,ServletContext sc,HttpSession session)
	       throws CustomException,Exception
	   { 
	       //判断环境实例是否为空
	       if (sc == null)
	       {
	           throw new CustomException("ServletContext 为空，返回");
	       }

	       //判断会话实例是否为空
	       if (session==null)
	       {
	           throw new CustomException("HttpSession 为空，返回");
	       }
	       
	       ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
	       //判断用户是否登录
	       baseForm bform=(baseForm)session.getAttribute("baseuser");
	       
	       if (bform==null)
	       {
	    	   throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统

	       }
	       
	       //保存查询结果信息
	       StringBuffer infoSB=null;
	       //保存SQL语句
	       StringBuffer sqlSB = null;
	       StringBuffer countSB = null;
	       
	       Connection con=null;//保存数据库连接
	       //PreparedStatement pstm=null;//保存预处理语句
	       ResultSet rs=null;//保存查询的结果集
	       
	       PageMan pm=PageManFactory.getInstance();
	       
	       try
	       {
	           con=((DataSource)sc.getAttribute("basedb")).getConnection();
	           
	           if (con==null)
	           {
	        	   throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败

	           }
	           infoSB=new StringBuffer();
	           sqlSB=new StringBuffer();
	           countSB=new StringBuffer();
	           
	           sqlSB.append("select * from t_m_baseinfo ");
	           countSB.append("select count(*) from t_m_baseinfo");
	           
	           
	           if (s != null && s.length()>0)
	           {
	               sqlSB.append(s);
	               countSB.append(s);
	           }
	           
	           sqlSB.append(" and status=1 order by id desc");
	           countSB.append(" and status=1 order by id desc");
	           
	           
	           rs=pm.list(con, perPage, curPage, countSB.toString(), sqlSB.toString());
	           if(rs==null){
	           	
	           	return "no";
	           }
	          
	           ResultSetMetaData rsmd = rs.getMetaData();
	           int numberOfColumns = rsmd.getColumnCount();
	           
	           while (rs!=null && rs.next())
	           {
	               for (int i = 1; i <= numberOfColumns; i ++)
	               {
	                   infoSB.append(basePublic.out(rs.getString(i))).append("</C>");
	                   
	               }
	        //       System.out.println(basePublic.out(rs.getString(2)));
	               infoSB.append("</R>");
	           }
	           
	           infoSB.append("|");
	           
	           infoSB.append(pm.getTotalPage()).append("</C>").append(pm.getTotalRow()).append("</C>").append(pm.getCurPage()).append("</C>");
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_czlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "根据条件查询基础信息成功！",baseInformationBean.class.getName());
	       }
	       catch (SQLException sql)
	       {
	           sql.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.queryTSEventTypee出现数据库错误，操作为：" 
						+"根据条件查询基础信息失败" + sql.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
	       }
	       catch (UnsupportedEncodingException ue)
	       {
	           ue.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.queryTSEventTypee出现错误，操作为：" 
						+"根据条件查询基础信息失败" + ue.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
	       }
	       catch (Exception ce)
	       {
	           ce.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.queryTSEventTypee出现错误，操作为：" 
						+"根据条件查询基础信息失败" + ce.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
	       }
	       finally
	       {
	       	pm.close(true);
	       	
	       	close(rs,null,null,con);
	           //关闭所有可用资源
	          // close(rs,pstm,null,con);
	       }

	       return infoSB.toString();
	   }
	   /*
	    * 根据ID值查询详细的代码信息AJAX
	    */
	   public String detailTSBaseInfo(long id,ServletContext sc,HttpSession session)
	       throws CustomException,Exception
	   {
		  
	       //判断环境实例是否为空
	       if (sc == null)
	       {
	           throw new CustomException("ServletContext 为空，返回");
	       }

	       //判断会话实例是否为空
	       if (session==null)
	       {
	           throw new CustomException("HttpSession 为空，返回");
	       }
	       ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
	       //判断用户是否登录
	       baseForm bform=(baseForm)session.getAttribute("baseuser");
	       
	       if (bform==null)
	       {
	    	   throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
	       }
	       
	       //保存查询结果信息
	       StringBuffer infoSB=null;
	       //保存SQL语句
	       
	       Connection con=null;//保存数据库连接
	       PreparedStatement pstm=null;//保存预处理语句
	       ResultSet rs=null;//保存查询的结果集
	       
	       try
	       {
	           con=((DataSource)sc.getAttribute("basedb")).getConnection();
	           if (con==null)
	           {
	        	   throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
	           }
	           
	           infoSB=new StringBuffer();
	           
	           pstm=con.prepareStatement("select defaultAuthName, defaultAuthPwd,defaultSoapUrl,defaultTaskpriority,uploadurl,uploadflash,uploadServer,uploadroot,defaultuploadpath,work from t_m_baseinfo where id=?");
	           pstm.setLong(1, id);
	           
	           rs=pstm.executeQuery();
	           if (rs!=null && rs.next())
	           {
	               infoSB.append(id).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultAuthName"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultAuthPwd"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultSoapUrl"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultTaskpriority"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("uploadurl"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("uploadflash"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("uploadServer"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("uploadroot"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultuploadpath"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("work"))).append("</C></R>");
	               
	           }
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_czlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "查看基础信息详细信息成功！",baseInformationBean.class.getName());
	       }
	       catch (SQLException sql)
	       {
	           sql.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.detailTSEventType出现数据库错误，操作为：" 
						+"查看基础信息详细信息失败" + sql.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException((rb.getString("exp.databaseConnectError")));//出现数据库连接方面的错误...
	       }
	       catch (UnsupportedEncodingException ue)
	       {
	           ue.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.detailTSEventType出现转化字符集错误，操作为：" 
						+"查看事件类型详细信息失败" + ue.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException((rb.getString("exp.convertCharacterSetWrong")));//转化字符集时出现错误
	       }
	       catch (Exception ce)
	       {
	           ce.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.detailTSEventType出现错误，操作为：" 
						+"查看基础信息详细信息失败" + ce.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException((rb.getString("exp.unknownError")));//出现未知异常错误
	       }
	       finally
	       {
	           //关闭所有可用资源
	           close(rs,pstm,null,con);
	       }

	       return infoSB.toString();
	   }
	   /*
	    * 修改前根据ID值查询详细的代码信息AJAX
	    */
	   public String beforeUpdateTSBaseInfo(long id,ServletContext sc,HttpSession session)
	       throws CustomException,Exception
	   {
	       
	       //判断环境实例是否为空
	       if (sc == null)
	       {
	           throw new CustomException("ServletContext 为空，返回");
	       }

	       //判断会话实例是否为空
	       if (session==null)
	       {
	           throw new CustomException("HttpSession 为空，返回");
	       }
	       ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
	       //判断用户是否登录
	       baseForm bform=(baseForm)session.getAttribute("baseuser");
	       
	       if (bform==null)
	       {
	    	   throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
	       }
	       
	       //保存查询结果信息
	       StringBuffer infoSB=null;
	       
	       Connection con=null;//保存数据库连接
	       PreparedStatement pstm=null;//保存预处理语句
	       ResultSet rs=null;//保存查询的结果集
	       DataSource ds=null;
	       try
	       {
	       	ds=(DataSource)sc.getAttribute("basedb");
	           con=ds.getConnection();
	           if (con==null)
	           {
	        	   throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
	           }
	           
	           infoSB=new StringBuffer();
	           
	           pstm=con.prepareStatement("select defaultAuthName, defaultAuthPwd,defaultSoapUrl,defaultTaskpriority,uploadurl,uploadflash,uploadServer,uploadroot,defaultuploadpath,work from t_m_baseinfo where id=?");
	         
	           pstm.setLong(1, id);
	           
	           rs=pstm.executeQuery();
	           if (rs!=null && rs.next())
	           {
	        	   infoSB.append(id).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultAuthName"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultAuthPwd"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultSoapUrl"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultTaskpriority"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("uploadurl"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("uploadflash"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("uploadServer"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("uploadroot"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("defaultuploadpath"))).append("</C>");
	               infoSB.append(basePublic.out(rs.getString("work"))).append("</C></R>");
	           }
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_czlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "修改前查询基础信息成功！",baseInformationBean.class.getName());
	       }
	       catch (SQLException sql)
	       {
	           sql.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.beforeUpdateTSEventType出现数据库错误，操作为：" 
						+"修改前查询基础信息失败" + sql.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
	       }
	       catch (UnsupportedEncodingException ue)
	       {
	           ue.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.beforeUpdateTSEventType出现转化字符集错误，操作为：" 
						+"修改前查询基础信息失败" + ue.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//转化字符集时出现错误
	       }
	       catch (Exception ce)
	       {
	           ce.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.beforeUpdateTSEventType出现错误，操作为：" 
						+"修改前查询基础信息失败" + ce.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
	       }
	       finally
	       {
	           //关闭所有可用资源
	           close(rs,pstm,null,con);
	       }

	       return infoSB.toString();
	   }
	   /*
	    * 修改代码信息AJAX
	    */
	   public int updateTSBaseInfo(String id,String values,
	       ServletContext sc,HttpSession session) throws CustomException,Exception
	   {
		   
	       //判断环境实例是否为空
	       if (sc == null)
	       {
	           throw new CustomException("ServletContext 为空，返回");
	       }

	       //判断会话实例是否为空
	       if (session==null)
	       {
	           throw new CustomException("HttpSession 为空，返回");
	       }
	       ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");
	       //判断用户是否登录
	       baseForm bform=(baseForm)session.getAttribute("baseuser");
	       if (bform==null)
	       {
	    	   throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
	       }


	       //保存SQL语句
	       StringBuffer sqlSB = null;
	       Connection con=null;//保存数据库连接
	       PreparedStatement pstm=null;//保存预处理语句
	       DataSource ds=null;
	       try
	       {
	       	ds=(DataSource)sc.getAttribute("basedb");
	           con=ds.getConnection();
	           if (con==null)
	           {
	        	   throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
	           }

	           sqlSB=new StringBuffer();
	           
	           sqlSB.append("update t_m_baseinfo set ").append(values).append(" where id=").append(id);
	           pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));

	           int num=pstm.executeUpdate();

	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_czlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "修改基础信息成功！",baseInformationBean.class.getName());
	          
	          return num;
	       }
	       catch (SQLException sql)
	       {
	           sql.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.updateTSEventType出现数据库错误，操作为：" 
						+"修改基础信息失败" + sql.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
	       }
	       catch (UnsupportedEncodingException ue)
	       {
	           ue.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.updateTSEventType出现转化字符集错误，操作为：" 
						+"修改基础信息失败" + ue.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//转化字符集时出现错误
	       }
	       catch (Exception ce)
	       {
	           ce.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.updateTSEventType出现错误，操作为：" 
						+"修改基础信息失败" + ce.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
	       }
	       finally
	       {
	           //关闭所有可用资源
	           close(null,pstm,null,con);
	       }
	   }
	   /*
	    * 添加代码信息AJAX
	    */
	   public int addTSBaseInfo(String labels,String values,ServletContext sc,HttpSession session)
	       throws CustomException,Exception
	   {
	       //判断环境实例是否为空
	       if (sc == null)
	       {
	           throw new CustomException("ServletContext 为空，返回");
	       }

	       //判断会话实例是否为空
	       if (session==null)
	       {
	           throw new CustomException("HttpSession 为空，返回");
	       }
	       ResourceBundle rb = (ResourceBundle)session.getAttribute("resourceBundle");

	       //判断用户是否登录
	       
	       baseForm bform=(baseForm)session.getAttribute("baseuser");
	       
	       if (bform==null)
	       {
	    	   throw new CustomException((rb.getString("exp.connectionFails")));//连接失效，请重新登录系统
	       }

	       //保存SQL语句
	       StringBuffer sqlSB = null;
	       
	       Connection con=null;//保存数据库连接
	       PreparedStatement pstm=null;//保存预处理语句
	       DataSource ds=null;
	       try
	       {
	       	ds=(DataSource)sc.getAttribute("basedb");
	           con=ds.getConnection();
	           if (con==null)
	           {
	        	   throw new CustomException((rb.getString("exp.databaseConnectFaild")));//数据库连接Connection为空，连接失败
	           }

	           sqlSB=new StringBuffer();
	           
	           sqlSB.append("insert into t_m_baseinfo(").append(labels).append(") values (").append(values).append(")");
	           
	           pstm=con.prepareStatement(basePublic.in(sqlSB.toString()));
	           
	           int num=pstm.executeUpdate();
	           
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_czlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "添加基础信息成功！",baseInformationBean.class.getName());
	           return num;
	       }
	       catch (SQLException sql)
	       {
	           sql.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.addTSEventType出现数据库错误，操作为：" 
						+"添加基础信息失败" + sql.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException(rb.getString("exp.databaseConnectError")+"("+sql.getMessage()+")");//出现数据库连接方面的错误
	       }
	       catch (UnsupportedEncodingException ue)
	       {
	           ue.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.addTSEventType出现转化字符集错误，操作为：" 
						+"添加基础信息失败" + ue.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException(rb.getString("exp.convertCharacterSetWrong")+"("+ue.getMessage()+")");//转化字符集时出现错误
	       }
	       catch (Exception ce)
	       {
	           ce.printStackTrace();
	           LogBean.wirte_log(((DataSource) sc.getAttribute("basedb"))
						.getConnection(), "t_s_cwlog", bform.user_code + "</C>"
						+ bform.user_name + "</C>" + bform.clientIP + "</C>"
						+ "eventTypeBean.addTSEventType出现错误，操作为：" 
						+"添加基础信息失败" + ce.getMessage(),baseInformationBean.class.getName());
	           throw new CustomException(rb.getString("exp.unknownError")+"("+ce.getMessage()+")");//出现未知异常错误
	       }
	       finally
	       {
	           //关闭所有可用资源
	           close(null,pstm,null,con);
	       }
	   }
}
