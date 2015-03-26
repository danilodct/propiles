package br.com.pilates.base.util;

import br.com.pilates.base.ObjetoBasico;
import br.com.pilates.base.enums.FormaPagamento;

public class RelatorioFormaPagamento extends ObjetoBasico {

	private FormaPagamento tipo;
	private int quantidade;
	private double porcentagem;

	public RelatorioFormaPagamento() {
	}

	public FormaPagamento getTipo() {
		return tipo;
	}

	public void setTipo(FormaPagamento tipo) {
		this.tipo = tipo;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public double getPorcentagem() {
		return porcentagem;
	}

	public void setPorcentagem(double porcentagem) {
		this.porcentagem = porcentagem;
	}

}
