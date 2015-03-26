package br.com.profisio.basics;

import java.util.Date;

import br.com.profisio.basics.enums.TipoMovimentacao;
import br.com.profisio.util.SystemUtils;

public class Movimentacao extends ObjetoBasico {

	private Double valor;
	private Date data;
	private String descricao;
	private TipoMovimentacao tipoMovimentacao;

	public Movimentacao() {
	}

	public Movimentacao(Double valor, Date dataPagamento, String descricao, TipoMovimentacao tipoMov) {
		this.setValor(valor);
		this.setData(dataPagamento);
		this.setDescricao(descricao);
		this.setTipoMovimentacao(tipoMov);
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

	public String getDataStr() {
		return SystemUtils.parseDataToString(data);
	}

	public void setDataStr(String data) {
		this.data = SystemUtils.parseStringToDate(data);
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public TipoMovimentacao getTipoMovimentacao() {
		return tipoMovimentacao;
	}

	public void setTipoMovimentacao(TipoMovimentacao tipoMovimentacao) {
		this.tipoMovimentacao = tipoMovimentacao;
	}

}
