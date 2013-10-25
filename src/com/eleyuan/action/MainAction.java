package com.eleyuan.action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


import com.eleyuan.bean.Member;
import com.eleyuan.bean.Posttopic;
import com.eleyuan.service.MemberManager;
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
public class MainAction extends ActionSupport implements RequestAware,ModelDriven<Member>,
SessionAware {
	private static final long serialVersionUID = -6630628618267470618L;
	@Inject
	private PosttopicManager posttopicManager;// 成员业务操作对象
	@Inject
	private MemberManager memberManager;// 成员操作业务对象
	private Member member = new Member();// 成员实体对象
	private Map<String, Object> request;
	private Map<String, Object> session;

	private PageModel pageModel = new PageModel();
 
	public void register() throws Exception {
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		try {
//			memberManager.addMember(member);// 成员信息写入数据库		
			session.put("member", member);
			writer.write("success");
		} catch (Exception e) {
			writer.write("failed");
		}
	}
	
	public String listPosttopic() {

		List<Posttopic> list = null;

		list = posttopicManager.findAllBy5();
		request.put("posttopics", list);

		return "success";

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

	public MemberManager getMemberManager() {
		return memberManager;
	}

	public void setMemberManager(MemberManager memberManager) {
		this.memberManager = memberManager;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
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

	public Member getModel() {
		return member;
	}
	


}