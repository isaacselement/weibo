package com.eleyuan.action;


import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class LogoutAction extends ActionSupport {

	private static final long serialVersionUID = 1L;	
	
	
	public String execute() throws Exception {
		ActionContext.getContext().getSession().put("user", null);
		return SUCCESS;			
	}
	
	
}
