package br.com.pilates.control.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;

import br.com.pilates.base.Cadastro;
import br.com.pilates.base.Cliente;
import br.com.pilates.base.Configuracao;
import br.com.pilates.base.ContaReceber;
import br.com.pilates.base.Contrato;
import br.com.pilates.base.Professor;
import br.com.pilates.base.Servico;
import br.com.pilates.base.TipoContaReceber;
import br.com.pilates.base.enums.FormaPagamento;
import br.com.pilates.base.enums.StatusConta;
import br.com.pilates.base.enums.TipoCusto;
import br.com.pilates.control.ControlConfiguracoes;
import br.com.pilates.control.ControlContaPagar;
import br.com.pilates.control.ControlContaReceber;
import br.com.pilates.control.ControlEstoque;
import br.com.pilates.control.ControlObjetoBasico;
import br.com.pilates.control.ControlServico;
import br.com.pilates.dao.DAOContaReceber;
import br.com.pilates.dao.DAOContrato;
import br.com.pilates.dao.DAOProfessor;
import br.com.pilates.dao.DAOTipoContaReceber;
import br.com.pilates.dao.impl.DAOContaReceberImpl;
import br.com.pilates.dao.impl.DAOContratoImpl;
import br.com.pilates.dao.impl.DAOProfessorImpl;
import br.com.pilates.dao.impl.DAOTipoContaReceberImpl;
import br.com.pilates.util.SystemUtils;

public class ControlContaReceberImpl implements ControlContaReceber {

	private final DAOContaReceber dao;
	private final DAOTipoContaReceber daoTipo;
	private final DAOContrato daoContrato;
	private final DAOProfessor daoProfessor;
	private final ControlObjetoBasico controlGeral;

	public ControlContaReceberImpl() {
		this.dao = new DAOContaReceberImpl();
		this.daoTipo = new DAOTipoContaReceberImpl();
		this.daoContrato = new DAOContratoImpl();
		this.daoProfessor = new DAOProfessorImpl();
		this.controlGeral = new ControlObjetoBasicoImpl();
	}

	@Override
	public void inserirContaReceberCadastro(ContaReceber contaReceber, Cadastro cadastro) {
		if (contaReceber.getValor() > 0) {
			contaReceber.setCadastro(cadastro);
			if (contaReceber.getStatus() == null) {
				contaReceber.setStatus(StatusConta.PENDENTE);
			}
			this.processarParcelasEDescontos(contaReceber);
			this.dao.insert(contaReceber);
			Collection<ContaReceber> parcelas = this.gerarParcelas(contaReceber);
			if (parcelas != null && parcelas.size() > 0) {
				for (ContaReceber parcela : parcelas) {
					this.dao.insert(parcela);
				}
			}
		}
	}

	private void processarParcelasEDescontos(ContaReceber contaReceber) {
		double valorParcela = contaReceber.getValor();
		if (contaReceber.getFormaPagamento().getQtdParcelas() > 1) {
			valorParcela = contaReceber.getValor() / contaReceber.getFormaPagamento().getQtdParcelas();
		}
		contaReceber.setOrdemParcelamento(1);
		contaReceber.setValor(valorParcela);
		contaReceber.setDescontos(valorParcela * contaReceber.getFormaPagamento().getDesconto());
		contaReceber.setCaixa(valorParcela - contaReceber.getDescontos());
		if (contaReceber.getFormaPagamento() == FormaPagamento.DEBITO || contaReceber.getFormaPagamento() == FormaPagamento.DINHEIRO) {
			contaReceber.setDataPagamento(contaReceber.getDataLancamento());
		} else if (contaReceber.getFormaPagamento() == FormaPagamento.CHEQUE_1 || contaReceber.getFormaPagamento() == FormaPagamento.CHEQUE_2 || contaReceber.getFormaPagamento() == FormaPagamento.CHEQUE_3 || contaReceber.getFormaPagamento() == FormaPagamento.CHEQUE_4 || contaReceber.getFormaPagamento() == FormaPagamento.CHEQUE_5 || contaReceber.getFormaPagamento() == FormaPagamento.CHEQUE_6) {
			contaReceber.setDataPagamento(contaReceber.getDataLancamento());
		} else if (contaReceber.getFormaPagamento() == FormaPagamento.CREDITO_1 || contaReceber.getFormaPagamento() == FormaPagamento.CREDITO_2 || contaReceber.getFormaPagamento() == FormaPagamento.CREDITO_3 || contaReceber.getFormaPagamento() == FormaPagamento.CREDITO_4 || contaReceber.getFormaPagamento() == FormaPagamento.CREDITO_5 || contaReceber.getFormaPagamento() == FormaPagamento.CREDITO_6) {
			contaReceber.setDataPagamento(this.aumentarUmMes(contaReceber.getDataLancamento()));
			contaReceber.setDataLancamento(this.aumentarUmMes(contaReceber.getDataLancamento()));
		}
	}

