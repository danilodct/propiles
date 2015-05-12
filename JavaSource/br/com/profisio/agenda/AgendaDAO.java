package br.com.profisio.agenda;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import br.com.profisio.basics.Agendamento;
import br.com.profisio.util.DAOBase;
import br.com.profisio.util.Tenant;

public class AgendaDAO extends DAOBase {

	public AgendaDAO() {
	}

	public static Object daoFactory() {
		return DAOBase.DAOFactory(AgendaDAO.class);
	}

	@SuppressWarnings("unchecked")
	public void cadastrar(Agendamento agendamento) {
		this.imp.insert(agendamento);
	}

	@SuppressWarnings("unchecked")
	public Collection<Agendamento> getAgendamentosByMes(Tenant tenant, Date dataInicial, Date dataFim) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFim);
		return imp.createNamedQuery("getAgendamentosByMes", params).list();
	}

	@SuppressWarnings("unchecked")
	public void editar(Agendamento agendamento) {
		this.imp.update(agendamento);
	}

	@SuppressWarnings("unchecked")
	public Agendamento getAgendamentosById(Integer id) {
		return ((Agendamento) this.imp.read(Agendamento.class, id));
	}

	@SuppressWarnings("unchecked")
	public void remover(Agendamento agendamento) {
		this.imp.delete(agendamento);
	}

	@SuppressWarnings("unchecked")
	public void removerProximosAgendamentosByPai(Agendamento proximo, Agendamento pai) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("proximo", proximo);
		params.put("pai", pai);
		this.imp.execute("removerProximosAgendamentosByPai", params);
	}

}
