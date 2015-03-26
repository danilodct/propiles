package br.com.pilates.dao.impl;

import java.util.Collection;

import br.com.pilates.base.CentroCusto;
import br.com.pilates.dao.DAOCentroCusto;

public class DAOCentroCustoImpl extends HibernateDAO<CentroCusto> implements DAOCentroCusto {

	@Override
	public Collection<CentroCusto> getAllCentroCusto() {
		return this.list("getAllCentroCusto");
	}

}
