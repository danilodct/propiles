package br.com.pilates.dao.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import br.com.pilates.base.Professor;
import br.com.pilates.base.Servico;
import br.com.pilates.dao.DAOProfessor;

public class DAOProfessorImpl extends HibernateDAO<Professor> implements DAOProfessor {

	@Override
	public Collection<Professor> getFuncionarios() {
		return this.list("getProfessores");
	}

	@Override
	public Collection<Professor> getPoucosFuncionarios() {
		return this.list("getProfessores", 10);
	}

	@Override
	public Collection<Professor> getProfessorByCpf(String cpf) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cpf", cpf);
		return this.list("getProfessorByCpf", params);
	}

	@Override
	public Collection<Professor> pesquisarProfessoresByCPF(String cpf) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cpf", cpf + "%");
		return this.list("pesquisarProfessoresByCpf", params);
	}

	@Override
	public Collection<Professor> pesquisarProfessoresByNome(String nome) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("nome", nome + "%");
		return this.list("pesquisarProfessoresByNome", params);
	}

	@Override
	public Collection<Professor> getProfessoresByModalidade(Servico servico) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("servico", servico);
		return this.list("getProfessoresByModalidade", params);
	}

	@Override
	public Collection<Professor> getProximosAniversariantesFunc(String mesAtual, String mesProximo) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("mesAtual", mesAtual + "%");
		params.put("mesProximo", mesProximo + "%");
		return this.list("getProximosAniversariantesFunc", params, 10);
	}

}
