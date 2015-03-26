package br.com.pilates.dao;

import java.util.Collection;

import br.com.pilates.base.TipoContaReceber;
import br.com.pilates.base.enums.FormaPagamento;

public interface DAOTipoContaReceber extends IHibernateDAO<TipoContaReceber> {

	Collection<TipoContaReceber> getAllTiposContaReceber();

	int getQtContaReceberByFormaPagamento(FormaPagamento forma);

}
