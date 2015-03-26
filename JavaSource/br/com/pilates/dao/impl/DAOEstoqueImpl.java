package br.com.pilates.dao.impl;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import br.com.pilates.base.Estoque;
import br.com.pilates.base.Professor;
import br.com.pilates.dao.DAOEstoque;

public class DAOEstoqueImpl extends HibernateDAO<Estoque> implements DAOEstoque {

	@Override
	public Collection<Estoque> getEstoques(Date dataInicial, Date dataFinal, String status, String nome) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		if (status != null && status.equals(""))
			status = null;
		params.put("status", status);
		if (nome == null || nome.equals("")) {
			params.put("nome1", null);
			params.put("nome2", null);
		} else {
			params.put("nome1", nome + "%");
			params.put("nome2", "% " + nome + "%");
		}
		return this.list("getEstoques", params);
	}

	@Override
	public Collection<Estoque> getEstoquesVendido(Date dataInicial, Date dataFinal, Professor vendedor) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("vendedor", vendedor);
		return this.list("getEstoquesVendido", params);
	}

	@Override
	public double getSomaVendasByProfessorData(Date dataInicial, Date dataFinal, Professor professor) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("vendedor", professor);
		Object soma = this.queryObject("getSomaVendasByProfessorData", params);
		if (soma == null) {
			soma = 0.0;
		}
		return (Double) soma;
	}

	@Override
	public double getSomaVendas(Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		Object soma = this.queryObject("getSomaVendas", params);
		if (soma == null) {
			soma = 0.0;
		}
		return (Double) soma;
	}

}
