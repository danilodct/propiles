package br.com.pilates.control.impl;

import java.util.Collection;

import br.com.pilates.base.Contrato;
import br.com.pilates.base.Professor;
import br.com.pilates.base.Servico;
import br.com.pilates.base.enums.StatusObjeto;
import br.com.pilates.control.ControlContrato;
import br.com.pilates.dao.DAOContrato;
import br.com.pilates.dao.impl.DAOContratoImpl;
import br.com.pilates.excecao.PilatesException;
import br.com.pilates.util.PilatesBundleUtil;

public class ControlContratoImpl implements ControlContrato {

	private final DAOContrato dao;

	public ControlContratoImpl() {
		this.dao = new DAOContratoImpl();
	}

	@Override
	public Collection<Contrato> getContratosFuncionario(Professor funcionario) {
		return this.dao.getContratosFuncionario(funcionario);
	}

	@Override
	public void inserirContrato(Contrato contrato) {
		if (contrato != null && contrato.getProfessor() != null) {
			contrato.setStatusObjeto(StatusObjeto.ATIVO);
			this.dao.insert(contrato);
		} else {
			throw new PilatesException(PilatesBundleUtil.NENHUM_PROFESSOR_SELECIONADO);
		}
	}

	@Override
	public void editarContrato(Contrato contrato) {
		contrato.setStatusObjeto(StatusObjeto.ATIVO);
		this.dao.update(contrato);
	}

	@Override
	public void removerContrato(Contrato contrato) {
		if (contrato == null)
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		contrato = this.dao.read(Contrato.class, contrato.getId());
		contrato.setStatusObjeto(StatusObjeto.MORTO);
		this.dao.update(contrato);
	}

	@Override
	public Contrato getContratoByModalidadeProfessor(Servico servico, Professor professor) {
		return this.dao.getContratoByModalidadeProfessor(servico, professor);
	}

}
