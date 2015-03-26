package br.com.pilates.control.impl;

import java.util.Calendar;
import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Estoque;
import br.com.pilates.base.Professor;
import br.com.pilates.base.enums.StatusEstoque;
import br.com.pilates.control.ControlEstoque;
import br.com.pilates.dao.DAOEstoque;
import br.com.pilates.dao.DAOProfessor;
import br.com.pilates.dao.impl.DAOEstoqueImpl;
import br.com.pilates.dao.impl.DAOProfessorImpl;
import br.com.pilates.util.SystemUtils;

public class ControlEstoqueImpl implements ControlEstoque {

	private final DAOEstoque dao;
	private final DAOProfessor daoVendedor;

	public ControlEstoqueImpl() {
		this.dao = new DAOEstoqueImpl();
		this.daoVendedor = new DAOProfessorImpl();
	}

	@Override
	public Collection<Estoque> getEstoques(Date dataInicial, Date dataFinal, String status, String nome) {
		if (status == null)
			status = "DISPONIVEL";
		else if (status.equals(""))
			status = null;
		dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
		dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 11, 59, 59);
		return this.dao.getEstoques(dataInicial, dataFinal, status, nome);
	}

	@Override
	public void addEstoque(Estoque estoque) {
		estoque.setStatus(StatusEstoque.DISPONIVEL);
		this.dao.insert(estoque);
	}

	@Override
	public void removerEstoque(Estoque estoque) {
		this.dao.delete(estoque);
	}

	@Override
	public void venderEstoque(Estoque estoque) {
		Professor vend = estoque.getVendedor();
		Date data = estoque.getData();
		data = SystemUtils.setHoraData(data, Calendar.PM, 12, 0, 0);
		Double valor = estoque.getValor();
		estoque = this.dao.read(Estoque.class, estoque.getId());
		estoque.setStatus(StatusEstoque.VENDIDO);
		estoque.setVendedor(vend);
		estoque.setData(data);
		estoque.setValor(valor);
		this.dao.update(estoque);
	}

	@Override
	public Collection<Estoque> getEstoquesVendido(Date dataInicial, Date dataFinal, Professor vendedor) {
		if (vendedor != null)
			vendedor = this.daoVendedor.read(Professor.class, vendedor.getId());

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
		return this.dao.getEstoquesVendido(dataInicial, dataFinal, vendedor);
	}

	@Override
	public double getSomaVendasByProfessorData(Date dataInicial, Date dataFinal, Professor professor) {
		return this.dao.getSomaVendasByProfessorData(dataInicial, dataFinal, professor);
	}

	@Override
	public double getPorcentagemVendasByProfessorData(Date dataInicial, Date dataFinal, Professor professor) {
		professor = this.daoVendedor.read(Professor.class, professor.getId());
		double somaVendasByProfessorData = this.dao.getSomaVendasByProfessorData(dataInicial, dataFinal, professor);
		return somaVendasByProfessorData * professor.getPorcentagemVendas() / 100;
	}

	@Override
	public double getSomaVendas(Date dataInicial, Date dataFinal) {
		return this.dao.getSomaVendas(dataInicial, dataFinal);
	}

}
