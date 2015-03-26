package br.com.profisio.basics;

import java.util.Date;

import br.com.profisio.basics.enums.StatusEstoque;
import br.com.profisio.util.SystemUtils;

public class Estoque extends ObjetoBasico {

	private Produto produto;
	private Colaborador vendedor;
	private Double valor;
	private Date data;
	private StatusEstoque status;
	private Movimentacao movimentacao;

	public Estoque() {
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public Colaborador getVendedor() {
		return vendedor;
	}

	public void setVendedor(Colaborador vendedor) {
		this.vendedor = vendedor;
	}

	public Double getValor() {
		return valor;
	}

	public String getValorStr() {
		return SystemUtils.parseDoubleToString(this.valor);
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public void setValorStr(String valor) {
		this.valor = SystemUtils.parseStringDouble(valor);
	}

	public Date getData() {
		return data;
	}

	public String getDataStr() {
		return SystemUtils.parseDataToString(data);
	}

	public void setData(Date data) {
		this.data = data;
	}

	public void setDataStr(String data) {
		this.data = SystemUtils.parseStringToDate(data);
	}

	public StatusEstoque getStatus() {
		return status;
	}

	public void setStatus(StatusEstoque status) {
		this.status = status;
	}

	public Movimentacao getMovimentacao() {
		return movimentacao;
	}

	public void setMovimentacao(Movimentacao movimentacao) {
		this.movimentacao = movimentacao;
	}

}
