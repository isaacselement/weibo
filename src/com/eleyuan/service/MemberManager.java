package com.eleyuan.service;

import java.util.List;

import com.eleyuan.bean.Member;
import com.eleyuan.util.PageModel;

public interface MemberManager {
	/**
	 * 增加成员
	 * 
	 * @param member
	 */
	public void addMember(Member member);

	/**
	 * 删除成员
	 * 
	 * @param memberNoList成员id号列表
	 */
	public void deleteMember(int[] memberIdList);

	/**
	 * 修改成员
	 * 
	 * @param member
	 */
	public void modifyMember(Member member);

	/**
	 * 通过名字查询
	 * 
	 * @param name
	 * @return
	 */
	public List<Member> findMemberByName(String name);

	/**
	 * 分年级列出学生信息
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @param grade年级
	 */
	public PageModel findAllMemberByGrade(int pageNo, int pageSize, String grade);

	/**
	 * 查询所有教师
	 */
	public List<Member> findAllTeacher();

	/**
	 * 查询复合条件的所有成员，通过
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @param queryString
	 */
	public PageModel findAllMember(int pageNo, int pageSize, String queryStr);

	/**
	 * 根据id查询成员
	 * 
	 * @param id
	 */
	public Member findMemberById(int id);

	/**
	 * 用于管理员查询成员名，实现人名自动提示补全功能
	 * 
	 * @param name
	 * @return
	 */
	public List<String> findNameMatched(String name);
}
