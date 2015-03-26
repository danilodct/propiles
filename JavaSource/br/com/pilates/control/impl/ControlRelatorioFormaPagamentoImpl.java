package br.com.pilates.control.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.enums.FormaPagamento;
import br.com.pilates.base.util.RelatorioFormaPagamento;
import br.com.pilates.control.ControlRelatorioFormaPagamento;
import br.com.pilates.dao.DAOTipoContaReceber;
import br.com.pilates.dao.impl.DAOTipoContaReceberImpl;

public class ControlRelatorioFormaPagamentoImpl implements ControlRelatorioFormaPagamento {

	private final DAOTipoContaReceber daoFormaContaReceber;

	public ControlRelatorioFormaPagamentoImpl() {
		this.daoFormaContaReceber = new DAOTipoContaReceberImpl();
	}

	@Override
	public Collection<RelatorioFormaPagamento> relatorioFormaPagamento(Date dataInicial, Date dataFinal, String ordenacao) {
		Collection<RelatorioFormaPagamento> relatorios = new ArrayList<RelatorioFormaPagamento>();
		RelatorioFormaPagamento linha = null;
		FormaPagamento[] formas = FormaPagamento.values();
		int total = 0;
		for (FormaPagamento forma : formas) {
			linha = new RelatorioFormaPagamento();
			linha.setTipo(forma);
			int qt = this.daoFormaContaReceber.getQtContaReceberByFormaPagamento(forma);
			linha.setQuantidade(qt);
			relatorios.add(linha);
			total += qt;
		}
		for (RelatorioFormaPagamento relatorio : relatorios) {
			relatorio.setPorcentagem((100 * relatorio.getQuantidade()) / total);
		}
		return relatorios;
	}

}
