package br.com.pilates.control;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Estoque;
import br.com.pilates.base.Professor;

public interface ControlEstoque {

	Collection<Estoque> getEstoques(Date dataInicial, Date dataFinal, String status, String nome);

	void addEstoque(Estoque estoque);

	void removerEstoque(Estoque estoque);

	void venderEstoque(Estoque estoque);

	Collection<Estoque> getEstoquesVendido(Date dataInicial, Date dataFinal, Professor vendedor);

	double getSomaVendasByProfessorData(Date dataInicial, Date dataFinal, Professor professor);

	double getPorcentagemVendasByProfessorData(Date dataInicial, Date dataFinal, Professor professor);

	double getSomaVendas(Date dataInicial, Date dataFinal);

}
