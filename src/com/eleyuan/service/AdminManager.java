package com.eleyuan.service;

import java.util.List;

import com.eleyuan.bean.Admin;


public interface AdminManager {
	
	/**
	 * ͨ�����ֲ�ѯ
	 * 
	 * @param name
	 * @return
	 */
	public List<Admin> findAdminByName(String name);

	
/*	public List<Admin> findAllTeacher();


	public Admin findAdminById(int id);

	*//**
	 * ���ڹ���Ա��ѯ��Ա����ʵ�������Զ���ʾ��ȫ����
	 * 
	 * @param name
	 * @return
	 *//*
	public List<String> findNameMatched(String name);
*/
}
