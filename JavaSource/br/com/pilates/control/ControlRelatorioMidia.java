package br.com.pilates.control;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.RelatorioMidia;

public interface ControlRelatorioMidia {
	
	Collection<RelatorioMidia> relatorioMidia(Date dataInicial, Date dataFinal, String ordenacao);
	
}
