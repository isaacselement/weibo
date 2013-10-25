package com.eleyuan.action;

import java.util.Map;

import javax.inject.Inject;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.eleyuan.bean.Admin;
import com.eleyuan.service.AdminLoginManager;
import com.eleyuan.service.LoginManager;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 登录处理
 * 
 * @author figo
 */
@Controller
@Scope("prototype")
public class AdminLoginAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 5568005134806660665L;
	@Inject
	private AdminLoginManager adminManager;// 登录验证操作对象
	private String username;
	private String password;
	private String picValidate = "";
	private Map<String, Object> session;

	public void setAdminLoginManager(AdminLoginManager adminManager) {
		this.adminManager = adminManager;
	}

	@Override
	public String execute() {
 
		Admin admin = adminManager.login(username, password);
		if (admin != null) {// 登录成功
			session.put("user", username);
			
				return "success";// 进入界面
		
		} else {// 登录失败
			addActionError(getText("login.failure"));
			return INPUT;// 登录失败，返回登录界面
		}
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPicValidate() {
		return picValidate;
	}

	public void setPicValidate(String picValidate) {
		this.picValidate = picValidate;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}