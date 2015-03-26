package br.com.profisio.basics;

import br.com.profisio.util.SystemUtils;

public class Produto extends ObjetoBasico {

	private Double valor;
	private String nome, categoria;

	public Produto() {
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
