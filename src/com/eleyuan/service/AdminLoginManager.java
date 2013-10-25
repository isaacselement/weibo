package com.eleyuan.service;

import com.eleyuan.bean.Admin;

/**
 * 用户登验证
 * 
 * @author figo
 */
public interface AdminLoginManager {
	public Admin  login(String username, String password);
}