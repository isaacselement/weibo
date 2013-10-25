package com.eleyuan.action;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.eleyuan.bean.Message;
import com.eleyuan.service.MessageManager;
import com.eleyuan.util.PageModel;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * �������
 * 
 * @author figo
 */
@Controller
@Scope("prototype")
public class MessageAction extends ActionSupport implements
		ModelDriven<Message>, SessionAware {

	private static final long serialVersionUID = -7573137155990622715L;
	@Inject
	private MessageManager messageManager;// ����ҵ���������
	private Message message = new Message();
	private PageModel pageModel = new PageModel();

	private String queryStr;// ��ѯ��������ݣ�
	
	private int[] selectFlag;// ����ɾ�������id��

	private Map<String, Object> session;
	
	
	// 取得当前登录的用户名
	public String getLoginUsername() {
		return (String) ActionContext.getContext().getSession().get(
				"user");
	}


	/**
	 * ���������Ϣ
	 */
	public String add() {		
		System.out.println(message.getUsername());
		System.out.println(message.getTime());
		System.out.println(message.getContent());
		System.out.println(message.getReciever());
//		message.setReciever("zhang");
		messageManager.add(message);		
		return "input";
	}

	public String deleteUsername() {
		messageManager.delete(selectFlag);
		return listMessageByUsername();
	}
	
	public String deleteReciever() {
		messageManager.delete(selectFlag);
		return listMessageByReciever();
	}


	public String queryMessage() {
		/*if (!"admin".equals(session.get("user"))) {
			addActionError("�������Թ���Ա����õ�¼��");
			return "login"; // �ǹ���Ա�û�������ҳ
		}*/
		pageModel = messageManager.findByTime(pageModel.getPageNo(), pageModel
				.getPageSize(), queryStr);

		ActionContext.getContext().put("pageModel", pageModel);

		return "message_receive_box";
	}
	
	public String listMessageByReciever() {
		
		
		pageModel = messageManager.findAllRecieverMessage(pageModel.getPageNo(), pageModel
				.getPageSize(),this.getLoginUsername());

		ActionContext.getContext().put("pageModel", pageModel);

		return "message_receive_box";
	}
	
	public String listMessageByUsername() {
		
		
		pageModel = messageManager.findAllUsernameMessage(pageModel.getPageNo(), pageModel
				.getPageSize(),this.getLoginUsername());

		ActionContext.getContext().put("pageModel", pageModel);

		return "message_send_box";
	}



	public void setMessageManager(MessageManager treatiseManager) {
		this.messageManager = treatiseManager;
	}

	public Message getModel() {
		return message;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getQueryStr() {
		return queryStr;
	}

	public void setQueryStr(String queryStr) {
		this.queryStr = queryStr;
	}

	public PageModel getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel pageModel) {
		this.pageModel = pageModel;
	}

	public int[] getSelectFlag() {
		return selectFlag;
	}

	public void setSelectFlag(int[] selectFlag) {
		this.selectFlag = selectFlag;
	}


	public MessageManager getMessageManager() {
		return messageManager;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}
}
