package br.com.profisio.basics;

import java.util.Collection;

import br.com.profisio.basics.enums.TipoUser;
import br.com.profisio.util.SystemUtils;

public class Colaborador extends Usuario {

	private Double salarioBase, porcentagemVendas;
	private String numeroCarteira;
	private Collection<Contrato> contratos;
	// Não persistíveis
	private Collection<Frequencia> frequencias;
	private Double somaSalarioParte;
	private Boolean jaTemPagamentos;//diz se ja foi feito pagamento 

	public Colaborador() {
		this.setTipo(TipoUser.PROFESSOR);
	}

	public double getSalarioBase() {
		return salarioBase;
	}

	public void setSalarioBase(double salarioBase) {
		this.salarioBase = salarioBase;
	}

	public String getSalarioBaseStr() {
		return SystemUtils.parseDoubleToString(salarioBase);
	}

	public void setSalarioBaseStr(String salarioBase) {
		this.salarioBase = SystemUtils.parseStringDouble(salarioBase);
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

	public String getPorcentagemVendasStr() {
		return SystemUtils.parseDoubleToString(porcentagemVendas);
	}

	public void setPorcentagemVendasStr(String porcentagemVendas) {
		this.porcentagemVendas = SystemUtils.parseStringDouble(porcentagemVendas);
	}

	public Collection<Frequencia> getFrequencias() {
		return frequencias;
	}

	public void setFrequencias(Collection<Frequencia> frequencias) {
		this.frequencias = frequencias;
	}

	public String getSomaSalarioParteStr() {
		return SystemUtils.parseDoubleToString(somaSalarioParte);
	}

	public Double getSomaSalarioParte() {
		return somaSalarioParte;
	}

	public void setSomaSalarioParte(Double somaSalarioParte) {
		this.somaSalarioParte = somaSalarioParte;
	}

	public Boolean getJaTemPagamentos() {
		return jaTemPagamentos;
	}

	public void setJaTemPagamentos(Boolean jaTemPagamentos) {
		this.jaTemPagamentos = jaTemPagamentos;
	}

}
