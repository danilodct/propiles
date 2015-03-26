package br.com.pilates.dao.impl;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.CentroCusto;
import br.com.pilates.base.ContaPagar;
import br.com.pilates.base.TipoContaPagar;
import br.com.pilates.base.enums.TipoCusto;
import br.com.pilates.dao.IHibernateDAO;

public interface DAOContaPagar extends IHibernateDAO<ContaPagar> {

	Collection<ContaPagar> getContasPagarByMes(TipoCusto tipoCusto, Date mesAtual, Date mesProximo, CentroCusto centroCusto);

	double getSomaSaidasByData(Date dataInicial, Date dataFinal, TipoCusto tipoCusto);

	Double getSomaContaPagarByTipo(TipoContaPagar tipo, Date dataInicio, Date dataFinal);

	double getSomaSaidasLiquidasByData(Date dataInicial, Date dataFinal, TipoCusto tipoCusto);

}
