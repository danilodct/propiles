package br.com.pilates.base.util;

public class FormaConhecimento {

	private String valor;
	private String nome;

	public FormaConhecimento(String valor, String nome) {
		this.setValor(valor);
		this.setNome(nome);
	}

	public FormaConhecimento(String nome) {
		this.setNome(nome);
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}
