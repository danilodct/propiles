package br.com.profisio.financeiro;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.hibernate.Query;

import br.com.profisio.basics.Atividade;
import br.com.profisio.basics.Cadastro;
import br.com.profisio.basics.CentroCusto;
import br.com.profisio.basics.Colaborador;
import br.com.profisio.basics.ContaPagar;
import br.com.profisio.basics.ContaReceber;
import br.com.profisio.basics.Movimentacao;
import br.com.profisio.basics.Servico;
import br.com.profisio.basics.TipoContaPagar;
import br.com.profisio.basics.enums.FormaPagamento;
import br.com.profisio.basics.enums.StatusConta;
import br.com.profisio.basics.enums.TipoCusto;
import br.com.profisio.util.DAOBase;
import br.com.profisio.util.Tenant;

public class FinanceiroDAO extends DAOBase {

	public FinanceiroDAO() {
	}

	public static Object daoFactory() {
		return DAOBase.DAOFactory(FinanceiroDAO.class);
	}

	@SuppressWarnings("unchecked")
	public Collection<ContaReceber> getContasReceberByCadastro(Cadastro cadastro) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cadastro", cadastro);
		return imp.createNamedQuery("getContasReceberByCadastro", params).list();
	}

	@SuppressWarnings("unchecked")
	public void remover(ContaReceber contaReceber) {
		this.imp.delete(contaReceber);
	}

	@SuppressWarnings("unchecked")
	public void cadastrar(ContaReceber contaReceber) {
		this.imp.insert(contaReceber);
	}

	@SuppressWarnings("unchecked")
	public void cadastrar(ContaPagar contaPagar) {
		this.imp.insert(contaPagar);
	}

	@SuppressWarnings("unchecked")
	public Collection<ContaPagar> getContasPagar(Tenant tenant, TipoCusto tipoCusto, Date dataInicial, Date dataFinal, CentroCusto centroCusto, TipoContaPagar tipoContaPagar, StatusConta statusContaPagar, Boolean geral) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("tipoCusto", tipoCusto);
		if (tipoCusto != null)
			params.put("tipoCusto", tipoCusto.getValue());
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("centroCusto", centroCusto);
		params.put("tipoContaPagar", tipoContaPagar);
		params.put("statusContaPagar", statusContaPagar);
		if (statusContaPagar != null)
			params.put("statusContaPagar", statusContaPagar.getValue());
		params.put("geral", geral);
		return this.imp.createNamedQuery("getContasPagar", params).list();
	}

	@SuppressWarnings("unchecked")
	public void remover(ContaPagar contaPagar) {
		this.imp.delete(contaPagar);
	}

	@SuppressWarnings("unchecked")
	public Collection<TipoContaPagar> getAllTiposContaPagar(Tenant tenant) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		return this.imp.createNamedQuery("getAllTiposContaPagar", params).list();
	}

	@SuppressWarnings("unchecked")
	public ContaPagar getContaPagarById(Integer id) {
		return (ContaPagar) this.imp.read(ContaPagar.class, id);
	}

	@SuppressWarnings("unchecked")
	public void cadastrar(TipoContaPagar tipo) {
		this.imp.insertOrUpdate(tipo);
	}

	@SuppressWarnings("unchecked")
	public void editar(ContaPagar contaPagar) {
		this.imp.update(contaPagar);
	}

	@SuppressWarnings("unchecked")
	public Collection<ContaReceber> getContasReceber(Tenant tenant, Date dataInicial, Date dataFinal, FormaPagamento formaPagamento, Colaborador colaborador, Servico servico, StatusConta statusContaPagar) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("colaborador", colaborador);
		params.put("servico", servico);
		params.put("formaPagamento", formaPagamento);
		if (formaPagamento != null)
			params.put("formaPagamento", formaPagamento.getValue());
		params.put("statusContaPagar", statusContaPagar);
		if (statusContaPagar != null)
			params.put("statusContaPagar", statusContaPagar.getValue());
		return this.imp.createNamedQuery("getContasReceber", params).list();
	}

	@SuppressWarnings("unchecked")
	public Collection<ContaReceber> getContasReceberAvulso(Tenant tenant, Date dataInicial, Date dataFinal, FormaPagamento formaPagamento, StatusConta statusContaPagar) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("formaPagamento", formaPagamento);
		if (formaPagamento != null)
			params.put("formaPagamento", formaPagamento.getValue());
		params.put("statusContaPagar", statusContaPagar);
		if (statusContaPagar != null)
			params.put("statusContaPagar", statusContaPagar.getValue());
		return this.imp.createNamedQuery("getContasReceberAvulso", params).list();
	}

	@SuppressWarnings("unchecked")
	public Movimentacao getMovimentacaoByContaPagar(ContaPagar contaPagar) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("contaPagar", contaPagar);
		return (Movimentacao) this.imp.queryObject("getMovimentacaoByContaPagar", params);
	}

	@SuppressWarnings("unchecked")
	public Collection<Movimentacao> getMovimentacoes(Tenant tenant, Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		return this.imp.createNamedQuery("getMovimentacoes", params).list();
	}

	@SuppressWarnings("unchecked")
	public Double getSomaMovimentacoes(Tenant tenant, Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		Query createNamedQuery = this.imp.createNamedQuery("getSomaMovimentacoes", params);
		Double double1 = (Double) createNamedQuery.uniqueResult();
		if (double1 == null)
			double1 = 0.0;
		return double1;
	}

	@SuppressWarnings("unchecked")
	public void editar(ContaReceber contaReceber) {
		this.imp.update(contaReceber);
	}

	@SuppressWarnings("unchecked")
	public void cadastrar(Movimentacao movimentacao) {
		this.imp.insert(movimentacao);
	}

	@SuppressWarnings("unchecked")
	public void editar(Movimentacao movBd) {
		this.imp.update(movBd);
	}

	@SuppressWarnings("unchecked")
	public ContaReceber getContaReceberById(Integer id) {
		return (ContaReceber) this.imp.read(ContaReceber.class, id);
	}

	@SuppressWarnings("unchecked")
	public Collection<ContaReceber> getParcelasByContaReceber(ContaReceber contaReceber) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pai", contaReceber);
		return this.imp.createNamedQuery("getParcelasByContaReceber", params).list();
	}

	@SuppressWarnings("unchecked")
	public Collection<ContaReceber> getPagamentosCheiosByAtividade(Atividade atividade) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("atividade", atividade);
		return imp.createNamedQuery("getPagamentosCheiosByAtividade", params).list();
	}

	@SuppressWarnings("unchecked")
	public void removerMovimentacao(ContaReceber contaReceber) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("contaReceber", contaReceber);
		imp.execute("removerMovimentacao", params);
	}

	@SuppressWarnings("unchecked")
	public void desassociarFrequenciasContaReceber(ContaReceber contaReceber) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("contaReceber", contaReceber);
		imp.execute("desassociarFrequenciasContaReceber", params);
	}

	@SuppressWarnings("unchecked")
	public Collection<ContaPagar> getPagamentosColaboradores(Tenant tenant, Colaborador colaborador, Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("colaborador", colaborador);
		return imp.createNamedQuery("getPagamentosColaboradores", params).list();
	}

	@SuppressWarnings("unchecked")
	public void removerAgendamentosContaReceber(ContaReceber contaReceber) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("contaReceber", contaReceber);
		imp.execute("removerAgendamentosContaReceber", params);
	}

	@SuppressWarnings("unchecked")
	public TipoContaPagar getTipoContaPagarById(Integer id) {
		return (TipoContaPagar) this.imp.read(TipoContaPagar.class, id);
	}

	@SuppressWarnings("unchecked")
	public Integer getQtdContasPagar(Tenant tenant) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		return ((Long) imp.queryObject("getQtdContasPagar", params)).intValue();
	}

	@SuppressWarnings("unchecked")
	public Integer getQtdContasReceber(Tenant tenant) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		return ((Long) imp.queryObject("getQtdContasReceber", params)).intValue();
	}
}
