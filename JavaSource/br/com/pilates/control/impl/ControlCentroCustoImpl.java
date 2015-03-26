package br.com.pilates.control.impl;

import java.util.Collection;

import br.com.pilates.base.CentroCusto;
import br.com.pilates.control.ControlCentroCusto;
import br.com.pilates.dao.DAOCentroCusto;
import br.com.pilates.dao.impl.DAOCentroCustoImpl;
import br.com.pilates.excecao.PilatesException;
import br.com.pilates.util.PilatesBundleUtil;

public class ControlCentroCustoImpl implements ControlCentroCusto {

	private final DAOCentroCusto dao;

	public ControlCentroCustoImpl() {
		this.dao = new DAOCentroCustoImpl();
	}

	@Override
	public Collection<CentroCusto> getAllCentroCusto() {
		return this.dao.getAllCentroCusto();
	}

	@Override
	public void editarCentroCusto(CentroCusto centroCusto) {
		if (centroCusto == null || centroCusto.getId() == null)
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		this.dao.update(centroCusto);
	}

	@Override
	public CentroCusto readCentroCusto(CentroCusto centroCusto) {
		if (centroCusto == null || centroCusto.getId() == null)
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		return this.dao.read(CentroCusto.class, centroCusto.getId());
	}

	@Override
	public void removerCentroCusto(CentroCusto centroCusto) {
		if (centroCusto == null || centroCusto.getId() == null)
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		this.dao.delete(centroCusto);
	}

	@Override
	public void inserirCentroCusto(CentroCusto centroCusto) {
		if (centroCusto == null || centroCusto.getNome() == null || centroCusto.getNome().equals(""))
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		this.dao.insert(centroCusto);
	}

}
