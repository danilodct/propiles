package br.com.pilates.dao.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import br.com.pilates.base.ObjetoBasico;
import br.com.pilates.dao.IHibernateDAO;
import br.com.pilates.excecao.PilatesException;
import br.com.pilates.util.PilatesBundleUtil;

@SuppressWarnings("unchecked")
public class HibernateDAO<T extends ObjetoBasico> implements IHibernateDAO<T> {
	
	public Collection<T> sublist(String namedQuery, int pag, int paginacaoAtual) {
		int start = (paginacaoAtual - 1) * pag;
		return list(namedQuery, start, pag);
	}
	
	public Collection<T> sublist(String namedQuery, Map<String, Object> params, int pag, int paginacaoAtual) {
		int start = (paginacaoAtual - 1) * pag;
		return list(namedQuery, start, pag, params);
	}
	
	public Integer getQtEntity(Object obj) {
		String className = obj.getClass().getSimpleName();
		return Integer.valueOf(((Long) createQueryUnique("select count(*) from " + className)).intValue());
	}
	
	public int getNextId(T t) {
		insert(t);
		int nextId = t.getId().intValue() + 1;
		delete(t);
		return nextId;
	}
	
	public void insertOrUpdate(T t) {
		if (t != null) {
			HibernateUtil.getInstance().getCurrentSession().saveOrUpdate(t);
		} else {
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		}
	}
	
	public void update(T t) {
		if (t != null) {
			HibernateUtil.getInstance().getCurrentSession().update(t);
		} else {
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		}
	}
	
	public void insert(T t) {
		if (t != null) {
			HibernateUtil.getInstance().getCurrentSession().save(t);
		} else {
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		}
	}
	
	public T read(Class<T> clazz, Serializable id) {
		if ((clazz == null) || (id == null)) {
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		}
		return ((T) HibernateUtil.getInstance().getCurrentSession().get(clazz, id));
	}
	
	public void delete(T t) {
		if (t != null) {
			HibernateUtil.getInstance().getCurrentSession().delete(t);
		} else {
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		}
	}
	
	public void execute(String namedQuery, Map<String, Object> params) {
		createNamedQuery(namedQuery, params).executeUpdate();
	}
	
	public Collection<T> list(String namedQuery, Map<String, Object> params) {
		return createNamedQuery(namedQuery, params).list();
	}
	
	public Collection<T> list(String namedQuery, Map<String, Object> params, String ordenacao) {
		return createNamedQuery(namedQuery, params, ordenacao).list();
	}
	
	public Collection<T> list(String namedQuery) {
		return createNamedQuery(namedQuery).list();
	}
	
	public Collection<T> list(String namedQuery, Map<String, Object> params, int maxResult) {
		return createNamedQuery(namedQuery, params).setMaxResults(maxResult).list();
	}
	
	public Collection<Integer> listIntegers(String namedQuery) {
		Session session = HibernateUtil.getInstance().getCurrentSession();
		return session.createSQLQuery(namedQuery).list();
	}
	
	public Collection<T> list(String namedQuery, int maxResult) {
		return createNamedQuery(namedQuery).setMaxResults(maxResult).list();
	}
	
	public Collection<T> list(String namedQuery, int index, int size, Map<String, Object> params) {
		if ((index < 0) || (size < 0)) {
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		}
		
		Query q = createNamedQuery(namedQuery, params);
		q.setFirstResult(index);
		q.setMaxResults(size);
		return q.list();
	}
	
	public Collection<T> list(String namedQuery, int index, int size) {
		if ((index < 0) || (size < 0)) {
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		}
		Query q = createNamedQuery(namedQuery);
		q.setFirstResult(index);
		q.setMaxResults(size);
		return q.list();
	}
	
	public Object queryObject(String namedQuery, Map<String, Object> params) {
		return createNamedQuery(namedQuery, params).uniqueResult();
	}
	
	public Object queryObject(String namedQuery) {
		return createNamedQuery(namedQuery).uniqueResult();
	}
	
	@SuppressWarnings("rawtypes")
	private Query createNamedQuery(String namedQuery, Map<String, Object> params, String ordenacao) {
		String ordenacaoStr = " order by " + ordenacao + " asc";
		String queryStr = HibernateUtil.getInstance().getCurrentSession().getNamedQuery(namedQuery).getQueryString() + ordenacaoStr;
		Query query = HibernateUtil.getInstance().getCurrentSession().createQuery(queryStr);
		Iterator<String> iterator = params.keySet().iterator();
		while (iterator.hasNext()) {
			String key = iterator.next();
			Object object = params.get(key);
			try {
				query.setParameterList(key, (Collection) object);
			} catch (Exception e) {
				query.setParameter(key, object);
			}
		}
		return query;
	}
	
	@SuppressWarnings("rawtypes")
	private Query createNamedQuery(String namedQuery, Map<String, Object> params) {
		Query query = HibernateUtil.getInstance().getCurrentSession().getNamedQuery(namedQuery);
		Iterator<String> iterator = params.keySet().iterator();
		while (iterator.hasNext()) {
			String key = iterator.next();
			Object object = params.get(key);
			try {
				query.setParameterList(key, (Collection) object);
			} catch (Exception e) {
				query.setParameter(key, object);
			}
		}
		return query;
	}
	
	protected Query createNamedQuery(String namedQuery) {
		return HibernateUtil.getInstance().getCurrentSession().getNamedQuery(namedQuery);
	}
	
	private Object createQueryUnique(String query) {
		return HibernateUtil.getInstance().getCurrentSession().createQuery(query).uniqueResult();
	}
	
}
