package br.com.pilates.dao;

import java.util.Collection;

import br.com.pilates.base.CentroCusto;

public interface DAOCentroCusto extends IHibernateDAO<CentroCusto> {

	Collection<CentroCusto> getAllCentroCusto();

}
