/**
 * @author tanguozhi
 */
package com.demo.server.xmpp.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.demo.server.common.db.XmppDBConnection;
import com.demo.server.xmpp.dao.dao.XmppDao;
import com.demo.server.xmpp.vo.MucRoomModel;
import com.demo.server.xmpp.vo.MucRoomUsersModel;

public class XmppImpl implements XmppDao{

	@Override
	public MucRoomModel getMucRoomByName(String roomName) {
		MucRoomModel mrm = new MucRoomModel();
		
		String sql = "select * from ofMucRoom where name='"+roomName+"' ";
		
		Connection connection = XmppDBConnection.getInstance().open();
		if (null!=connection) {
			try {
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()) {
					mrm.rsToModel(rs);
				}
				rs.close();
				stmt.close();
				connection.close();
			} catch (Exception e) {
				System.out.println("sql语句执行失败--->"+sql);
				e.printStackTrace();
			}
		}
		XmppDBConnection.getInstance().close();
		
		return mrm;
	}

	@Override
	public MucRoomModel getMucRoomByID(String roomID) {
		MucRoomModel mrm = new MucRoomModel();
		
		String sql = "select * from ofMucRoom where roomID='"+roomID+"' ";
		
		Connection connection = XmppDBConnection.getInstance().open();
		if (null!=connection) {
			try {
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()) {
					mrm.rsToModel(rs);
				}
				rs.close();
				stmt.close();
				connection.close();
			} catch (Exception e) {
				System.out.println("sql语句执行失败--->"+sql);
				e.printStackTrace();
			}
		}
		XmppDBConnection.getInstance().close();
		
		return mrm;
	}

	@Override
	public ArrayList<MucRoomModel> getUserInRoomsByName(String userName) {
		ArrayList<MucRoomModel> list = new ArrayList<MucRoomModel>();
		
		String sql = "select * from ofMucRoom where roomID in (select roomID from ofMucMember where jid like '%"+userName+"%')"+" or roomID in (select roomID from ofMucAffiliation where jid like '%"+userName+"%')";

		Connection connection = XmppDBConnection.getInstance().open();
		if (null!=connection) {
			try {
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()) {
					MucRoomModel mrm = new MucRoomModel();
					
					mrm.rsToModel(rs);
					
					list.add(mrm);
				}
				rs.close();
				stmt.close();
				connection.close();
			} catch (Exception e) {
				System.out.println("sql语句执行失败--->"+sql);
				e.printStackTrace();
			}
		}
		XmppDBConnection.getInstance().close();
		
		return list;
	}
	
	@Override
	public ArrayList<MucRoomUsersModel> getRoomAffiliationUserByRoomID(String roomID) {
		ArrayList<MucRoomUsersModel> list = new ArrayList<MucRoomUsersModel>();
		
		String sql = "select * from ofMucAffiliation where roomID='"+roomID+"'";
		Connection connection = XmppDBConnection.getInstance().open();
		if (null!=connection) {
			try {
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()) {
					MucRoomUsersModel mrm = new MucRoomUsersModel();

					mrm.rsToModel(rs);
					
					list.add(mrm);
				}
				rs.close();
				stmt.close();
				connection.close();
			} catch (Exception e) {
				System.out.println("sql语句执行失败--->"+sql);
				e.printStackTrace();
			}
		}
		XmppDBConnection.getInstance().close();
		
		return list;
	}
	
	@Override
	public ArrayList<MucRoomUsersModel>	getRoomMemberUserByRoomID(String roomID) {
		ArrayList<MucRoomUsersModel> list = new ArrayList<MucRoomUsersModel>();
		
		String sql = "select * from ofMucMember where roomID='"+roomID+"'";
		Connection connection = XmppDBConnection.getInstance().open();
		if (null!=connection) {
			try {
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()) {
					MucRoomUsersModel mrm = new MucRoomUsersModel();
					
					mrm.rsToModel(rs);
					
					list.add(mrm);
				}
				rs.close();
				stmt.close();
				connection.close();
			} catch (Exception e) {
				System.out.println("sql语句执行失败--->"+sql);
				e.printStackTrace();
			}
		}
		XmppDBConnection.getInstance().close();
		
		return list;
	}
	
	@Override
	public boolean	quitRoomMember(String roomID, String jid) {
		boolean bFlag = false;
			
		String sql = "delete from ofMucMember where roomID='"+roomID+"' and jid='"+jid+"'";
		Connection connection = XmppDBConnection.getInstance().open();
		if (null!=connection) {
			try {
				Statement stmt = connection.createStatement();
				stmt.execute(sql);
				
				stmt.close();
				connection.close();
				
				bFlag = true;
			} catch (Exception e) {
				System.out.println("sql语句执行失败--->"+sql);
				e.printStackTrace();
				
				bFlag = false;
			}
		}
		XmppDBConnection.getInstance().close();
		
		return bFlag;
	}
}
