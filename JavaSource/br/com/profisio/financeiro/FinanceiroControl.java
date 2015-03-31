package br.com.profisio.financeiro;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;

import br.com.profisio.basics.Atividade;
import br.com.profisio.basics.Cadastro;
import br.com.profisio.basics.CentroCusto;
import br.com.profisio.basics.Colaborador;
import br.com.profisio.basics.Configuracao;
import br.com.profisio.basics.ContaPagar;
import br.com.profisio.basics.ContaReceber;
import br.com.profisio.basics.Contrato;
import br.com.profisio.basics.Frequencia;
import br.com.profisio.basics.Movimentacao;
import br.com.profisio.basics.Servico;
import br.com.profisio.basics.TipoContaPagar;
import br.com.profisio.basics.enums.FormaPagamento;
import br.com.profisio.basics.enums.StatusConta;
import br.com.profisio.basics.enums.TipoCusto;
import br.com.profisio.basics.enums.TipoMovimentacao;
import br.com.profisio.cadastro.CadastroControl;
import br.com.profisio.colaborador.ColaboradorControl;
import br.com.profisio.configuracao.ConfiguracaoControl;
import br.com.profisio.frequencia.FrequenciaControl;
import br.com.profisio.util.ControllerBase;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.ProfisioException;
import br.com.profisio.util.SystemUtils;
import br.com.profisio.util.Tenant;

public class FinanceiroControl extends ControllerBase {

	private static FinanceiroControl instance = null;
	private FinanceiroDAO dao = null;

	private FinanceiroControl() {
		dao = (FinanceiroDAO) FinanceiroDAO.daoFactory();
	}

	public static FinanceiroControl getInstance() {
		if (instance == null)
			instance = new FinanceiroControl();
		return instance;
	}

	public Collection<ContaReceber> getContasReceberByCadastro(Cadastro cadastro) {
		SystemUtils.assertObjectIsNotNullHasId(cadastro);
		Collection<ContaReceber> contasReceber = this.dao.getContasReceberByCadastro(cadastro);
		return contasReceber;
	}

	public void remover(ContaReceber contaReceber) {
		SystemUtils.assertObjectIsNotNullHasId(contaReceber);
		contaReceber = this.dao.getContaReceberById(contaReceber.getId());
		this.dao.desassociarFrequenciasContaReceber(contaReceber);
		this.removerParcelasContaReceber(contaReceber);
		this.dao.remover(contaReceber);
	}

	public void removerParcelasContaReceber(ContaReceber contaReceber) {
		SystemUtils.assertObjectIsNotNullHasId(contaReceber);
		Collection<ContaReceber> parcelas = this.dao.getParcelasByContaReceber(contaReceber);
		if (parcelas != null && parcelas.size() > 0) {
			for (ContaReceber conta : parcelas) {
				this.dao.remover(conta);
			}
		}
	}

