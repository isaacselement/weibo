package com.eleyuan.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/*import cn.hxex.blog.dao.hibernate.String;*/

import com.eleyuan.service.impl.PosttopicManagerImpl;
import com.eleyuan.bean.Member;
import com.eleyuan.bean.Message;
import com.eleyuan.bean.Posttopic;
import com.eleyuan.service.PosttopicManager;
import com.eleyuan.util.PageModel;
import com.opensymphony.xwork2.ActionContext;


@Service
public class PosttopicManagerImpl extends InjectSessionFactory implements
	PosttopicManager {
	private static final Logger log = LoggerFactory.getLogger(PosttopicManagerImpl.class);

	public void addPosttopic(Posttopic posttopic) {
/*		ActionContext contents = ActionContext.getContext();*/
 
		try {

			getHibernateTemplate().save(posttopic);
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public Posttopic findPosttopicById(int id) {
		
		return (Posttopic)getHibernateTemplate().get(Posttopic.class, id);
			
	}

	/**
	 * 查询所有boke
	 */
	@SuppressWarnings("unchecked")
	public List<Posttopic> findAll() {
		log.debug("finding all Posttopic instances");
		try {
			String queryString = "from Posttopic order by id DESC";
			Query queryObject = getSession().createQuery(queryString)
					.setCacheable(true);
			
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Posttopic> findAllBy5() {
		log.debug("finding all Posttopic instances");
		try {
			String queryString = "from Posttopic order by id DESC";
			Query queryObject = getSession().createQuery(queryString)
					.setCacheable(true);
			queryObject.setFirstResult(0);
			queryObject.setMaxResults(16);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public PageModel findByUsername(final int pageNo, final int pageSize,
			final String username) {
		getHibernateTemplate().setCacheQueries(true);// ������ѯ����

		List<Posttopic> posttopicList = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						return session
						.createQuery(
								"from Posttopic m where m.username=:username order by m.id")
						.setString("username", username).setFirstResult(
								(pageNo - 1) * pageSize).setMaxResults(
								pageSize).list();
						}				
					
				});
		PageModel pageModuel = new PageModel(pageNo, pageSize, posttopicList);
		String hql = "select count(*) from Posttopic m where m.username=?";
		Long totalRecords = (Long) getHibernateTemplate().find(hql, username).get(
				0);

		pageModuel.setTotalRecords(totalRecords.intValue());
		return pageModuel;		
	}
	
	@SuppressWarnings("unchecked")
	public List<Posttopic> findByUsername(String username) {
		String hql = "from Posttopic t where t.username = ?";
		getHibernateTemplate().setCacheQueries(true);
		return getHibernateTemplate().find(hql, username);
	}
	
	
	//20110520kevin
/*	public Message getMessage(String id)
	{
		return (Message) getObject(Message.class, id);
	}*/
	

}