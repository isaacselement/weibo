package com.eleyuan.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.eleyuan.bean.Photo;
import com.eleyuan.service.PhotoManager;
import com.eleyuan.util.HeadIconUtil;
import com.eleyuan.util.MD5;
import com.eleyuan.util.PageModel;
import com.eleyuan.util.PicCutPara;
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
public class PhotoAction extends ActionSupport implements ModelDriven<Photo>,
		SessionAware {
	private static final long serialVersionUID = -6326490188942700211L;
	private String savePath;// 头像上传相对路径
	@Inject
	private PhotoManager photoManager;// 成员操作业务对象
	private Photo photo = new Photo();// 成员实体对象
	private PageModel pageModel = new PageModel();
	private PicCutPara cutPara = new PicCutPara();// 图片剪切参数封装
	private static final int BUFFER_SIZE = 20 * 1024;// 文件上传缓冲区

	private Map<String, Object> session;
	private File file;// 上传文件名

	// 查询条件
	private String queryStr;

	// 成员批量删除成员id号
	private int[] selectFlag;
	
	/**
	 * 添加照片
	 */
	public String add() throws Exception {
		photoManager.addPhoto(photo);// 照片信息写入数据库

		HttpServletRequest request = ServletActionContext.getRequest();
		String realPath = request.getSession(true).getServletContext()
				.getRealPath("/")
				+ savePath;// 文件上传绝对路径

		
			File file = new File(realPath + photo.getId() + ".jpg");
			createHeadIcon(file);
		

		
			addActionError("上传成功！");
			return "update";// 普通用户转到信息更用户界面
		
	}

	private void createHeadIcon(File headIcon) throws IOException {
		InputStream in = new BufferedInputStream(new FileInputStream(file),
				BUFFER_SIZE);
		OutputStream out = new BufferedOutputStream(new FileOutputStream(
				headIcon), BUFFER_SIZE);

		byte[] buffer = new byte[BUFFER_SIZE];
		int length = 0;
		while ((length = in.read(buffer)) > 0) {
			out.write(buffer, 0, length);
		}
		in.close();
		out.flush();
		out.close();

		if (cutPara.getW() != 0) {// 用户用上传头像进行了编辑
			HeadIconUtil.cropImage(cutPara, headIcon);
		}

		if (headIcon.length() > 1024 * 350) {// 对大于350K的图片进行压缩
			HeadIconUtil.compress(headIcon, 600, 600, 1.0f);
		}
	}

	/**
	 * 删除成员
	 */
	public String delete() throws Exception {
		if (!"admin".equals(session.get("user"))) {
			addActionError("请以先以管理员身份用登录！");
			return "login"; // 非管理员用户返回首页
		}

		photoManager.deletePhoto(selectFlag);// 删除用户数据库记录

		String realPath = ServletActionContext.getRequest().getSession(true)
				.getServletContext().getRealPath("/"); // 此处获取web应用得绝对路径

		for (int i = 0; i < selectFlag.length; i++) {// 删除用户照片
			String fileName = realPath + savePath + selectFlag[i] + ".jpg";
			File file = new File(fileName);

			if (file.isFile() && file.exists()) {
				file.delete();
			}
		}
		return queryMember();
	}

	/**
	 * 用于管理员成员信息修改
	 */
	public String modifyDetail() throws Exception {
		if (!"admin".equals(session.get("user"))) {
			addActionError("请以先以管理员身份用登录！");
			return "login"; // 非管理员用户返回首页
		}
		Photo photo = photoManager.findPhotoById(selectFlag[0]);
		session.put("member", photo);
		return "update";
	}

	/**
	 * 会员信息修改
	 */
	public String update() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();

		
		photoManager.modifyPhoto(photo);

		String realPath = request.getSession(true).getServletContext()
				.getRealPath("/")
				+ savePath;// 文件上传绝对路径

		File headIcon = new File(realPath + photo.getId() + ".jpg");
		if (file != null) {
			createHeadIcon(headIcon);
		} else if (cutPara.getW() != 0) {// 用户用上传头像进行了编辑
			HeadIconUtil.cropImage(cutPara, headIcon);
		}

/*		if ("admin".equals(session.get("user"))) {
			return "admin_maint";// 管理员则转到人员围护界面
		} else {
			session.put("member", member);
			addActionError("信息修改成功！");
			return "index";// 普通用户转到信息更用户界面
		}*/
		session.put("photo", photo);
		addActionError("信息修改成功！");
		return "update";
	}


	/**
	 * 按查询条件查询列出成员，仅管理人员可使用
	 */
	public String queryMember() throws Exception {
		if (!"admin".equals(session.get("user"))) {
			addActionError("请以先以管理员身份用登录！");
			return "login"; // 非管理员用户返回首页
		}

		pageModel = photoManager.findAllPhoto(pageModel.getPageNo(),
				pageModel.getPageSize(), queryStr);

		ActionContext.getContext().put("pageModel", pageModel);

		return "admin_maint";
	}

	/**
	 * 查询人名自动补全
	 */
	public String auto() throws Exception {
		if (!"admin".equals(session.get("user"))) {
			return "/index.html"; // 非管理员用户返回首页
		}
		String name = ServletActionContext.getRequest().getParameter("word");

		List<String> list = photoManager.findNameMatched(name);
		ActionContext.getContext().put("names", list);

		return "nameAuto";
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public void setMemberManager(PhotoManager manager) {
		this.photoManager = manager;
	}

	public PicCutPara getCutPara() {
		return cutPara;
	}

	public void setCutPara(PicCutPara cutPara) {
		this.cutPara = cutPara;
	}

	public Photo getModel() {
		return photo;
	}

	public Photo getPhoto() {
		return photo;
	}

	public void setPhoto(Photo photo) {
		this.photo = photo;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getQueryStr() {
		return queryStr;
	}

	public void setQueryStr(String queryStr) {
		this.queryStr = queryStr;
	}

	public int[] getSelectFlag() {
		return selectFlag;
	}

	public void setSelectFlag(int[] selectFlag) {
		this.selectFlag = selectFlag;
	}

	public String getSavePath() {
		return savePath;
	}

	public PhotoManager getPhotoManager() {
		return photoManager;
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

	public Map<String, Object> getSession() {
		return session;
	}

}