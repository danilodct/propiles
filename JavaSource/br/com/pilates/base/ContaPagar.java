package br.com.pilates.base;

import java.util.Date;

import br.com.pilates.base.enums.StatusConta;
import br.com.pilates.base.enums.TipoCusto;
import br.com.pilates.util.SystemUtils;

public class ContaPagar extends ObjetoBasico {

	private double valor;
	private Date dataVencimento;
	private Date dataPagamento;
	private Date mesCompetencia;
	private TipoContaPagar tipo;
	private StatusConta status;
	private TipoCusto tipoCusto;
	private CentroCusto centroCusto;

	public ContaPagar() {

	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
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

	public void setStatus(StatusConta status) {
		this.status = status;
	}

	public void setStatusStr(String status) {
		this.status = StatusConta.PAGO;
		if (status == null || status.equals("")) {
			this.status = StatusConta.PENDENTE;
		}
	}

	public TipoCusto getTipoCusto() {
		return tipoCusto;
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
		return SystemUtils.parseDataToMesNome(mesCompetencia);
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

}
