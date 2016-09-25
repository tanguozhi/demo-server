<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.demo.server.xmpp.vo.*" %>

<%
	String node = (String)request.getAttribute("node");
	System.out.println("node===="+node);
	
	ArrayList<MucRoomUsersModel> list = (ArrayList<MucRoomUsersModel>)request.getAttribute("mucRoomUsersModel");
	String roomName = (String)request.getAttribute("roomName");
	
	String json = "[{\"node\":\""+node+"\",\"data\":[";
	if (null!=list) {
		for(int i=0; i<list.size(); i++) {
			MucRoomUsersModel mrm = list.get(i);
			json += "{\"roomName\":\""+roomName+"\",\"roomID\":\""+mrm.getRoomID()+"\",\"jid\":\""+mrm.getJid()+"\",\"affiliation\":\""+mrm.getAffiliation()+"\"},";
		}
	}
	json += "{}]}]";
%>

<%=json%>

