package com.demo.server.common;


public class Config {
	
	public static String PROJ_NAME = "chat";
	
	//消息推送证书密码
	public static String IOS_PUSH_CERTIFICATE_PASSWORD = "1234";

	public static String getUploadPath() {
		String path = "/"+Thread.currentThread().getContextClassLoader().getResource("").getPath().substring(1);
		
		path = path.replaceAll("WEB-INF/classes/", "upload_file/");
		
		return path;
	}
	
	
	public static String getHotelUploadFilePath() {
		return "hotel";
	}
	
	public static String getIOSPushCertificate() {
		String path = "/"+Thread.currentThread().getContextClassLoader().getResource("").getPath().substring(1);
		
		path = path.replaceAll("WEB-INF/classes/", "");
		
		path = path+"IOS_PUSH.p12";
		
		return path;
	}
}
