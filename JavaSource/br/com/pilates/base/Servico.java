package br.com.pilates.base;

public class Servico extends ObjetoBasico {

	private String nome;
	private CentroCusto centroCusto;

	public Servico() {

	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public CentroCusto getCentroCusto() {
		return centroCusto;
	}

	public void setCentroCusto(CentroCusto centroCusto) {
		this.centroCusto = centroCusto;
	}

}
