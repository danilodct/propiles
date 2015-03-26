package br.com.pilates.fachada;

import java.util.Collection;

import br.com.pilates.base.Contrato;
import br.com.pilates.base.Professor;
import br.com.pilates.control.ControlContrato;
import br.com.pilates.control.impl.ControlContratoImpl;

public class FachadaContrato {
	
	private static FachadaContrato instance;
	
	private ControlContrato controlContrato;
	
	private FachadaContrato() {
		this.controlContrato = new ControlContratoImpl();
	}
	
	public static FachadaContrato getInstance() {
		if (instance == null) {
			instance = new FachadaContrato();
		}
		return instance;
	}
	
	public Collection<Contrato> getContratosFuncionario(Professor funcionario) {
		return this.controlContrato.getContratosFuncionario(funcionario);
	}
	
	public void inserirContrato(Contrato contrato) {
		this.controlContrato.inserirContrato(contrato);
	}
	
	public void editarContrato(Contrato contrato) {
		this.controlContrato.editarContrato(contrato);
	}
	
	public void removerContrato(Contrato contrato) {
		this.controlContrato.removerContrato(contrato);
	}
}
