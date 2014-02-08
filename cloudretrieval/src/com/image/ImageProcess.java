package com.image;

public class ImageProcess {
	
	public ImageProcess(){
		System.out.println("new ImageProcess()");
	}
	
	public native String FogRemove(String srcFile, String destFile);//ͼ��ȥ��
	public native String LowLight(String srcFile, String destFile);//���ն�
	public native String TooBright(String srcFile, String destFile);//����
	public native String Deblur(String srcFile, String destFile);//ȥģ��
	public native String Retinex(String srcFile, String destFile);//�ۺ��Զ����� 

	public native String HistEqualize(String srcFile, String destFile);//ֱ��ͼ���⻯
	public native String MedianFilter(String srcFile, String destFile);//��ֵ�˲�
	public native String Stablization(String srcFile, String destFile);//�ȶ��� 
	public native String HazeRemove(String srcFile, String destFile);//ͼ��ȥ����
	
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
