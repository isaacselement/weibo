package com.eleyuan.util;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthorizationInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 2575538469018873724L;

	public String intercept(ActionInvocation invocation) throws Exception {
		Map session = invocation.getInvocationContext().getSession();
		String username = (String) session.get("user");
		if (null != username && !username.equals("")) {

			return invocation.invoke();
		} else {				
			System.out.println("用户未登录");
			return "index";
		}
	}
}
