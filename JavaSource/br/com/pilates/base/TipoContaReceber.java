package br.com.pilates.base;

public class TipoContaReceber extends ObjetoBasico {
	
	public static final String AVALIACAO = "Avaliação";
	
	private String nome;
	
	public TipoContaReceber() {}
	
	public TipoContaReceber(String nome) {
		this.setNome(nome);
	}
	
	public TipoContaReceber(int id, String nome) {
		this.setId(id);
		this.setNome(nome);
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
}
