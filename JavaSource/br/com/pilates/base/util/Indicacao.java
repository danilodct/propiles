package br.com.pilates.base.util;

public class Indicacao {
	
	private String valor;
	private String nome;
	
	public Indicacao(String valor, String nome) {
		this.setValor(valor);
		this.setNome(nome);
	}
	
	public Indicacao() {}
	
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
