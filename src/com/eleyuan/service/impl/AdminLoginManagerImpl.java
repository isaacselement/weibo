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
	private AdminManager adminManager;// ��Ա�����Զ���


		public Admin  login(String username, String password) {
		
		List<Admin> list = adminManager.findAdminByName(username);// ͨ�����ֲ��ҳ�Ա
		for (Admin admin : list) {
/*			String passwd = MD5.encoderByMd5(password);// ���ܺ��ٽ��жԱ�
*/ 			if (admin.getPassword().trim().equals(password))
				return admin;
		}
		return null;
			
		} 

	}
