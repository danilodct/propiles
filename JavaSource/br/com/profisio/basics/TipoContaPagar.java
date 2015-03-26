package br.com.profisio.basics;

public class TipoContaPagar extends ObjetoBasico {
	
	private String nome;
	
	public TipoContaPagar() {}
	
	public TipoContaPagar(String nome) {
		this.setNome(nome);
	}
	
	public TipoContaPagar(int id, String nome) {
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
