package br.com.profisio.util;

public class ItemGeralUI {
	
	private String valor;
	private String nome;
	
	public ItemGeralUI(String valor, String nome) {
		this.setValor(valor);
		this.setNome(nome);
	}
	
	public ItemGeralUI() {}
	
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
