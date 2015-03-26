package br.com.pilates.dao.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import br.com.pilates.base.Avaliacao;
import br.com.pilates.base.Cliente;
import br.com.pilates.base.Servico;
import br.com.pilates.dao.DAOAvaliacao;

public class DAOAvaliacaoImpl extends HibernateDAO<Avaliacao> implements DAOAvaliacao {

	@Override
	public Avaliacao getLastAvaliacaoByModalidadeCliente(Servico servico, Cliente cliente) {
		Avaliacao retorno = null;
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("servico", servico);
		params.put("cliente", cliente);
		Collection<Avaliacao> list = this.list("getLastAvaliacaoByModalidadeCliente", params, 1);
		if (list != null && list.size() > 0) {
			retorno = list.iterator().next();
		}
		return retorno;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<String> getAllConhecimentoStudio() {
		return createNamedQuery("getAllConhecimentoStudio").list();
	}

	@Override
	public int getQtAvaliacaoByMidia(String midia) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("midia", midia);
		return ((Long) this.queryObject("getQtAvaliacaoByMidia", params)).intValue();
	}
}
