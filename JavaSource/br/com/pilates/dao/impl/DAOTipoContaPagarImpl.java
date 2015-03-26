package br.com.pilates.dao.impl;

import java.util.Collection;

import br.com.pilates.base.TipoContaPagar;
import br.com.pilates.dao.DAOTipoContaPagar;

public class DAOTipoContaPagarImpl extends HibernateDAO<TipoContaPagar> implements DAOTipoContaPagar {
	
	@Override
	public Collection<TipoContaPagar> getAllTiposContaPagar() {
		return this.list("getAllTiposContaPagar");
	}
	
}
