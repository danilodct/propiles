package br.com.pilates.dao.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import br.com.pilates.base.Contrato;
import br.com.pilates.base.Professor;
import br.com.pilates.base.Servico;
import br.com.pilates.dao.DAOContrato;

public class DAOContratoImpl extends HibernateDAO<Contrato> implements DAOContrato {

	@Override
	public Collection<Contrato> getContratosFuncionario(Professor professor) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("professor", professor);
		return this.list("getContratosByProfessor", params);
	}

	@Override
	public Contrato getContratoByModalidadeProfessor(Servico servico, Professor professor) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("servico", servico);
		params.put("professor", professor);
		return (Contrato) this.queryObject("getContratoByModalidadeProfessor", params);
	}

}
