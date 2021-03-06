package br.com.profisio.agenda;

import java.util.Calendar;
import java.util.Collection;
import java.util.Date;

import br.com.profisio.basics.Agendamento;
import br.com.profisio.basics.Frequencia;
import br.com.profisio.basics.enums.RepeticaoAgendamento;
import br.com.profisio.basics.enums.StatusAgendamento;
import br.com.profisio.basics.enums.StatusObjeto;
import br.com.profisio.frequencia.FrequenciaControl;
import br.com.profisio.util.ControllerBase;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.ProfisioException;
import br.com.profisio.util.SystemUtils;
import br.com.profisio.util.Tenant;

public class AgendaControl extends ControllerBase {

	private static AgendaControl instance = null;
	private AgendaDAO dao = null;

	private AgendaControl() {
		dao = (AgendaDAO) AgendaDAO.daoFactory();
	}

	public static AgendaControl getInstance() {
		if (instance == null)
			instance = new AgendaControl();
		return instance;
	}

	public void cadastrarAgendamento(Tenant tenant, Agendamento agendamento) {
		SystemUtils.assertObjectIsNotNull(agendamento);
		if (agendamento.getDataInicio() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_DATA);
		if (agendamento.getTitulo() == null && agendamento.getTitulo().trim().equals(""))
			throw new ProfisioException(ProfisioBundleUtil.INFORME_TITULO);

		if (agendamento.getDataFim() == null)
			agendamento.setDuracao(Agendamento.DURACAO_DEFAULT);
		agendamento.setTenant(tenant);
		if (agendamento.getPai() != null && agendamento.getPai().getId() == null)
			agendamento.setPai(null);
		agendamento.setStatus(StatusAgendamento.INDEFINIDO);
		this.dao.cadastrar(agendamento);

		if (agendamento.getRepeticao() == RepeticaoAgendamento.SEMANALMENTE) {
			//inserir para os proximos 4 * 6 (6 meses) = 24 vezes a cada 7 dias
			Calendar calendar = Calendar.getInstance();
			Agendamento agendamentoRep = new Agendamento();
			agendamentoRep.parseDados(agendamento);
			for (int i = 0; i < 24; i += 1) {
				calendar.setTime(agendamentoRep.getDataInicio());
				//próxima semana
				calendar.set(Calendar.DAY_OF_MONTH, calendar.get(Calendar.DAY_OF_MONTH) + RepeticaoAgendamento.SEMANALMENTE.getQtdDias());
				agendamentoRep.parseDados(agendamento);
				agendamentoRep.setDataInicio(calendar.getTime());
				agendamentoRep.setDuracao(agendamento.getDuracao());
				agendamentoRep.setRepeticao(null);
				agendamentoRep.setPai(agendamento);
				this.dao.cadastrar(agendamentoRep);
			}
		}
	}

	public void cadastrarAgendamentos(Tenant tenant, Collection<Agendamento> agendamentos) {
		if (agendamentos != null && agendamentos.size() > 0) {
			for (Agendamento agendamento : agendamentos)
				this.cadastrarAgendamento(tenant, agendamento);
		}
	}

	public String getAgendamentosByMes(Tenant tenant, Date mes) {
		String retorno = "[";
		if (mes == null)
			mes = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(mes);
		cal.set(Calendar.MONTH, cal.get(Calendar.MONTH) - 1);
		Date dataInicial = SystemUtils.getPrimeiroDiaMesAtual(cal.getTime());
		cal.set(Calendar.MONTH, cal.get(Calendar.MONTH) + 2);
		Date dataFinal = SystemUtils.getUltimoDiaMesAtual(cal.getTime());
		Collection<Agendamento> agendamentos = this.dao.getAgendamentosByMes(tenant, dataInicial, dataFinal);
		if (agendamentos != null && agendamentos.size() > 0) {
			for (Agendamento agendamento : agendamentos) {
				String nota = agendamento.getNota();
				if (nota == null)
					nota = "";
				nota = nota.replaceAll("\n", "");
				nota = nota.replaceAll("\r", "");
				nota = nota.replaceAll("\t", "");
				nota = nota.replaceAll("\"", "\'");
				String duracao = String.valueOf(agendamento.getDuracao());
				if (duracao == null || duracao.equals("null"))
					duracao = "";
				String cliente = "";
				if (agendamento.getCadastro() != null)
					cliente = agendamento.getCadastro().getNome();

				String cor = "#00B5AD";
				if (agendamento.getStatus() != null && agendamento.getStatus() == StatusAgendamento.FALTOU)
					cor = "red";
				if (agendamento.getStatus() != null && agendamento.getStatus() == StatusAgendamento.COMPARECEU)
					cor = "#99C347";
				String corTexto = "white";

				String paiIdCript = "";
				if (agendamento.getPai() != null)
					paiIdCript = agendamento.getPai().getIdCript();

				String repeticoes = "";
				if (agendamento.getRepeticao() != null)
					repeticoes = agendamento.getRepeticao().getValue();

				String cadastroIdCript = "";
				if (agendamento.getCadastro() != null && agendamento.getCadastro().getId() != null)
					cadastroIdCript = agendamento.getCadastro().getIdCript();

				String atividade = "";
				if (agendamento.getAtividade() != null && agendamento.getAtividade().getContrato() != null)
					atividade = agendamento.getAtividade().getContrato().getServico().getNome() + " - " + agendamento.getAtividade().getContrato().getColaborador().getNome();

				retorno += ",{\"id\":\"" + agendamento.getIdCript() + "\",  \"pai\":\"" + paiIdCript + "\", \"cadastro\":\"" + cadastroIdCript + "\", \"atividade\":\"" + atividade + "\", \"backgroundColor\":\"" + cor + "\", \"borderColor\":\"" + cor + "\", \"textColor\":\"" + corTexto + "\", \"repeticao\":\"" + repeticoes + "\", \"cliente\":\"" + cliente + "\", \"nota\":\"" + nota + "\", \"horario\":\"" + agendamento.getHorario() + "\", \"title\":\"" + agendamento.getTituloTratado() + "\", \"duracao\":\"" + duracao + "\", \"dataInicial\":\"" + agendamento.getDataInicioStr() + "\",  \"start\":\"" + agendamento.getDataInicioStrEUA() + " " + agendamento.getHorario() + "\", \"dataFinal\":\"" + agendamento.getDataFimStr() + "\", \"end\":\"" + agendamento.getDataFimStrEUA() + " " + agendamento.getHorarioFinal() + "\", \"status\":\"" + agendamento.getStatusStr() + "\" }";

			}

		}

		if (agendamentos != null && agendamentos.size() > 0)
			retorno = retorno.replace("[,", "[");
		retorno += "]";
		return retorno;
	}

