/**
 * @author tanguozhi
 */
package com.demo.server.xmpp.web.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.demo.server.common.Config;
import com.demo.server.xmpp.business.ebi.XmppEbi;
import com.demo.server.xmpp.vo.*;
import com.demo.server.xmpp.web.vo.XmppActionModel;
import com.gz.tool.push.ios.IOSPush;
import com.opensymphony.xwork2.ActionSupport;

public class XmppAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	
	//创建
	private final String GET_ROOM_ALL_USER = "EBL000001";				//获取房间的所有人员
	private final String GET_USER_IN_ROOMS = "EBL000002";				//获取自己在那些房间
	private final String QUIT_ROOM_MEMBER = "EBL000003";				//获取自己在那些房间
	
	public XmppActionModel model = new XmppActionModel();
	
	IOSPush send;
	
	/*
	 * 逻辑层接口
	 */
	private XmppEbi ebi = null;
	public void setEbi(XmppEbi ebi) {
		this.ebi = ebi;
	}
	
	/*
	 * 表现层进入
	 * BXC00001		
	 */
	public String execute(){
		String resultReturn = "";	//界面跳转标识
		String errorMessage = "";
		
		String submitFlag = model.getSubmitFlag();
		String os = ServletActionContext.getRequest().getParameter("os");
		if(null==os || "".equals(os)) {	//判断是否非法进入
			resultReturn = "illegal_page";
		} else {
			if (GET_ROOM_ALL_USER.equals(submitFlag)) {				//检查用户是否存在
				getRoomUsers();
				resultReturn = "room_users";
			} else if (GET_USER_IN_ROOMS.equals(submitFlag)) {
				getUserInRooms();
				resultReturn = "user_in_rooms";
			} else if (QUIT_ROOM_MEMBER.equals(submitFlag)) {
				quitRoomMember();
				
				resultReturn = "quit_room";
			}
			
			resultReturn = resultReturn+"_"+os;
		}
		
		if (!"".equals(errorMessage)) {	//将错误信息带到下一个界面
			ServletActionContext.getRequest().setAttribute("errorMessage", errorMessage);
		}
		System.out.println("xmppAction_ResultReturn=========>>>"+resultReturn);
		return resultReturn;
	}
	
	private void quitRoomMember() {
		boolean bFlag = false;
		String roomName = ServletActionContext.getRequest().getParameter("roomName");
		String jid = ServletActionContext.getRequest().getParameter("jid");
		String roomID = getRoomID();
		
		//根据roomID获取会员
		ArrayList<MucRoomUsersModel> affiliationList = ebi.getRoomAffiliationUserByRoomID(roomID);
		for (int i=0; i<affiliationList.size(); i++) {
			MucRoomUsersModel mrm = affiliationList.get(i);
			if(jid.equals(mrm.getJid())) {
//				bFlag = ebi.quitRoomMember(roomID, jid);
			}
		}
		
		//根据roomID获取管理员
		ArrayList<MucRoomUsersModel> memberList = ebi.getRoomMemberUserByRoomID(roomID);
		for (int i=0; i<memberList.size(); i++) {
			MucRoomUsersModel mrm = memberList.get(i);
			if(jid.equals(mrm.getJid())) {
//				bFlag = ebi.quitRoomMember(roomID, jid);
			}
		}
		
		ServletActionContext.getRequest().setAttribute("roomName", roomName);
		if (bFlag) {
			ServletActionContext.getRequest().setAttribute("bFlag", "1");
		} else {
			ServletActionContext.getRequest().setAttribute("bFlag", "1");
		}
	}
	
	private void getUserInRooms() {
		String userName = ServletActionContext.getRequest().getParameter("userName");
		ArrayList<MucRoomModel> mucRoomModels = ebi.getUserInRoomsByName(userName);
		ServletActionContext.getRequest().setAttribute("mucRoomModels", mucRoomModels);
	}
	
	private void getRoomUsers() {
		String roomName = ServletActionContext.getRequest().getParameter("roomName");
		String roomID = getRoomID();

		//根据roomID获取会员
		ArrayList<MucRoomUsersModel> affiliationList = ebi.getRoomAffiliationUserByRoomID(roomID);
		
		//根据roomID获取管理员
		ArrayList<MucRoomUsersModel> memberList = ebi.getRoomMemberUserByRoomID(roomID);
		
		for (int i=0; i<affiliationList.size(); i++) {
			memberList.add(affiliationList.get(i));
		}
		
		String node = ServletActionContext.getRequest().getParameter("node");
		
		ServletActionContext.getRequest().setAttribute("node", node);
		ServletActionContext.getRequest().setAttribute("mucRoomUsersModel", memberList);
		ServletActionContext.getRequest().setAttribute("roomName", roomName);
	}
	
	private String getRoomID() {
		String roomName = ServletActionContext.getRequest().getParameter("roomName");
		String roomID = ServletActionContext.getRequest().getParameter("roomID");

		if (null==roomID || "".equals(roomID)) {
			//获取房间信息
			MucRoomModel mrm = ebi.getMucRoomByName(roomName);
			roomID = mrm.getRoomID();
		}
		
		return roomID;
	}
}
