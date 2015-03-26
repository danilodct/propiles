package br.com.pilates.base;

import java.util.Collection;

public class CentroCusto extends ObjetoBasico {

	private String nome;
	private Collection<Servico> servicos;

	public CentroCusto() {

	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Collection<Servico> getServicos() {
		return servicos;
	}

	public void setServicos(Collection<Servico> servicos) {
		this.servicos = servicos;
	}

}