	public void editarAgendamento(Tenant tenant, Agendamento agendamento) {
		SystemUtils.assertObjectIsNotNullHasId(agendamento);
		Agendamento agendamentoBD = this.dao.getAgendamentosById(agendamento.getId());
		agendamento.setCadastro(agendamentoBD.getCadastro());
		agendamento.setAtividade(agendamentoBD.getAtividade());
		agendamento.setContaReceber(agendamentoBD.getContaReceber());
		agendamento.setTenant(tenant);
		if (agendamento.getPai() != null && agendamento.getPai().getId() == null)
			agendamento.setPai(null);
		if (agendamento.getStatus() == null)
			agendamento.setStatus(agendamentoBD.getStatus());
		if (agendamento.getStatus() == StatusAgendamento.COMPARECEU && agendamento.getCadastro() != null && agendamento.getAtividade() != null) {
			//para cadastrar frequencia precisa informar atividade
			Frequencia frequencia = new Frequencia();
			frequencia.setAtividade(agendamento.getAtividade());
			frequencia.setCadastro(agendamento.getCadastro());
			frequencia.setContaReceber(agendamento.getContaReceber());
			frequencia.setData(agendamento.getDataInicio());
			frequencia.setDuracao(agendamento.getDuracao());
			frequencia.setHorario(agendamento.getHorario());
			frequencia.setNovo(true);
			frequencia.setTenant(tenant);
			frequencia.setStatusObjeto(StatusObjeto.ATIVO);
			FrequenciaControl.getInstance().cadastrarFrequencia(tenant, frequencia);
		}
		this.dao.editar(agendamento);
	}

	public void alterarDataAgendamento(Tenant tenant, Agendamento agendamento) {
		SystemUtils.assertObjectIsNotNullHasId(agendamento);
		Agendamento agendamentoBD = this.dao.getAgendamentosById(agendamento.getId());

		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(agendamento.getDataInicio());
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(agendamentoBD.getDataInicio());
		cal2.set(Calendar.YEAR, cal1.get(Calendar.YEAR));
		cal2.set(Calendar.MONTH, cal1.get(Calendar.MONTH));
		cal2.set(Calendar.DAY_OF_MONTH, cal1.get(Calendar.DAY_OF_MONTH));
		cal2.set(Calendar.HOUR_OF_DAY, cal1.get(Calendar.HOUR_OF_DAY));
		cal2.set(Calendar.MINUTE, cal1.get(Calendar.MINUTE));

		agendamentoBD.setDataInicio(cal2.getTime());
		agendamentoBD.setTenant(tenant);
		this.dao.editar(agendamentoBD);
	}

	public void removerAgendamento(Tenant tenant, Agendamento agendamento, Boolean repeticoes) {
		SystemUtils.assertObjectIsNotNullHasId(agendamento);
		agendamento = this.dao.getAgendamentosById(agendamento.getId());
		SystemUtils.assertObjectIsFromTenant(tenant, agendamento);

		if (repeticoes) {
			if (agendamento.getPai() != null) {
				this.removerProximosAgendamentosByPai(agendamento, agendamento.getPai());
			} else if (agendamento.getRepeticao() == RepeticaoAgendamento.SEMANALMENTE) {
				this.removerProximosAgendamentosByPai(agendamento, agendamento);
				this.dao.remover(agendamento);
			}
		} else {
			this.removerProximosAgendamentosByPai(agendamento, agendamento);
			this.dao.remover(agendamento);
		}
	}

	private void removerProximosAgendamentosByPai(Agendamento proximo, Agendamento pai) {
		this.dao.removerProximosAgendamentosByPai(proximo, pai);
	}

}
