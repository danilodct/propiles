package br.com.profisio.basics;

import java.util.Date;

import br.com.profisio.basics.enums.FormaPagamento;
import br.com.profisio.basics.enums.StatusConta;
import br.com.profisio.util.SystemUtils;

public class ContaReceber extends ObjetoBasico {

	private Date dataPagamento, dataLancamento;
	private Double valor, descontos, caixa, valorCheio;
	private String observacao;
	private FormaPagamento formaPagamento;
	private Atividade atividade;
	private StatusConta status;
	private Colaborador colaborador;
	private ContaReceber parcelamentoPai;
	private Movimentacao movimentacao;
	private Integer qtdSessoes, qtdParcelas;
	// apenas para diferenciar a contaReceber que guardará o valor cheio que é o
	// valor sem ser parcelado
	private Boolean primeiraParcela;
	private int ordemParcelamento;
	// usado para saber se a contaReceber é para um colaborador diferente do da
	// atividade
	private Boolean outroColaborador;

	public ContaReceber() {
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

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public String getValorStr() {
		return SystemUtils.parseDoubleToString(valor);
	}

	public void setValorStr(String valor) {
		this.valor = SystemUtils.parseStringDouble(valor);
	}

	public Double getValorCheioComDesconto() {
		Double valorCheioComDesconto = this.valorCheio;
		if (this.formaPagamento != null) {
			valorCheioComDesconto = this.valorCheio - this.valorCheio * this.formaPagamento.getDesconto();
		}
		return valorCheioComDesconto;
	}

	public String getValorCheioComDescontoStr() {
		Double valorCheioComDesconto = this.valorCheio;
		if (this.formaPagamento != null) {
			valorCheioComDesconto = this.valorCheio - this.valorCheio * this.formaPagamento.getDesconto();
		}
		return SystemUtils.parseDoubleToString(valorCheioComDesconto);
	}

	public Double getValorCheio() {
		return valorCheio;
	}

	public void setValorCheio(Double valor) {
		this.valorCheio = valor;
	}

	public String getValorCheioStr() {
		return SystemUtils.parseDoubleToString(valorCheio);
	}

	public void setValorCheioStr(String valor) {
		this.valorCheio = SystemUtils.parseStringDouble(valor);
	}

	public Atividade getAtividade() {
		return atividade;
	}

	public void setAtividade(Atividade atividade) {
		this.atividade = atividade;
	}

	public FormaPagamento getFormaPagamento() {
		return formaPagamento;
	}

	public String getFormaPagamentoStr() {
		String formaPagamentoStr = null;
		if (this.formaPagamento != null)
			formaPagamentoStr = this.formaPagamento.getValue();
		return formaPagamentoStr;
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

	public Colaborador getColaborador() {
		return colaborador;
	}

	public Colaborador getColaboradorCerto() {
		Colaborador colaboradorTemp = colaborador;
		if (outroColaborador != null && !outroColaborador && atividade != null && atividade.getContrato() != null)
			colaboradorTemp = this.atividade.getContrato().getColaborador();
		return colaboradorTemp;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}

	public Double getValorPercentualColaborador() {
		return this.valor * this.atividade.getContrato().getPercentual() / 100;
	}

	public Double getDescontos() {
		return descontos;
	}

	public void setDescontos(Double descontos) {
		this.descontos = descontos;
	}

	public String getDescontosStr() {
		return SystemUtils.parseDoubleToString(descontos);
	}

	public void setDescontosStr(String descontos) {
		this.descontos = SystemUtils.parseStringDouble(descontos);
	}

	public Double getCaixa() {
		return caixa;
	}

	public void setCaixa(Double caixa) {
		this.caixa = caixa;
	}

	public String getCaixaStr() {
		return SystemUtils.parseDoubleToString(caixa);
	}

	public void setCaixaStr(String caixa) {
		this.caixa = SystemUtils.parseStringDouble(caixa);
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
		contaTemp.setAtividade(atividade);
		contaTemp.setCaixa(caixa);
		contaTemp.setDataLancamento(dataLancamento);
		contaTemp.setDataPagamento(dataPagamento);
		contaTemp.setDescontos(descontos);
		contaTemp.setFormaPagamento(formaPagamento);
		contaTemp.setObservacao(observacao);
		contaTemp.setOrdemParcelamento(ordemParcelamento);
		contaTemp.setParcelamentoPai(contaTemp);
		contaTemp.setColaborador(colaborador);
		contaTemp.setStatus(status);
		contaTemp.setStatusObjeto(this.getStatusObjeto());
		contaTemp.setValor(valor);
		contaTemp.setOutroColaborador(outroColaborador);
	}

	public Boolean getOutroColaborador() {
		return outroColaborador;
	}

	public void setOutroColaborador(Boolean outroColaborador) {
		this.outroColaborador = outroColaborador;
	}

	public Movimentacao getMovimentacao() {
		return movimentacao;
	}

	public void setMovimentacao(Movimentacao movimentacao) {
		this.movimentacao = movimentacao;
	}

	public Boolean getPrimeiraParcela() {
		return primeiraParcela;
	}

	public void setPrimeiraParcela(Boolean primeiraParcela) {
		this.primeiraParcela = primeiraParcela;
	}

	public Integer getQtdSessoes() {
		return qtdSessoes;
	}

	public void setQtdSessoes(Integer qtdSessoes) {
		this.qtdSessoes = qtdSessoes;
	}

	public Integer getQtdParcelas() {
		return qtdParcelas;
	}

	public void setQtdParcelas(Integer qtdParcelas) {
		this.qtdParcelas = qtdParcelas;
	}

}
