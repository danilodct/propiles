package br.com.profisio.util;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;

import net.sf.cglib.proxy.Enhancer;
import net.sf.cglib.proxy.MethodInterceptor;
import net.sf.cglib.proxy.MethodProxy;

import org.apache.log4j.Logger;
import org.hibernate.Query;

import br.com.profisio.basics.ObjetoBasico;
import br.com.profisio.basics.Usuario;

public class DAOBase implements MethodInterceptor {

	// Acesso a implementacao.
	@SuppressWarnings("rawtypes")
	protected final DAOBaseImpl imp = new DAOBaseImpl();

	// Logging Util
	static Logger logger = Logger.getLogger(DAOBase.class);

	/**
	 * Factory for the DAO objects.
	 * 
	 * @param classObj
	 *            - This is the class type. ex.: Object.class
	 * @return Proxy
	 */
	public static Object DAOFactory(Class<?> classObj) {
		return Enhancer.create(classObj, new DAOBase());
	}

	/**
	 * Interceptor
	 */
	@Override
	public Object intercept(Object obj, Method method, Object[] args, MethodProxy methodProxy) throws Throwable {

		// Pega usuario da sessao
		Object retorno = null;
		Usuario userSession = ProfisioSessionUtil.getUserSession();
		Integer userId = -1;

		//
		if (userSession != null)
			userId = userSession.getId();

		try {
			// Inicia a transaction
			HibernateUtil.getInstance().getCurrentSession().beginTransaction();

			// Chama o metodo proxiado
			Object result = methodProxy.invokeSuper(obj, args);

			// Commita transaction
			HibernateUtil.getInstance().getCurrentSession().getTransaction().commit();

			//
			retorno = result;

		} catch (Exception e) {
			HibernateUtil.getInstance().getCurrentSession().getTransaction().rollback();
			throw e;
		} finally {
			if ((HibernateUtil.getInstance().getCurrentSession() != null) && (HibernateUtil.getInstance().getCurrentSession().isOpen())) {
				HibernateUtil.getInstance().getCurrentSession().close();
			}
		}
		return retorno;
	}

	/**
	 * Implementation, to bypass some interceptions.
	 * 
	 * @author lzt
	 * 
	 */
	protected class DAOBaseImpl<T extends ObjetoBasico> {

		/**
		 * DAO insert
		 * 
		 * @param obj
		 */
		public void insert(T obj) {

			if (obj != null) {
				HibernateUtil.getInstance().getCurrentSession().save(obj);
			} else {
				throw new ProfisioException(ProfisioBundleUtil.NO_OBJECT_SELECTED);
			}
		}

		@SuppressWarnings("unchecked")
		public T read(Class<T> clazz, Serializable id) {
			if ((clazz == null) || (id == null)) {
				throw new ProfisioException(ProfisioBundleUtil.NO_OBJECT_SELECTED);
			}
			return (T) (HibernateUtil.getInstance().getCurrentSession().get(clazz, id));
		}

		/**
		 * 
		 * @param obj
		 */
		public void update(T obj) {
			if (obj != null) {
				HibernateUtil.getInstance().getCurrentSession().update(obj);
			} else {
				throw new ProfisioException(ProfisioBundleUtil.NO_OBJECT_SELECTED);
			}
		}

		/**
		 * 
		 * @param t
		 */
		public void delete(T obj) {
			if (obj != null) {
				HibernateUtil.getInstance().getCurrentSession().delete(obj);
			} else {
				throw new ProfisioException(ProfisioBundleUtil.NO_OBJECT_SELECTED);
			}
		}

		/**
		 * 
		 * @param namedQuery
		 * @param params
		 */
		public void execute(String namedQuery, Map<String, Object> params) {
			createNamedQuery(namedQuery, params).executeUpdate();
		}

		/**
		 * 
		 * @param namedQuery
		 */
		public void execute(String namedQuery) {
			createNamedQuery(namedQuery).executeUpdate();
		}

		/**
		 * 
		 * @param obj
		 */
		public void insertOrUpdate(T obj) {
			if (obj != null) {
				HibernateUtil.getInstance().getCurrentSession().saveOrUpdate(obj);
			} else {
				throw new ProfisioException(ProfisioBundleUtil.NO_OBJECT_SELECTED);
			}
		}

		/**
		 * Creates named query without parameters.
		 * 
		 * @param namedQuery
		 * @return
		 */
		public Query createNamedQuery(String namedQuery) {
			return HibernateUtil.getInstance().getCurrentSession().getNamedQuery(namedQuery);
		}

		/**
		 * Cria named query com parametros.
		 * 
		 * @param namedQuery
		 * @param params
		 * @return
		 */
		@SuppressWarnings("rawtypes")
		public Query createNamedQuery(String namedQuery, Map<String, Object> params) {

			// get query object from Hibernate.
			Query query = HibernateUtil.getInstance().getCurrentSession().getNamedQuery(namedQuery);

			// iterate throught parameters to build query
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

		/**
		 * 
		 * @param namedQuery
		 * @param params
		 * @return
		 */
		public Object queryObject(String namedQuery, Map<String, Object> params) {
			return createNamedQuery(namedQuery, params).uniqueResult();
		}

		/**
		 * 
		 * @param namedQuery
		 * @return
		 */
		public Object queryObject(String namedQuery) {
			return createNamedQuery(namedQuery).uniqueResult();
		}

		/**
		 * return unique result over query.
		 * 
		 * @param query
		 * @return
		 */
		public Object createQueryUnique(String query) {
			return HibernateUtil.getInstance().getCurrentSession().createQuery(query).uniqueResult();
		}

	}

}
