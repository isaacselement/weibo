package com.eleyuan.service;

import com.eleyuan.bean.Admin;

/**
 * �û�����֤
 * 
 * @author figo
 */
public interface AdminLoginManager {
	public Admin  login(String username, String password);
}