package modules.base;

import java.util.*;
import java.text.*;
/**
 * @author JAVA
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class TimeBean {

	/**
	 * 
	 */
	
	public static String transTime(String s){
		
		StringBuffer time=new StringBuffer();
		
		time.append(s.substring(0,4)).append("年").append(s.substring(4,6)).append("月").append(s.substring(6,8)).append("日").append(s.substring(8,10)).append(":").append(s.substring(10,12)).append(":").append(s.substring(12,14));
		
		return time.toString();
	}
	
	public static String transTime2(String s){
		
		StringBuffer time=new StringBuffer();
		
		time.append(s.substring(0,4)).append("年").append(s.substring(4,6)).append("月").append(s.substring(6,8)).append("日").append(s.substring(8,10)).append("时").append(s.substring(10,12)).append("分").append(s.substring(12,14)).append("秒");
		
		return time.toString();
	}
	
	public static String transTime0(String s){
		
		StringBuffer time=new StringBuffer();
		
		time.append(s.substring(0,4)).append("年").append(s.substring(4,6)).append("月").append(s.substring(6,8)).append("日").append(s.substring(8,10)).append("时").append(s.substring(10,12)).append("分");
		
		return time.toString();
	}
	//
	public static String transTime3(String s){
		
		StringBuffer time=new StringBuffer();
		
		time.append(s.substring(0,4)).append("年").append(s.substring(4,6)).append("月").append(s.substring(6,8)).append("日").append(s.substring(8,10)).append("时");
		
		return time.toString();
	}
	
	public static String transTime4(String s){
		
		if(s==null || s.length()!=14){
			
			return s;
		}
		
		StringBuffer time=new StringBuffer();
		
		time.append(s.substring(0,4)).append("-").append(s.substring(4,6)).append("-").append(s.substring(6,8)).append(" ").append(s.substring(8,10)).append(":").append(s.substring(10,12)).append(":").append(s.substring(12,14));
		
		return time.toString();
	}
	
	public static String transTime6(String s){
		
		if(s==null || s.length()!=14){
			
			return s;
		}
		
		StringBuffer time=new StringBuffer();
		
		time.append(s.substring(0,4)).append("-").append(s.substring(4,6)).append("-").append(s.substring(6,8)).append(" ").append(s.substring(8,10)).append(":").append(s.substring(10,12)).append(":").append(s.substring(12,14)).append(".0");
		
		return time.toString();
	}
	
	public static String transTime7(String s){
		
		StringBuffer time=new StringBuffer();
		
		time.append(s.substring(0,4)).append("-").append(s.substring(4,6)).append("-").append(s.substring(6,8));
		
		return time.toString();
	}
	
	public static String transTime1(String s){
		
		StringBuffer time=new StringBuffer();
		
		time.append(s.substring(0,4)).append("/").append(s.substring(4,6)).append("/").append(s.substring(6,8));
		
		return time.toString();
	}

	public static String transTime5(String s){
		
		StringBuffer time=new StringBuffer();
		
		time.append(s.substring(0,4)).append("年").append(s.substring(4,6)).append("月").append(s.substring(6,8)).append("日");
		
		return time.toString();
	}
	
	public static String transStartTime(String s){
		
		if(s==null || s.length()<=0){
			
			return s;
		}
		//20060809
		//2006-08-09
		StringBuffer time=new StringBuffer();
		
		time.append(s.substring(0,4)).append(s.substring(5,7)).append(s.substring(8,10)).append("000000");
		
		return time.toString();
	}
	
	public static String transStopTime(String s){
		
		if(s==null || s.length()<=0){
			
			return s;
		}
		//20060809
		//2006-08-09
		StringBuffer time=new StringBuffer();
		
		time.append(s.substring(0,4)).append(s.substring(5,7)).append(s.substring(8,10)).append("235959");
		
		return time.toString();
	}
	
	public static String getCurrentDate()
    {
        String currentDate = "";
        Format formatter;
        formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date();
        currentDate = formatter.format(date);
        //MipDebug.printDebugMessage("Current Date:"+currentDate);

        return currentDate;
    }
	
	public static String getCurrentTime(){

        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        return sdf.format(new Date());
	}
	
	public static String getCurrentTime1(){

        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss.s");
        return sdf.format(new Date());
	}
	
	public static String getCurrentTime3(){

        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
        return sdf.format(new Date());
	}
	
	public static String getCurrentTime2(){

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒");
        return sdf.format(new Date());
	}
	
	public static String getCurrentWeek(Date d){
	
	       SimpleDateFormat sdf=new SimpleDateFormat("E");
	       return sdf.format(d);
	}
	
	public static String getTime(Date d){
		
	       SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
	       return sdf.format(d);
	}
	
	public static int getCurrentHour(Date d){
	
	
	       return d.getHours();
	}
	
	public static int getCurrentMinute(Date d){
	       return d.getMinutes();
	}
	
	public static String addHour(int hour){
	    
	    GregorianCalendar gc=new GregorianCalendar();
	    
	    gc.add(GregorianCalendar.HOUR,hour);
	    
	    return new SimpleDateFormat("yyyyMMddHHmmss").format(gc.getTime());
	}
	
	public static String addDate(int date){
	    
	    GregorianCalendar gc=new GregorianCalendar();
	    
	    gc.add(GregorianCalendar.DATE,date);
	    
	    return new SimpleDateFormat("yyyyMMddHHmmss").format(gc.getTime());
	}
	
	//计算日期间隔（单位：日）
	/*
	 *  时间格式：yyyyMMdd
	 */
	public static int segDate(String startDate,String endDate) throws Exception{
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
		
		int num=0;
		
		try{
			Date start=sdf.parse(startDate);
			Date end=sdf.parse(endDate);
			
			////////////System.out.println("segDate............");
			
			num=(int)((end.getTime()-start.getTime())/1000/60/60/24);
		}
		catch(Exception e){
			
			e.printStackTrace();
			
			throw new CustomException("转换日期时出现异常。");
		}
		
		return num;
	}
	


	//获得当前时间
	public static String getjqDate (){
		
 	    SimpleDateFormat sf = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
		
 	    Date dt = Calendar.getInstance().getTime();
 	    
 	    String time = sf.format(dt)+" 00:00:00.000";
 	    
 	    return time;
	}
	
	//获得当前时间
	public static String getDate (int year,int month,int day){
		
 	    SimpleDateFormat sf = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
		
 	    Calendar cd = new GregorianCalendar(year,month-1,day);
 	    
 	    String time = sf.format(cd.getTime())+" 00:00:00.000";
 	    
 	    return time;
	}
	
	//判断今天是否为周一
	public static boolean isWeekBegin (int year,int month, int day){
		
		
		Calendar cd = new GregorianCalendar(year,month-1,day);
		
		int res = cd.get(Calendar.DAY_OF_WEEK);

		if (res == 2){
			return true;
		}
		else
		{
			return false;
		}
	}
	
	//返回周末日期
	public static String getWeekEndDate (int year,int month,int day) {
		
		Calendar cd = new GregorianCalendar(year,month-1,day);
		
		Date nowDate = cd.getTime();
		
		long time = (nowDate.getTime()/1000)+60*60*24*7;
		
		nowDate.setTime(time*1000);
		
		String date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(nowDate)+" 00:00:00.000";
		
		return date;
	}
	
	//取得本月天数
	public static int monthEndDay (int year,int month) {
		
		
		int daysInTheMonth = 0;
		
       	if(month == 1||month == 3||month == 5||month == 7||month == 8||month == 10||month == 12)
       	{
			daysInTheMonth = 31;
			
		}
       	else if(month == 4||month == 6||month == 9||month == 11)
		{
			daysInTheMonth = 30;
		}
       	else
		{	
			if((year%4==0&&year%100!=0)||(year%400==0))
				daysInTheMonth = 29;
			else
				daysInTheMonth = 28;			
		}
       	
       	return daysInTheMonth;
	}
	
	//判断今天是否为月初
	public static boolean isMonthBegin (int year,int month,int day){
		
		Calendar cd = new GregorianCalendar(year,month-1,day);
		
		int res = cd.get(Calendar.DAY_OF_MONTH);
		
		if (res == 1)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	//取得月末日期
	public static String getEndDate(int status,int year,int month,int day1) {
		
		Calendar cd = new GregorianCalendar(year,month-1,day1);
		
		Date nowDate = cd.getTime();
		
		String day = new java.text.SimpleDateFormat("yyyyMMdd").format(nowDate);
		//System.out.println(day);
		
		long time = 0;
		
		if (status == 1)
		{
			time = (nowDate.getTime()/1000);
		}
		else if (status == 2)
		{
		    time = (nowDate.getTime()/1000)+60*60*24*6;
		}
		else if (status == 3)
		{
			if (day.substring(6,8).equals("21"))
			    time = (nowDate.getTime()/1000)+60*60*24*(monthEndDay(year,month)-21);
			else
				time = (nowDate.getTime()/1000)+60*60*24*9;
		}
		else if (status == 4)
		{
			time = (nowDate.getTime()/1000)+60*60*24*(monthEndDay(year,month)-1);
		}
		else if (status == 5)
		{
			//System.out.println(day.substring(4,8));
		    if (day.substring(4,8).equals("0101"))
		    {
		    	return day.substring(0,4)+"-"+"03-31 00:00:00.000";
		    }
		    else if (day.substring(4,8).equals("0401"))
		    {
		    	return day.substring(0,4)+"-"+"06-30 00:00:00.000";
		    }
		    else if (day.substring(4,8).equals("0701"))
		    {
		    	return day.substring(0,4)+"-"+"09-30 00:00:00.000";
		    }
		    else
		    {
		    	return (Integer.parseInt(day.substring(0,4)))+"-"+"12-31 00:00:00.000";
		    }
		}
		else if (status == 6)
		{
			if (getMonthDay(year,month,day1).equals("0701"))
			{
				return (Integer.parseInt(day.substring(0,4)))+"-"+"12-31 00:00:00.000";
			}
			else
			{
				return day.substring(0,4)+"-"+"06-30 00:00:00.000";
			}
		}
		else
		{
			return (Integer.parseInt(day.substring(0,4)))+"-"+"12-31 00:00:00.000";
		}
		
		nowDate.setTime(time*1000);
		
		String date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(nowDate)+" 00:00:00.000";
		//System.out.println(date);
		return date;
	}
	
	//判断今天是否为季初
	public static boolean isSeseanBegin (int year,int month,int day1){
		
		Calendar cd = new GregorianCalendar(year,month-1,day1);
		
		Date nowDate = cd.getTime();
		
		String day = new java.text.SimpleDateFormat("MMdd").format(nowDate);
		
		if (day.equals("0101")||day.equals("0401")||day.equals("0701")||day.equals("1001"))
		{
			return true;
		}
		else
		{
			return false;
		}
		
	}
	
	//判断今天是否为旬初
	public static boolean isTenDay (int year,int month,int day) {
		
		Calendar cd = new GregorianCalendar(year,month-1,day);
		
		int res = cd.get(Calendar.DAY_OF_MONTH);
		
		if (res == 1 || res == 11 || res == 21)
		{
			return true;
		}
		else
		{
			return false;
		}

	}
	
	//取得当天月日 例如二月十四 0214
    public static String getMonthDay (int year,int month,int day) {
    	
		Calendar cd = new GregorianCalendar(year,month-1,day);
		
		Date nowDate = cd.getTime();
    	
 	    SimpleDateFormat sf = new java.text.SimpleDateFormat("MMdd"); 
		
 	    String date = sf.format(nowDate);
 	    
 	    return date;
    }

	//判断半年初
	/**
	 * @return
	 */
	public static boolean isHalfOfYear (int year,int month,int day) {
		
 	    if (getMonthDay(year,month,day).equals("0701")||getMonthDay(year,month,day).equals("0101"))
 	    {
 	    	return true;
 	    }
 	    else
 	    {
 	    	return false;
 	    }
		
	}
	//判断今天是星期几
	public int dayOfWeek()
	{
		
		Date today = new Date();
		DateFormat d = DateFormat.getDateInstance(); 
		String string = d.format(today); 
		String[] Today = string.split("-");
	  
		int year = Integer.parseInt(Today[0]);
		int month = Integer.parseInt(Today[1]);
		int day = Integer.parseInt(Today[2]);
		Calendar cd = new GregorianCalendar(year,month-1,day);
		
		int res = cd.get(Calendar.DAY_OF_WEEK);
		int val = 0;
		if(res == 1)
		{
			val = res;
		}
		if (res == 2)
		{
			val = res;
		}
		if(res == res)
		{
			val = res;
		}
		if(res == 4)
		{
			val = res;
		}
		if(res == res)
		{
			val = res;
		}
		if(res == 6)
		{
			val = res;
		}
		if(res == 7)
		{
			val = res;
		}
		return val;
	}
	
	
	//判断是否为年初
	public static boolean isYearBegin (int year,int month,int day) {
		
		if (getMonthDay(year,month,day).equals("0101"))
		{
			return true;
		}
		else 
		{
			return false;
		}
		
	}

		public static String transStartTime2(String s){
			
			if(s==null || s.length()<=0){
				
				return s;
			}
			//20060809
			//2006-08-09
			StringBuffer time=new StringBuffer();
			
			time.append(s.substring(0,4)).append(s.substring(5,7)).append(s.substring(8,10));
			
			return time.toString();
		}
	
	public static void main (String[] args) {
		
		////System.out.println(getDate(2007,9,10));
		////System.out.println(isMonthEnd(2007,8,30));
		////System.out.println(monthEndDay());
		////System.out.println(isYearEnd(2007,5,1));*/
		////System.out.println(getWeekEndDate(2007,9,10));
		////System.out.println(getEndDate(7));*/
		//System.out.println(isWeekBegin(2007,7,2));
		//System.out.println(isTenDay(2007,7,1));
		//System.out.println(isMonthBegin(2007,7,1));
		//System.out.println(isSeseanBegin(2007,7,1));
		//System.out.println(isHalfOfYear(2007,7,1));
		//System.out.println(isYearBegin(2007,1,1));
		
		////System.out.println(monthEndDay(2007,9));
		System.out.println(getEndDate(3,2007,12,21));
		System.out.println(getEndDate(5,2007,10,1));
		
		//Calendar cd = new GregorianCalendar(2007,9-1,1);
		
		//Date nowDate = cd.getTime();
		
		//long numtime = (nowDate.getTime()/1000)+60*60*24;
					
		//nowDate.setTime(numtime*1000);
		
		//String date = new java.text.SimpleDateFormat("yyyyMMdd").format(nowDate);
		////System.out.println(date);
	}

	
}

