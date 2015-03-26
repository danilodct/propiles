package br.com.pilates.dao.impl;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import br.com.pilates.base.Cadastro;
import br.com.pilates.base.Cliente;
import br.com.pilates.base.ContaReceber;
import br.com.pilates.base.Contrato;
import br.com.pilates.base.Professor;
import br.com.pilates.base.Servico;
import br.com.pilates.dao.DAOContaReceber;

public class DAOContaReceberImpl extends HibernateDAO<ContaReceber> implements DAOContaReceber {

	@Override
	public Collection<ContaReceber> getContasReceberByCadastro(Cadastro cadastro) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cadastro", cadastro);
		return this.list("getContasReceberByCadastro", params);
	}

	@Override
	public Collection<ContaReceber> getContasReceberByClienteModalidade(Cliente cliente, Servico servico) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cliente", cliente);
		params.put("servico", servico);
		return this.list("getContasReceberByClienteModalidade", params);
	}

	@Override
	public Collection<ContaReceber> getContasReceberByMes(Date mesAtual, Date mesProximo) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", mesAtual);
		params.put("dataProxima", mesProximo);
		return this.list("getContasReceberByMes", params);
	}

	@Override
	public Collection<ContaReceber> getContasReceberByProfessorData(Date dataInicial, Date dataFinal, Professor professor) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("professor", professor);
		return list("getContasReceberByProfessorData", params);
	}

	@Override
	public Collection<ContaReceber> getContasReceberAvulso(Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		return list("getContasReceberAvulso", params);
	}

	@Override
	public double getSomaEntradasByProfessorData(Date dataInicial, Date dataFinal, Professor professor) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("professor", professor);
		Object soma = queryObject("getSomaEntradasByProfessorData", params);
		if (soma == null) {
			soma = 0.0;
		}
		return (Double) soma;
	}

	@Override
	public double getSomaEntradasAvulso(Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		Object soma = queryObject("getSomaEntradasAvulso", params);
		if (soma == null) {
			soma = 0.0;
		}
		return (Double) soma;
	}

	@Override
	public double getSomaContaReceberByContrato(Date dataInicial, Date dataFinal, Contrato contrato, Professor professor) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("contrato", contrato);
		params.put("professor", professor);
		Object soma = queryObject("getSomaEntradasByContrato", params);
		if (soma == null) {
			soma = 0.0;
		}
		return (Double) soma;
	}

	@Override
	public Double getSomaContaReceberByModalidade(Servico serv, Date dataInicio, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("servico", serv);
		params.put("dataInicio", dataInicio);
		params.put("dataFinal", dataFinal);
		Object soma = queryObject("getSomaContaReceberByModalidade", params);
		if (soma == null) {
			soma = 0.0;
		}
		return (Double) soma;
	}

	@Override
	public double getEntradasCaixa(Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		Object soma = queryObject("getEntradasCaixa", params);
		if (soma == null) {
			soma = 0.0;
		}
		return (Double) soma;
	}

	@Override
	public double getEntradasLiquidasCaixa(Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		Object soma = queryObject("getEntradasLiquidasCaixa", params);
		if (soma == null) {
			soma = 0.0;
		}
		return (Double) soma;
	}

	@Override
	public double getEntradasLiquidasCaixaParcelas(Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		Object soma = queryObject("getEntradasLiquidasCaixaParcelas", params);
		if (soma == null) {
			soma = 0.0;
		}
		return (Double) soma;
	}

	@Override
	public double getSaidasCaixa(Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		Object soma = queryObject("getSaidasCaixa", params);
		if (soma == null) {
			soma = 0.0;
		}
		return (Double) soma;
	}

	@Override
	public double getEntradasVendasCaixa(Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		Object soma = queryObject("getEntradasVendasCaixa", params);
		if (soma == null) {
			soma = 0.0;
		}
		return (Double) soma;
	}

	@Override
	public double getDescontosEntradasCaixa(Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		Object soma = queryObject("getDescontosEntradasCaixa", params);
		if (soma == null) {
			soma = 0.0;
		}
		return (Double) soma;
	}

}
