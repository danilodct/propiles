package br.com.pilates.control.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Cliente;
import br.com.pilates.base.RelatorioMidia;
import br.com.pilates.control.ControlRelatorioMidia;
import br.com.pilates.dao.DAOCliente;
import br.com.pilates.dao.impl.DAOClienteImpl;

public class ControlRelatorioMidiaImpl implements ControlRelatorioMidia {

	private final DAOCliente daoCliente;

	public ControlRelatorioMidiaImpl() {
		this.daoCliente = new DAOClienteImpl();
	}

	@Override
	public Collection<RelatorioMidia> relatorioMidia(Date dataInicial, Date dataFinal, String ordenacao) {
		Collection<RelatorioMidia> relatorios = new ArrayList<RelatorioMidia>();
		Collection<Cliente> clientes = this.daoCliente.getFormasConhecimento();
		RelatorioMidia linha = null;
		int total = 0;
		for (Cliente cliente : clientes) {
			linha = new RelatorioMidia();
			linha.setMidia(cliente.getConhecimentoStudio());
			int qt = this.daoCliente.getQtdClientesByMidia(cliente.getConhecimentoStudio());
			linha.setQuantidade(qt);
			relatorios.add(linha);
			total += qt;
		}
		if (relatorios != null) {
			linha = new RelatorioMidia();
			linha.setMidia("Não informado");
			int qt = this.daoCliente.getQtdClientesSemMidia();
			linha.setQuantidade(qt);
			total += qt;
			relatorios.add(linha);
		}
		for (RelatorioMidia relatorio : relatorios) {
			relatorio.setPorcentagem((100 * relatorio.getQuantidade()) / total);
		}
		return relatorios;
	}
}
