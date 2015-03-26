package br.com.pilates.base;

import br.com.pilates.util.SystemUtils;

public class Produto extends ObjetoBasico {

	private double valor;
	private String nome, categoria;

	public Produto() {
	}

	public double getValor() {
		return valor;
	}

	public String getValorStr() {
		return SystemUtils.parseDoubleToString(valor);
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

	public void setValorStr(String valor) {
		this.valor = Double.parseDouble(valor);
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

}
