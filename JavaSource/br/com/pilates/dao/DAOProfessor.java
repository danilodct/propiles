package br.com.pilates.dao;

import java.util.Collection;

import br.com.pilates.base.Professor;
import br.com.pilates.base.Servico;

public interface DAOProfessor extends IHibernateDAO<Professor> {

	Collection<Professor> getFuncionarios();

	Collection<Professor> getProfessorByCpf(String cpf);

	Collection<Professor> pesquisarProfessoresByCPF(String pesquisa);

	Collection<Professor> pesquisarProfessoresByNome(String pesquisa);

	Collection<Professor> getProfessoresByModalidade(Servico servico);

	Collection<Professor> getProximosAniversariantesFunc(String mesAtual, String mesProximo);

	Collection<Professor> getPoucosFuncionarios();

}
