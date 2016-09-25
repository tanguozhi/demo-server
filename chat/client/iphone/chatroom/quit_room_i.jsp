<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.demo.server.xmpp.vo.MucRoomModel" %>

<%
	String roomName = (String)request.getAttribute("roomName");
	String bFlag = (String)request.getAttribute("bFlag");
	String json = "[{\"node\":\"quit_room\",\"data\":[{\"result\":\""+bFlag+"\",\"room\":\""+roomName+"\"}]}]";
%>

<%=json%>

