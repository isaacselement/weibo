package com.eleyuan.util;

import java.util.List;

/**
 * 分页组件
 */
public class PageModel {

	// 总记录数
	private int totalRecords;

	// 结果集
	private List<?> data;

	// 当前页
	private int pageNo;

	// 每页显示多少条
	private int pageSize;

	// 设置默认值
	public PageModel() {
		this.pageNo = 1;
		this.pageSize = 10;
	}

	/**
	 * 
	 * @param pageNo页数
	 * @param pageSize每页显示数量
	 */
	public PageModel(int pageNo, int pageSize, List<?> data) {
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.data = data;
	}

	/**
	 * 取得最后一页
	 * 
	 * @return
	 */
	public int getBottomPageNo() {
		return getTotalPages() == 0 ? 1 : getTotalPages();
	}

	public List<?> getList() {
		return data;
	}

	/**
	 * 取得下一页
	 * 
	 * @return
	 */
	public int getNextPageNo() {
		if (pageNo >= getTotalPages()) {
			return getTotalPages() == 0 ? 1 : getTotalPages();
		}
		return pageNo + 1;
	}

	public int getPageNo() {
		return pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	/**
	 * 取得上一页
	 * 
	 * @return
	 */
	public int getPreviousPageNo() {
		if (pageNo <= 1) {
			return 1;
		}
		return pageNo - 1;
	}

	/**
	 * 取得第一页
	 * 
	 * @return
	 */
	public int getTopPageNo() {
		return 1;
	}

	public int getTotalPages() {
		return (totalRecords + pageSize - 1) / pageSize;
	}

	// 总记录数
	public int getTotalRecords() {
		return totalRecords;
	}

	public List<?> getData() {
		return data;
	}

	public void setData(List<?> data) {
		this.data = data;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
}