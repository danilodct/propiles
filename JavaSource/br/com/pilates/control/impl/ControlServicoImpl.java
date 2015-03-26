package br.com.pilates.control.impl;

import java.util.Collection;

import br.com.pilates.base.Servico;
import br.com.pilates.control.ControlServico;
import br.com.pilates.dao.DAOServico;
import br.com.pilates.dao.impl.DAOServicoImpl;
import br.com.pilates.excecao.PilatesException;
import br.com.pilates.util.PilatesBundleUtil;

public class ControlServicoImpl implements ControlServico {

	private final DAOServico dao;

	public ControlServicoImpl() {
		this.dao = new DAOServicoImpl();
	}

	@Override
	public Collection<Servico> getAllServicos() {
		return this.dao.getAllServicos();
	}

	@Override
	public void inserirServico(Servico servico) {
		if (servico == null || servico.getNome() == null || servico.getNome().equals(""))
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		this.dao.insert(servico);
	}

	@Override
	public void removerServico(Servico servico) {
		if (servico == null || servico.getId() == null)
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		this.dao.delete(servico);
	}

	@Override
	public Servico readServico(Servico servico) {
		if (servico == null || servico.getId() == null)
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		return this.dao.read(Servico.class, servico.getId());
	}

	@Override
	public void editarServico(Servico servico) {
		if (servico == null || servico.getNome() == null || servico.getNome().equals(""))
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		this.dao.update(servico);
	}

}
