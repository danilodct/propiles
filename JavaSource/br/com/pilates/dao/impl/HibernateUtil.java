package br.com.pilates.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	private static HibernateUtil instance;
	private SessionFactory sessionDefault;
	
	private SessionFactory getSessionFactory() {
		if (this.sessionDefault == null) {
			this.sessionDefault = new Configuration().configure().buildSessionFactory();
		}
		return this.sessionDefault;
	}
	
	public Session getCurrentSession() {
		return getSessionFactory().getCurrentSession();
	}
	
	public static HibernateUtil getInstance() {
		if (instance == null) {
			instance = new HibernateUtil();
		}
		return instance;
	}
}
