package com.eleyuan.action;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.eleyuan.bean.Member;
import com.eleyuan.bean.Posttopic;


import com.eleyuan.service.LoginManager;
import com.eleyuan.service.PosttopicManager;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class LoginAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 5568005134806660665L;
	@Inject
	private  LoginManager userManager;
	@Inject
	private PosttopicManager posttopicManager;
	private String username;
	private String password;
	private String picValidate;
	private Map<String, Object> session;
	

	public void setLoginManager(LoginManager userManager) {
		this.userManager = userManager;
	}

	@Override
	public String execute() {
		Member member = userManager.login(username, password);
		if (member != null) {
			session.put("user", username);
			session.put("member", member);
				return listPosttopic();
		
		} else {
			addActionError(getText("login.failure"));
			return INPUT;
		}
	}
	
	public String listPosttopic() {

		List<Posttopic> list = null;


		list = posttopicManager.findAll();

		ActionContext.getContext().put("posttopics", list);
		
		return "success";

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