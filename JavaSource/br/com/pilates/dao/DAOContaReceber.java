package br.com.pilates.dao;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Cadastro;
import br.com.pilates.base.Cliente;
import br.com.pilates.base.ContaReceber;
import br.com.pilates.base.Contrato;
import br.com.pilates.base.Professor;
import br.com.pilates.base.Servico;

public interface DAOContaReceber extends IHibernateDAO<ContaReceber> {

	Collection<ContaReceber> getContasReceberByCadastro(Cadastro cadastro);

	Collection<ContaReceber> getContasReceberByMes(Date mesAtual, Date mesProximo);

	Collection<ContaReceber> getContasReceberByProfessorData(Date dataInicial, Date dataFinal, Professor professor);

	double getSomaEntradasByProfessorData(Date dataInicial, Date dataFinal, Professor professor);

	double getSomaContaReceberByContrato(Date dataInicial, Date dataFinal, Contrato contrato, Professor professor);

	Collection<ContaReceber> getContasReceberByClienteModalidade(Cliente cliente, Servico servico);

	Collection<ContaReceber> getContasReceberAvulso(Date dataInicial, Date dataFinal);

	double getSomaEntradasAvulso(Date dataInicial, Date dataFinal);

	Double getSomaContaReceberByModalidade(Servico serv, Date dataInicio, Date dataFinal);

	double getEntradasCaixa(Date dataInicial, Date dataFinal);

	double getSaidasCaixa(Date dataInicial, Date dataFinal);

	double getEntradasVendasCaixa(Date dataInicial, Date dataFinal);

	double getDescontosEntradasCaixa(Date dataInicial, Date dataFinal);

	double getEntradasLiquidasCaixa(Date dataInicial, Date dataFinal);

	double getEntradasLiquidasCaixaParcelas(Date dataInicial, Date dataFinal);

}
