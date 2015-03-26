package br.com.pilates.fachada;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.RelatorioMidia;
import br.com.pilates.base.util.RelatorioFormaPagamento;
import br.com.pilates.control.ControlRelatorioMidia;
import br.com.pilates.control.ControlRelatorioFormaPagamento;
import br.com.pilates.control.impl.ControlRelatorioMidiaImpl;
import br.com.pilates.control.impl.ControlRelatorioFormaPagamentoImpl;

public class FachadaRelatorio {
	
	private static FachadaRelatorio instance;
	private ControlRelatorioFormaPagamento controlRelatorioFormaPagamento;
	private ControlRelatorioMidia controlRelatorioMidia;
	
	private FachadaRelatorio() {
		this.controlRelatorioFormaPagamento = new ControlRelatorioFormaPagamentoImpl();
		this.controlRelatorioMidia = new ControlRelatorioMidiaImpl();
	}
	
	public static FachadaRelatorio getInstance() {
		if (instance == null) {
			instance = new FachadaRelatorio();
		}
		return instance;
	}
	
	public Collection<RelatorioFormaPagamento> relatorioFormaPagamento(Date dataInicial, Date dataFinal, String ordenacao) {
		return this.controlRelatorioFormaPagamento.relatorioFormaPagamento(dataInicial, dataFinal, ordenacao);
	}
	
	public Collection<RelatorioMidia> relatorioMidia(Date dataInicial, Date dataFinal, String ordenacao) {
		return this.controlRelatorioMidia.relatorioMidia(dataInicial, dataFinal, ordenacao);
	}
}
