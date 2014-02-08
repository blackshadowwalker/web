package modules.base;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class Configuration implements ServletContextListener
{
	private static Properties propertie;
	private static FileInputStream inputFile;
	private FileOutputStream outputFile;
	private static String FilePath = "config/jdbc.properties";
	
	public void contextInitialized(ServletContextEvent arg0)
	{
		ServletContext sc = arg0.getServletContext();
		String basePathExt = sc.getInitParameter("basePathExt");
		String basePathExtName = sc.getInitParameter("basePathExtName");
		String configLocation = sc.getInitParameter("configLocation");
		this.FilePath = basePathExt+"/"+basePathExtName+"/"+configLocation;
		this.init(this.FilePath);
	}
	
	public static void main(String[] args){
		Configuration rc = new Configuration("E:/WebServer/Tomcat 6.0/webapps/cloudretrievalExt/config/jdbc.properties");
		System.out.println(rc.getValue("db.ip"));
	}
	
	public Configuration()
	{
		propertie = new Properties();
	}
	public void init(String filePath){
		try{
			inputFile = new FileInputStream(filePath);
			propertie.load(inputFile);
			inputFile.close();
			System.out.println("Loaded ["+this.FilePath+"].");
		} catch (FileNotFoundException ex) {
			System.out.println("��ȡ�����ļ���>ʧ�ܣ�- ԭ���ļ�·����������ļ�������");
			ex.printStackTrace();
		} catch (IOException ex) {
			System.out.println("װ���ļ���>ʧ��!");
			ex.printStackTrace();
		}
	}
	public Configuration(String filePath){
		propertie = new Properties();
		init(filePath);
	}
	public static String getValue(String key){
		if(propertie.containsKey(key)){
			String value = propertie.getProperty(key);//�õ�ĳһ���Ե�ֵ
			return value;
		}
		return "";
	}
	public static String getValue(String fileName, String key){
		try {
			String value = "";
			inputFile = new FileInputStream(fileName);
			propertie.load(inputFile);
			inputFile.close();
			if(propertie.containsKey(key)){
				value = propertie.getProperty(key);
				return value;
			}else
				return value;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return "";
		} catch (IOException e) {
			e.printStackTrace();
			return "";
		} catch (Exception ex) {
			ex.printStackTrace();
			return "";
		}
	}
	public static void setValue(String key, String value)
	{
		propertie.setProperty(key, value);
	}//end setValue(��)
	/** 
	 * ���properties�ļ������е�key����ֵ
	 */
	public static void clear()
	{
		propertie.clear();
	}//end clear();

	public void contextDestroyed(ServletContextEvent arg0)
	{
		// TODO Auto-generated method stub
		
	}

	
}









