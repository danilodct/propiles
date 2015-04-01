package br.com.profisio.financeiro;

import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Map;

import br.com.profisio.agenda.AgendaControl;
import br.com.profisio.basics.Agendamento;
import br.com.profisio.basics.Atividade;
import br.com.profisio.basics.Cadastro;
import br.com.profisio.basics.CentroCusto;
import br.com.profisio.basics.Colaborador;
import br.com.profisio.basics.ContaPagar;
import br.com.profisio.basics.ContaReceber;
import br.com.profisio.basics.Estoque;
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
import br.com.profisio.servico.ServicoControl;
import br.com.profisio.util.ProfisioActionSupport;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.ProfisioSessionUtil;
import br.com.profisio.util.SystemUtils;
import br.com.profisio.util.Tenant;
import br.com.profisio.venda.VendaControl;

import com.opensymphony.xwork2.ActionContext;

public class FinanceiroView extends ProfisioActionSupport {

	private static final long serialVersionUID = 4742339788981156278L;

	private final FinanceiroControl controller;

	private Collection<ContaPagar> contasPagar, contasPagarColaboradores;
	private Collection<ContaReceber> contasReceber, contasReceberAvulso;
	private Collection<Estoque> estoques;
	private Collection<Movimentacao> movimentacoes;
	private Collection<Atividade> atividades;
	private Collection<Colaborador> colaboradores;
	private Atividade atividade;
	private Servico servico;
	private ContaReceber contaReceber;
	private Colaborador colaborador;
	private ContaPagar contaPagar;
	private Cadastro cadastro;
	private CentroCusto centroCusto;
	private Date dataInicial, dataFinal;
	private Double soma = 0.0, somaAvulso = 0.0, somaEstoque = 0.0, somaTotal = 0.0;
	private String novoTipoContaPagar, aba;
	private TipoContaPagar tipoContaPagar;
	private StatusConta statusContaPagar;
	private FormaPagamento formaPagamento;
	private Boolean avulso;
	private double somaEntradas, somaSaidas;
	private Integer qtdAgendamentos;

	private FileInputStream fileInputStream;

	public FinanceiroView() {
		controller = FinanceiroControl.getInstance();
	}

