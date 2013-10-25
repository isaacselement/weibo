package com.eleyuan.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Service;

import com.eleyuan.bean.Photo;
import com.eleyuan.service.PhotoManager;
import com.eleyuan.util.PageModel;

@Service
public class PhotoManagerImpl extends InjectSessionFactory implements
    PhotoManager {

	public void addPhoto(Photo photo) {
		try {
			getHibernateTemplate().save(photo);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void deletePhoto(int[] photoIdList) {
		for (int i = 0; i < photoIdList.length; i++) {
			Photo photo = getHibernateTemplate().load(Photo.class,
					photoIdList[i]);
			getHibernateTemplate().delete(photo);
		}
	}

	public void modifyPhoto(Photo photo) {
		try {
			getHibernateTemplate().update(photo);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Photo> findPhotoByName(String name) {
		String hql = "from Photo m where m.photoName = ?";
		return getHibernateTemplate().find(hql, name);
	}

	

	@SuppressWarnings("unchecked")
	public PageModel findAllPhoto(final int pageNo, final int pageSize,
			final String queryStr) {
		getHibernateTemplate().setCacheQueries(true);

		List<Photo> photoList = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						return session
								.createQuery(
										"from Photo a where a.photoName like ? "
												+ "or a.photoAddress = ? or a.photoDescription = ? or a.photoTime = ? order by a.id")
								.setParameter(0, "%" + queryStr + "%")
								.setParameter(1, queryStr).setParameter(2,
										queryStr).setParameter(3, queryStr)
								.setFirstResult((pageNo - 1) * pageSize)
								.setMaxResults(pageSize).setCacheable(true)
								.list();
					}
				});
		PageModel pageModel = new PageModel(pageNo, pageSize, photoList);

		// 查询记录总数
		Long totalRecords = 0l;
		if (queryStr != null && queryStr.trim().length() != 0) {
			totalRecords = (Long) this
					.getHibernateTemplate()
					.find(
							"select count(*) from Photo a "
									+ "where a.photoName like ? or a.photoAddress = ? or a.photoDescription = ? or a.photoTime = ?",
							new Object[] { "%" + queryStr + "%", queryStr,
									queryStr, queryStr }).get(0);
		} else {
			totalRecords = (Long) this.getSession().createQuery(
					"select count(*) from Photo a").uniqueResult();
		}

		pageModel.setTotalRecords(totalRecords.intValue());

		return pageModel;
	}

	public Photo findPhotoById(int id) {
		return getHibernateTemplate().get(Photo.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<String> findNameMatched(String name) {
		HibernateTemplate hibernateTemplate = getHibernateTemplate();
		hibernateTemplate.setCacheQueries(true);

		String hql = "select a.photoName from Photo a where a.photoName like ?";
		return hibernateTemplate.find(hql, "%" + name + "%");
	}

	@SuppressWarnings("unchecked")
	public List<Photo> findAllPhoto() {
		HibernateTemplate hibernateTemplate = getHibernateTemplate();

		hibernateTemplate.setCacheQueries(true);
		// String hql =
		// "from Member m where m.type = '教师' ORDER BY NLSSORT(username, 'NLS_SORT = SCHINESE_PINYIN_M')";
		String hql = "from Photo m ORDER BY m.photoName";
		return hibernateTemplate.find(hql);

	}

}