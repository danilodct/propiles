package br.com.pilates.dao;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Estoque;
import br.com.pilates.base.Professor;

public interface DAOEstoque extends IHibernateDAO<Estoque> {

	Collection<Estoque> getEstoques(Date dataInicial, Date dataFinal, String status, String nome);

	Collection<Estoque> getEstoquesVendido(Date dataInicial, Date dataFinal, Professor vendedor);

	double getSomaVendasByProfessorData(Date dataInicial, Date dataFinal, Professor professor);

	double getSomaVendas(Date dataInicial, Date dataFinal);

}
