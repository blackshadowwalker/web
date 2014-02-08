package modules.base;

import java.io.*;
import java.util.*;

public final class baseDefine implements Serializable
{
    private Properties set = null;
    private String filename = null;

    public baseDefine() throws Exception
    {
        filename = "/base-define.properties";
        InputStream inputstream = getClass().getResourceAsStream(filename);
        set = new Properties();
        try
        {
            set.load(inputstream);
            inputstream.close();
            inputstream = null;
        }
        catch(Exception exception)
        {
            exception.printStackTrace();
            return;
        }
    }

    public baseDefine(String s) throws Exception
    {
        filename = s;
        InputStream inputstream = getClass().getResourceAsStream(filename);
        set = new Properties();
        try
        {
            set.load(inputstream);
            inputstream.close();
            inputstream = null;
        }
        catch(Exception exception)
        {
            exception.printStackTrace();
            return;
        }
    }

    public String getProperty(String type) throws Exception
    {
        if (set == null)
            return null;

        return set.getProperty(type);
    }

    public String getText(String type, String id) throws Exception
    {
        if (id == null)
            return null;

        if (set == null)
            return null;

	String s = null;

        s = set.getProperty(type+".count");
        if (s == null)
            return null;

        int cnt = Integer.parseInt(s);
        for (int i = 0; i < cnt; i ++)
        {
            s = set.getProperty(type+"."+i);
            if (s != null)
            {
                String[] tmp = s.split(",");
                

                if (tmp.length == 2 && id.equals(tmp[0].trim()))
                    return new String(tmp[1].trim().getBytes("ISO-8859-1"), "GB2312");
            }
        }
        return null;
    }

    //public void getList(String type, List listid, List listtext) throws Exception
    public void getList(String type, List listid, List listtext) throws Exception
    {
        if (listid == null || listtext == null)
            return;

        if (set == null)
            return;

        String s = null;

        s = set.getProperty(type+".count");
        if (s == null)
            return;

        int cnt = Integer.parseInt(s);
        for (int i = 0; i < cnt; i ++)
        {
             s = set.getProperty(type+"."+i);
             if (s != null)
             {
                String[] tmp = s.split(",");

                if (tmp.length == 2)
                {
                    listid.add(tmp[0].trim());
                   
                    listtext.add(new String(tmp[1].trim().getBytes("ISO-8859-1"), "GB2312"));
                }

             }
        }
    }

    public void destroy()
    { 
        if (set != null)
        {
            set.clear();
            set = null;
        }
    }
}
