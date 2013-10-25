package com.eleyuan.action;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.struts2.interceptor.RequestAware;
import org.springframework.stereotype.Controller;

import com.eleyuan.bean.Posttopic;
import com.eleyuan.service.PosttopicManager;
import com.eleyuan.bean.Message;
import com.eleyuan.service.MemberManager;
import com.eleyuan.service.MessageManager;
import com.eleyuan.service.PhotoManager;
import com.eleyuan.util.PageModel;

/**
 * 常规访问Action
 * 
 * @author figo
 */
@Controller
public class ListAction implements RequestAware {
	private static final long serialVersionUID = -6630628618267470618L;
	@Inject
	private MemberManager memberManager;// 成员业务操作对象
	@Inject
    private PhotoManager photoManager;
	@Inject
	private MessageManager messageManager;
	@Inject
	private PosttopicManager posttopicManager;// 成员业务操作对象
	private Map<String, Object> request;

	private PageModel pageModel = new PageModel();

	// 成员id号
	private int id;
	private String username;


	/**
	 * 列出会员
	 */
	public String listMember() {

		pageModel = memberManager.findAllMemberByGrade(pageModel.getPageNo(),
				pageModel.getPageSize(), username);
		request.put("pageModel", pageModel);
		return "student";
	}

	/**
	 * 列出所有私信
	 */
	public String listMessage() {

		return "message";
	}
	
	
	public String listPosttopic() {

		List<Posttopic> list = null;


		list = posttopicManager.findAll();
		

		request.put("posttopics", list);

		return "posttopic";

	}

	/**
	 * 按ID列出单个成员详细信息，默认返回学生详细信息
	 */
	public String listMessageByID() {
		Message message = messageManager.findMessageById(id);

		if (message == null) {// id为空时
			List<Message> messageList = messageManager.findAllMessage();
			message = messageList.get((int) (Math.random() * messageList.size()));
		}

		request.put("message", message);

/*		if ("教师".equals(member.getType())) {
			return "teacherDetail";
		} else {
			return "studentDetail";
		}*/
		return "messageDetail";
	}

	public String listMessage1() {

		List<Message> list = null;
		
		list = messageManager.findAllMessage();
		
		request.put("Messages", list);

		return "message";
	}

	public PageModel getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel pageModel) {
		this.pageModel = pageModel;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public MemberManager getMemberManager() {
		return memberManager;
	}

	public void setMemberManager(MemberManager memberManager) {
		this.memberManager = memberManager;
	}

	public PhotoManager getPhotoManager() {
		return photoManager;
	}

	public void setPhotoManager(PhotoManager photoManager) {
		this.photoManager = photoManager;
	}
	
}