	private Collection<ContaReceber> gerarParcelas(ContaReceber contaReceber) {
		Collection<ContaReceber> retorno = new ArrayList<ContaReceber>();
		Date dataLancamento = contaReceber.getDataLancamento();
		if (contaReceber.getFormaPagamento() != FormaPagamento.DINHEIRO && contaReceber.getFormaPagamento() != FormaPagamento.DEBITO && contaReceber.getFormaPagamento() != FormaPagamento.CHEQUE_1 && contaReceber.getFormaPagamento() != FormaPagamento.CREDITO_1) {
			for (int i = 1; i < contaReceber.getFormaPagamento().getQtdParcelas(); i += 1) {
				ContaReceber contaTemp = new ContaReceber();
				contaReceber.parseDados(contaTemp);
				contaTemp.setOrdemParcelamento(i + 1);
				dataLancamento = this.aumentarUmMes(dataLancamento);
				contaTemp.setDataPagamento(dataLancamento);
				contaTemp.setDataLancamento(dataLancamento);
				contaTemp.setParcelamentoPai(contaReceber);
				retorno.add(contaTemp);
			}
		}
		return retorno;
	}

	private Date aumentarUmMes(Date dataLancamento) {
		Calendar calendar = GregorianCalendar.getInstance();
		calendar.setTime(dataLancamento);
		calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) + 1);
		return calendar.getTime();
	}

	@Override
	public Collection<ContaReceber> getContasReceberByCadastro(Cadastro cadastro) {
		cadastro = (Cadastro) this.controlGeral.read(Cadastro.class, cadastro.getId());
		return this.dao.getContasReceberByClienteModalidade(cadastro.getCliente(), cadastro.getModalidade().getServico());
	}

	@Override
	public void removerContaReceberCadastro(ContaReceber contaReceber) {
		this.dao.delete(contaReceber);
	}

	@Override
	public Collection<TipoContaReceber> getAllTiposContaReceber() {
		return this.daoTipo.getAllTiposContaReceber();
	}

	@Override
	public Collection<ContaReceber> getContasReceberMesAtual(Date dataInicial, Date dataFinal) {
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
		return this.dao.getContasReceberByMes(dataInicial, dataFinal);
	}

	@Override
	public void inserirContaReceber(ContaReceber contaReceber) {
		if (contaReceber.getValor() > 0) {
			if (contaReceber.getStatus() == null) {
				contaReceber.setStatus(StatusConta.PENDENTE);
			}
			this.processarParcelasEDescontos(contaReceber);
			this.dao.insert(contaReceber);
			Collection<ContaReceber> parcelas = this.gerarParcelas(contaReceber);
			if (parcelas != null && parcelas.size() > 0) {
				for (ContaReceber parcela : parcelas) {
					this.dao.insert(parcela);
				}
			}
		}
	}

	@Override
	public Collection<ContaReceber> getContasReceberByProfessorData(Date dataInicial, Date dataFinal, Professor professor) {
		if (professor != null && (professor.getId() == 0 || professor.getId() == -1)) {
			professor = null;
		}
		// se for logo qd a pagina abre, sem o usuario escolher nada
		if (dataInicial == null && dataFinal == null && professor == null) {
			Calendar calendar = Calendar.getInstance();
			calendar.set(Calendar.AM_PM, Calendar.AM);
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			calendar.set(Calendar.DAY_OF_MONTH, 1);
			dataInicial = calendar.getTime();
			calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) + 1);
			calendar.set(Calendar.DAY_OF_MONTH, 1);
			calendar.set(Calendar.SECOND, -1);
			dataFinal = calendar.getTime();
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 11, 59, 59);
		}
		return this.dao.getContasReceberByProfessorData(dataInicial, dataFinal, professor);
	}

	@Override
	public double getSomaEntradasByProfessorData(Date dataInicial, Date dataFinal, Professor professor) {
		dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
		dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 11, 59, 59);
		return this.dao.getSomaEntradasByProfessorData(dataInicial, dataFinal, professor);
	}

	@Override
	public double getSomaPercentagemProfessorByProfessorData(Date dataInicial, Date dataFinal, Professor professor) {
		dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
		dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 11, 59, 59);
		Collection<Contrato> contratos = this.daoContrato.getContratosFuncionario(professor);
		double soma = 0;
		for (Contrato contrato : contratos) {
			soma += this.dao.getSomaContaReceberByContrato(dataInicial, dataFinal, contrato, professor) * contrato.getPercentual() / 100;
		}
		return soma;
	}

	@Override
	public double getSomaPercentagemAllProfessoresByData(Date dataInicial, Date dataFinal) {
		double soma = 0;
		dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
		dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 11, 59, 59);
		Collection<Professor> allFuncionarios = this.daoProfessor.getFuncionarios();
		for (Professor professor : allFuncionarios) {
			soma += this.getSomaPercentagemProfessorByProfessorData(dataInicial, dataFinal, professor);
		}
		return soma;
	}

	@Override
	public Collection<ContaReceber> getContasReceberAvulso(Date dataInicial, Date dataFinal) {
		if (dataInicial == null && dataFinal == null) {
			Calendar calendar = Calendar.getInstance();
			calendar.set(Calendar.AM_PM, Calendar.AM);
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			calendar.set(Calendar.DAY_OF_MONTH, 1);
			dataInicial = calendar.getTime();
			calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) + 1);
			calendar.set(Calendar.DAY_OF_MONTH, 1);
			calendar.set(Calendar.SECOND, -1);
			dataFinal = calendar.getTime();
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 11, 59, 59);
		}
		return this.dao.getContasReceberAvulso(dataInicial, dataFinal);
	}

	@Override
	public double getSomaEntradasAvulso(Date dataInicial, Date dataFinal) {
		dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
		dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 11, 59, 59);
		return this.dao.getSomaEntradasAvulso(dataInicial, dataFinal);
	}

	@Override
	public String getRendimentoServicosStr(Date dataInicio, Date dataFinal) {
		String retorno = "";
		ControlServico controlServico = new ControlServicoImpl();
		Collection<Servico> servicos = controlServico.getAllServicos();
		for (Servico servico : servicos) {
			Calendar calendar = Calendar.getInstance();
			if (dataInicio != null) {
				calendar.setTime(dataInicio);
				calendar.set(Calendar.AM_PM, Calendar.AM);
				calendar.set(Calendar.HOUR, 0);
				calendar.set(Calendar.MINUTE, 0);
				calendar.set(Calendar.SECOND, 0);
				dataInicio = calendar.getTime();
			}
			if (dataFinal != null) {
				calendar.setTime(dataFinal);
				calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) + 1);
				calendar.set(Calendar.AM_PM, Calendar.AM);
				calendar.set(Calendar.HOUR, 0);
				calendar.set(Calendar.MINUTE, 0);
				calendar.set(Calendar.SECOND, 0);
				calendar.set(Calendar.SECOND, calendar.get(Calendar.SECOND) - 1);
				dataFinal = calendar.getTime();
			}
			Double rendimentos = this.dao.getSomaContaReceberByModalidade(servico, dataInicio, dataFinal);
			retorno += servico.getNome() + "," + rendimentos + ";";
		}
		if (retorno.length() > 0) {
			retorno = retorno.substring(0, retorno.length() - 1);
		}
		retorno = SystemUtils.orderLabelValue(retorno);
		return retorno;
	}

	@Override
	public Collection<ContaReceber> getContasReceberByCliente(Cliente cliente) {
		return this.dao.getContasReceberByClienteModalidade(cliente, null);
	}

	@Override
	public double getSaldoCaixa(Date dataInicial) {
		if (dataInicial == null) {
			Calendar calendar = Calendar.getInstance();
			calendar.set(Calendar.AM_PM, Calendar.PM);
			calendar.set(Calendar.HOUR, 11);
			calendar.set(Calendar.MINUTE, 59);
			dataInicial = calendar.getTime();
		}
		double entradas = this.getEntradasCaixa(dataInicial);
		double vendas = this.getEntradasVendasCaixa(dataInicial);
		double saidas = this.getSaidasCaixa(dataInicial);
		return entradas + vendas - saidas;
	}

	@Override
	public double getEntradasCaixa(Date dataInicial) {
		Date dataFinal = dataInicial;
		if (dataInicial != null) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(dataInicial);
			calendar.set(Calendar.AM_PM, Calendar.AM);
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			dataInicial = calendar.getTime();
			calendar.set(Calendar.AM_PM, Calendar.PM);
			calendar.set(Calendar.HOUR, 11);
			calendar.set(Calendar.MINUTE, 59);
			calendar.set(Calendar.SECOND, 59);
			dataFinal = calendar.getTime();
		}
		return this.dao.getEntradasCaixa(dataInicial, dataFinal);
	}

	@Override
	public double getEntradasLiquidasCaixa(Date dataInicial, Date dataFinal) {
		Calendar calendar = Calendar.getInstance();
		if (dataInicial != null) {
			calendar.setTime(dataInicial);
			calendar.set(Calendar.AM_PM, Calendar.AM);
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			dataInicial = calendar.getTime();
		}
		if (dataFinal != null) {
			calendar.setTime(dataFinal);
			calendar.set(Calendar.AM_PM, Calendar.PM);
			calendar.set(Calendar.HOUR, 11);
			calendar.set(Calendar.MINUTE, 59);
			calendar.set(Calendar.SECOND, 59);
			dataFinal = calendar.getTime();
		}
		double entradasLiquidasCaixa = this.dao.getEntradasLiquidasCaixa(dataInicial, dataFinal);
		double entradasLiquidasCaixaParcelas = this.dao.getEntradasLiquidasCaixaParcelas(dataInicial, dataFinal);

		return entradasLiquidasCaixa + entradasLiquidasCaixaParcelas;
	}

	@Override
	public double getEntradasVendasCaixa(Date dataInicial) {
		Date dataFinal = dataInicial;
		if (dataInicial != null) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(dataInicial);
			calendar.set(Calendar.AM_PM, Calendar.AM);
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			dataInicial = calendar.getTime();
			calendar.set(Calendar.AM_PM, Calendar.PM);
			calendar.set(Calendar.HOUR, 11);
			calendar.set(Calendar.MINUTE, 59);
			calendar.set(Calendar.SECOND, 59);
			dataFinal = calendar.getTime();
		}
		return this.dao.getEntradasVendasCaixa(dataInicial, dataFinal);
	}

	@Override
	public double getSaidasCaixa(Date dataInicial) {
		Date dataFinal = dataInicial;
		if (dataInicial != null) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(dataInicial);
			calendar.set(Calendar.AM_PM, Calendar.AM);
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			dataInicial = calendar.getTime();
			calendar.set(Calendar.AM_PM, Calendar.PM);
			calendar.set(Calendar.HOUR, 11);
			calendar.set(Calendar.MINUTE, 59);
			calendar.set(Calendar.SECOND, 59);
			dataFinal = calendar.getTime();
		}
		return this.dao.getSaidasCaixa(dataInicial, dataFinal);
	}

	@Override
	public double getDescontosEntradasCaixa(Date dataInicial) {
		Date dataFinal = dataInicial;
		if (dataInicial != null) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(dataInicial);
			calendar.set(Calendar.AM_PM, Calendar.AM);
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			dataInicial = calendar.getTime();
			calendar.set(Calendar.AM_PM, Calendar.PM);
			calendar.set(Calendar.HOUR, 11);
			calendar.set(Calendar.MINUTE, 59);
			calendar.set(Calendar.SECOND, 59);
			dataFinal = calendar.getTime();
		}
		return this.dao.getDescontosEntradasCaixa(dataInicial, dataFinal);
	}

	@Override
	public double getSaldoAnteriorCaixa(Date dataInicial) {
		ControlConfiguracoes controlConf = new ControlConfiguracoesImpl();
		Configuracao conf = controlConf.getConfiguracoes();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(dataInicial);
		calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) - 1);
		double entradasCaixa = this.dao.getEntradasCaixa(conf.getCaixaDataInicial(), calendar.getTime());
		double entradasVendas = this.dao.getEntradasVendasCaixa(conf.getCaixaDataInicial(), calendar.getTime());
		double saidasCaixa = this.dao.getSaidasCaixa(conf.getCaixaDataInicial(), calendar.getTime());
		return conf.getCaixaValorInicial() + entradasCaixa + entradasVendas - saidasCaixa;
	}

	private double getFaturamentoBrutoByMesAno(Date dataInicial, Date proximoMes) {
		double entradasMes = this.getEntradasLiquidasCaixa(dataInicial, proximoMes);

		ControlEstoque controlEstoque = new ControlEstoqueImpl();
		double entradasMesVenda = controlEstoque.getSomaVendas(dataInicial, proximoMes);

		return entradasMes + entradasMesVenda;
	}

	@Override
	public String gerarDemonstrativoResultado(Date dataInicial, Date dataFinal) {
		// esta funcao nao deve considerar o dia e sim o ano/mes
		String retorno = "";
		if (dataInicial != null || dataFinal != null) {
			Calendar calendar1 = Calendar.getInstance();
			Calendar calendar2 = Calendar.getInstance();
			if (dataInicial == null) {
				calendar1.set(Calendar.YEAR, 2012);
				calendar1.set(Calendar.MONTH, 8);
				calendar1.set(Calendar.DATE, 1);
			} else {
				calendar1.setTime(dataInicial);
			}
			calendar1.set(Calendar.DATE, 1);
			calendar1.setTime(SystemUtils.setHoraData(calendar1.getTime(), Calendar.AM, 0, 0, 0));

			if (dataFinal != null) {
				calendar2.setTime(dataFinal);
			}
			calendar2.set(Calendar.DAY_OF_MONTH, calendar2.getActualMaximum(Calendar.DAY_OF_MONTH));
			calendar2.setTime(SystemUtils.setHoraData(calendar2.getTime(), Calendar.PM, 11, 59, 59));

			if (calendar1.compareTo(calendar2) > 0) {
				Date timeTemp = calendar1.getTime();
				calendar1.setTime(calendar2.getTime());
				calendar1.setTime(SystemUtils.setHoraData(calendar1.getTime(), Calendar.AM, 0, 0, 0));
				calendar2.setTime(timeTemp);
				calendar2.setTime(SystemUtils.setHoraData(calendar2.getTime(), Calendar.PM, 23, 59, 59));
			}

			double somaFat = 0;
			double somaContasVar = 0;
			double somaMargem = 0;
			double somaContasFixas = 0;
			double somaResultados = 0;
			double percContasVar = 0;
			double percMargem = 0;
			double percContasFixas = 0;
			double percResultados = 0;

			boolean mesIgual = false;
			while (!mesIgual) {
				Calendar calendarProximoMes = Calendar.getInstance();
				calendarProximoMes.setTime(calendar1.getTime());
				calendarProximoMes.set(Calendar.DAY_OF_MONTH, calendarProximoMes.getActualMaximum(Calendar.DAY_OF_MONTH));
				Date proximoMes = SystemUtils.setHoraData(calendarProximoMes.getTime(), Calendar.PM, 23, 59, 59);

				retorno += "|" + calendar1.get(Calendar.YEAR) + SystemUtils.formatarNumeroQtdAlgarismos((calendar1.get(Calendar.MONTH) + 1), 2) + "=";
				mesIgual = calendar1.get(Calendar.YEAR) == calendar2.get(Calendar.YEAR) && calendar1.get(Calendar.MONTH) == calendar2.get(Calendar.MONTH);

				// FATURAMENTO
				Double receitasBruto = this.getFaturamentoBrutoByMesAno(calendar1.getTime(), proximoMes);
				retorno += SystemUtils.parseDoubleToString(receitasBruto) + "=";
				somaFat += receitasBruto;

				// CONTAS PAGAR VARIAVEIS
				ControlContaPagar controlContaPagar = new ControlContaPagarImpl();
				Double contasPagarVariaveis = controlContaPagar.getSomaSaidasByData(calendar1.getTime(), proximoMes, TipoCusto.VARIAVEL);
				retorno += SystemUtils.parseDoubleToString(contasPagarVariaveis) + "=";
				somaContasVar += contasPagarVariaveis;

				// MARGEM CONTRIBUICAO
				double valorMargemContribuicao = receitasBruto - contasPagarVariaveis;
				retorno += SystemUtils.parseDoubleToString(valorMargemContribuicao) + "=";
				somaMargem += valorMargemContribuicao;

				// CONTAS FIXAS
				Double contasPagarFixos = controlContaPagar.getSomaSaidasByData(calendar1.getTime(), proximoMes, TipoCusto.FIXO);
				retorno += SystemUtils.parseDoubleToString(contasPagarFixos) + "=";
				somaContasFixas += contasPagarFixos;

				// RESULTADO
				double valorResultados = valorMargemContribuicao - contasPagarFixos;
				retorno += SystemUtils.parseDoubleToString(valorResultados) + "=";
				somaResultados += valorResultados;

				if (!mesIgual)
					calendar1.set(Calendar.MONTH, calendar1.get(Calendar.MONTH) + 1);
			}
			retorno += "|Totais=" + SystemUtils.parseDoubleToString(somaFat) + "=" + SystemUtils.parseDoubleToString(somaContasVar) + "=" + SystemUtils.parseDoubleToString(somaMargem) + "=" + SystemUtils.parseDoubleToString(somaContasFixas) + "=" + SystemUtils.parseDoubleToString(somaResultados);
			retorno += "|Percentuais=100,00=" + SystemUtils.parseDoubleToString((somaContasVar / somaFat) * 100) + "=" + SystemUtils.parseDoubleToString((somaMargem / somaFat) * 100) + "=" + SystemUtils.parseDoubleToString((somaContasFixas / somaFat) * 100) + "=" + SystemUtils.parseDoubleToString((somaResultados / somaFat) * 100);
		}
		if (retorno.length() > 0)
			retorno = retorno.substring(1, retorno.length());
		return retorno;
	}
}
