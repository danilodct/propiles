package br.com.profisio.basics;

public class TipoCadastro extends ObjetoBasico {
	
	private String nome;
	
	public TipoCadastro() {}
	
	public TipoCadastro(int id, String nome) {
		this.setNome(nome);
		this.setId(id);
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
}
