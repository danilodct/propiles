package br.com.profisio.cadastro;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import br.com.profisio.basics.Atividade;
import br.com.profisio.basics.Avaliacao;
import br.com.profisio.basics.Cadastro;
import br.com.profisio.basics.Colaborador;
import br.com.profisio.basics.ContaReceber;
import br.com.profisio.basics.FormaConhecimento;
import br.com.profisio.basics.Frequencia;
import br.com.profisio.basics.Servico;
import br.com.profisio.basics.enums.EstadoCivil;
import br.com.profisio.basics.enums.FormaPagamento;
import br.com.profisio.basics.enums.Sexo;
import br.com.profisio.colaborador.ColaboradorControl;
import br.com.profisio.financeiro.FinanceiroControl;
import br.com.profisio.util.ItemGeralUI;
import br.com.profisio.util.ProfisioActionSupport;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.ProfisioSessionUtil;
import br.com.profisio.util.SystemUtils;
import br.com.profisio.util.Tenant;

public class CadastroView extends ProfisioActionSupport {

	private static final long serialVersionUID = 4742339788981156278L;

	private final CadastroControl controller;

	private Collection<Cadastro> clientes;
	private Collection<Colaborador> colaboradores;
	private Collection<Atividade> atividades;
	private Collection<ContaReceber> contasReceber;
	private Collection<Frequencia> frequencias;
	private String agendamentos;
	private Collection<Servico> servicosFrequencias, servicosContasReceber;
	private ContaReceber contaReceber;
	private Cadastro cadastro;
	private Atividade atividade;
	private Avaliacao avaliacao;
	private String nomeCliente, outraFormaConhecimento, aba, avaliacaoId;
	private Integer pagAtual, qtdPaginas, qtdCadastros;
	private double totalValorContasReceber;

	private Frequencia frequencia;

	public CadastroView() {
		controller = CadastroControl.getInstance();
	}

