/**
 * @author tanguozhi
 */
package com.demo.server.push.web.action;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.server.common.Config;
import com.gz.tool.push.ios.IOSPush;


public class PushServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public static String SUBMIT_FLAG = "submitFlag";
	private static String PUSH_DEVELOPER = "P_00001";
	private static String PUSH_DIS = "P_00002";
	
	public static String REQUEST_URI = "";
	
	/**
	 * "/push?submitFlag=P_00001&text=13123&token=d3afa9662122c11b202bc26b19f9c0fcde87bfd606cd72cf32cad0c4e8065ccc"
	 */
	 @Override  
	 public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		 String text = request.getParameter("text");
		 String token = request.getParameter("token");
		 
		 String submitFlag = request.getParameter(SUBMIT_FLAG);
		 System.out.println("submitFlag>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+submitFlag);
		 System.out.println("token>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+token);
		 if(PUSH_DEVELOPER.equals(submitFlag)) {	//测试APNS
			 System.out.println("APNS--developer>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+text);
			 push(text, token, false);
		 } else if (PUSH_DIS.equals(submitFlag)) {	//生产APNS
			 System.out.println("APNS--dis>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+text);
			 push(text, token, true);
		 }
	 }
	
	 private void push(String text, String token, boolean isDis) {
			IOSPush send = new IOSPush();
			List<String> tokens = new ArrayList<String>();
			tokens.add(token);
			boolean sendCount = false;
			if (tokens.size()>0) {
				sendCount = true;
			}
			send.sendpush(tokens, Config.getIOSPushCertificate(), Config.IOS_PUSH_CERTIFICATE_PASSWORD, text, 5, sendCount, isDis);
		}
}
