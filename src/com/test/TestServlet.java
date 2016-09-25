/**
 * @author tanguozhi
 */
package com.test;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jboss.util.Base64;

import com.demo.server.common.Config;
import com.gz.tool.push.ios.IOSPush;
import com.gz.tool.server.security.AESCipher;
import com.gz.tool.server.security.HMac;
import com.gz.tool.server.tool.Utils;


public class TestServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	 @Override  
	 public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		 String text = request.getParameter("aa");
		 System.out.println("text================="+text);
		 
		 
		 byte[] testData = Utils.readFileByBytes(Utils.getWebRoot()+"test1.jsp");
		 byte[] serverKey = AESCipher.getInfoBySessionIdAndKey(((HttpServletRequest)request).getSession(true).getId(), AESCipher.SERVER_KEY);
		byte[] serverIV = AESCipher.getInfoBySessionIdAndKey(((HttpServletRequest)request).getSession(true).getId(), AESCipher.SERVER_IV);
		try {
			byte[] ecryptedInitData = AESCipher.encrypt(testData, serverKey, serverIV);
			
			byte[] hmacKey = HMac.getInfoBySessionIdAndKey(Utils.getSessionID(request), HMac.HMAC_SERVER_KEY);
			byte[] encrypt = HMac.encryptHMAC(ecryptedInitData, hmacKey, HMac.KEY_MAC_SHA1);
			response.addHeader("Content-Type", "application/octet-stream");
			response.setHeader("X-Emp-Signature", Base64.encodeBytes(encrypt));
			String ss = "11111111111111111111";
			System.out.println("length====="+ss.getBytes().length);
			testData = Utils.joinBytes(encrypt, ecryptedInitData);
			response.getOutputStream().write(Base64.encodeBytes(testData).getBytes());
		} catch (Exception e) {
			System.out.println("================="+serverIV);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
	 }
	
}
