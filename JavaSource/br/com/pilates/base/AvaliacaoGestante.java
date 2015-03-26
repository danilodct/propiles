package br.com.pilates.base;

public class AvaliacaoGestante extends Avaliacao {

	private String numeroSemanas;
	private String medicoAcompanhante;
	private String mid, mie;

	public AvaliacaoGestante() {
	}

	public String getNumeroSemanas() {
		return numeroSemanas;
	}

	public void setNumeroSemanas(String numeroSemanas) {
		this.numeroSemanas = numeroSemanas;
	}

	public String getMedicoAcompanhante() {
		return medicoAcompanhante;
	}

	public void setMedicoAcompanhante(String medicoAcompanhante) {
		this.medicoAcompanhante = medicoAcompanhante;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMie() {
		return mie;
	}

	public void setMie(String mie) {
		this.mie = mie;
	}

}
