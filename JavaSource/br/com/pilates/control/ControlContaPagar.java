package br.com.pilates.control;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.CentroCusto;
import br.com.pilates.base.ContaPagar;
import br.com.pilates.base.TipoContaPagar;
import br.com.pilates.base.enums.TipoCusto;

public interface ControlContaPagar {

	void inserirContaPagar(ContaPagar contaPagar);

	Collection<TipoContaPagar> getAllTiposContaPagar();

	Collection<ContaPagar> getContasPagarMesAtual(TipoCusto tipoCusto, Date dataInicial, Date dataFinal, CentroCusto centroCusto);

	Collection<ContaPagar> getContasPagarByData(Date dataInicial, Date dataFinal);

	double getSomaSaidasByData(Date dataInicial, Date dataFinal, TipoCusto variavel);

	String getGastosPorTipoStr(Date dataInicio, Date dataFinal);

}
