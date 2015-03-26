package br.com.pilates.control;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Cadastro;
import br.com.pilates.base.Cliente;
import br.com.pilates.base.ContaReceber;
import br.com.pilates.base.Professor;
import br.com.pilates.base.TipoContaReceber;

public interface ControlContaReceber {

	void inserirContaReceberCadastro(ContaReceber contaReceber, Cadastro cadastro);

	Collection<ContaReceber> getContasReceberByCadastro(Cadastro cadastro);

	void removerContaReceberCadastro(ContaReceber contaReceber);

	Collection<TipoContaReceber> getAllTiposContaReceber();

	Collection<ContaReceber> getContasReceberMesAtual(Date dataInicial, Date dataFinal);

	void inserirContaReceber(ContaReceber contaReceber);

	Collection<ContaReceber> getContasReceberByProfessorData(Date dataInicial, Date dataFinal, Professor professor);

	double getSomaEntradasByProfessorData(Date dataInicial, Date dataFinal, Professor professor);

	double getSomaPercentagemProfessorByProfessorData(Date dataInicial, Date dataFinal, Professor professor);

	double getSomaPercentagemAllProfessoresByData(Date dataInicial, Date dataFinal);

	Collection<ContaReceber> getContasReceberAvulso(Date dataInicial, Date dataFinal);

	double getSomaEntradasAvulso(Date dataInicial, Date dataFinal);

	String getRendimentoServicosStr(Date dataInicio, Date dataFinal);

	Collection<ContaReceber> getContasReceberByCliente(Cliente cliente);

	double getSaldoCaixa(Date dataInicial);

	double getEntradasCaixa(Date dataInicial);

	double getEntradasVendasCaixa(Date dataInicial);

	double getSaidasCaixa(Date dataInicial);

	double getDescontosEntradasCaixa(Date dataInicial);

	double getSaldoAnteriorCaixa(Date dataInicial);

	String gerarDemonstrativoResultado(Date dataInicial, Date dataFinal);

	double getEntradasLiquidasCaixa(Date dataInicial, Date dataFinal);

}
