package br.com.pilates.control;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.util.RelatorioFormaPagamento;

public interface ControlRelatorioFormaPagamento {
	
	Collection<RelatorioFormaPagamento> relatorioFormaPagamento(Date dataInicial, Date dataFinal, String ordenacao);
	
}
