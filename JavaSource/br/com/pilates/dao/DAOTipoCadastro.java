package br.com.pilates.dao;

import java.util.Collection;

import br.com.pilates.base.TipoCadastro;

public interface DAOTipoCadastro extends IHibernateDAO<TipoCadastro> {
	
	Collection<TipoCadastro> getAllTiposCadastro();
	
}
