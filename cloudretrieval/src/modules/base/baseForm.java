package modules.base;

import java.io.*;

public class baseForm implements Serializable {
    
	public String id;
	//�û���¼Ψһ��ʾ
	public String login_id="";
    // ��������(��ɫ-����)
    public String dept_code = "";
    //��������(��ɫ-����)
    public String dept_name = "";
    // ��������
    public String dept_level = null;
    // �û�����
    public String user_name = null;
    // �û�����
    public String user_code = null;
    // �û�����
    //public String user_passwd = null;
    //�û�ͷ��·��
    public String photo_path="";
    // �û���ɫ����
    public String  role_code = null;
    //�ͻ���IP
    public String clientIP="";
    public String role_name ="";
    public String xb = "";//�Ա�
    public String csrq = "";//��������
    public String locationId = "" ; // ������
    public String zbld = "";
    public String jrtq = "";
    public String srtx="";
    public String sessionID = "";//
    public String language = "ch_CN";//
    
    public String logo="image/logo.png"; //ҳ��logo
    public String mainTitle="Teleframe"; //ҳ������
    public String footerContent="����ʹ��IE��������ֱ�����1024*768����"; //ҳ��

}
