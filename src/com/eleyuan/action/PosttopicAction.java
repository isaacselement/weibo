package com.eleyuan.action;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;


import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import org.apache.struts2.interceptor.SessionAware;


import com.eleyuan.bean.Posttopic;
import com.eleyuan.service.PosttopicManager;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 成员操作
 * 
 * @author figo
 */
@Controller
@Scope("prototype")
public class PosttopicAction extends ActionSupport implements ModelDriven<Posttopic>,
SessionAware {


	private static final long serialVersionUID = -6326490188941234211L;
	
	@Inject
	private PosttopicManager posttopicManager;// 成员操作业务对象
	/*private String context;*/
	private Posttopic posttopic = new Posttopic();// 成员实体对象
	private Map<String, Object> session;
	private Map<String, Object> request;
	
	
	public String getLoginUsername() {
		return (String) ActionContext.getContext().getSession().get(
				"user");
	}
	
		
	public String add() throws Exception {

		/*encoderPassword();*/

		posttopicManager.addPosttopic(posttopic);//博客信息写入数据库	
		
		addActionError("发表成功！");
		
		return listPosttopicAll();// 普通用户转到信息更用户界面
	
	}

	public String listPosttopicAll(){
		List<Posttopic> posttopics = null;
		posttopics = posttopicManager.findByUsername(this.getLoginUsername());
		ActionContext.getContext().put("posttopics", posttopics);
		return "posttopic";

	}
	
	
	public String queryPosttopic() {

		return "show";
	}
	
	
	public PosttopicManager getPosttopicManager() {
		return posttopicManager;
		
	}


	public void setPosttopicManager(PosttopicManager posttopicManager) {
		this.posttopicManager = posttopicManager;
	}


	public Posttopic getPosttopic() {
		return posttopic;
	}


	public void setPosttopic(Posttopic posttopic) {
		this.posttopic = posttopic;
	}
/*	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}*/
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public Map<String, Object> getRequest() {
		return request;
	}
	public Posttopic getModel() {
		return posttopic;
	}
	
}