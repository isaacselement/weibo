package com.eleyuan.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.eleyuan.bean.Admin;
import com.eleyuan.service.AdminManager;
import com.eleyuan.service.AdminLoginManager;
import com.eleyuan.util.MD5;



@Service
public class AdminLoginManagerImpl implements AdminLoginManager {
	@Inject
	private AdminManager adminManager;// 成员操作对对象


		public Admin  login(String username, String password) {
		
		List<Admin> list = adminManager.findAdminByName(username);// 通过名字查找成员
		for (Admin admin : list) {
/*			String passwd = MD5.encoderByMd5(password);// 加密后再进行对比
*/ 			if (admin.getPassword().trim().equals(password))
				return admin;
		}
		return null;
			
		} 

	}
