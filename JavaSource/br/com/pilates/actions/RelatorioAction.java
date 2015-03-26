package br.com.pilates.actions;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Cadastro;
import br.com.pilates.base.Cliente;
import br.com.pilates.base.Frequencia;
import br.com.pilates.base.Professor;
import br.com.pilates.base.RelatorioMidia;
import br.com.pilates.base.Servico;
import br.com.pilates.base.TipoContaPagar;
import br.com.pilates.base.enums.Sexo;
import br.com.pilates.base.util.RelatorioFormaPagamento;
import br.com.pilates.fachada.IProxy;
import br.com.pilates.fachada.Proxy;
import br.com.pilates.util.SystemUtils;

@SuppressWarnings("serial")
public class RelatorioAction extends PilatesActionSupport {

	private final IProxy proxy;

	private Date dataInicial;
	private Date dataFinal;
	private Professor professor;
	private String ordenacao, modalidade, relatorio;
	private Servico servico;
	private Integer qtdClientesAtivos;
	private Collection<Cadastro> cadastros;
	private Collection<Cliente> clientes;
	private Collection<Frequencia> frequencias;
	private Collection<RelatorioFormaPagamento> relatoriosFormaPagamento;
	private Collection<RelatorioMidia> relatorioMidia;

	private String clientesBairro, clientesServico, clientesServicoMasculino, clientesServicoFeminino, clientesPeriodo, clientesFaixaEtaria, clientesSexo, clientesEstadoCivil, modalidades, rendimentoServicos, gastosPorTipo, tiposGastos;

	private double somaCadastros, somaEfetividade, porcentagemEfetividade, somaEntrada, somaEntradaComDescontos, somaEntradaAvulso, somaEntradaProfessor, somaVendasProfessor, porcentagemVendasProfessor, somaSaida, somaProfessor, somaVendas, somaProfessores, somaVitaCorpore, lucroVitaCorpore = 0;

	public RelatorioAction() {
		proxy = Proxy.getInstance();
	}

