package com.eleyuan.service.impl;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Service;

import com.eleyuan.bean.Message;
import com.eleyuan.service.MessageManager;
import com.eleyuan.util.PageModel;

@Service
public class MessageManagerImpl extends InjectSessionFactory implements
		MessageManager {

	private static final Logger log = LoggerFactory
			.getLogger(MessageManagerImpl.class);

	public void add(Message messageInstance) {
		log.debug("saving Message instance");
		if(messageInstance!=null){
		try {
			getHibernateTemplate().save(messageInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
		}		
		
	}

	public void delete(Message treatise) {
		log.debug("deleting Treatise instance");
		try {
			getHibernateTemplate().delete(treatise);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Message> findAll() {
		log.debug("finding all Message instances");
		try {
			String queryString = "from Message order by time";
			Query queryObject = getSession().createQuery(queryString)
					.setCacheable(true);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public void update(Message treatise) {
		getHibernateTemplate().update(treatise);
	}

	@SuppressWarnings("unchecked")
	public PageModel findByTime(final int pageNo, final int pageSize,
			final String time) {
		getHibernateTemplate().setCacheQueries(true);// ������ѯ����

		List<Message> messageList = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						String hql;
						if (time != null && time.trim().length() == 0) {// ����������Ĭ�ϲ�ѯ�������
							return session.createQuery(
									"from Message t order by time")
									.setFirstResult((pageNo - 1) * pageSize)
									.setMaxResults(pageSize).list();
						} else {
							hql = "from Message t where t.time = :time";
							return session.createQuery(hql).setString("time",
									time).setFirstResult(
									(pageNo - 1) * pageSize).setMaxResults(
									pageSize).list();
						}
					}
				});
		PageModel pageModel = new PageModel(pageNo, pageSize, messageList);

		String hql;

		if (time != null && time.trim().length() == 0) {// ����������Ĭ�ϲ�ѯ�������
			hql = "select count(*) from Message";
		} else {
			hql = "select count (*) from Message t where t.time = " + time;
		}

		Long totalRecords = (Long) getHibernateTemplate().find(hql).get(0);
		pageModel.setTotalRecords(totalRecords.intValue());
		return pageModel;
	}

	@SuppressWarnings("unchecked")
	public List<Message> findAllByTime(String time) {
		String hql = "from Message t where t.time = ?";
		getHibernateTemplate().setCacheQueries(true);
		return getHibernateTemplate().find(hql, time);
	}

	public void delete(int[] messageIdlist) {
		try {
			for (int i = 0; i < messageIdlist.length; i++) {
				Message message = getHibernateTemplate().load(Message.class,
						messageIdlist[i]);

				/*File temp = new File(docPath + treatise.getId()
						+ treatise.getExt());
				if (temp.exists()) {
					temp.delete();// ɾ������ĵ�
				}*/
				getHibernateTemplate().delete(message);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Message findMessageById(int id) {
		return getHibernateTemplate().get(Message.class, id);
	}

	@SuppressWarnings("unchecked")
	
	public PageModel findAllMessage(final int pageNo, final int pageSize) {
		log.debug("finding all Message instances");
/*		try {
			String queryString = "from Message order by time";
			Query queryObject = getSession().createQuery(queryString)
					.setCacheable(true);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
		*/
		getHibernateTemplate().setCacheQueries(true);// ������ѯ����

		List<Message> messageList = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						String hql;
						
						return session.createQuery(
									"from Message t order by time")
									.setFirstResult((pageNo - 1) * pageSize)
									.setMaxResults(pageSize).list();
						
					}
				});
		PageModel pageModel = new PageModel(pageNo, pageSize, messageList);

		String hql;

		hql = "select count(*) from Message";
		
		Long totalRecords = (Long) getHibernateTemplate().find(hql).get(0);
		pageModel.setTotalRecords(totalRecords.intValue());
		return pageModel;
	}

	@SuppressWarnings("unchecked")
	public List<Message> findMessageByReceiver(String receiver) {
		String hql = "from Message t where t.receiver = ?";
		getHibernateTemplate().setCacheQueries(true);
		return getHibernateTemplate().find(hql, receiver);
	}

	@SuppressWarnings("unchecked")
	public List<Message> findMessageByUsername(String username) {
		String hql = "from Message t where t.username = ?";
		getHibernateTemplate().setCacheQueries(true);
		return getHibernateTemplate().find(hql, username);
	}

	public List<Message> findAllMessage() {
		log.debug("finding all Message instances");
		try {
				String queryString = "from Message order by time";
				Query queryObject = getSession().createQuery(queryString)
							.setCacheable(true);
					return queryObject.list();
			} catch (RuntimeException re) {
					log.error("find all failed", re);
					throw re;
			}
	}

	@SuppressWarnings("unchecked")
	public PageModel findAllRecieverMessage(final int pageNo, final int pageSize,
			final String reciever) {
		getHibernateTemplate().setCacheQueries(true);// ������ѯ����

		List<Message> messageList = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
									
						return session
						.createQuery(
								"from Message m where m.reciever=:reciever order by m.id")
						.setString("reciever", reciever).setFirstResult(
								(pageNo - 1) * pageSize).setMaxResults(
								pageSize).list();
					}
				});
		PageModel pageModuel = new PageModel(pageNo, pageSize, messageList);
		String hql = "select count(*) from Message m where m.reciever=?";
		Long totalRecords = (Long) getHibernateTemplate().find(hql, reciever).get(
				0);

		pageModuel.setTotalRecords(totalRecords.intValue());
		return pageModuel;		
	}

	@SuppressWarnings("unchecked")
	public PageModel findAllUsernameMessage(final int pageNo, final int pageSize,
			final String username) {
		getHibernateTemplate().setCacheQueries(true);// ������ѯ����

		List<Message> messageList = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						return session
						.createQuery(
								"from Message m where m.username=:username order by m.id")
						.setString("username", username).setFirstResult(
								(pageNo - 1) * pageSize).setMaxResults(
								pageSize).list();
						}				
					
				});
		PageModel pageModuel = new PageModel(pageNo, pageSize, messageList);
		String hql = "select count(*) from Message m where m.username=?";
		Long totalRecords = (Long) getHibernateTemplate().find(hql, username).get(
				0);

		pageModuel.setTotalRecords(totalRecords.intValue());
		return pageModuel;		
	}




}
