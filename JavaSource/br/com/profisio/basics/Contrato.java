package br.com.profisio.basics;

import br.com.profisio.util.SystemUtils;

public class Contrato extends ObjetoBasico {

	private Colaborador colaborador;
	private double percentual;
	private Servico servico;

	public Contrato() {
	}

	public Colaborador getColaborador() {
		return colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}

	public double getPercentual() {
		return percentual;
	}

	public void setPercentual(double percentual) {
		this.percentual = percentual;
	}

	public String getPercentualStr() {
		return SystemUtils.parseDoubleToString(percentual);
	}

	public void setPercentualStr(String percentual) {
		this.percentual = SystemUtils.parseStringDouble(percentual);
	}

	public Servico getServico() {
		return servico;
	}

	public void setServico(Servico servico) {
		this.servico = servico;
	}

}