	public String actionDemonstrativoResultadoRedirect() {
		try {
			this.relatorio = proxy.gerarDemonstrativoResultado(dataInicial, dataFinal);
			qtdClientesAtivos = proxy.getQtdClientesQueContrataramServico(dataInicial, dataFinal);
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String actionGestaoFinanceiraRedirect() {
		try {
			this.rendimentoServicos = this.proxy.getRendimentoServicosStr(this.dataInicial, this.dataFinal);
			this.gastosPorTipo = this.proxy.getGastosPorTipoStr(this.dataInicial, this.dataFinal);
			this.gerarTiposContaPagarStr();
			// gerarModalidadesStr();
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	private void gerarTiposContaPagarStr() {
		Collection<TipoContaPagar> tiposContaPagar = this.getTiposContaPagar();
		this.modalidades = "";
		for (TipoContaPagar tipo : tiposContaPagar) {
			if (tipo != null) {
				this.tiposGastos += tipo.getNome() + ";";
			}
		}
		this.tiposGastos = this.tiposGastos.substring(0, tiposGastos.length() - 1);
	}

	private void gerarModalidadesStr() {
		Collection<Servico> servicos = super.getModalidades();
		this.modalidades = "";
		for (Servico servico : servicos) {
			if (servico != null) {
				this.modalidades += servico.getNome() + ";";
			}
		}
		this.modalidades = this.modalidades.substring(0, modalidades.length() - 1);
	}

	public String actionGestaoClientesRedirect() {
		try {
			// this.clientesServico =
			// this.proxy.getQtdClientesPorServicoSexoStr(null);
			if (this.dataFinal != null || this.dataInicial != null) {
				this.clientesBairro = this.proxy.getQtdClientesPorBairroStr(this.dataInicial, this.dataFinal);
				this.clientesServicoMasculino = this.proxy.getQtdClientesPorServicoSexoStr(Sexo.MASCULINO, this.dataInicial, this.dataFinal);
				this.clientesServicoFeminino = this.proxy.getQtdClientesPorServicoSexoStr(Sexo.FEMININO, this.dataInicial, this.dataFinal);
				this.clientesEstadoCivil = this.proxy.getQtdClientesPorEstadoCivilStr(this.dataInicial, this.dataFinal);
				this.clientesSexo = this.proxy.getQtdClientesAtivosPorSexoStr(this.dataInicial, this.dataFinal);
				this.clientesFaixaEtaria = this.proxy.getQtdClientesAtivosPorFaixaEtariaStr(this.dataInicial, this.dataFinal);
				this.clientesPeriodo = this.proxy.getQtdClientesAtivosPorPeriodoStr(this.dataInicial, this.dataFinal);
			}
			gerarModalidadesStr();
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String actionRelatorioLucros() {
		String resposta = "";
		try {
			this.professor = (Professor) this.proxy.read(Professor.class, professor.getId());

			this.somaEntradaProfessor = this.proxy.getSomaEntradasByProfessorData(dataInicial, dataFinal, this.professor);
			this.somaProfessor = this.proxy.getSomaPercentagemProfessorByProfessorData(dataInicial, dataFinal, this.professor);

			this.somaVendasProfessor = this.proxy.getSomaVendasByProfessorData(dataInicial, dataFinal, this.professor);
			this.porcentagemVendasProfessor = this.proxy.getPorcentagemVendasByProfessorData(dataInicial, dataFinal, this.professor);

			this.somaVitaCorpore = this.somaEntradaProfessor + this.somaVendasProfessor - this.somaProfessor - this.porcentagemVendasProfessor;

			this.somaEntrada = this.proxy.getSomaEntradasByProfessorData(dataInicial, dataFinal, null);
			this.somaEntradaAvulso = this.proxy.getSomaEntradasAvulso(dataInicial, dataFinal);
			this.somaSaida = this.proxy.getSomaSaidasByData(dataInicial, dataFinal, null);
			this.somaProfessores = this.proxy.getSomaPercentagemAllProfessoresByData(dataInicial, dataFinal);
			this.somaVendas = this.proxy.getSomaVendasData(dataInicial, dataFinal);
			this.lucroVitaCorpore = this.somaEntrada + this.somaEntradaAvulso + this.somaVendas - this.somaSaida - this.somaProfessores;
			resposta = SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionRelatorioMidia() {
		String resposta = "";
		try {
			this.relatorioMidia = this.proxy.relatorioMidia(dataInicial, dataFinal, ordenacao);
			resposta = SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionRelatorioFormaPagamento() {
		String resposta = "";
		try {
			this.relatoriosFormaPagamento = this.proxy.relatorioFormaPagamento(dataInicial, dataFinal, ordenacao);
			resposta = SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionRelatorioAlunos() {
		String resposta = "";
		try {
			this.cadastros = this.proxy.relatorioAlunos(dataInicial, dataFinal, professor, ordenacao);
			resposta = SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionRelatorioAlunosAtivos() {
		String resposta = "";
		try {
			this.clientes = this.proxy.relatorioAlunosAtivos(dataInicial, dataFinal, professor, servico, ordenacao);
			resposta = SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionRelatorioEfetividade() {
		String resposta = "";
		try {
			this.somaEfetividade = this.somaCadastros = this.porcentagemEfetividade = 0;
			if (dataInicial != null || dataFinal != null) {
				this.clientes = this.proxy.relatorioEfetividade(dataInicial, dataFinal, ordenacao);
				if (this.clientes != null && this.clientes.size() > 0) {
					for (Cliente cli : this.clientes) {
						if (cli.isVirouNovoCliente()) {
							this.somaEfetividade += 1;
						}
						this.somaCadastros += 1;
					}
				}
				this.porcentagemEfetividade = (this.somaEfetividade / this.somaCadastros) * 100;
			}
			resposta = SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public Date getDataInicial() {
		return dataInicial;
	}

	public void setDataInicial(Date dataInicial) {
		this.dataInicial = dataInicial;
	}

	public Date getDataInicialStr() {
		return dataInicial;
	}

	public void setDataInicialStr(String dataInicial) {
		this.dataInicial = SystemUtils.parseStringToDate(dataInicial);
	}

	public Date getDataFinal() {
		return dataFinal;
	}

	public void setDataFinal(Date dataFinal) {
		this.dataFinal = dataFinal;
	}

	public Date getDataFinalStr() {
		return dataFinal;
	}

	public void setDataFinalStr(String dataFinal) {
		this.dataFinal = SystemUtils.parseStringToDate(dataFinal);
	}

	public Professor getProfessor() {
		return professor;
	}

	public void setProfessor(Professor professor) {
		this.professor = professor;
	}

	public String getOrdenacao() {
		return ordenacao;
	}

	public void setOrdenacao(String ordenacao) {
		this.ordenacao = ordenacao;
	}

	public Collection<Cadastro> getCadastros() {
		return cadastros;
	}

	public void setCadastros(Collection<Cadastro> cadastros) {
		this.cadastros = cadastros;
	}

	public Collection<RelatorioFormaPagamento> getRelatoriosFormaPagamento() {
		return relatoriosFormaPagamento;
	}

	public void setRelatoriosFormaPagamento(Collection<RelatorioFormaPagamento> relatoriosFormaPagamento) {
		this.relatoriosFormaPagamento = relatoriosFormaPagamento;
	}

	public Collection<RelatorioMidia> getRelatoriosMidia() {
		return relatorioMidia;
	}

	public void setRelatoriosMidia(Collection<RelatorioMidia> relatorioMidia) {
		this.relatorioMidia = relatorioMidia;
	}

	public Collection<RelatorioMidia> getRelatorioMidia() {
		return relatorioMidia;
	}

	public void setRelatorioMidia(Collection<RelatorioMidia> relatorioMidia) {
		this.relatorioMidia = relatorioMidia;
	}

	public double getSomaEntrada() {
		return somaEntrada;
	}

	public void setSomaEntrada(double somaEntrada) {
		this.somaEntrada = somaEntrada;
	}

	public double getSomaSaida() {
		return somaSaida;
	}

	public void setSomaSaida(double somaSaida) {
		this.somaSaida = somaSaida;
	}

	public double getSomaProfessor() {
		return somaProfessor;
	}

	public void setSomaProfessor(double somaProfessor) {
		this.somaProfessor = somaProfessor;
	}

	public double getSomaEntradaProfessor() {
		return somaEntradaProfessor;
	}

	public void setSomaEntradaProfessor(double somaEntradaProfessor) {
		this.somaEntradaProfessor = somaEntradaProfessor;
	}

	public double getSomaProfessores() {
		return somaProfessores;
	}

	public void setSomaProfessores(double somaProfessores) {
		this.somaProfessores = somaProfessores;
	}

	public double getLucroVitaCorpore() {
		return lucroVitaCorpore;
	}

	public void setLucroVitaCorpore(double lucroVitaCorpore) {
		this.lucroVitaCorpore = lucroVitaCorpore;
	}

	public double getSomaVitaCorpore() {
		return somaVitaCorpore;
	}

	public void setSomaVitaCorpore(double somaVitaCorpore) {
		this.somaVitaCorpore = somaVitaCorpore;
	}

	public double getSomaVendasProfessor() {
		return somaVendasProfessor;
	}

	public void setSomaVendasProfessor(double somaVendasProfessor) {
		this.somaVendasProfessor = somaVendasProfessor;
	}

	public double getPorcentagemVendasProfessor() {
		return porcentagemVendasProfessor;
	}

	public void setPorcentagemVendasProfessor(double porcentagemVendasProfessor) {
		this.porcentagemVendasProfessor = porcentagemVendasProfessor;
	}

	public double getSomaVendas() {
		return somaVendas;
	}

	public void setSomaVendas(double somaVendas) {
		this.somaVendas = somaVendas;
	}

	public double getSomaEntradaAvulso() {
		return somaEntradaAvulso;
	}

	public void setSomaEntradaAvulso(double somaEntradaAvulso) {
		this.somaEntradaAvulso = somaEntradaAvulso;
	}

	public String getClientesBairro() {
		return clientesBairro;
	}

	public void setClientesBairro(String clientesBairro) {
		this.clientesBairro = clientesBairro;
	}

	public String getClientesServico() {
		return clientesServico;
	}

	public void setClientesServico(String clientesServico) {
		this.clientesServico = clientesServico;
	}

	public String getClientesFaixaEtaria() {
		return clientesFaixaEtaria;
	}

	public void setClientesFaixaEtaria(String clientesFaixaEtaria) {
		this.clientesFaixaEtaria = clientesFaixaEtaria;
	}

	public String getClientesSexo() {
		return clientesSexo;
	}

	public void setClientesSexo(String clientesSexo) {
		this.clientesSexo = clientesSexo;
	}

	public String getClientesEstadoCivil() {
		return clientesEstadoCivil;
	}

	public void setClientesEstadoCivil(String clientesEstadoCivil) {
		this.clientesEstadoCivil = clientesEstadoCivil;
	}

	public String getModalidadesStr() {
		return modalidades;
	}

	public String getClientesServicoMasculino() {
		return clientesServicoMasculino;
	}

	public void setClientesServicoMasculino(String clientesServicoMasculino) {
		this.clientesServicoMasculino = clientesServicoMasculino;
	}

	public String getClientesServicoFeminino() {
		return clientesServicoFeminino;
	}

	public void setClientesServicoFeminino(String clientesServicoFeminino) {
		this.clientesServicoFeminino = clientesServicoFeminino;
	}

	public String getRendimentoServicos() {
		return rendimentoServicos;
	}

	public void setRendimentoServicos(String rendimentoServicos) {
		this.rendimentoServicos = rendimentoServicos;
	}

	public String getGastosPorTipo() {
		return gastosPorTipo;
	}

	public void setGastosPorTipo(String gastosPorTipo) {
		this.gastosPorTipo = gastosPorTipo;
	}

	public String getTiposGastos() {
		return tiposGastos;
	}

	public void setTiposGastos(String tiposGastos) {
		this.tiposGastos = tiposGastos;
	}

	public Collection<Frequencia> getFrequencias() {
		return frequencias;
	}

	public void setFrequencias(Collection<Frequencia> frequencias) {
		this.frequencias = frequencias;
	}

	public Collection<Cliente> getClientes() {
		return clientes;
	}

	public void setClientes(Collection<Cliente> clientes) {
		this.clientes = clientes;
	}

	public double getSomaCadastros() {
		return somaCadastros;
	}

	public void setSomaCadastros(double somaCadastros) {
		this.somaCadastros = somaCadastros;
	}

	public Integer getSomaEfetividade() {
		return Double.valueOf(somaEfetividade).intValue();
	}

	public void setSomaEfetividade(double somaEfetividade) {
		this.somaEfetividade = somaEfetividade;
	}

	public double getPorcentagemEfetividade() {
		return porcentagemEfetividade;
	}

	public void setPorcentagemEfetividade(double porcentagemEfetividade) {
		this.porcentagemEfetividade = porcentagemEfetividade;
	}

	public double getSomaEntradaComDescontos() {
		return somaEntradaComDescontos;
	}

	public void setSomaEntradaComDescontos(double somaEntradaComDescontos) {
		this.somaEntradaComDescontos = somaEntradaComDescontos;
	}

	public String getModalidade() {
		return modalidade;
	}

	public void setModalidade(String modalidade) {
		this.modalidade = modalidade;
	}

	@Override
	public Servico getServico() {
		return servico;
	}

	@Override
	public void setServico(Servico servico) {
		this.servico = servico;
	}

	public String getRelatorio() {
		return relatorio;
	}

	public void setRelatorio(String relatorio) {
		this.relatorio = relatorio;
	}

	public Integer getQtdClientesAtivos() {
		return qtdClientesAtivos;
	}

	public void setQtdClientesAtivos(Integer qtdClientesAtivos) {
		this.qtdClientesAtivos = qtdClientesAtivos;
	}

	public String getClientesPeriodo() {
		return clientesPeriodo;
	}

	public void setClientesPeriodo(String clientesPeriodo) {
		this.clientesPeriodo = clientesPeriodo;
	}

}
