package br.com.pilates.dao.impl;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import br.com.pilates.base.CentroCusto;
import br.com.pilates.base.ContaPagar;
import br.com.pilates.base.TipoContaPagar;
import br.com.pilates.base.enums.TipoCusto;

public class DAOContaPagarImpl extends HibernateDAO<ContaPagar> implements DAOContaPagar {

	@Override
	public Collection<ContaPagar> getContasPagarByMes(TipoCusto tipoCusto, Date mesAtual, Date mesProximo, CentroCusto centroCusto) {
		Map<String, Object> params = new HashMap<String, Object>();
		if (tipoCusto != null)
			params.put("tipoCusto", tipoCusto.getValue());
		else
			params.put("tipoCusto", tipoCusto);
		params.put("dataInicial", mesAtual);
		params.put("dataProxima", mesProximo);
		params.put("centroCusto", centroCusto);
		return list("getContasPagarByMes", params);
	}

	@Override
	public double getSomaSaidasByData(Date dataInicial, Date dataFinal, TipoCusto tipoCusto) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataProxima", dataFinal);
		if (tipoCusto != null)
			params.put("tipoCusto", tipoCusto.getValue());
		else
			params.put("tipoCusto", tipoCusto);
		Object valor = queryObject("getSomaSaidasByData", params);
		if (valor == null) {
			valor = 0.0;
		}
		return (Double) valor;
	}

	@Override
	public double getSomaSaidasLiquidasByData(Date dataInicial, Date dataFinal, TipoCusto tipoCusto) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataProxima", dataFinal);
		if (tipoCusto != null)
			params.put("tipoCusto", tipoCusto.getValue());
		else
			params.put("tipoCusto", tipoCusto);
		Object valor = queryObject("getSomaSaidasLiquidasByData", params);
		if (valor == null) {
			valor = 0.0;
		}
		return (Double) valor;
	}

	@Override
	public Double getSomaContaPagarByTipo(TipoContaPagar tipo, Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tipo", tipo);
		params.put("dataInicio", dataInicial);
		params.put("dataFinal", dataFinal);
		Object valor = queryObject("getSomaContaPagarByTipo", params);
		if (valor == null) {
			valor = 0.0;
		}
		return (Double) valor;
	}

}
