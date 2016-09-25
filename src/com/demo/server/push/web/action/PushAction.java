/**
 * @author tanguozhi
 */
package com.demo.server.push.web.action;


import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.demo.server.common.Config;
import com.demo.server.push.business.ebi.PushEbi;
import com.demo.server.push.vo.PushModel;
import com.demo.server.push.web.vo.PushActionModel;
import com.gz.tool.push.ios.IOSPush;
import com.opensymphony.xwork2.ActionSupport;

public class PushAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	
	//国智: d378264d2a8f5acd26c1ac124c323c16c304a2cf4d291d58039fb039a2b56070
	//文达：d8beb0c5cf4482531d898d157b18b879d81d33f7cef474fbb7aa89bcfd986228
	//秀云: aee7b9b6c5693ed59640884c09e7a1002eed986e5d4a3ba665cfe0608a0566b5
	//建勇: a608f6abac92b4b5fe864a89d0a0527c47c93fcfd5b0c332e15b89070caa1398
	
	
	
	private final String DEVICE_TOKE_LCJI = "d8beb0c5cf4482531d898d157b18b879d81d33f7cef474fbb7aa89bcfd986228";	
	private final String DEVICE_TOKE_CLIENT = "d378264d2a8f5acd26c1ac124c323c16c304a2cf4d291d58039fb039a2b56070";
	private final String DEVICE_TOKE_DTJI = "d8beb0c5cf4482531d898d157b18b879d81d33f7cef474fbb7aa89bcfd986228";	
	
	
	//创建
	private final String IOS_PUSH = "EBL000001";					//推送
	private final String IOS_PUSH_IBEACON_TEST = "EBL000002";					//推送
	private final String IOS_PUSH_CLIENT = "EBL000003";					//推送
	private final String IOS_PUSH_SUER = "EBL000004";					//推送
	private final String IOS_DTJL_PUSH_SUER = "EBL000005";
	private final String IOS_DTJL_PUSH_SUER_GG = "EBL000006";
	
	public PushActionModel model = new PushActionModel();
	public PushModel pm = new PushModel();
	
	/*
	 * 逻辑层接口
	 */
	private PushEbi ebi = null;
	public void setEbi(PushEbi ebi) {
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
			if (IOS_PUSH.equals(submitFlag)) {
				push();
			} else if (IOS_PUSH_IBEACON_TEST.equals(submitFlag)) {
				ibeaconTest();
			} else if (IOS_PUSH_CLIENT.equals(submitFlag)) {
				clientPush();
			} else if (IOS_PUSH_SUER.equals(submitFlag)) {
				enter();
			} else if (IOS_DTJL_PUSH_SUER.equals(submitFlag)) {
				update();
			} else if (IOS_DTJL_PUSH_SUER_GG.equals(submitFlag)) {
				gg();
			}
			
			resultReturn = resultReturn+"_"+os;
		}
		
		if (!"".equals(errorMessage)) {	//将错误信息带到下一个界面
			ServletActionContext.getRequest().setAttribute("errorMessage", errorMessage);
		}
		System.out.println("pushAction_ResultReturn=========>>>"+resultReturn);
		return resultReturn;
	}
	
	private void push() {
		
		IOSPush send = new IOSPush();
		
		List<String> tokens = new ArrayList<String>();
		
		String[] token = pm.getTokens().split(";");
		for (int i=0; i<token.length; i++) {
			tokens.add(token[i]);
		}
		boolean sendCount = false;
		if (tokens.size()>0) {
			sendCount = true;
		}
		send.sendpush(tokens, Config.getIOSPushCertificate(), Config.IOS_PUSH_CERTIFICATE_PASSWORD, pm.getMessage(), pm.getCount(), sendCount, true);
	}
	
	private void ibeaconTest() {
		String major = ServletActionContext.getRequest().getParameter("major");
		String minor = ServletActionContext.getRequest().getParameter("minor");
		if (major.equals("1") && minor.equals("1")) {
			System.out.println("in========>>>>"+major+", "+minor);
			pm.setTokens(DEVICE_TOKE_LCJI);
			pm.setMessage("EBL00001");
//			push();
		} else if (major.equals("1") && minor.equals("2")) {
			System.out.println("in========>>>>"+major+", "+minor);
			pm.setTokens(DEVICE_TOKE_DTJI);
			pm.setMessage("EBL00002");
//			push();
		}
	}
	
	public void enter() {
		pm.setTokens(DEVICE_TOKE_LCJI);
		pm.setMessage("EBL00005");
		push();
	}
	
	private void clientPush() {
		String type = ServletActionContext.getRequest().getParameter("type");
		pm.setTokens(DEVICE_TOKE_CLIENT);
		pm.setMessage("EBL00003|"+type);
		push();
	}
	
	private void update() {
		System.out.println("=========");
		pm.setTokens(DEVICE_TOKE_CLIENT);
		pm.setMessage("EBL00004");
		push();
		System.out.println("end=========");
	}
	
	public void gg() {
		String type = ServletActionContext.getRequest().getParameter("type");
		pm.setTokens(DEVICE_TOKE_CLIENT);
		pm.setMessage("EBL00006|"+type);
		push();
	}
	
}
