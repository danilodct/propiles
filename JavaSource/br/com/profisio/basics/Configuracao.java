package br.com.profisio.basics;

import java.util.Date;

import br.com.profisio.util.SystemUtils;

public class Configuracao extends ObjetoBasico {

	private double caixaValorInicial;
	private Date caixaDataInicial;

	public Configuracao() {
	}

	public double getCaixaValorInicial() {
		return caixaValorInicial;
	}

	public void setCaixaValorInicial(double caixaValorInicial) {
		this.caixaValorInicial = caixaValorInicial;
	}

	public String getCaixaValorInicialStr() {
		return SystemUtils.parseDoubleToString(caixaValorInicial);
	}

	public void setCaixaValorInicialStr(String caixaValorInicial) {
		this.caixaValorInicial = SystemUtils.parseStringDouble(caixaValorInicial);
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
