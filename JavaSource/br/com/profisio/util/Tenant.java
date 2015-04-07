package br.com.profisio.util;

import java.util.Date;

import br.com.profisio.basics.ObjetoBasico;

public class Tenant extends ObjetoBasico {

	private String nome;
	private Date dataCriacao;
	private Plano plano;

	public Tenant() {
	}

	public Tenant(String nome, Date date, Plano plano) {
		this.setNome(nome);
		this.setDataCriacao(date);
		this.setPlano(plano);
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDataCriacaoStr() {
		return SystemUtils.parseDataToString(dataCriacao);
	}

	public Date getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacaoStr(String dataCriacao) {
		this.dataCriacao = SystemUtils.parseStringToDate(dataCriacao);
	}

	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public Plano getPlano() {
		return plano;
	}

	public void setPlano(Plano plano) {
		this.plano = plano;
	}

}
