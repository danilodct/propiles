package br.com.pilates.control;

import java.util.Collection;

import br.com.pilates.base.Professor;
import br.com.pilates.base.Servico;

public interface ControlProfessor {

	void editarFuncionario(Professor funcionario);

	Collection<Professor> getPoucosFuncionarios();

	void inserirFuncionario(Professor funcionario);

	Professor lerFuncionario(Professor funcionario);

	void removerFuncionario(Professor funcionario);

	Collection<Professor> pesquisarProfessores(String pesquisa, String param);

	Collection<Professor> getProfessoresByModalidade(Servico servico);

	Collection<Professor> getProximosAniversariantesFuncionarios();

	Collection<Professor> getFuncionarios();

	Collection<Professor> getColaboradores();

}
