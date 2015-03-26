package br.com.pilates.dao.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import br.com.pilates.base.TipoContaReceber;
import br.com.pilates.base.enums.FormaPagamento;
import br.com.pilates.dao.DAOTipoContaReceber;

public class DAOTipoContaReceberImpl extends HibernateDAO<TipoContaReceber> implements DAOTipoContaReceber {

	@Override
	public Collection<TipoContaReceber> getAllTiposContaReceber() {
		return this.list("getAllTiposContaReceber");
	}

	@Override
	public int getQtContaReceberByFormaPagamento(FormaPagamento forma) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("forma", forma);
		return ((Long) this.queryObject("getQtContaReceberByFormaPagamento", params)).intValue();
	}
}
