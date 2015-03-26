package br.com.pilates.dao;

import java.util.Collection;

import br.com.pilates.base.Contrato;
import br.com.pilates.base.Professor;
import br.com.pilates.base.Servico;

public interface DAOContrato extends IHibernateDAO<Contrato> {

	Collection<Contrato> getContratosFuncionario(Professor funcionario);

	Contrato getContratoByModalidadeProfessor(Servico servico, Professor professor);

}
