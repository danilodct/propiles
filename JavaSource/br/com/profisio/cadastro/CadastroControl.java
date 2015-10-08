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

	public Collection<Cadastro> getProximosAniversariantes() {
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
		return this.dao.getProximosAniversariantes(mesAtual, mesProximo);
	}

	public Collection<FormaConhecimento> getAllFormasConhecimento() {
		return this.dao.getAllFormasConhecimento();
	}

	public Collection<Cadastro> getCadastros(String nomeCliente, String cpf, Boolean inativo, Integer pagAtual) {
		Double qtdPag = this.getQtdPaginas(nomeCliente, cpf, inativo);
		if (qtdPag == null || qtdPag <= 1)
			pagAtual = null;
		Integer start = null;
		Integer end = null;
		if (pagAtual != null) {
			start = SystemUtils.getStartPaginacao(pagAtual, TAMANHO_PAGINACAO_CADASTRO);
			end = SystemUtils.getEndPaginacao(pagAtual, qtdPag, TAMANHO_PAGINACAO_CADASTRO);
		}
		return this.dao.getCadastros(nomeCliente, cpf, inativo, start, end);
	}

	public Integer getQtdCadastros(String nomeCliente, String cpf, Boolean inativo) {
		return this.dao.getQtdCadastros(nomeCliente, cpf, inativo);
	}

	public Double getQtdPaginas(String nomeCliente, String cpf, Boolean inativo) {
		Integer qtdTotal = this.getQtdCadastros(nomeCliente, cpf, inativo);
		return qtdTotal / new Double(TAMANHO_PAGINACAO_CADASTRO);
	}

	public void removerCadastro(Cadastro cadastro) {
		SystemUtils.assertObjectIsNotNullHasId(cadastro);
		cadastro = this.dao.getCadastroById(cadastro.getId());
		cadastro.setStatusObjeto(StatusObjeto.MORTO);
		this.dao.editar(cadastro);
	}

	public void editarCadastro(Cadastro cadastro) {
		SystemUtils.assertObjectIsNotNullHasId(cadastro);
		if (cadastro.getNome() == null || cadastro.getNome().equals("")) {
			throw new ProfisioException(ProfisioBundleUtil.NOME_CLIENTE_OBRIGATORIO);
		}
		if (cadastro.getCpf() == null || cadastro.getCpf().equals("")) {
			throw new ProfisioException(ProfisioBundleUtil.CPF_CLIENTE_OBRIGATORIO);
		}
		if (cadastro.getConhecimentoStudio() != null && (cadastro.getConhecimentoStudio().equals("") || cadastro.getConhecimentoStudio().equals("Outro"))) {
			throw new ProfisioException(ProfisioBundleUtil.FORMA_CONHECIMENTO_INVALIDA);
		}
		Cadastro cadastroBD = this.dao.getCadastroById(cadastro.getId());
		SystemUtils.gerarNiver(cadastro);
		cadastro.setDataCadastro(cadastroBD.getDataCadastro());
		cadastro.setStatusObjeto(StatusObjeto.ATIVO);
		cadastro.setInativo(cadastroBD.getInativo());
		this.dao.editar(cadastro);
	}

	public void cadastrarCadastro(Cadastro cadastro) {
		SystemUtils.assertObjectIsNotNull(cadastro);
		if (cadastro.getNome() == null || cadastro.getNome().equals("")) {
			throw new ProfisioException(ProfisioBundleUtil.NOME_CLIENTE_OBRIGATORIO);
		}
		if (cadastro.getConhecimentoStudio() == null || cadastro.getConhecimentoStudio() != null && (cadastro.getConhecimentoStudio().equals("") || cadastro.getConhecimentoStudio().equals("Outro"))) {
			throw new ProfisioException(ProfisioBundleUtil.FORMA_CONHECIMENTO_INVALIDA);
		}
		cadastro.setDataCadastro(new Date());
		cadastro.setStatusObjeto(StatusObjeto.ATIVO);
		cadastro.setInativo(true);
		SystemUtils.gerarNiver(cadastro);
		this.dao.cadastrar(cadastro);
	}

	public Cadastro getCadastro(Cadastro cadastro) {
		SystemUtils.assertObjectIsNotNullHasId(cadastro);
		return this.dao.getCadastroById(cadastro.getId());
	}

	public void cadastrarAtividade(Atividade atividade) {
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

	public void removerAtividade(Atividade atividade) {
		SystemUtils.assertObjectIsNotNullHasId(atividade);
		atividade = this.dao.getAtividadeById(atividade.getId());
		atividade.setStatusObjeto(StatusObjeto.MORTO);
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
				retorno += ",{\"id\":" + agendamento.getId() + ", \"cliente\":\"" + cliente + "\", \"nota\":\"" + nota + "\", \"horario\":\"" + agendamento.getHorario() + "\", \"title\":\"" + agendamento.getTitulo() + "\", \"duracao\":\"" + duracao + "\", \"dataInicial\":\"" + agendamento.getDataInicioStr() + "\",  \"start\":\"" + agendamento.getDataInicioStrEUA() + " " + agendamento.getHorario() + "\", \"dataFinal\":\"" + agendamento.getDataFimStr() + "\", \"end\":\"" + agendamento.getDataFimStrEUA() + " " + agendamento.getHorarioFinal() + "\" }";
			}
		}
		if (agendamentos != null && agendamentos.size() > 0)
			retorno = retorno.replace("[,", "[");
		retorno += "]";
		return retorno;
	}

	public String getCadastrosCSV(String nomeCliente, Boolean inativo) {
		String csv = "CLIENTE;E-MAIL;DATA NASCIMENTO;BAIRRO;SEXO\n";
		Collection<Cadastro> cadastros = this.dao.getCadastros(nomeCliente, null, inativo, null, null);
		if (cadastros != null && cadastros.size() > 0) {
			for (Cadastro cadastro : cadastros) {
				csv += cadastro.getNome() + ";" + cadastro.getEmail() + ";" + cadastro.getDataNascimentoStr() + ";" + cadastro.getEndereco().getBairro() + ";" + cadastro.getSexoStr() + "\n";
			}
		}
		return csv;
	}

	public void atualizarCadastrosInativos() {
		this.dao.atualizarCadastrosInativos();
		this.dao.atualizarCadastrosAtivos();
	}

	public void setCadastroAtivoByFrequencia(Frequencia frequencia) {
		SystemUtils.assertObjectIsNotNullHasId(frequencia);
		this.dao.setCadastroAtivoByFrequencia(frequencia);
	}
}
