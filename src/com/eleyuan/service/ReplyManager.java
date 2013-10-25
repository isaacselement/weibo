package com.eleyuan.service;

import java.util.List;




import com.eleyuan.bean.Message;
import com.eleyuan.bean.Reply;
import com.eleyuan.util.PageModel;

public interface ReplyManager {
	/**
	 * 增加微博
	 * 
	 * @param member
	 */
	public void addReply(Reply reply);


	/**
	 * 查询所有 回复
	 */
	public List<Reply> findAll();//
	


	public PageModel findByUsername(int pageNo, int pageSize, String username);
	
	public List<Reply> findByUsername(String username);
	
	public List<Reply> findAllByPosttopicId(int id);
	





}
