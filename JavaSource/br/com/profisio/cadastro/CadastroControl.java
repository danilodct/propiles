package br.com.profisio.cadastro;

import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import br.com.profisio.basics.Agendamento;
import br.com.profisio.basics.Atividade;
import br.com.profisio.basics.Avaliacao;
import br.com.profisio.basics.Cadastro;
import br.com.profisio.basics.FormaConhecimento;
import br.com.profisio.basics.Frequencia;
import br.com.profisio.basics.enums.StatusObjeto;
import br.com.profisio.util.ControllerBase;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.ProfisioException;
import br.com.profisio.util.SystemUtils;
import br.com.profisio.util.Tenant;

public class CadastroControl extends ControllerBase {

	private static final Integer TAMANHO_PAGINACAO_CADASTRO = 100;
	private static CadastroControl instance = null;
	private CadastroDAO dao = null;

	private CadastroControl() {
		dao = (CadastroDAO) CadastroDAO.daoFactory();
	}

	public static CadastroControl getInstance() {
		if (instance == null)
			instance = new CadastroControl();
		return instance;
	}

	public Collection<Cadastro> getProximosAniversariantes(Tenant tenant) {
		Calendar calendar = Calendar.getInstance();
		int month = calendar.get(Calendar.MONTH) + 1;
		String mesAtual = "" + month;
		if (mesAtual.length() == 1) {
			mesAtual = "0" + mesAtual;
		}
		int mesProximoInt = month + 1;
		if (mesProximoInt == 13)
			mesProximoInt = 1;
		String mesProximo = "" + mesProximoInt;
		if (mesProximo.length() == 1) {
			mesProximo = "0" + mesProximo;
		}
		return this.dao.getProximosAniversariantes(tenant, mesAtual, mesProximo);
	}

	public Collection<FormaConhecimento> getAllFormasConhecimento(Tenant tenant) {
		return this.dao.getAllFormasConhecimento(tenant);
	}

	public Collection<Cadastro> getCadastros(Tenant tenant, String nomeCliente, Integer pagAtual) {
		Integer qtdPag = this.getQtdPaginas(tenant, nomeCliente);
		if (qtdPag == null || qtdPag < 2)
			pagAtual = null;
		return this.dao.getCadastros(tenant, nomeCliente, TAMANHO_PAGINACAO_CADASTRO, pagAtual);
	}

	public Integer getQtdCadastros(Tenant tenant, String nomeCliente) {
		return this.dao.getQtdCadastros(tenant, nomeCliente);
	}

	public Integer getQtdPaginas(Tenant tenant, String nomeCliente) {
		Integer qtdTotal = this.getQtdCadastros(tenant, nomeCliente);
		double ceil = Math.ceil(qtdTotal / TAMANHO_PAGINACAO_CADASTRO);
		long round = Math.round(ceil);
		return Long.valueOf(round).intValue();
	}

	public void removerCadastro(Tenant tenant, Cadastro cadastro) {
		SystemUtils.assertObjectIsNotNullHasId(cadastro);
		cadastro = this.dao.getCadastroById(cadastro.getId());
		cadastro.setStatusObjeto(StatusObjeto.MORTO);
		cadastro.setTenant(tenant);
		this.dao.editar(cadastro);
	}

	public void editarCadastro(Tenant tenant, Cadastro cadastro) {
		SystemUtils.assertObjectIsNotNullHasId(cadastro);
		if (cadastro.getNome() == null || cadastro.getNome().equals("")) {
			throw new ProfisioException(ProfisioBundleUtil.NOME_CLIENTE_OBRIGATORIO);
		}
		if (cadastro.getCpf() == null || cadastro.getCpf().equals("")) {
			throw new ProfisioException(ProfisioBundleUtil.CPF_CLIENTE_OBRIGATORIO);
		}
		if (cadastro.getConhecimentoStudio() != null && (cadastro.getConhecimentoStudio().trim().equals("") || cadastro.getConhecimentoStudio().trim().equalsIgnoreCase("Outro"))) {
			throw new ProfisioException(ProfisioBundleUtil.FORMA_CONHECIMENTO_INVALIDA);
		}
		Cadastro cadastroBD = this.dao.getCadastroById(cadastro.getId());
		SystemUtils.gerarNiver(cadastro);
		cadastro.setDataCadastro(cadastroBD.getDataCadastro());
		cadastro.setStatusObjeto(StatusObjeto.ATIVO);
		cadastro.setTenant(tenant);
		this.dao.editar(cadastro);
	}

	public void cadastrarCadastro(Tenant tenant, Cadastro cadastro) {
		SystemUtils.assertObjectIsNotNull(cadastro);
		if (cadastro.getNome() == null || cadastro.getNome().equals("")) {
			throw new ProfisioException(ProfisioBundleUtil.NOME_CLIENTE_OBRIGATORIO);
		}
		if (cadastro.getConhecimentoStudio() == null || cadastro.getConhecimentoStudio() != null && (cadastro.getConhecimentoStudio().trim().equals("") || cadastro.getConhecimentoStudio().trim().equalsIgnoreCase("Outro"))) {
			throw new ProfisioException(ProfisioBundleUtil.FORMA_CONHECIMENTO_INVALIDA);
		}
		cadastro.setDataCadastro(new Date());
		cadastro.setStatusObjeto(StatusObjeto.ATIVO);
		SystemUtils.gerarNiver(cadastro);
		cadastro.setTenant(tenant);
		this.dao.cadastrar(cadastro);
	}

