<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.demo.server.xmpp.vo.MucRoomModel" %>

<%
	ArrayList<MucRoomModel> list = (ArrayList<MucRoomModel>)request.getAttribute("mucRoomModels");
	String json = "[{\"node\":\"user_in_rooms\",\"data\":[";
	if (null!=list) {
		for(int i=0; i<list.size(); i++) {
			MucRoomModel mrm = list.get(i);
			json += "{\"name\":\""+mrm.getName()+"\",\"roomid\":\""+mrm.getRoomID()+"\",\"subject\":\""+mrm.getSubject()+"\",\"roompassword\":\""+mrm.getRoomPassword()+"\"},";
		}
	}
	json += "{}]}]";
%>

<%=json%>

