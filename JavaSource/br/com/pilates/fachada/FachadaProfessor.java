package br.com.pilates.fachada;

import java.util.Collection;

import br.com.pilates.base.Professor;
import br.com.pilates.base.Servico;
import br.com.pilates.control.ControlProfessor;
import br.com.pilates.control.impl.ControlProfessorImpl;

public class FachadaProfessor {

	private static FachadaProfessor instance;

	private final ControlProfessor controlProfessor;

	private FachadaProfessor() {
		this.controlProfessor = new ControlProfessorImpl();
	}

	public static FachadaProfessor getInstance() {
		if (instance == null) {
			instance = new FachadaProfessor();
		}
		return instance;
	}

	public void editarFuncionario(Professor funcionario) {
		this.controlProfessor.editarFuncionario(funcionario);
	}

	public Collection<Professor> getPoucosFuncionarios() {
		return this.controlProfessor.getPoucosFuncionarios();
	}

	public void inserirFuncionario(Professor funcionario) {
		this.controlProfessor.inserirFuncionario(funcionario);
	}

	public Professor lerFuncionario(Professor funcionario) {
		return this.controlProfessor.lerFuncionario(funcionario);
	}

	public void removerFuncionario(Professor funcionario) {
		this.controlProfessor.removerFuncionario(funcionario);
	}

	public Collection<Professor> pesquisarProfessores(String pesquisa, String param) {
		return this.controlProfessor.pesquisarProfessores(pesquisa, param);
	}

	public Collection<Professor> getProfessoresByModalidade(Servico servico) {
		return this.controlProfessor.getProfessoresByModalidade(servico);
	}

	public Collection<Professor> getProximosAniversariantesFuncionarios() {
		return this.controlProfessor.getProximosAniversariantesFuncionarios();
	}

	public Collection<Professor> getFuncionarios() {
		return this.controlProfessor.getFuncionarios();
	}

}