	public String actionEditarAvaliacao() {
		try {
			this.controller.editarAvaliacao(avaliacao);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionRemoverAtividade() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.controller.removerAtividade(tenant, atividade);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionAtividade() {
		String resposta = null;
		try {
			this.atividade = this.controller.getAtividadeById(atividade);
			resposta = SUCCESS;
		} catch (Exception e) {
			this.dealException(e);
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionCadastrarAtividade() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.controller.cadastrarAtividade(tenant, atividade);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionCadastro() {
		try {
			this.cadastro = this.controller.getCadastro(cadastro);
			this.atividades = this.controller.getAtividadesByCadastro(this.cadastro);
			this.contasReceber = FinanceiroControl.getInstance().getContasReceberByCadastro(this.cadastro);
			this.totalValorContasReceber = this.extractTotalValorContasReceber(this.contasReceber);
			this.frequencias = this.controller.getFrequenciasByCadastro(this.cadastro);
			this.agendamentos = this.controller.getAgendamentosByCadastro(this.cadastro);
			// para fazer o filtro das frequencias e de contas a receber por
			// servico
			this.servicosFrequencias = this.extractServicosFromFrequencias(this.frequencias);
			this.servicosContasReceber = this.extractServicosFromContasReceber(this.contasReceber);
			// --------------------------------------------------------------
			// setando o valor inicial de alguns campos
			this.contaReceber = new ContaReceber();
			contaReceber.setDataLancamento(new Date());
			contaReceber.setQtdSessoes(1);
			this.frequencia = new Frequencia();
			this.frequencia.setData(new Date());
			this.atividade = new Atividade();
			this.atividade.setDataCriacao(new Date());
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionCadastrarCadastro() {
		String resposta = null;
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			if (cadastro != null && cadastro.getConhecimentoStudio() != null && cadastro.getConhecimentoStudio().equals("Outro") && this.outraFormaConhecimento != null && !this.outraFormaConhecimento.equals("")) {
				cadastro.setConhecimentoStudio(this.outraFormaConhecimento);
			}
			this.controller.cadastrarCadastro(tenant, cadastro);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.CADASTRO_SUCESSO));
			resposta = SUCCESS;
		} catch (Exception e) {
			this.dealException(e);
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionEditarCadastro() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			if (cadastro != null && cadastro.getConhecimentoStudio() != null && cadastro.getConhecimentoStudio().equals("Outro") && this.outraFormaConhecimento != null && !this.outraFormaConhecimento.equals("")) {
				cadastro.setConhecimentoStudio(this.outraFormaConhecimento);
			}
			this.controller.editarCadastro(tenant, cadastro);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionRemoverCadastro() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.controller.removerCadastro(tenant, cadastro);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionCadastros() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			if (pagAtual == null)
				pagAtual = 1;
			this.qtdCadastros = this.controller.getQtdCadastros(tenant, null);
			this.qtdPaginas = this.controller.getQtdPaginas(tenant, nomeCliente);
			this.clientes = this.controller.getCadastros(tenant, nomeCliente, pagAtual);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionAniversariantes() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.clientes = controller.getProximosAniversariantes(tenant);
			this.colaboradores = ColaboradorControl.getInstance().getProximosAniversariantes(tenant);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	// 8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

	private Collection<Servico> extractServicosFromContasReceber(Collection<ContaReceber> contasReceber) {
		Map<Integer, Servico> servicos = new HashMap<Integer, Servico>();
		if (contasReceber != null && contasReceber.size() > 0) {
			for (ContaReceber conta : contasReceber) {
				if (!servicos.containsKey(conta.getAtividade().getContrato().getServico().getId()))
					servicos.put(conta.getAtividade().getContrato().getServico().getId(), conta.getAtividade().getContrato().getServico());
			}
		}
		Collection<Servico> values = new ArrayList<Servico>(servicos.values());
		return values;
	}

	private Collection<Servico> extractServicosFromFrequencias(Collection<Frequencia> contasReceber) {
		Map<Integer, Servico> servicos = new HashMap<Integer, Servico>();
		if (contasReceber != null && contasReceber.size() > 0) {
			for (Frequencia frequencia : contasReceber) {
				if (!servicos.containsKey(frequencia.getServicoCerto().getId()))
					servicos.put(frequencia.getServicoCerto().getId(), frequencia.getServicoCerto());
			}
		}
		Collection<Servico> values = new ArrayList<Servico>(servicos.values());
		return values;
	}

	private double extractTotalValorContasReceber(Collection<ContaReceber> contasReceber) {
		double retorno = 0;
		if (contasReceber != null && contasReceber.size() > 0) {
			for (ContaReceber conta : contasReceber)
				retorno += conta.getValor();
		}
		return retorno;
	}

	// 88888888888888888888888888888888888888888888888888888888888888888888888888888888888888

	public Sexo[] getAllSexos() {
		return Sexo.values();
	}

	public EstadoCivil[] getAllEstadosCivil() {
		return EstadoCivil.values();
	}

	public FormaPagamento[] getAllFormasPagamento() {
		return FormaPagamento.values();
	}

	public Collection<FormaConhecimento> getAllFormasConhecimento() {
		Tenant tenant = ProfisioSessionUtil.getTenantSession();
		Collection<FormaConhecimento> formas = this.controller.getAllFormasConhecimento(tenant);
		if (formas != null) {
			formas.add(new FormaConhecimento("OUTRO", "Outro"));
		}
		return formas;
	}

	public Collection<Colaborador> getAllColaboradores() {
		Tenant tenant = ProfisioSessionUtil.getTenantSession();
		Collection<Colaborador> colaboradores = ColaboradorControl.getInstance().getColaboradores(tenant, null);
		return colaboradores;
	}

	// 8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

	public Collection<Cadastro> getClientes() {
		return clientes;
	}

	public void setClientes(Collection<Cadastro> clientes) {
		this.clientes = clientes;
	}

	public Collection<Colaborador> getColaboradores() {
		return colaboradores;
	}

	public void setColaboradores(Collection<Colaborador> colaboradores) {
		this.colaboradores = colaboradores;
	}

	public String getNomeCliente() {
		return nomeCliente;
	}

	public void setNomeCliente(String nomeCliente) {
		this.nomeCliente = nomeCliente;
	}

	public String getOutraFormaConhecimento() {
		return outraFormaConhecimento;
	}

	public void setOutraFormaConhecimento(String outraFormaConhecimento) {
		this.outraFormaConhecimento = outraFormaConhecimento;
	}

	public Integer getPagAtual() {
		return pagAtual;
	}

	public void setPagAtual(Integer pagAtual) {
		this.pagAtual = pagAtual;
	}

	public Collection<ItemGeralUI> getQtdPaginas() {
		Collection<ItemGeralUI> qtdPaginas = new ArrayList<ItemGeralUI>();
		if (this.qtdPaginas > 0) {
			for (int i = 1; i < this.qtdPaginas; i += 1) {
				qtdPaginas.add(new ItemGeralUI(i + "", i + ""));
			}
		}
		return qtdPaginas;
	}

	public Integer getQtdCadastros() {
		return qtdCadastros;
	}

	public void setQtdCadastros(Integer qtdCadastros) {
		this.qtdCadastros = qtdCadastros;
	}

	public Cadastro getCadastro() {
		return cadastro;
	}

	public void setCadastro(Cadastro cadastro) {
		this.cadastro = cadastro;
	}

	public Atividade getAtividade() {
		return atividade;
	}

	public void setAtividade(Atividade atividade) {
		this.atividade = atividade;
	}

	public Collection<Atividade> getAtividades() {
		return atividades;
	}

	public void setAtividades(Collection<Atividade> atividades) {
		this.atividades = atividades;
	}

	public Collection<ContaReceber> getContasReceber() {
		return contasReceber;
	}

	public void setContasReceber(Collection<ContaReceber> contasReceber) {
		this.contasReceber = contasReceber;
	}

	public Collection<Frequencia> getFrequencias() {
		return frequencias;
	}

	public void setFrequencias(Collection<Frequencia> frequencias) {
		this.frequencias = frequencias;
	}

	public String getTotalValorContasReceberStr() {
		return SystemUtils.parseDoubleToString(totalValorContasReceber);
	}

	public Collection<Servico> getServicosFrequencias() {
		return servicosFrequencias;
	}

	public void setServicosFrequencias(Collection<Servico> servicosFrequencias) {
		this.servicosFrequencias = servicosFrequencias;
	}

	public Collection<Servico> getServicosContasReceber() {
		return servicosContasReceber;
	}

	public void setServicosContasReceber(Collection<Servico> servicosContasReceber) {
		this.servicosContasReceber = servicosContasReceber;
	}

	public String getAba() {
		return aba;
	}

	public void setAba(String aba) {
		this.aba = aba;
	}

	public String getAvaliacaoId() {
		return avaliacaoId;
	}

	public void setAvaliacaoId(String avaliacaoId) {
		this.avaliacaoId = avaliacaoId;
	}

	public Avaliacao getAvaliacao() {
		return avaliacao;
	}

	public void setAvaliacao(Avaliacao avaliacao) {
		this.avaliacao = avaliacao;
	}

	public ContaReceber getContaReceber() {
		return contaReceber;
	}

	public void setContaReceber(ContaReceber contaReceber) {
		this.contaReceber = contaReceber;
	}

	public Frequencia getFrequencia() {
		return frequencia;
	}

	public void setFrequencia(Frequencia frequencia) {
		this.frequencia = frequencia;
	}

	public String getAgendamentos() {
		return agendamentos;
	}

	public void setAgendamentos(String agendamentos) {
		this.agendamentos = agendamentos;
	}

}
