package com.eleyuan.service;

import java.util.List;


import com.eleyuan.bean.Photo;
import com.eleyuan.util.PageModel;

public interface PhotoManager {
	/**
	 * 增加成员
	 * 
	 * @param photo
	 */
	public void addPhoto(Photo photo);

	/**
	 * 删除成员
	 * 
	 * @param photoNoList成员id号列表
	 */
	public void deletePhoto(int[] photoIdList);

	/**
	 * 修改成员
	 * 
	 * @param photo
	 */
	public void modifyPhoto(Photo photo);

	/**
	 * 通过名字查询
	 * 
	 * @param name
	 * @return
	 */
	public List<Photo> findPhotoByName(String name);

	
	/**
	 * 查询所有教师
	 */
	public List<Photo> findAllPhoto();

	/**
	 * 查询复合条件的所有成员，通过
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @param queryString
	 */
	public PageModel findAllPhoto(int pageNo, int pageSize, String queryStr);

	/**
	 * 根据id查询成员
	 * 
	 * @param id
	 */
	public Photo findPhotoById(int id);

	/**
	 * 用于管理员查询成员名，实现人名自动提示补全功能
	 * 
	 * @param name
	 * @return
	 */
	public List<String> findNameMatched(String name);
}
