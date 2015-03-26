package br.com.pilates.dao;

import java.util.Collection;

import br.com.pilates.base.TipoContaPagar;

public interface DAOTipoContaPagar extends IHibernateDAO<TipoContaPagar> {
	
	Collection<TipoContaPagar> getAllTiposContaPagar();
	
}
