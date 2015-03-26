package br.com.profisio.basics;

public class Servico extends ObjetoBasico {

	private String nome;
	private CentroCusto centroCusto;
	private Integer qtdSessoes, duracaoSessao;

	public Servico(Integer id) {
		setId(id);
	}

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

	public Integer getQtdSessoes() {
		return qtdSessoes;
	}

	public void setQtdSessoes(Integer qtdSessoes) {
		this.qtdSessoes = qtdSessoes;
	}

	public Integer getDuracaoSessao() {
		return duracaoSessao;
	}

	public void setDuracaoSessao(Integer duracaoSessao) {
		this.duracaoSessao = duracaoSessao;
	}

}
