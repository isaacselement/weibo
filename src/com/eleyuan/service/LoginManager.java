package com.eleyuan.service;

import com.eleyuan.bean.Member;
public interface LoginManager {
	public Member login(String username, String password);
}