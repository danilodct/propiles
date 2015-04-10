package br.com.profisio.basics;

import java.util.Date;

import br.com.profisio.basics.enums.StatusConta;
import br.com.profisio.basics.enums.TipoCusto;
import br.com.profisio.util.SystemUtils;

public class ContaPagar extends ObjetoBasico {

	private Double valor;
	private Date dataVencimento, dataPagamento, mesCompetencia;
	private TipoContaPagar tipo;
	private StatusConta status;
	private TipoCusto tipoCusto;
	private CentroCusto centroCusto;
	private Movimentacao movimentacao;
	private String observacao;
	private String numRef;
	//serve para inserir pagamentos aos colaboradores
	private Colaborador colaborador;

	public ContaPagar() {

	}

	public Double getValor() {
		return valor;
	}

	public String getValorStr() {
		return SystemUtils.parseDoubleToString(valor);
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public void setValorStr(String valor) {
		this.valor = SystemUtils.parseStringDouble(valor);
	}

	public String getDataVencimentoStr() {
		return SystemUtils.parseDataToString(dataVencimento);
	}

	public void setDataVencimentoStr(String dataVencimento) {
		this.dataVencimento = SystemUtils.parseStringToDate(dataVencimento);
	}

	public Date getDataVencimento() {
		return dataVencimento;
	}

	public void setDataVencimento(Date dataVencimento) {
		this.dataVencimento = dataVencimento;
	}

	public String getDataPagamentoStr() {
		return SystemUtils.parseDataToString(dataPagamento);
	}

	public void setDataPagamentoStr(String dataPagamento) {
		this.dataPagamento = SystemUtils.parseStringToDate(dataPagamento);
	}

	public Date getDataPagamento() {
		return dataPagamento;
	}

	public void setDataPagamento(Date dataPagamento) {
		this.dataPagamento = dataPagamento;
	}

	public TipoContaPagar getTipo() {
		return tipo;
	}

	public void setTipo(TipoContaPagar tipo) {
		this.tipo = tipo;
	}

	public StatusConta getStatus() {
		return status;
	}

	public String getStatusStr() {
		String statusStr = "";
		if (this.status != null)
			statusStr = this.status.getValue();
		return statusStr;
	}

	public void setStatus(StatusConta status) {
		this.status = status;
	}

	public void setStatusStr(String status) {
		this.status = StatusConta.createEnum(status);
		if (status == null || status.equals("")) {
			this.status = StatusConta.PENDENTE;
		}
	}

	public TipoCusto getTipoCusto() {
		return tipoCusto;
	}

	public String getTipoCustoStr() {
		String tipoCustoStr = "";
		if (this.tipoCusto != null)
			tipoCustoStr = tipoCusto.getValue();
		return tipoCustoStr;
	}

	public void setTipoCusto(TipoCusto tipoCusto) {
		this.tipoCusto = tipoCusto;
	}

	public void setTipoCustoStr(String tipoCusto) {
		this.tipoCusto = TipoCusto.createEnum(tipoCusto);
	}

	public Date getMesCompetencia() {
		return mesCompetencia;
	}

	public void setMesCompetencia(Date mesCompetencia) {
		this.mesCompetencia = mesCompetencia;
	}

	public String getMesCompetenciaNome() {
		return SystemUtils.parseDataToNomeMes(mesCompetencia);
	}

	public String getMesCompetenciaStr() {
		return SystemUtils.parseDataToString(mesCompetencia);
	}

	public void setMesCompetenciaStr(String mesCompetencia) {
		this.mesCompetencia = SystemUtils.parseStringToDate(mesCompetencia);
	}

	public CentroCusto getCentroCusto() {
		return centroCusto;
	}

	public void setCentroCusto(CentroCusto centroCusto) {
		this.centroCusto = centroCusto;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public Movimentacao getMovimentacao() {
		return movimentacao;
	}

	public void setMovimentacao(Movimentacao movimentacao) {
		this.movimentacao = movimentacao;
	}

	public Colaborador getColaborador() {
		return colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}

	public String getNumRef() {
		return numRef;
	}

	public void setNumRef(String numRef) {
		this.numRef = numRef;
	}

}
