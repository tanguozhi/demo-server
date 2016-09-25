<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.demo.server.common.fileupload.FileUpload"%>
<%@ page import="com.demo.server.common.Config"%>

<%
	String fileName = FileUpload.getInstance().upload(request, response, Config.getHotelUploadFilePath());
	System.out.println("==ss========>>>"+fileName);
%>