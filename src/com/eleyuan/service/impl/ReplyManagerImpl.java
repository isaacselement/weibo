package com.eleyuan.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.eleyuan.service.impl.ReplyManagerImpl;
import com.eleyuan.bean.Member;
import com.eleyuan.bean.Reply;
import com.eleyuan.service.ReplyManager;
import com.eleyuan.util.PageModel;
import com.opensymphony.xwork2.ActionContext;


@Service
public class ReplyManagerImpl extends InjectSessionFactory implements
	ReplyManager {
	private static final Logger log = LoggerFactory.getLogger(ReplyManagerImpl.class);

	public void addReply(Reply reply) {
/*		ActionContext contents = ActionContext.getContext();*/
 
		try {

			getHibernateTemplate().save(reply);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	/**
	 * 查询所有boke
	 */
	@SuppressWarnings("unchecked")
	public List<Reply> findAll() {
		log.debug("finding all Reply instances");
		try {
			String queryString = "from Reply order by id DESC";
			Query queryObject = getSession().createQuery(queryString)
					.setCacheable(true);
			
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

		List<Reply> ReplyList = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						return session
						.createQuery(
								"from Reply m where m.username=:username order by m.id")
						.setString("username", username).setFirstResult(
								(pageNo - 1) * pageSize).setMaxResults(
								pageSize).list();
						}				
					
				});
		PageModel pageModuel = new PageModel(pageNo, pageSize, ReplyList);
		String hql = "select count(*) from Reply m where m.username=?";
		Long totalRecords = (Long) getHibernateTemplate().find(hql, username).get(
				0);

		pageModuel.setTotalRecords(totalRecords.intValue());
		return pageModuel;		
	}
	
	@SuppressWarnings("unchecked")
	public List<Reply> findByUsername(String username) {
		String hql = "from Reply t where t.username = ?";
		getHibernateTemplate().setCacheQueries(true);
		return getHibernateTemplate().find(hql, username);
	}
	@SuppressWarnings("unchecked")
	public List<Reply> findAllByPosttopicId(int id) {
		String hql = "from Reply t where t.posttopicId = ?";
		getHibernateTemplate().setCacheQueries(true);
		return getHibernateTemplate().find(hql, id);
	}

	

}