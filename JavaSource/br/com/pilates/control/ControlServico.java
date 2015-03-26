package br.com.pilates.control;

import java.util.Collection;

import br.com.pilates.base.Servico;

public interface ControlServico {

	Collection<Servico> getAllServicos();

	void inserirServico(Servico servico);

	void removerServico(Servico servico);

	Servico readServico(Servico servico);

	void editarServico(Servico servico);

}
