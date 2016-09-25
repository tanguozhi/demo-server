/**
 * @author tanguozhi
 */
package com.demo.server.push.business.ebo;

import com.demo.server.push.business.ebi.PushEbi;
import com.demo.server.push.dao.dao.PushDao;


/**
 * @author TanGuozhi
 *
 */
public class PushEbo implements PushEbi{
	/*
	 * 
	 */
	private PushDao dao = null;
	public void setDao(PushDao dao){
		this.dao = dao;
	}
	
}