	public void cadastrarContaReceber(Tenant tenant, ContaReceber contaReceber, Boolean avulso) {
		SystemUtils.assertObjectIsNotNull(contaReceber);
		if ((avulso == null || avulso == false) && contaReceber.getAtividade() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_ATIVIDADE);
		if (contaReceber.getValor() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_VALOR);
		if (contaReceber.getDataLancamento() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_DATA);
		if (contaReceber.getFormaPagamento() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_FORMA_PAGAMENTO);

		if ((avulso == null || !avulso) && (contaReceber.getQtdSessoes() == null || contaReceber.getQtdSessoes() < 0))
			contaReceber.setQtdSessoes(0);

		if (contaReceber.getStatus() == null)
			contaReceber.setStatus(StatusConta.PENDENTE);

		// nao faz sentido contaReceber ter outro colaborador. A freq sim e ai a
		// $ vai para o outro de acordo com a freq.
		contaReceber.setColaborador(null);
		contaReceber.setOutroColaborador(false);

		Double valorOriginal = contaReceber.getValor();

		this.processarParcelasEDescontos(contaReceber);

		contaReceber.setQtdParcelas(contaReceber.getFormaPagamento().getQtdParcelas());
		contaReceber.setPrimeiraParcela(true);
		contaReceber.setValorCheio(valorOriginal);
		contaReceber.setTenant(tenant);
		this.dao.cadastrar(contaReceber);

		Atividade atividade = null;
		String cliente = "";
		if (contaReceber.getAtividade() != null) {
			atividade = CadastroControl.getInstance().getAtividadeById(contaReceber.getAtividade());
			cliente = atividade.getCadastro().getNome() + "; ";
		}
		String nota = "Valor original: R$ " + valorOriginal + "; Dia do pagamento: " + contaReceber.getDataLancamentoStr() + "; " + contaReceber.getFormaPagamento().getValor() + "; " + cliente + contaReceber.getObservacao();
		String compNota = "";
		if (contaReceber.getFormaPagamento().getQtdParcelas() > 1)
			compNota = " [" + contaReceber.getOrdemParcelamento() + "/" + contaReceber.getFormaPagamento().getQtdParcelas() + "]";
		cadastrarMovimentacao(tenant, contaReceber, nota + compNota);

		Collection<ContaReceber> parcelas = this.gerarParcelas(contaReceber);
		if (parcelas != null && parcelas.size() > 0) {
			for (ContaReceber parcela : parcelas) {
				parcela.setTenant(tenant);
				this.dao.cadastrar(parcela);
				compNota = "";
				if (contaReceber.getFormaPagamento().getQtdParcelas() > 1)
					compNota = " [" + parcela.getOrdemParcelamento() + "/" + contaReceber.getFormaPagamento().getQtdParcelas() + "]";
				this.cadastrarMovimentacao(tenant, parcela, nota + compNota);
			}
		}

	}