	public Cadastro getCadastro(Cadastro cadastro) {
		SystemUtils.assertObjectIsNotNullHasId(cadastro);
		return this.dao.getCadastroById(cadastro.getId());
	}

	public void cadastrarAtividade(Tenant tenant, Atividade atividade) {
		SystemUtils.assertObjectIsNotNull(atividade);
		if (atividade.getCadastro() == null || atividade.getCadastro().getId() == null || atividade.getCadastro().getId().intValue() == -1)
			throw new ProfisioException(ProfisioBundleUtil.CLIENTE_NAO_INFORMADO);
		if (atividade.getContrato() == null || atividade.getContrato().getId() == null || atividade.getContrato().getId().intValue() == -1)
			throw new ProfisioException(ProfisioBundleUtil.CONTRATO_NAO_INFORMADO);

		Atividade atividadeBD = this.dao.getAtividade(atividade.getCadastro(), atividade.getContrato());
		if (atividadeBD != null)
			throw new ProfisioException(ProfisioBundleUtil.ATIVIDADE_DUPLICADA);

		atividade.setDataCriacao(new Date());
		atividade.setAvaliacao(new Avaliacao());
		atividade.setStatusObjeto(StatusObjeto.ATIVO);
		atividade.setTenant(tenant);
		this.dao.cadatrarAtividade(atividade);
	}

	public Atividade getAtividadeById(Atividade atividade) {
		SystemUtils.assertObjectIsNotNullHasId(atividade);
		return this.dao.getAtividadeById(atividade.getId());
	}

	public Collection<Atividade> getAtividadesByCadastro(Cadastro cadastro) {
		SystemUtils.assertObjectIsNotNullHasId(cadastro);
		return this.dao.getAtividadesByCadastro(cadastro);
	}

	public void removerAtividade(Tenant tenant, Atividade atividade) {
		SystemUtils.assertObjectIsNotNullHasId(atividade);
		atividade = this.dao.getAtividadeById(atividade.getId());
		atividade.setStatusObjeto(StatusObjeto.MORTO);
		atividade.setTenant(tenant);
		this.dao.editarAtividade(atividade);
	}

	public Collection<Frequencia> getFrequenciasByCadastro(Cadastro cadastro) {
		SystemUtils.assertObjectIsNotNullHasId(cadastro);
		Collection<Frequencia> frequenciasByCadastro = this.dao.getFrequenciasByCadastro(cadastro, null, null);
		setOrdemFrequenciasByServico(frequenciasByCadastro);
		return frequenciasByCadastro;
	}

	private void setOrdemFrequenciasByServico(Collection<Frequencia> frequenciasByCadastro) {
		Map<Integer, Integer> ordenador = new HashMap<Integer, Integer>();
		if (frequenciasByCadastro != null) {
			Integer ordem = 0;
			for (Frequencia freq : frequenciasByCadastro) {
				Integer idServico = freq.getServicoCerto().getId().intValue();
				if (ordenador.get(idServico) == null) {
					ordenador.put(idServico, 1);
					ordem = 1;
				} else {
					ordem = ordenador.get(idServico);
					ordem += 1;
					ordenador.put(idServico, ordem);
				}
				freq.setOrdem(ordem);
			}
		}
	}

	public void editarAvaliacao(Avaliacao avaliacao) {
		SystemUtils.assertObjectIsNotNullHasId(avaliacao);
		this.dao.editarAvaliacao(avaliacao);
	}

	public String getAgendamentosByCadastro(Cadastro cadastro) {
		SystemUtils.assertObjectIsNotNullHasId(cadastro);
		String retorno = "[";
		Collection<Agendamento> agendamentos = this.dao.getAgendamentosByCadastro(cadastro);
		if (agendamentos != null && agendamentos.size() > 0) {
			for (Agendamento agendamento : agendamentos) {
				String nota = agendamento.getNota();
				if (nota == null)
					nota = "";
				String duracao = String.valueOf(agendamento.getDuracao());
				if (duracao == null || duracao.equals("null"))
					duracao = "";
				String cliente = "";
				if (agendamento.getCadastro() != null)
					cliente = agendamento.getCadastro().getNome();
				retorno += ",{\"id\":\"" + agendamento.getIdCript() + "\", \"cliente\":\"" + cliente + "\", \"nota\":\"" + nota + "\", \"horario\":\"" + agendamento.getHorario() + "\", \"title\":\"" + agendamento.getTitulo() + "\", \"duracao\":\"" + duracao + "\", \"dataInicial\":\"" + agendamento.getDataInicioStr() + "\",  \"start\":\"" + agendamento.getDataInicioStrEUA() + " " + agendamento.getHorario() + "\", \"dataFinal\":\"" + agendamento.getDataFimStr() + "\", \"end\":\"" + agendamento.getDataFimStrEUA() + " " + agendamento.getHorarioFinal() + "\" }";
			}
		}
		if (agendamentos != null && agendamentos.size() > 0)
			retorno = retorno.replace("[,", "[");
		retorno += "]";
		return retorno;
	}

}
