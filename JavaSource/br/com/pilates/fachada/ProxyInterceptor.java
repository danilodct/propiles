package br.com.pilates.fachada;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import org.hibernate.Session;

import br.com.pilates.dao.impl.HibernateUtil;
import br.com.pilates.excecao.PilatesException;

public class ProxyInterceptor implements InvocationHandler {
	private final Object target;
	
	private ProxyInterceptor(Object target) {
		this.target = target;
	}
	
	@SuppressWarnings("unchecked")
	public static Object newProxy(Object target) {
		Class clazz = target.getClass();
		return Proxy.newProxyInstance(clazz.getClassLoader(), clazz.getInterfaces(), new ProxyInterceptor(target));
	}
	
	public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
		Object retorno = null;
		Session currentSession = HibernateUtil.getInstance().getCurrentSession();
		try {
			currentSession.beginTransaction();
			Object result = method.invoke(this.target, args);
			currentSession.getTransaction().commit();
			retorno = result;
		}
		catch (InvocationTargetException e) {
			e.printStackTrace();
			currentSession.getTransaction().rollback();
			throw e.getCause();
		}
		catch (PilatesException e) {
			e.printStackTrace();
			currentSession.getTransaction().rollback();
			throw e;
		}
		catch (Exception e) {
			e.printStackTrace();
			currentSession.getTransaction().rollback();
			throw e;
		}
		finally {
			if ((currentSession != null) && (currentSession.isOpen())) {
				currentSession.close();
			}
		}
		return retorno;
	}
}
