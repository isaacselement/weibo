package com.eleyuan.servlet;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 公告管理Servlet
 */
public class Bulletin extends HttpServlet {
	private static final long serialVersionUID = -6083965022318400487L;

	@Override
	protected void doGet(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse) throws ServletException,
			IOException {
		doPost(httpServletRequest, httpServletResponse);
	}

	@Override
	protected void doPost(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse) throws ServletException,
			IOException {
		httpServletResponse.setContentType("text/html;charset=utf-8");
		PrintWriter out = httpServletResponse.getWriter();
		String realPath = httpServletRequest.getSession(true).getServletContext().getRealPath("/");
		
		Properties properties = new Properties();
		String propertiesPath = realPath + "docs/docs.properties";

		// 1.取方法类型
		String method = httpServletRequest.getParameter("command");
		// 2.取参数
		String parameters = httpServletRequest.getParameter("parameter");

		if (method.equals("get")) {
			properties.load(new FileInputStream(propertiesPath));
			String string = properties.getProperty(parameters);
			out.print(string);
			
		} else if (method.equals("put")) {
			String bulletin = httpServletRequest.getParameter("bulletin");
			
			properties.setProperty(parameters, bulletin);
			properties.store(new FileOutputStream(propertiesPath), (new Date()).toString());
			
			out.print("<center>");
			out.print("<div style=\"margin-top:150px\">");
			out.print("公告添加成功!<br><br>");
			out.print("</div>");
			out.print("</center>");
		}
	}
}
