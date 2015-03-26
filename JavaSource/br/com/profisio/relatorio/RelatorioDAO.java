package br.com.profisio.relatorio;

import java.math.BigInteger;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import br.com.profisio.basics.Atividade;
import br.com.profisio.basics.Cadastro;
import br.com.profisio.basics.Colaborador;
import br.com.profisio.basics.Frequencia;
import br.com.profisio.basics.Servico;
import br.com.profisio.basics.enums.TipoCusto;
import br.com.profisio.util.DAOBase;

public class RelatorioDAO extends DAOBase {

	public RelatorioDAO() {
	}

	public static Object daoFactory() {
		return DAOBase.DAOFactory(RelatorioDAO.class);
	}

	@SuppressWarnings("unchecked")
	public Collection<Cadastro> getClientesFrequentes(Date dataInicial, Date dataFinal, Colaborador colaborador, Servico servico) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("colaborador", colaborador);
		if (colaborador != null)
			params.put("colaborador", colaborador.getId());
		params.put("servico", servico);
		if (servico != null)
			params.put("servico", servico.getId());
		return imp.createNamedQuery("getClientesFrequentes", params).list();
	}

	@SuppressWarnings("unchecked")
	public Collection<Cadastro> getNovosCadastros(Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		return imp.createNamedQuery("getNovosCadastros", params).list();
	}

	@SuppressWarnings("unchecked")
	public Collection<Frequencia> getFrequenciasByCadastro(Cadastro cliente, Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("cadastro", cliente);
		return imp.createNamedQuery("getFrequenciasByCadastro", params).list();
	}

	@SuppressWarnings("unchecked")
	public double getSomaContasReceberBruto(Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		Object soma = this.imp.queryObject("getSomaContasReceberBruto", params);
		if (soma == null)
			soma = 0.0;
		Object somaParcelas = this.imp.queryObject("getSomaContasReceberBrutoParcelas", params);
		if (somaParcelas == null)
			somaParcelas = 0.0;
		return (Double) somaParcelas + (Double) soma;
	}

	@SuppressWarnings("unchecked")
	public Double getSomaContasPagar(Date dataInicial, Date dataFinal, TipoCusto tipoCusto) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		if (tipoCusto != null)
			params.put("tipoCusto", tipoCusto.getValue());
		else
			params.put("tipoCusto", tipoCusto);
		Object valor = this.imp.queryObject("getSomaContasPagar", params);
		if (valor == null)
			valor = 0.0;
		return (Double) valor;
	}

	@SuppressWarnings("unchecked")
	public Collection<Cadastro> getClientesComAtividade(Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		return this.imp.createNamedQuery("getClientesComAtividade", params).list();
	}

	@SuppressWarnings("unchecked")
	public Double getSomaContasReceberByAtividade(Atividade atividade) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("atividade", atividade);
		Object valor = this.imp.queryObject("getSomaContasReceberByAtividade", params);
		if (valor == null)
			valor = 0.0;
		return (Double) valor;
	}

	@SuppressWarnings("unchecked")
	public Integer getQtdClientesFrequentes(Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		return ((BigInteger) this.imp.queryObject("getQtdClientesFrequentes", params)).intValue();
	}

}
