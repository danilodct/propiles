package br.com.pilates.dao.impl;

import java.util.Collection;

import br.com.pilates.base.Servico;
import br.com.pilates.dao.DAOServico;

public class DAOServicoImpl extends HibernateDAO<Servico> implements DAOServico {

	@Override
	public Collection<Servico> getAllServicos() {
		return this.list("getAllServicos");
	}

}
