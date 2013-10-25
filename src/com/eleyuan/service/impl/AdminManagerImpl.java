package com.eleyuan.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Service;

import com.eleyuan.bean.Admin;
import com.eleyuan.service.AdminManager;
import com.eleyuan.service.MemberManager;
import com.eleyuan.util.PageModel;

@Service
public class AdminManagerImpl extends InjectSessionFactory implements
		AdminManager {

	/*public void addAdmin(Admin admin) {
		try {
			getHibernateTemplate().save(admin);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void deleteAdmin(int[] adminIdList) {
		for (int i = 0; i < adminIdList.length; i++) {
			Admin admin = getHibernateTemplate().load(admin.class,
					adminIdList[i]);
			getHibernateTemplate().delete(admin);
		}
	}

	public void modifyAdmin(Admin admin) {
		try {
			// 新密码为空时将密码保存为原始密码
			if (admin.getPassword() == null
					|| admin.getPassword().trim().length() == 0) {
				Admin adminOld = getHibernateTemplate().get(Admin.class,
						admin.getId());
				admin.setPassword(adminOld.getPassword());
				getHibernateTemplate().evict(adminOld);
			}

			getHibernateTemplate().update(admin);
		} catch (RuntimeException re) {
			throw re;
		}
	}*/

	@SuppressWarnings("unchecked")
	public List<Admin> findAdminByName(String name) {
		String hql = "from Admin m where m.username = ?";
		return getHibernateTemplate().find(hql, name);
	}

/*	@SuppressWarnings("unchecked")
	public PageModel findAllAdminByGrade(final int pageNo, final int pageSize,
			final String grade) {
		getHibernateTemplate().setCacheQueries(true);// 开启查询缓存

		List<Admin> memberList = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						return session
								.createQuery(
										"from Admin m where m.grade=:grade order by m.id")
								.setString("grade", grade).setFirstResult(
										(pageNo - 1) * pageSize).setMaxResults(
										pageSize).list();
					}
				});
		PageModel pageModuel = new PageModel(pageNo, pageSize, memberList);
		String hql = "select count(*) from Admin m where m.grade=?";
		Long totalRecords = (Long) getHibernateTemplate().find(hql, grade).get(
				0);

		pageModuel.setTotalRecords(totalRecords.intValue());
		return pageModuel;
	}

	@SuppressWarnings("unchecked")
	public PageModel findAllAdmin(final int pageNo, final int pageSize,
			final String queryStr) {
		getHibernateTemplate().setCacheQueries(true);

		List<Admin> memberList = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						return session
								.createQuery(
										"from Admin a where a.username like ? "
												+ "or a.sex = ? or a.type = ? or a.grade = ? order by a.id")
								.setParameter(0, "%" + queryStr + "%")
								.setParameter(1, queryStr).setParameter(2,
										queryStr).setParameter(3, queryStr)
								.setFirstResult((pageNo - 1) * pageSize)
								.setMaxResults(pageSize).setCacheable(true)
								.list();
					}
				});
		PageModel pageModel = new PageModel(pageNo, pageSize, memberList);

		// 查询记录总数
		Long totalRecords = 0l;
		if (queryStr != null && queryStr.trim().length() != 0) {
			totalRecords = (Long) this
					.getHibernateTemplate()
					.find(
							"select count(*) from Admin a "
									+ "where a.username like ? or a.sex = ? or a.type = ? or a.grade = ?",
							new Object[] { "%" + queryStr + "%", queryStr,
									queryStr, queryStr }).get(0);
		} else {
			totalRecords = (Long) this.getSession().createQuery(
					"select count(*) from Member a").uniqueResult();
		}

		pageModel.setTotalRecords(totalRecords.intValue());

		return pageModel;
	}

	public Admin findAdminById(int id) {
		return getHibernateTemplate().get(Admin.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<String> findNameMatched(String name) {
		HibernateTemplate hibernateTemplate = getHibernateTemplate();
		hibernateTemplate.setCacheQueries(true);

		String hql = "select a.username from Admin a where a.username like ?";
		return hibernateTemplate.find(hql, "%" + name + "%");
	}

	@SuppressWarnings("unchecked")
	public List<Admin> findAllTeacher() {
		HibernateTemplate hibernateTemplate = getHibernateTemplate();

		hibernateTemplate.setCacheQueries(true);
		// String hql =
		// "from Member m where m.type = '教师' ORDER BY NLSSORT(username, 'NLS_SORT = SCHINESE_PINYIN_M')";
		String hql = "from Admin m where m.type = '教师' ORDER BY m.username";
		return hibernateTemplate.find(hql);

	}*/
}