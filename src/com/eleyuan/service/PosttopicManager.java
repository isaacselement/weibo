package com.eleyuan.service;

import java.util.List;


import com.eleyuan.bean.Message;
import com.eleyuan.bean.Posttopic;
import com.eleyuan.util.PageModel;

public interface PosttopicManager {
	/**
	 * 增加微博
	 * 
	 * @param member
	 */
	public void addPosttopic(Posttopic posttopic);


	/**
	 * 查询所有weibo
	 */
	public List<Posttopic> findAll();
	
	public List<Posttopic> findAllBy5() ;


	public PageModel findByUsername(int pageNo, int pageSize, String username);
	
	public List<Posttopic> findByUsername(String username);
	//20110520kevin
/*	public Posttopic getPosttopic(String id );*/
	public Posttopic findPosttopicById(int id);



}
