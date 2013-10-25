package com.eleyuan.service;

import java.util.List;

import com.eleyuan.bean.Message;
import com.eleyuan.util.PageModel;

public interface MessageManager {

	/**
	 * �������
	 */
	public abstract void add(Message message);

	/**
	 * ɾ������
	 */
	public abstract void delete(Message message);

	/**
	 * ����ɾ������
	 * 
	 * @param treatiseIdlist
	 *            ɾ���ĵ���id�б�
	 * @param docPath
	 *            �ĵ����·��
	 */
	public abstract void delete(int[] messageIdlist);



	/**
	 * ��id�Ų�ѯ
	 */
	public abstract Message findMessageById(int id);

	/**
	 * ��������ݲ�ѯ����
	 */
	public abstract List<Message> findAllByTime(String time);

	/**
	 * ��������ݷ�ҳ��ѯ
	 */
	public abstract PageModel findByTime(int pageNo, int pageSize, String time);

	/**
	 * ��ѯ����������Ϣ
	 */
	public abstract List<Message> findMessageByReceiver(String receiver);

	public abstract List<Message> findMessageByUsername(String username);

	public abstract PageModel findAllMessage(int i, int j);

	public abstract List<Message> findAllMessage();

	public abstract PageModel findAllRecieverMessage(int pageNo, int pageSize,
			String queryStr);

	public abstract PageModel findAllUsernameMessage(int pageNo, int pageSize,
			String queryStr);

	
}