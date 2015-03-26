package br.com.pilates.base;

import java.util.Date;

import br.com.pilates.base.enums.StatusEstoque;
import br.com.pilates.util.SystemUtils;

public class Estoque extends ObjetoBasico {

	private Produto produto;
	private Professor vendedor;
	private double valor;
	private Date data;
	private StatusEstoque status;

	public Estoque() {
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public Professor getVendedor() {
		return vendedor;
	}

	public void setVendedor(Professor vendedor) {
		this.vendedor = vendedor;
	}

	public double getValor() {
		return valor;
	}

	public String getValorStr() {
		return SystemUtils.parseDoubleToString(this.valor);
	}

	public void setValor(double valor) {
		this.valor = valor;
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

}
