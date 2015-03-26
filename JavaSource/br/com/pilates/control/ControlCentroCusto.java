package br.com.pilates.control;

import java.util.Collection;

import br.com.pilates.base.CentroCusto;

public interface ControlCentroCusto {

	Collection<CentroCusto> getAllCentroCusto();

	void editarCentroCusto(CentroCusto centroCusto);

	CentroCusto readCentroCusto(CentroCusto centroCusto);

	void removerCentroCusto(CentroCusto centroCusto);

	void inserirCentroCusto(CentroCusto centroCusto);

}