	public String actionFolhaPagamento() {
		try {
			
			this.colaboradores = this.controller.getFolhaPagamento(getTenant(), this.colaborador, this.dataInicial);
			this.soma = 0.0;
			if (this.colaboradores != null && this.colaboradores.size() > 0) {
				for (Colaborador col : this.colaboradores) {
					Double somaSalarioBase = col.getSalarioBase();
					this.soma += col.getSalarioBase();
					Collection<Frequencia> frequencias = col.getFrequencias();
					if (frequencias != null && frequencias.size() > 0) {
						for (Frequencia freq : frequencias) {
							this.soma += freq.getPorcentagemColaborador();
							somaSalarioBase += freq.getPorcentagemColaborador();
						}
					}
					col.setSomaSalarioParte(somaSalarioBase);
				}
			}
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionExportContasReceber() {
		try {
			
			String path = SystemUtils.getPath() + "/report_conta_receber.csv";
			DataOutputStream doStream = new DataOutputStream(new FileOutputStream(path));
			doStream.writeBytes(this.controller.getContasReceberClientesCSV(getTenant(), dataInicial, dataFinal, formaPagamento, colaborador, servico, statusContaPagar));
			doStream.flush();
			doStream.close();
			fileInputStream = new FileInputStream(path);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionGetPagamentosCheiosByAtividade() {
		String xml = XML_HEAD;
		try {
			
			this.contasReceber = this.controller.getPagamentosCheiosByAtividade(getTenant(), this.atividade);
			xml += "<pagamentos>";
			if (this.contasReceber != null && this.contasReceber.size() > 0) {
				for (ContaReceber contaReceber : this.contasReceber) {
					xml += "<pagamento id=\"" + contaReceber.getIdCript() + "\" data=\"" + contaReceber.getDataLancamentoStr() + "\" qtdSessoes=\"" + contaReceber.getQtdSessoes() + "\" valor=\"" + contaReceber.getValorCheioStr() + "\"  />";
				}
			}
			xml += "</pagamentos>";
		} catch (Exception e) {
			this.dealException(e);
		}
		printResponse(xml);
		return null;
	}

	public String actionCaixa() {
		try {
			
			this.soma = this.controller.getSaldoAnteriorCaixa(getTenant(), dataInicial);
			this.somaTotal += this.soma;
			this.movimentacoes = this.controller.getMovimentacoes(getTenant(), dataInicial, dataFinal);
			this.somaEntradas = 0.0;
			this.somaSaidas = 0.0;
			for (Movimentacao movimentacao : this.movimentacoes) {
				this.somaTotal += movimentacao.getValor();
				if (movimentacao.getTipoMovimentacao() == TipoMovimentacao.CONTA_PAGAR)
					this.somaSaidas += movimentacao.getValor();
				else
					this.somaEntradas += movimentacao.getValor();
			}
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionContasReceber() {
		try {
			
			this.contasReceber = this.controller.getContasReceber(getTenant(), dataInicial, dataFinal, formaPagamento, colaborador, servico, statusContaPagar);
			for (ContaReceber conta : this.contasReceber) {
				Double valorTemp = conta.getValor();
				if (conta.getPrimeiraParcela() && conta.getValorCheio() != null)
					valorTemp = conta.getValorCheioComDesconto();
				this.soma += valorTemp;
				this.somaTotal += valorTemp;
			}

			this.contasReceberAvulso = this.controller.getContasReceberAvulso(getTenant(), dataInicial, dataFinal, formaPagamento, statusContaPagar);
			for (ContaReceber conta : this.contasReceberAvulso) {
				Double valorTemp = conta.getValor();
				if (conta.getPrimeiraParcela() && conta.getValorCheio() != null)
					valorTemp = conta.getValorCheioComDesconto();
				this.somaAvulso += valorTemp;
				this.somaTotal += valorTemp;
			}

			this.estoques = VendaControl.getInstance().getEstoquesVendidos(getTenant(), dataInicial, dataFinal, null, colaborador);
			for (Estoque estoque : this.estoques) {
				this.somaEstoque += estoque.getValor();
				this.somaTotal += estoque.getValor();
			}
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionEditarContaReceber() {
		String resposta = REDIRECT;
		try {
			
			controller.editarContaReceber(getTenant(), contaReceber, false);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		if (this.cadastro != null)
			resposta = "redirect_cadastro";
		return resposta;
	}

	public String actionEditarContaPagar() {
		String resposta = "";
		try {
			
			if (contaPagar != null && this.novoTipoContaPagar != null && !this.novoTipoContaPagar.equals(""))
				contaPagar.setTipo(new TipoContaPagar(this.novoTipoContaPagar));
			this.controller.editarContaPagar(getTenant(), contaPagar);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
			resposta = SUCCESS;
		} catch (Exception e) {
			this.dealException(e);
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionContaReceber() {
		try {
			
			this.contaReceber = this.controller.getContaReceber(getTenant(), contaReceber);
			if (this.cadastro != null && this.cadastro.getId() != null)
				this.atividades = CadastroControl.getInstance().getAtividadesByCadastro(getTenant(), cadastro);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionContaPagar() {
		try {
			
			this.contaPagar = this.controller.getContaPagar(getTenant(), contaPagar);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionContasPagar() {
		try {
			
			TipoCusto tipo = null;
			if (contaPagar != null)
				tipo = contaPagar.getTipoCusto();
			CentroCusto centro = null;
			if (contaPagar != null)
				centro = contaPagar.getCentroCusto();
			this.contasPagar = this.controller.getContasPagar(getTenant(), tipo, dataInicial, dataFinal, centro, tipoContaPagar, statusContaPagar, true);
			if (this.contasPagar != null && this.contasPagar.size() > 0) {
				for (ContaPagar conta : this.contasPagar)
					this.soma += conta.getValor();
			}
			this.contasPagarColaboradores = this.controller.getPagamentosColaboradores(getTenant(), null, dataInicial, dataFinal);
			if (this.contasPagarColaboradores != null && this.contasPagarColaboradores.size() > 0) {
				for (ContaPagar conta : this.contasPagarColaboradores)
					this.soma += conta.getValor();
			}
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionCadastrarContaPagar() {
		String resposta = REDIRECT;
		try {
			
			if (contaPagar != null && this.novoTipoContaPagar != null && !this.novoTipoContaPagar.equals(""))
				contaPagar.setTipo(new TipoContaPagar(this.novoTipoContaPagar));
			controller.cadastrarContaPagar(getTenant(), contaPagar);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.CADASTRO_SUCESSO));
			this.cadastro = null;
		} catch (Exception e) {
			this.dealException(e);
		}
		if (this.aba != null && this.aba.equals("folha"))
			resposta = "redirect_folha";
		return resposta;
	}

	public String actionRemoverContaPagar() {
		try {
			
			controller.removerContaPagar(getTenant(), contaPagar);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionCadastrarContaReceber() {
		String resposta = REDIRECT;
		Boolean sucesso = true;
		
		try {
			controller.cadastrarContaReceber(getTenant(), contaReceber, avulso);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
			sucesso = false;
		}
		if (sucesso && this.cadastro != null) {
			try {
				Collection<Agendamento> agendamentos = this.extractAgendamentos(contaReceber);
				AgendaControl.getInstance().cadastrarAgendamentos(getTenant(), agendamentos);
			} catch (Exception e) {
				this.dealException(e);

			}
		}
		if (this.cadastro != null)
			resposta = "redirect_cadastro";
		return resposta;
	}

	private Collection<Agendamento> extractAgendamentos(ContaReceber contaReceber) {
		
		Collection<Agendamento> retorno = new ArrayList<Agendamento>();
		if (this.qtdAgendamentos != null && this.qtdAgendamentos > 0) {
			Map<String, Object> params = ActionContext.getContext().getParameters();
			for (int i = 0; i < this.qtdAgendamentos; i += 1) {
				String[] dataStr = (String[]) params.get("agendamento" + (i + 1) + ".dataStr");
				String[] horario = (String[]) params.get("agendamento" + (i + 1) + ".horario");
				String[] duracao = (String[]) params.get("agendamento" + (i + 1) + ".duracao");
				if (dataStr[0] != null && !dataStr[0].trim().equals("") && horario[0] != null && !horario[0].trim().equals("")) {
					Agendamento agendamento = new Agendamento();
					agendamento.setCadastro(this.cadastro);
					agendamento.setContaReceber(contaReceber);
					agendamento.setDataInicio(SystemUtils.parseStringToDate(dataStr[0]));
					Atividade atividade = CadastroControl.getInstance().getAtividadeById(getTenant(), contaReceber.getAtividade());
					String titulo = atividade.getContrato().getServico().getNome() + " - " + atividade.getContrato().getColaborador().getNome() + " - " + atividade.getCadastro().getNome();
					agendamento.setTitulo(titulo);
					agendamento.setHorario(horario[0]);
					agendamento.setDuracao(Integer.parseInt(duracao[0]));
					retorno.add(agendamento);
				}
			}
		}
		return retorno;
	}

	public String actionRemoverContaReceber() {
		String resposta = REDIRECT;
		try {
			
			controller.remover(getTenant(), contaReceber);
			this.formaPagamento = null;
			this.colaborador = null;
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		if (this.aba != null && this.aba.equals("contasReceber"))
			resposta = "redirect_cadastro";
		return resposta;
	}

	// 8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

	public TipoCusto[] getAllTiposCusto() {
		return TipoCusto.values();
	}

	public Collection<CentroCusto> getAllCentrosCusto() {
		
		return ServicoControl.getInstance().getCentrosCusto(getTenant());
	}

	public Collection<TipoContaPagar> getAllTiposContaPagar() {
		
		Collection<TipoContaPagar> allTiposContaPagar = this.controller.getAllTiposContaPagar(getTenant());
		if (allTiposContaPagar != null)
			allTiposContaPagar.add(new TipoContaPagar(-1, "Outro"));
		return allTiposContaPagar;
	}

	public Collection<Colaborador> getAllColaboradores() {
		
		return ColaboradorControl.getInstance().getColaboradores(getTenant(), null);
	}

	public FormaPagamento[] getAllFormasPagamento() {
		return FormaPagamento.values();
	}

	// 8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

	public Cadastro getCadastro() {
		return cadastro;
	}

	public void setCadastro(Cadastro cadastro) {
		this.cadastro = cadastro;
	}

	public ContaReceber getContaReceber() {
		return contaReceber;
	}

	public void setContaReceber(ContaReceber contaReceber) {
		this.contaReceber = contaReceber;
	}

	public ContaPagar getContaPagar() {
		return contaPagar;
	}

	public void setContaPagar(ContaPagar contaPagar) {
		this.contaPagar = contaPagar;
	}

	public Collection<ContaPagar> getContasPagar() {
		return contasPagar;
	}

	public void setContasPagar(Collection<ContaPagar> contasPagar) {
		this.contasPagar = contasPagar;
	}

	public String getDataInicialStr() {
		return SystemUtils.parseDataToString(dataInicial);
	}

	public void setDataInicialStr(String dataInicial) {
		this.dataInicial = SystemUtils.parseStringToDate(dataInicial);
	}

	public String getDataFinalStr() {
		return SystemUtils.parseDataToString(dataFinal);
	}

	public void setDataFinalStr(String dataFinal) {
		this.dataFinal = SystemUtils.parseStringToDate(dataFinal);
	}

	public CentroCusto getCentroCusto() {
		return centroCusto;
	}

	public void setCentroCusto(CentroCusto centroCusto) {
		this.centroCusto = centroCusto;
	}

	public String getSomaStr() {
		return SystemUtils.parseDoubleToString(soma);
	}

	public Double getSoma() {
		return soma;
	}

	public void setSoma(Double soma) {
		this.soma = soma;
	}

	public String getNovoTipoContaPagar() {
		return novoTipoContaPagar;
	}

	public void setNovoTipoContaPagar(String novoTipoContaPagar) {
		this.novoTipoContaPagar = novoTipoContaPagar;
	}

	public TipoContaPagar getTipoContaPagar() {
		return tipoContaPagar;
	}

	public void setTipoContaPagar(TipoContaPagar tipoContaPagar) {
		this.tipoContaPagar = tipoContaPagar;
	}

	public String getStatusContaPagarStr() {
		String statusStr = "";
		if (this.statusContaPagar != null)
			statusStr = this.statusContaPagar.getValue();
		return statusStr;
	}

	public void setStatusContaPagarStr(String statusContaPagar) {
		this.statusContaPagar = StatusConta.createEnum(statusContaPagar);
	}

	public String getFormaPagamentoStr() {
		String formaPagamentoStr = "";
		if (this.formaPagamento != null)
			formaPagamentoStr = this.formaPagamento.getValue();
		return formaPagamentoStr;
	}

	public void setFormaPagamentoStr(String formaPagamento) {
		this.formaPagamento = FormaPagamento.createEnum(formaPagamento);
	}

	public Colaborador getColaborador() {
		return colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}

	public Collection<ContaReceber> getContasReceber() {
		return contasReceber;
	}

	public void setContasReceber(Collection<ContaReceber> contasReceber) {
		this.contasReceber = contasReceber;
	}

	public Collection<ContaReceber> getContasReceberAvulso() {
		return contasReceberAvulso;
	}

	public void setContasReceberAvulso(Collection<ContaReceber> contasReceberAvulso) {
		this.contasReceberAvulso = contasReceberAvulso;
	}

	public Collection<Estoque> getEstoques() {
		return estoques;
	}

	public void setEstoques(Collection<Estoque> estoques) {
		this.estoques = estoques;
	}

	public String getSomaAvulsoStr() {
		return SystemUtils.parseDoubleToString(somaAvulso);
	}

	public void setSomaAvulsoStr(String somaAvulso) {
		this.somaAvulso = SystemUtils.parseStringDouble(somaAvulso);
	}

	public String getSomaEstoqueStr() {
		return SystemUtils.parseDoubleToString(somaEstoque);
	}

	public void setSomaEstoqueStr(String somaEstoque) {
		this.somaEstoque = SystemUtils.parseStringDouble(somaEstoque);
	}

	public String getSomaTotalStr() {
		return SystemUtils.parseDoubleToString(somaTotal);
	}

	public void setSomaTotalStr(String somaTotal) {
		this.somaTotal = SystemUtils.parseStringDouble(somaTotal);
	}

	public Boolean getAvulso() {
		return avulso;
	}

	public void setAvulso(Boolean avulso) {
		this.avulso = avulso;
	}

	public String getAba() {
		return aba;
	}

	public void setAba(String aba) {
		this.aba = aba;
	}

	public Collection<Movimentacao> getMovimentacoes() {
		return movimentacoes;
	}

	public void setMovimentacoes(Collection<Movimentacao> movimentacoes) {
		this.movimentacoes = movimentacoes;
	}

	public Atividade getAtividade() {
		return atividade;
	}

	public void setAtividade(Atividade atividade) {
		this.atividade = atividade;
	}

	public Servico getServico() {
		return servico;
	}

	public void setServico(Servico servico) {
		this.servico = servico;
	}

	public FileInputStream getFileInputStream() {
		return fileInputStream;
	}

	public void setFileInputStream(FileInputStream fileInputStream) {
		this.fileInputStream = fileInputStream;
	}

	public Collection<Atividade> getAtividades() {
		return atividades;
	}

	public void setAtividades(Collection<Atividade> atividades) {
		this.atividades = atividades;
	}

	public String getSomaEntradasStr() {
		return SystemUtils.parseDoubleToString(somaEntradas);
	}

	public String getSomaSaidasStr() {
		return SystemUtils.parseDoubleToString(somaSaidas);
	}

	public Integer getQtdAgendamentos() {
		return qtdAgendamentos;
	}

	public void setQtdAgendamentos(Integer qtdAgendamentos) {
		this.qtdAgendamentos = qtdAgendamentos;
	}

	public Collection<ContaPagar> getContasPagarColaboradores() {
		return contasPagarColaboradores;
	}

	public void setContasPagarColaboradores(Collection<ContaPagar> contasPagarColaboradores) {
		this.contasPagarColaboradores = contasPagarColaboradores;
	}

	public Collection<Colaborador> getColaboradores() {
		return colaboradores;
	}

	public void setColaboradores(Collection<Colaborador> colaboradores) {
		this.colaboradores = colaboradores;
	}

}
