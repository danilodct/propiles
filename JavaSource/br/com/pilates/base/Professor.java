package br.com.pilates.base;

import java.util.Collection;

import br.com.pilates.base.enums.TipoUser;

public class Professor extends Usuario {

	private double salarioBase, porcentagemVendas;
	private String numeroCarteira;
	private Collection<Contrato> contratos;

	public Professor() {
		this.setTipo(TipoUser.PROFESSOR);
	}

	public double getSalarioBase() {
		return salarioBase;
	}

	public void setSalarioBase(double salarioBase) {
		this.salarioBase = salarioBase;
	}

	public String getNumeroCarteira() {
		return numeroCarteira;
	}

	public void setNumeroCarteira(String numeroCarteira) {
		this.numeroCarteira = numeroCarteira;
	}

	public Collection<Contrato> getContratos() {
		return contratos;
	}

	public void setContratos(Collection<Contrato> contratos) {
		this.contratos = contratos;
	}

	public double getPorcentagemVendas() {
		return porcentagemVendas;
	}

	public void setPorcentagemVendas(double porcentagemVendas) {
		this.porcentagemVendas = porcentagemVendas;
	}

}
