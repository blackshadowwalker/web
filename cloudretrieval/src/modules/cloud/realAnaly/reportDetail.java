package modules.cloud.realAnaly;

import java.util.Date;

public class reportDetail 
{   
	private long  	id = 0 ;
	private String 	LPNumber ="";
	private String  LPNPicUrl = "";
	private long	frameIndex = 0;
	private long	FrameCtsUs = 0;
	private String  reprotUrl = "";
	private long	pts = 0;
	private Date	Time = new Date();
	private String 	Location = "";
	private String  reportUrl = "";
	private int		pos_x = 0;
	private int		pos_y = 0;
	private int 	width = 0;
	private int 	height = 0;
	private double	confidence = 0.0;
	
	public String getReprotUrl()
	{
		return reprotUrl;
	}
	public void setReprotUrl(String reprotUrl)
	{
		this.reprotUrl = reprotUrl;
	}
	public long getFrameCtsUs()
	{
		return FrameCtsUs;
	}
	public void setFrameCtsUs(long frameCtsUs)
	{
		FrameCtsUs = frameCtsUs;
	}
	public long getId()
	{
		return id;
	}
	public int getWidth()
	{
		return width;
	}
	public void setWidth(int width)
	{
		this.width = width;
	}
	public int getHeight()
	{
		return height;
	}
	public void setHeight(int height)
	{
		this.height = height;
	}
	public String getLPNPicUrl()
	{
		return LPNPicUrl;
	}
	public void setLPNPicUrl(String lPNPicUrl)
	{
		LPNPicUrl = lPNPicUrl;
	}
	public void setId(long id)
	{
		this.id = id;
	}
	public String getLPNumber()
	{
		return LPNumber;
	}
	public void setLPNumber(String lPNumber)
	{
		LPNumber = lPNumber;
	}
	public long getFrameIndex()
	{
		return frameIndex;
	}
	public void setFrameIndex(long frameIndex)
	{
		this.frameIndex = frameIndex;
	}
	public long getPts()
	{
		return pts;
	}
	public void setPts(long pts)
	{
		this.pts = pts;
	}
	public Date getTime()
	{
		return Time;
	}
	public void setTime(long time)
	{
		Time.setTime(time);
	}
	public String getLocation()
	{
		return Location;
	}
	public void setLocation(String location)
	{
		Location = location;
	}

	public String getReportUrl()
	{
		return reportUrl;
	}
	public void setReportUrl(String reportUrl)
	{
		this.reportUrl = reportUrl;
	}
	public int getPos_x()
	{
		return pos_x;
	}
	public void setPos_x(int posX)
	{
		pos_x = posX;
	}
	public int getPos_y()
	{
		return pos_y;
	}
	public void setPos_y(int posY)
	{
		pos_y = posY;
	}
	public double getConfidence()
	{
		return confidence;
	}
	public void setConfidence(double confidence)
	{
		this.confidence = confidence;
	}
	public reportDetail(){
	}
	public static void main(String[] args){
		
	}
}