package br.com.pilates.fachada;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.ContaPagar;
import br.com.pilates.base.TipoContaPagar;
import br.com.pilates.base.enums.TipoCusto;
import br.com.pilates.control.ControlContaPagar;
import br.com.pilates.control.impl.ControlContaPagarImpl;

public class FachadaContaPagar {

	private static FachadaContaPagar instance;
	private final ControlContaPagar controlContaPagar;

	private FachadaContaPagar() {
		this.controlContaPagar = new ControlContaPagarImpl();
	}

	public static FachadaContaPagar getInstance() {
		if (instance == null) {
			instance = new FachadaContaPagar();
		}
		return instance;
	}

	public void inserirContaPagar(ContaPagar contaPagar) {
		this.controlContaPagar.inserirContaPagar(contaPagar);
	}

	public Collection<TipoContaPagar> getAllTiposContaPagar() {
		return this.controlContaPagar.getAllTiposContaPagar();
	}

	public Collection<ContaPagar> getContasPagarByData(Date dataInicial, Date dataFinal) {
		return this.controlContaPagar.getContasPagarByData(dataInicial, dataFinal);
	}

	public double getSomaSaidasByData(Date dataInicial, Date dataFinal, TipoCusto tipoCusto) {
		return this.controlContaPagar.getSomaSaidasByData(dataInicial, dataFinal, tipoCusto);
	}
}
