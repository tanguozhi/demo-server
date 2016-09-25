<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.demo.server.common.fileupload.FileUpload"%>
<%@ page import="com.demo.server.common.Config"%>

<%
	//解析参数
	HashMap<String, String> map = new HashMap<String, String>();
	
	String file_upload = request.getParameter("file_upload");
	String[] args = file_upload.split("===");
	for(int i=0; i<args.length; i++) {
		String temp = args[i];
		String[] keyAndValue = temp.split("=");
		
		String key = keyAndValue[0];
		String value = "";
		if(keyAndValue.length>1) {
			value = keyAndValue[1];
		}
		map.put(key, value);
		
		System.out.println("key, value====>>"+key+","+value);
	}
	
	String url = "";
	
	//逻辑处理
	String submitFlag = map.get("submitFlag");
	if("hotel".equals(submitFlag)) {
		String uploadFilePath = Config.getHotelUploadFilePath();
		String fullFilePath = FileUpload.getInstance().upload(request, response, uploadFilePath);
		
		if("".equals(fullFilePath)) {
			System.out.println("upload faile========>>>>");
			return;
		}
		
		url = "/demo/hotel.action?model.submitFlag=EBL000009";
		url += "&hm.uuid="+map.get("uuid");
		
		String code = map.get("code");
		if(null!=code && "cover".equals(code))
			url += "&hm.cover="+fullFilePath.split("/")[fullFilePath.split("/").length-1];
		else
			url += "&hm.otherpic="+fullFilePath.split("/")[fullFilePath.split("/").length-1];
		
	} 
	System.out.println("saaaa=====>>>>"+url);
	try{
		response.setContentType("text/html; charset=utf-8");
		response.sendRedirect(url);
	} catch(Exception err) {
		err.printStackTrace();
	}
%>