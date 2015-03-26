package br.com.pilates.control;

import java.util.Collection;

import br.com.pilates.base.Contrato;
import br.com.pilates.base.Professor;
import br.com.pilates.base.Servico;

public interface ControlContrato {

	Collection<Contrato> getContratosFuncionario(Professor funcionario);

	void inserirContrato(Contrato contrato);

	void editarContrato(Contrato contrato);

	void removerContrato(Contrato contrato);

	Contrato getContratoByModalidadeProfessor(Servico servico, Professor professor);

}
