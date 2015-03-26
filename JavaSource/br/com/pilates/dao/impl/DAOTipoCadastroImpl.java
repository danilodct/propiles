package br.com.pilates.dao.impl;

import java.util.Collection;

import br.com.pilates.base.TipoCadastro;
import br.com.pilates.dao.DAOTipoCadastro;

public class DAOTipoCadastroImpl extends HibernateDAO<TipoCadastro> implements DAOTipoCadastro {
	
	@Override
	public Collection<TipoCadastro> getAllTiposCadastro() {
		return this.list("getAllTiposCadastro");
	}
	
}
