package modules.base;

import java.io.*;

public class baseForm implements Serializable {
    
	public String id;
	//用户登录唯一表示
	public String login_id="";
    // 机构代码(角色-机构)
    public String dept_code = "";
    //机构名称(角色-机构)
    public String dept_name = "";
    // 机构级别
    public String dept_level = null;
    // 用户姓名
    public String user_name = null;
    // 用户代码
    public String user_code = null;
    // 用户密码
    //public String user_passwd = null;
    //用户头像路径
    public String photo_path="";
    // 用户角色代码
    public String  role_code = null;
    //客户端IP
    public String clientIP="";
    public String role_name ="";
    public String xb = "";//性别
    public String csrq = "";//出生日期
    public String locationId = "" ; // 地域编号
    public String zbld = "";
    public String jrtq = "";
    public String srtx="";
    public String sessionID = "";//
    public String language = "ch_CN";//
    
    public String logo="image/logo.png"; //页面logo
    public String mainTitle="Teleframe"; //页面主题
    public String footerContent="建议使用IE浏览器，分辨率在1024*768以上"; //页脚

}
