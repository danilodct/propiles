package br.com.pilates.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.Map;

import br.com.pilates.base.ObjetoBasico;

public interface IHibernateDAO<T extends ObjetoBasico> {
	public Integer getQtEntity(Object paramObject);
	
	public void insert(T paramT);
	
	public T read(Class<T> paramClass, Serializable paramSerializable);
	
	public void delete(T paramT);
	
	public void update(T paramT);
	
	public void execute(String paramString, Map<String, Object> paramMap);
	
	public Collection<T> list(String paramString, Map<String, Object> paramMap);
	
	public Collection<T> list(String paramString, int paramInt1, int paramInt2, Map<String, Object> paramMap);
	
	public Object queryObject(String paramString, Map<String, Object> paramMap);
}
