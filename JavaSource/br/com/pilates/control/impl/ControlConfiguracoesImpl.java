package br.com.pilates.control.impl;

import java.util.Date;

import br.com.pilates.base.Configuracao;
import br.com.pilates.control.ControlConfiguracoes;
import br.com.pilates.dao.DAOConfiguracao;
import br.com.pilates.dao.impl.DAOConfiguracaoImpl;
import br.com.pilates.excecao.PilatesException;
import br.com.pilates.util.PilatesBundleUtil;

public class ControlConfiguracoesImpl implements ControlConfiguracoes {

	private final DAOConfiguracao dao;

	public ControlConfiguracoesImpl() {
		this.dao = new DAOConfiguracaoImpl();
	}

	@Override
	public Configuracao getConfiguracoes() {
		return this.dao.read(Configuracao.class, 1);
	}

	@Override
	public void editarConfiguracoesCaixa(Configuracao configuracoes) {
		if (configuracoes == null)
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		double valorInicial = configuracoes.getCaixaValorInicial();
		Date dataInicial = configuracoes.getCaixaDataInicial();
		configuracoes = this.dao.read(Configuracao.class, 1);
		configuracoes.setCaixaDataInicial(dataInicial);
		configuracoes.setCaixaValorInicial(valorInicial);
		this.dao.update(configuracoes);
	}
}
