package br.com.pilates.control.impl;

import br.com.pilates.base.Avaliacao;
import br.com.pilates.base.Cliente;
import br.com.pilates.base.Servico;
import br.com.pilates.control.ControlAvaliacao;
import br.com.pilates.dao.DAOAvaliacao;
import br.com.pilates.dao.impl.DAOAvaliacaoImpl;

public class ControlAvaliacaoImpl implements ControlAvaliacao {

	private final DAOAvaliacao dao;

	public ControlAvaliacaoImpl() {
		this.dao = new DAOAvaliacaoImpl();
	}

	@Override
	public Avaliacao getLastAvaliacaoByModalidadeCliente(Servico servico, Cliente cliente) {
		return this.dao.getLastAvaliacaoByModalidadeCliente(servico, cliente);
	}

	@Override
	public Avaliacao getAvaliacao(Avaliacao avaliacao) {
		return this.dao.read(Avaliacao.class, avaliacao.getId());
	}

	@Override
	public void atualizarAvaliacao(Avaliacao avaliacao) {
		this.dao.update(avaliacao);
	}

}
