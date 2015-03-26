package br.com.pilates.control.impl;

import br.com.pilates.base.ObjetoBasico;
import br.com.pilates.control.ControlObjetoBasico;
import br.com.pilates.dao.impl.HibernateDAO;

public class ControlObjetoBasicoImpl implements ControlObjetoBasico {
	
	private final HibernateDAO<ObjetoBasico> dao;
	
	public ControlObjetoBasicoImpl() {
		dao = new HibernateDAO<ObjetoBasico>();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ObjetoBasico read(Class clazz, Integer id) {
		return this.dao.read(clazz, id);
	}
	
	@Override
	public void save(ObjetoBasico mat) {
		this.dao.insertOrUpdate(mat);
	}
	
	@Override
	public void update(ObjetoBasico pergunta) {
		this.dao.update(pergunta);
	}
	
	@Override
	public void delete(ObjetoBasico obj) {
		this.dao.delete(obj);
	}
	
}
