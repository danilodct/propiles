package br.com.pilates.dao;

import java.util.Collection;

import br.com.pilates.base.Avaliacao;
import br.com.pilates.base.Cliente;
import br.com.pilates.base.Servico;

public interface DAOAvaliacao extends IHibernateDAO<Avaliacao> {

	Avaliacao getLastAvaliacaoByModalidadeCliente(Servico servico, Cliente cliente);

	Collection<String> getAllConhecimentoStudio();

	int getQtAvaliacaoByMidia(String midia);

}
