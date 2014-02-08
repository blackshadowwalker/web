package com.image;

public class ImageProcess {
	
	public ImageProcess(){
		System.out.println("new ImageProcess()");
	}
	
	public native String FogRemove(String srcFile, String destFile);//图像去雾
	public native String LowLight(String srcFile, String destFile);//低照度
	public native String TooBright(String srcFile, String destFile);//过亮
	public native String Deblur(String srcFile, String destFile);//去模糊
	public native String Retinex(String srcFile, String destFile);//综合自动处理 

	public native String HistEqualize(String srcFile, String destFile);//直方图均衡化
	public native String MedianFilter(String srcFile, String destFile);//中值滤波
	public native String Stablization(String srcFile, String destFile);//稳定化 
	public native String HazeRemove(String srcFile, String destFile);//图像去阴霾
	
	static {
		System.out.println(System.getProperty("java.library.path")); 
		System.out.println("  ");
		System.loadLibrary("ImageProcess");
	}
	public static void main(String[] args){
		String fileDir = ImageProcess.class.getClassLoader().getResource("./").getPath();
		fileDir = fileDir.substring(1);
		String classname = ImageProcess.class.getName();
		classname = classname.replaceAll("\\.", "/");
		System.out.println(fileDir+classname);
		System.out.println(System.getProperty("java.library.path"));
		
		if(args.length>=2){
			ImageProcess im = new ImageProcess();
			im.FogRemove(args[0], args[1]);
			System.out.println("Finish");
		}
		
	}
}
