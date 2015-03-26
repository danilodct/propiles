package br.com.pilates.control;

import br.com.pilates.base.Avaliacao;
import br.com.pilates.base.Cliente;
import br.com.pilates.base.Servico;

public interface ControlAvaliacao {

	Avaliacao getLastAvaliacaoByModalidadeCliente(Servico servico, Cliente cliente);

	Avaliacao getAvaliacao(Avaliacao avaliacao);

	void atualizarAvaliacao(Avaliacao avaliacao);

}
