package br.com.pilates.control.impl;

import java.util.Calendar;
import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.CentroCusto;
import br.com.pilates.base.ContaPagar;
import br.com.pilates.base.TipoContaPagar;
import br.com.pilates.base.enums.StatusConta;
import br.com.pilates.base.enums.TipoCusto;
import br.com.pilates.control.ControlContaPagar;
import br.com.pilates.dao.DAOTipoContaPagar;
import br.com.pilates.dao.impl.DAOContaPagar;
import br.com.pilates.dao.impl.DAOContaPagarImpl;
import br.com.pilates.dao.impl.DAOTipoContaPagarImpl;
import br.com.pilates.util.SystemUtils;

public class ControlContaPagarImpl implements ControlContaPagar {

	private final DAOContaPagar dao;
	private final DAOTipoContaPagar daoTipo;

	public ControlContaPagarImpl() {
		this.dao = new DAOContaPagarImpl();
		this.daoTipo = new DAOTipoContaPagarImpl();
	}

	@Override
	public void inserirContaPagar(ContaPagar contaPagar) {
		if (contaPagar.getStatus() == null) {
			contaPagar.setStatus(StatusConta.PENDENTE);
		}
		if (contaPagar.getCentroCusto() != null && contaPagar.getCentroCusto().getId().intValue() == -1)
			contaPagar.setCentroCusto(null);
		this.dao.insert(contaPagar);
	}

	@Override
	public Collection<TipoContaPagar> getAllTiposContaPagar() {
		return this.daoTipo.getAllTiposContaPagar();
	}

	@Override
	public Collection<ContaPagar> getContasPagarMesAtual(TipoCusto tipoCusto, Date dataInicial, Date dataFinal, CentroCusto centroCusto) {
		if (dataInicial == null && dataFinal == null) {
			Calendar calendar = Calendar.getInstance();
			calendar.set(Calendar.DAY_OF_MONTH, 1);
			calendar.set(Calendar.AM_PM, Calendar.AM);
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			dataInicial = calendar.getTime();
			calendar = Calendar.getInstance();
			calendar.set(Calendar.AM_PM, Calendar.AM);
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			calendar.set(Calendar.DAY_OF_MONTH, 32);
			calendar.set(Calendar.MINUTE, -1);
			dataFinal = calendar.getTime();
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 11, 59, 59);
		}
		if (centroCusto != null && (centroCusto.getId() == null || centroCusto.getId().intValue() == -1))
			centroCusto = null;
		return this.dao.getContasPagarByMes(tipoCusto, dataInicial, dataFinal, centroCusto);
	}

	@Override
	public Collection<ContaPagar> getContasPagarByData(Date dataInicial, Date dataFinal) {
		dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
		dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 11, 59, 59);
		return this.dao.getContasPagarByMes(null, dataInicial, dataFinal, null);
	}

	@Override
	public double getSomaSaidasByData(Date dataInicial, Date dataFinal, TipoCusto tipoCusto) {
		dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
		dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 11, 59, 59);
		return this.dao.getSomaSaidasLiquidasByData(dataInicial, dataFinal, tipoCusto);
	}

	@Override
	public String getGastosPorTipoStr(Date dataInicio, Date dataFinal) {
		String retorno = "";
		Collection<TipoContaPagar> tipos = this.daoTipo.getAllTiposContaPagar();
		for (TipoContaPagar tipo : tipos) {
			Double gastos = this.dao.getSomaContaPagarByTipo(tipo, dataInicio, dataFinal);
			retorno += tipo.getNome() + "," + gastos + ";";
		}
		if (retorno.length() > 0) {
			retorno = retorno.substring(0, retorno.length() - 1);
		}
		retorno = SystemUtils.orderLabelValue(retorno);
		return retorno;
	}

}
