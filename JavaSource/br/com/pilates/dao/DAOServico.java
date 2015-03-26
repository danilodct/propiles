package br.com.pilates.dao;

import java.util.Collection;

import br.com.pilates.base.Servico;

public interface DAOServico extends IHibernateDAO<Servico> {

	Collection<Servico> getAllServicos();

}
