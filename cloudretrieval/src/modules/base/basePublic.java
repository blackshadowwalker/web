package modules.base;

import org.apache.log4j.*;

public final class basePublic
{
    public static void debug(String s)
    {
        Logger logger = Logger.getLogger(basePublic.class);
        logger.debug(s);
    }
    public static void info(String s)
    {
        Logger InfoLogger = Logger.getLogger("InfoLogger");
        InfoLogger.info(s);
    }
    public static void error(String s)
    {
        Logger ErrorLogger = Logger.getLogger("ErrorLogger");
        ErrorLogger.error(s);
    }
    public static void debug(int s)
    {
        Logger logger = Logger.getLogger(basePublic.class);
        logger.debug(Integer.toString(s));
    }
    public static void info(int s)
    {
        Logger InfoLogger = Logger.getLogger("InfoLogger");
        InfoLogger.info(Integer.toString(s));
    }
    public static void error(int s)
    {
        Logger ErrorLogger = Logger.getLogger("ErrorLogger");
        ErrorLogger.error(Integer.toString(s));
    }
    public static void debug(Object s)
    {
        Logger logger = Logger.getLogger(basePublic.class);
        logger.debug(s);
    }
    public static void info(Object s)
    {
        Logger InfoLogger = Logger.getLogger("InfoLogger");
        InfoLogger.info(s);
    }
    public static void error(Object s)
    {
        Logger ErrorLogger = Logger.getLogger("ErrorLogger");
        ErrorLogger.error(s);
    }
    
    public static String in(String s) throws java.io.UnsupportedEncodingException {
        
    	if (s != null)
    	//return s.trim();
            return new String(s.trim().getBytes("GBK"), "GBK");
        	//return new String(s.trim().getBytes("GBK"), "ISO-8859-1");
        else
        	return "";
            //return new String("");
       //*/
    	
    	//return s;
    }

    public static String inUTF8(String s) throws java.io.UnsupportedEncodingException {
        if (s != null)
    	    return new String(s.trim().getBytes("UTF-8"), "ISO-8859-1");
        else
            return new String("");
    }
    
    public static String out(String s) throws java.io.UnsupportedEncodingException {
        
    	
    	if (s != null)
    	    return s.trim();
    		//return new String(s.trim().getBytes("GBK"),"GBK");
        	//return new String(s.trim().getBytes("ISO-8859-1"),"GBK");
        else
        	return "";
            //return new String("");
       //*/
    	//return s;
    }
    
    

	public static String inGBK(String s) throws java.io.UnsupportedEncodingException {
        if (s != null)
            return new String(s.trim().getBytes("GBK"), "GBK");
        else
            return new String("");
    }

    
    public static String outGBK(String s) throws java.io.UnsupportedEncodingException {
        if (s != null)
    	    return new String(s.trim().getBytes("ISO-8859-1"),"GBK");
        else
            return new String("");
    }

    public static String toDate(String s) throws Exception {
        if (s == null)
            return new String("0000-00-00 00:00:00.0");

        s = s.trim();

        if (s.length() == 4)
            return new String(s+"-00-00 00:00:00.0");
        else if (s.length() <= 7)
            return new String(s+"-00 00:00:00.0");
        else if (s.length() <= 10)
            return new String(s+" 00:00:00.0");
        else if (s.length() <= 13)
            return new String(s+":00:00.0");
        else if (s.length() <= 16)
            return new String(s+":00.0");
        else if (s.length() <= 19)
            return new String(s+".0");

        return s;
    }
}
