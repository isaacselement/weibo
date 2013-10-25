package com.eleyuan.service;

import java.util.List;

import com.eleyuan.bean.Admin;


public interface AdminManager {
	
	/**
	 * 通过名字查询
	 * 
	 * @param name
	 * @return
	 */
	public List<Admin> findAdminByName(String name);

	
/*	public List<Admin> findAllTeacher();


	public Admin findAdminById(int id);

	*//**
	 * 用于管理员查询成员名，实现人名自动提示补全功能
	 * 
	 * @param name
	 * @return
	 *//*
	public List<String> findNameMatched(String name);
*/
}
