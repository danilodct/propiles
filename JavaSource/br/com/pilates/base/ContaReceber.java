package br.com.pilates.base;

import java.util.Date;

import br.com.pilates.base.enums.FormaPagamento;
import br.com.pilates.base.enums.StatusConta;
import br.com.pilates.util.SystemUtils;

public class ContaReceber extends ObjetoBasico {

	private Date dataVencimento;
	private Date dataPagamento;
	private Date dataLancamento;
	private double valor;
	private double descontos;
	private double caixa;
	private String observacao;
	private FormaPagamento formaPagamento;
	private TipoContaReceber tipo;
	private Cadastro cadastro;
	private StatusConta status;
	private Professor professor;
	private ContaReceber parcelamentoPai;
	private int ordemParcelamento;

	public ContaReceber() {
	}

	public Date getDataVencimento() {
		return dataVencimento;
	}

	public String getDataVencimentoStr() {
		return SystemUtils.parseDataToString(dataVencimento);
	}

	public void setDataVencimento(Date dataVencimento) {
		this.dataVencimento = dataVencimento;
	}

	public void setDataVencimentoStr(String dataVencimento) {
		this.dataVencimento = SystemUtils.parseStringToDate(dataVencimento);
	}

	public Date getDataLancamento() {
		return dataLancamento;
	}

	public String getDataLancamentoStr() {
		return SystemUtils.parseDataToString(dataLancamento);
	}

	public void setDataLancamento(Date dataLancamento) {
		this.dataLancamento = dataLancamento;
	}

	public void setDataLancamentoStr(String dataLancamento) {
		this.dataLancamento = SystemUtils.parseStringToDate(dataLancamento);
	}

	public String getDataPagamentoStr() {
		return SystemUtils.parseDataToString(dataPagamento);
	}

	public Date getDataPagamento() {
		return dataPagamento;
	}

	public void setDataPagamentoStr(String dataPagamento) {
		this.dataPagamento = SystemUtils.parseStringToDate(dataPagamento);
	}

	public void setDataPagamento(Date dataPagamento) {
		this.dataPagamento = dataPagamento;
	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

	public Cadastro getCadastro() {
		return cadastro;
	}

	public void setCadastro(Cadastro cadastro) {
		this.cadastro = cadastro;
	}

	public TipoContaReceber getTipo() {
		return tipo;
	}

	public void setTipo(TipoContaReceber tipo) {
		this.tipo = tipo;
	}

	public FormaPagamento getFormaPagamento() {
		return formaPagamento;
	}

	public void setFormaPagamento(FormaPagamento formaPagamento) {
		this.formaPagamento = formaPagamento;
	}

	public void setFormaPagamentoStr(String formaPagamento) {
		this.formaPagamento = FormaPagamento.createEnum(formaPagamento);
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public StatusConta getStatus() {
		return status;
	}

	public void setStatus(StatusConta status) {
		this.status = status;
	}

	public void setStatusStr(String status) {
		this.status = StatusConta.PAGO;
		if (status == null || status.equals("")) {
			this.status = StatusConta.PENDENTE;
		}
	}

	public Professor getProfessor() {
		return professor;
	}

	public void setProfessor(Professor professor) {
		this.professor = professor;
	}

	public double getValorPercentualProfessor() {
		return this.valor * this.cadastro.getModalidade().getPercentual() / 100;
	}

	public double getDescontos() {
		return descontos;
	}

	public void setDescontos(double descontos) {
		this.descontos = descontos;
	}

	public double getCaixa() {
		return caixa;
	}

	public void setCaixa(double caixa) {
		this.caixa = caixa;
	}

	public ContaReceber getParcelamentoPai() {
		return parcelamentoPai;
	}

	public void setParcelamentoPai(ContaReceber parcelamentoPai) {
		this.parcelamentoPai = parcelamentoPai;
	}

	public int getOrdemParcelamento() {
		return ordemParcelamento;
	}

	public void setOrdemParcelamento(int ordemParcelamento) {
		this.ordemParcelamento = ordemParcelamento;
	}

	public void parseDados(ContaReceber contaTemp) {
		contaTemp.setCadastro(cadastro);
		contaTemp.setCaixa(caixa);
		contaTemp.setDataLancamento(dataLancamento);
		contaTemp.setDataPagamento(dataPagamento);
		contaTemp.setDataVencimento(dataVencimento);
		contaTemp.setDescontos(descontos);
		contaTemp.setFormaPagamento(formaPagamento);
		contaTemp.setObservacao(observacao);
		contaTemp.setOrdemParcelamento(ordemParcelamento);
		contaTemp.setParcelamentoPai(contaTemp);
		contaTemp.setProfessor(professor);
		contaTemp.setStatus(status);
		contaTemp.setStatusObjeto(this.getStatusObjeto());
		contaTemp.setTipo(tipo);
		contaTemp.setValor(valor);
	}

}
