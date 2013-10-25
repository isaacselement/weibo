package com.eleyuan.action;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;



import com.eleyuan.bean.Reply;
import com.eleyuan.bean.Posttopic;
import com.eleyuan.service.ReplyManager;
import com.eleyuan.service.PosttopicManager;
import com.eleyuan.util.PageModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 常规访问Action
 * 
 * @author figo
 */
@Controller
@Scope("prototype")
public class ReplyAction extends ActionSupport implements RequestAware,ModelDriven<Reply>,
SessionAware {
	private static final long serialVersionUID = -6630628618267470618L;
	@Inject
	private PosttopicManager posttopicManager;// 成员业务操作对
	@Inject
	private ReplyManager replyManager;
	private Reply reply = new Reply();// 成员实体对象
	private Map<String, Object> request;
	private Map<String, Object> session;
	private PageModel pageModel = new PageModel();
	
/*	public String register() throws Exception {

		encoderPassword();
		memberManager.addMember(member);// 成员信息写入数据库		
		session.put("member", member);		
		return "mainPage";// 普通用户转到信息更用户界面
	
	}*/
	/**
	 * 列出所有boke
	 */
	public String getLoginUsername() {
		return (String) ActionContext.getContext().getSession().get(
				"user");
	}


	public String listPosttopic() {
		
		
		List<Posttopic> list = null;
		list = posttopicManager.findAllBy5();
		request.put("posttopics", list);
		System.out.println("在replyAction.listPosttopic！！");
		return "list";

	}
	public String listPosttopicByContext() {
		System.out.println("在！！");
/*		Posttopic posttopic = new Posttopic();
		String context =posttopic.getContext();
		request.put("posttopic", context);
		System.out.println("在???！！");*/
		return SUCCESS;
	}
	
	public String init(){
		Integer id=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		session.put("posttopicId", id);
		return listReply();
	}

	public String listReply() {		
		int id=(Integer)session.get("posttopicId");
		List<Reply> list = null;		
		list =replyManager.findAllByPosttopicId(id);
		Posttopic posttopic =posttopicManager.findPosttopicById(id);
		request.put("replies", list);
		request.put("posttopic", posttopic);		
		return "list";

	}
	public String add() throws Exception {

		replyManager.addReply(reply);//博客信息写入数据库	
		addActionError("发表成功！");
		return listReply();// 普通用户转到信息更用户界面
	}

	public String listPosttopicAll(){
		List<Posttopic> posttopics = null;

		posttopics = posttopicManager.findByUsername(this.getLoginUsername());

		ActionContext.getContext().put("posttopics", posttopics);

		return "posttopic";

	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	public PosttopicManager getPosttopicManager() {
		return posttopicManager;
	}

	public void setPosttopicManager(PosttopicManager posttopicManager) {
		this.posttopicManager = posttopicManager;
	}




	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public PageModel getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel pageModel) {
		this.pageModel = pageModel;
	}



	public ReplyManager getReplyManager() {
		return replyManager;
	}


	public void setReplyManager(ReplyManager replyManager) {
		this.replyManager = replyManager;
	}


	public Reply getReply() {
		return reply;
	}


	public void setReply(Reply reply) {
		this.reply = reply;
	}


	public Reply getModel() {
		// TODO Auto-generated method stub
		return reply;
	}

	
}