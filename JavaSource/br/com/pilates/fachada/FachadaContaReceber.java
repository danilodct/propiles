package br.com.pilates.fachada;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Cadastro;
import br.com.pilates.base.ContaReceber;
import br.com.pilates.base.Professor;
import br.com.pilates.base.TipoContaReceber;
import br.com.pilates.control.ControlContaReceber;
import br.com.pilates.control.impl.ControlContaReceberImpl;

public class FachadaContaReceber {
	
	private static FachadaContaReceber instance;
	
	private ControlContaReceber controlContaReceber;
	
	private FachadaContaReceber() {
		this.controlContaReceber = new ControlContaReceberImpl();
	}
	
	public static FachadaContaReceber getInstance() {
		if (instance == null) {
			instance = new FachadaContaReceber();
		}
		return instance;
	}
	
	public void inserirContaReceberCadastro(ContaReceber contaReceber, Cadastro cadastro) {
		this.controlContaReceber.inserirContaReceberCadastro(contaReceber, cadastro);
	}
	
	public Collection<ContaReceber> getContasReceberByCadastro(Cadastro cadastro) {
		return this.controlContaReceber.getContasReceberByCadastro(cadastro);
	}
	
	public void removerContaReceberCadastro(ContaReceber contaReceber) {
		this.controlContaReceber.removerContaReceberCadastro(contaReceber);
	}
	
	public Collection<TipoContaReceber> getAllTiposContaReceber() {
		return this.controlContaReceber.getAllTiposContaReceber();
	}
	
	public Collection<ContaReceber> getContasReceberMesAtual(Date dataInicial, Date dataFinal) {
		return this.controlContaReceber.getContasReceberMesAtual(dataInicial, dataFinal);
	}
	
	public void inserirContaReceber(ContaReceber contaReceber) {
		this.controlContaReceber.inserirContaReceber(contaReceber);
	}
	
	public Collection<ContaReceber> getContasReceberByProfessorData(Date dataInicial, Date dataFinal, Professor professor) {
		return this.controlContaReceber.getContasReceberByProfessorData(dataInicial, dataFinal, professor);
	}
	
	public double getSomaEntradasByProfessorData(Date dataInicial, Date dataFinal, Professor professor) {
		return this.controlContaReceber.getSomaEntradasByProfessorData(dataInicial, dataFinal, professor);
	}
	
	public double getSomaPercentagemProfessorByProfessorData(Date dataInicial, Date dataFinal, Professor professor) {
		return this.controlContaReceber.getSomaPercentagemProfessorByProfessorData(dataInicial, dataFinal, professor);
	}
	
	public double getSomaPercentagemAllProfessoresByData(Date dataInicial, Date dataFinal) {
		return this.controlContaReceber.getSomaPercentagemAllProfessoresByData(dataInicial, dataFinal);
	}
}
