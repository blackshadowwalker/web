package modules.log;

import org.apache.log4j.*;


public final class Log
{
	
    public static void debug(String s)
    {
        Logger logger = Logger.getLogger(Log.class);
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
        Logger logger = Logger.getLogger(Log.class);
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
        Logger logger = Logger.getLogger(Log.class);
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
    
}
