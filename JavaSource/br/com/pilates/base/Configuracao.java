package br.com.pilates.base;

import java.util.Date;

import br.com.pilates.util.SystemUtils;

public class Configuracao extends ObjetoBasico {

	private double avaliacaoPilates;
	private double avaliacaoRPG;
	private double avaliacaoAcupuntura;
	private double avaliacaoEstetica;
	private double caixaValorInicial;
	private Date caixaDataInicial;

	public Configuracao() {
	}

	public double getAvaliacaoPilates() {
		return avaliacaoPilates;
	}

	public void setAvaliacaoPilates(double avaliacaoPilates) {
		this.avaliacaoPilates = avaliacaoPilates;
	}

	public double getAvaliacaoRPG() {
		return avaliacaoRPG;
	}

	public void setAvaliacaoRPG(double avaliacaoRPG) {
		this.avaliacaoRPG = avaliacaoRPG;
	}

	public double getAvaliacaoAcupuntura() {
		return avaliacaoAcupuntura;
	}

	public void setAvaliacaoAcupuntura(double avaliacaoAcupuntura) {
		this.avaliacaoAcupuntura = avaliacaoAcupuntura;
	}

	public double getAvaliacaoEstetica() {
		return avaliacaoEstetica;
	}

	public void setAvaliacaoEstetica(double avaliacaoEstetica) {
		this.avaliacaoEstetica = avaliacaoEstetica;
	}

	public double getCaixaValorInicial() {
		return caixaValorInicial;
	}

	public void setCaixaValorInicial(double caixaValorInicial) {
		this.caixaValorInicial = caixaValorInicial;
	}

	public Date getCaixaDataInicial() {
		return caixaDataInicial;
	}

	public void setCaixaDataInicial(Date caixaDataInicial) {
		this.caixaDataInicial = caixaDataInicial;
	}

	public String getCaixaDataInicialStr() {
		return SystemUtils.parseDataToString(caixaDataInicial);
	}

	public void setCaixaDataInicialStr(String caixaDataInicial) {
		this.caixaDataInicial = SystemUtils.parseStringToDate(caixaDataInicial);
	}

}