	private void cadastrarMovimentacao(Tenant tenant, ContaReceber contaReceber, String nota) {
		Movimentacao movimentacao = new Movimentacao(contaReceber.getCaixa(), contaReceber.getDataPagamento(), nota, TipoMovimentacao.CONTA_RECEBER);
		movimentacao.setTenant(tenant);
		this.dao.cadastrar(movimentacao);
		contaReceber.setMovimentacao(movimentacao);
		contaReceber.setTenant(tenant);
		this.dao.editar(contaReceber);
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
			contaReceber.setDataLancamento(contaReceber.getDataLancamento());
		}
	}

	private Date aumentarUmMes(Date dataLancamento) {
		Calendar calendar = GregorianCalendar.getInstance();
		calendar.setTime(dataLancamento);
		calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) + 1);
		return calendar.getTime();
	}

	private Collection<ContaReceber> gerarParcelas(ContaReceber contaReceber) {
		Collection<ContaReceber> retorno = new ArrayList<ContaReceber>();
		Date dataLancamento = contaReceber.getDataLancamento();
		Date dataPagamento = contaReceber.getDataPagamento();
		if (contaReceber.getFormaPagamento() != FormaPagamento.DINHEIRO && contaReceber.getFormaPagamento() != FormaPagamento.DEBITO && contaReceber.getFormaPagamento() != FormaPagamento.CHEQUE_1 && contaReceber.getFormaPagamento() != FormaPagamento.CREDITO_1) {
			for (int i = 1; i < contaReceber.getFormaPagamento().getQtdParcelas() && contaReceber.getFormaPagamento() != FormaPagamento.DEBITO; i += 1) {
				ContaReceber contaTemp = new ContaReceber();
				contaReceber.parseDados(contaTemp);
				contaTemp.setOrdemParcelamento(i + 1);
				Date dataPagamentoMaisUm = this.aumentarUmMes(dataPagamento);
				dataPagamento = dataPagamentoMaisUm;
				contaTemp.setDataPagamento(dataPagamentoMaisUm);
				contaTemp.setDataLancamento(dataLancamento);
				contaTemp.setParcelamentoPai(contaReceber);
				contaTemp.setPrimeiraParcela(false);
				retorno.add(contaTemp);
			}
		}
		return retorno;
	}

	public void cadastrarContaPagar(Tenant tenant, ContaPagar contaPagar) {
		SystemUtils.assertObjectIsNotNull(contaPagar);
		if (contaPagar.getValor() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_VALOR);
		if (contaPagar.getTipoCusto() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_TIPO_CUSTO);
		if (contaPagar.getTipo() != null && (contaPagar.getTipo().getNome() == null || contaPagar.getTipo().getNome().trim().equalsIgnoreCase("") || contaPagar.getTipo().getNome().trim().equalsIgnoreCase("Outro")))
			throw new ProfisioException(ProfisioBundleUtil.TIPO_INVALIDO);
		if (contaPagar.getMesCompetencia() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_MES_COMPETENCIA);

		if (contaPagar.getStatus() == null)
			contaPagar.setStatus(StatusConta.PENDENTE);
		if (contaPagar.getCentroCusto() != null && (contaPagar.getCentroCusto().getId() == null || contaPagar.getCentroCusto().getId().intValue() == -1))
			contaPagar.setCentroCusto(null);

		TipoContaPagar tipo = contaPagar.getTipo();
		tipo.setTenant(tenant);
		this.dao.cadastrar(tipo);

		contaPagar.setTenant(tenant);
		this.dao.cadastrar(contaPagar);

		Movimentacao movimentacao = new Movimentacao(-contaPagar.getValor(), contaPagar.getDataPagamento(), contaPagar.getTipo().getNome() + " - " + contaPagar.getObservacao(), TipoMovimentacao.CONTA_PAGAR);
		movimentacao.setTenant(tenant);
		this.dao.cadastrar(movimentacao);
		contaPagar.setMovimentacao(movimentacao);
		contaPagar.setTenant(tenant);
		this.dao.editar(contaPagar);
	}

	public Collection<ContaPagar> getContasPagar(Tenant tenant, TipoCusto tipoCusto, Date dataInicial, Date dataFinal, CentroCusto centroCusto, TipoContaPagar tipoContaPagar, StatusConta statusContaPagar, Boolean geral) {
		// se o usuário nao informou data inicio e fim, vai pegar paenas
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);
		}
		if (tipoContaPagar != null && (tipoContaPagar.getNome() == null || tipoContaPagar.getNome().equals("") || tipoContaPagar.getNome().equals("-1")))
			tipoContaPagar = null;
		if (centroCusto != null && (centroCusto.getId() == null || centroCusto.getId().intValue() == -1))
			centroCusto = null;
		return this.dao.getContasPagar(tenant, tipoCusto, dataInicial, dataFinal, centroCusto, tipoContaPagar, statusContaPagar, geral);
	}

	public void removerContaPagar(ContaPagar contaPagar) {
		SystemUtils.assertObjectIsNotNullHasId(contaPagar);
		contaPagar.setCentroCusto(null);
		this.dao.remover(contaPagar);
	}

	public Collection<TipoContaPagar> getAllTiposContaPagar(Tenant tenant) {
		return this.dao.getAllTiposContaPagar(tenant);
	}

	public ContaPagar getContaPagar(ContaPagar contaPagar) {
		SystemUtils.assertObjectIsNotNullHasId(contaPagar);
		return this.dao.getContaPagarById(contaPagar.getId());
	}

	public void editarContaPagar(Tenant tenant, ContaPagar contaPagar) {
		SystemUtils.assertObjectIsNotNullHasId(contaPagar);
		if (contaPagar.getValor() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_VALOR);
		if (contaPagar.getTipoCusto() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_TIPO_CUSTO);

		if (contaPagar.getStatus() == null)
			contaPagar.setStatus(StatusConta.PENDENTE);
		if (contaPagar.getCentroCusto() != null && (contaPagar.getCentroCusto().getId() == null || contaPagar.getCentroCusto().getId().intValue() == -1))
			contaPagar.setCentroCusto(null);

		TipoContaPagar tipo = contaPagar.getTipo();
		tipo.setTenant(tenant);
		this.dao.cadastrar(tipo);

		ContaPagar contaPagarBD = this.dao.getContaPagarById(contaPagar.getId());
		contaPagar.setMovimentacao(contaPagarBD.getMovimentacao());
		contaPagar.setTenant(tenant);
		this.dao.editar(contaPagar);

		Movimentacao movBd = this.dao.getMovimentacaoByContaPagar(contaPagar);
		movBd.setValor(contaPagar.getValor());
		movBd.setData(contaPagar.getDataPagamento());
		movBd.setDescricao(contaPagar.getObservacao());
		movBd.setTenant(tenant);
		this.dao.editar(movBd);
	}

	// Não trás as parcelas
	public Collection<ContaReceber> getContasReceber(Tenant tenant, Date dataInicial, Date dataFinal, FormaPagamento formaPagamento, Colaborador colaborador, Servico servico, StatusConta statusContaPagar) {
		// se o usuário nao informou data inicio e fim, vai pegar paenas
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);
		}

		if (colaborador != null && (colaborador.getId() == null || colaborador.getId().intValue() == -1))
			colaborador = null;
		if (servico != null && (servico.getId() == null || servico.getId().intValue() == -1))
			servico = null;

		Collection<ContaReceber> contasReceber = this.dao.getContasReceber(tenant, dataInicial, dataFinal, formaPagamento, colaborador, servico, statusContaPagar);
		return contasReceber;
	}

	public Collection<ContaReceber> getContasReceberAvulso(Tenant tenant, Date dataInicial, Date dataFinal, FormaPagamento formaPagamento, StatusConta statusContaPagar) {
		// se o usuário nao informou data inicio e fim, vai pegar paenas
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);
		}

		return this.dao.getContasReceberAvulso(tenant, dataInicial, dataFinal, formaPagamento, statusContaPagar);
	}

	public Collection<Movimentacao> getMovimentacoes(Tenant tenant, Date dataInicial, Date dataFinal) {
		// se o usuário nao informou data inicio e fim, vai pegar paenas
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getHoje();
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);
		}
		return this.dao.getMovimentacoes(tenant, dataInicial, dataFinal);
	}

	public Double getSaldoAnteriorCaixa(Tenant tenant, Date dataInicial) {
		if (dataInicial == null) {
			Calendar calendar = Calendar.getInstance();
			calendar.set(Calendar.AM_PM, Calendar.AM);
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			dataInicial = calendar.getTime();
		}
		Configuracao configuracao = ConfiguracaoControl.getInstance().getConfiguracao(tenant);
		Double caixaValorInicial = configuracao.getCaixaValorInicial();
		if (caixaValorInicial == null)
			caixaValorInicial = 0.0;

		Date caixaDataInicial = configuracao.getCaixaDataInicial();
		if (caixaDataInicial != null)
			caixaDataInicial = SystemUtils.setHoraData(caixaDataInicial, Calendar.PM, 23, 59, 59);

		// soma do saldo determiando nas configuracoes do caixa + todas as
		// entradas, saidas e vendas da data determinada até a data inicial de
		// pesquisa
		double saldo = 0;
		if (caixaDataInicial.compareTo(dataInicial) < 0)
			saldo = this.getSomaMovimentacoes(tenant, caixaDataInicial, dataInicial);
		return saldo + caixaValorInicial;
	}

	private double getSomaMovimentacoes(Tenant tenant, Date caixaDataInicial, Date dataInicial) {
		return this.dao.getSomaMovimentacoes(tenant, caixaDataInicial, dataInicial);
	}

	public Collection<ContaReceber> getPagamentosCheiosByAtividade(Atividade atividade) {
		SystemUtils.assertObjectIsNotNullHasId(atividade);
		return this.dao.getPagamentosCheiosByAtividade(atividade);
	}

	public ContaReceber getContaReceber(ContaReceber contaReceber) {
		SystemUtils.assertObjectIsNotNullHasId(contaReceber);
		return this.dao.getContaReceberById(contaReceber.getId());
	}

	public String getContasReceberClientesCSV(Tenant tenant, Date dataInicial, Date dataFinal, FormaPagamento formaPagamento, Colaborador colaborador, Servico servico, StatusConta statusContaPagar) {
		String csv = "CLIENTE;E-MAIL;DATA NASCIMENTO;BAIRRO;SEXO;SERVIÇO;MES COMPETENCIA;VALOR\n";
		// se o usuário nao informou data inicio e fim, vai pegar paenas
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getHoje();
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);
		}
		if (colaborador != null && (colaborador.getId() == null || colaborador.getId().intValue() == -1))
			colaborador = null;
		if (servico != null && (servico.getId() == null || servico.getId().intValue() == -1))
			servico = null;
		Collection<ContaReceber> contasReceber = this.dao.getContasReceber(tenant, dataInicial, dataFinal, formaPagamento, colaborador, servico, statusContaPagar);
		if (contasReceber != null && contasReceber.size() > 0) {
			for (ContaReceber conta : contasReceber) {
				csv += conta.getAtividade().getCadastro().getNome() + ";" + conta.getAtividade().getCadastro().getEmail() + ";" + conta.getAtividade().getCadastro().getDataNascimentoStr() + ";" + conta.getAtividade().getCadastro().getEndereco().getBairro() + ";" + conta.getAtividade().getCadastro().getSexoStr() + ";" + conta.getAtividade().getContrato().getServico().getNome() + ";" + conta.getDataLancamentoStr() + ";" + conta.getValorCheioComDescontoStr() + "\n";
			}
		}
		return csv;
	}

	public void editarContaReceber(Tenant tenant, ContaReceber contaReceber, Boolean avulso) {
		SystemUtils.assertObjectIsNotNullHasId(contaReceber);
		if ((avulso == null || !avulso) && contaReceber.getAtividade() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_ATIVIDADE);
		if (contaReceber.getValor() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_VALOR);
		if (contaReceber.getDataLancamento() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_DATA);
		if (contaReceber.getFormaPagamento() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_FORMA_PAGAMENTO);
		if ((avulso == null || !avulso) && (contaReceber.getQtdSessoes() == null || contaReceber.getQtdSessoes() < 0))
			throw new ProfisioException(ProfisioBundleUtil.INFORME_QTDSESSOES);

		if (contaReceber.getStatus() == null)
			contaReceber.setStatus(StatusConta.PENDENTE);

		// nao faz sentido contaReceber ter outro colaborador. A freq sim e ai a
		// $ vai para o outro de acordo com a freq.
		contaReceber.setColaborador(null);
		contaReceber.setOutroColaborador(false);

		this.removerParcelasContaReceber(contaReceber);
		this.removerMovimentacoes(contaReceber);

		Double valorOriginal = contaReceber.getValor();

		this.processarParcelasEDescontos(contaReceber);

		contaReceber.setQtdParcelas(contaReceber.getFormaPagamento().getQtdParcelas());
		contaReceber.setPrimeiraParcela(true);
		contaReceber.setValorCheio(valorOriginal);
		contaReceber.setTenant(tenant);
		this.dao.editar(contaReceber);

		Atividade atividade = null;
		String cliente = "";
		if (contaReceber.getAtividade() != null) {
			atividade = CadastroControl.getInstance().getAtividadeById(contaReceber.getAtividade());
			cliente = atividade.getCadastro().getNome() + "; ";
		}
		String nota = "Valor original: R$ " + valorOriginal + "; Dia do pagamento: " + contaReceber.getDataLancamentoStr() + "; " + contaReceber.getFormaPagamento().getValor() + "; " + cliente + contaReceber.getObservacao();
		String compNota = "";
		if (contaReceber.getFormaPagamento().getQtdParcelas() > 1)
			compNota = "[" + contaReceber.getOrdemParcelamento() + "/" + contaReceber.getFormaPagamento().getQtdParcelas() + "]";
		cadastrarMovimentacao(tenant, contaReceber, nota + compNota);

		Collection<ContaReceber> parcelas = this.gerarParcelas(contaReceber);
		if (parcelas != null && parcelas.size() > 0) {
			for (ContaReceber parcela : parcelas) {
				parcela.setTenant(tenant);
				this.dao.cadastrar(parcela);
				compNota = "";
				if (contaReceber.getFormaPagamento().getQtdParcelas() > 1)
					compNota = "[" + parcela.getOrdemParcelamento() + "/" + contaReceber.getFormaPagamento().getQtdParcelas() + "]";
				this.cadastrarMovimentacao(tenant, parcela, nota + compNota);
			}
		}
	}

	public void removerMovimentacoes(ContaReceber contaReceber) {
		SystemUtils.assertObjectIsNotNullHasId(contaReceber);
		this.dao.removerMovimentacao(contaReceber);
	}

	public Collection<Colaborador> getFolhaPagamento(Tenant tenant, Colaborador colaborador, Date dataInicial) {
		Collection<Colaborador> temp = new ArrayList<Colaborador>();
		if (dataInicial != null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(dataInicial);
			Date dataFinal = SystemUtils.getUltimoDiaMesAtual(dataInicial);
			if (colaborador == null || colaborador.getId() == null || colaborador.getId().intValue() == -1)
				temp = ColaboradorControl.getInstance().getColaboradores(tenant, null);
			else {
				colaborador = ColaboradorControl.getInstance().getColaboradorById(colaborador.getId());
				temp.add(colaborador);
			}
			if (temp != null && temp.size() > 0) {
				for (Colaborador col : temp) {
					Collection<Frequencia> frequencias = FrequenciaControl.getInstance().getFrequencias(col, dataInicial, dataFinal);
					if (frequencias != null && frequencias.size() > 0) {
						for (Frequencia freq : frequencias) {
							if (freq.getContaReceber() != null) {
								Double valorCheio = freq.getContaReceber().getValorCheio();
								Integer qtdSessoes = freq.getContaReceber().getQtdSessoes();
								if (qtdSessoes == 0)
									qtdSessoes = FrequenciaControl.getInstance().getQtdFrequenciasByPagamento(freq.getContaReceber());
								Contrato contrato = ColaboradorControl.getInstance().getContratoByColaboradorServico(col, freq.getServicoCerto());
								Double valorFrequencia = 0.0;
								if (contrato != null) {
									Double porcAtendimentos = contrato.getPercentual();
									valorFrequencia = (valorCheio / qtdSessoes) * (porcAtendimentos / 100);
								}
								freq.setPorcentagemColaborador(valorFrequencia);
							} else {
								freq.setPorcentagemColaborador(0.0);
							}
						}
					}
					col.setFrequencias(frequencias);
					Collection<ContaPagar> pagamentos = this.getPagamentosColaboradores(tenant, col, dataInicial, dataFinal);
					if (pagamentos != null && pagamentos.size() > 0)
						col.setJaTemPagamentos(true);
					else
						col.setJaTemPagamentos(false);
				}
			}
		}
		return temp;
	}

	public Collection<ContaPagar> getPagamentosColaboradores(Tenant tenant, Colaborador colaborador, Date dataInicial, Date dataFinal) {
		// se o usuário nao informou data inicio e fim, vai pegar paenas
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);
		}
		return this.dao.getPagamentosColaboradores(tenant, colaborador, dataInicial, dataFinal);
	}

}
