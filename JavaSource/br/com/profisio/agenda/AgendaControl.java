package br.com.profisio.agenda;

import java.util.Calendar;
import java.util.Collection;
import java.util.Date;

import br.com.profisio.basics.Agendamento;
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
		this.dao.cadastrar(agendamento);
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

	public void editarAgendamento(Tenant tenant, Agendamento agendamento) {
		SystemUtils.assertObjectIsNotNullHasId(agendamento);
		Agendamento agendamentoBD = this.dao.getAgendamentosById(agendamento.getId());
		agendamento.setCadastro(agendamentoBD.getCadastro());
		agendamento.setContaReceber(agendamentoBD.getContaReceber());
		agendamento.setTenant(tenant);
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

	public void removerAgendamento(Agendamento agendamento) {
		SystemUtils.assertObjectIsNotNullHasId(agendamento);
		this.dao.remover(agendamento);
	}

}
