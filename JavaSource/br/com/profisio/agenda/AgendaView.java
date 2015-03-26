package br.com.profisio.agenda;

import java.util.Date;

import br.com.profisio.basics.Agendamento;
import br.com.profisio.basics.Cadastro;
import br.com.profisio.util.ProfisioActionSupport;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.ProfisioSessionUtil;
import br.com.profisio.util.Tenant;

public class AgendaView extends ProfisioActionSupport {

	private static final long serialVersionUID = -735616690640381036L;
	private final AgendaControl controller;

	private Cadastro cadastro;
	private Agendamento agendamento;
	private String agendamentos, aba;

	public AgendaView() {
		controller = AgendaControl.getInstance();
	}

	public String actionRemoverAgendamento() {
		String resposta = REDIRECT;
		try {
			controller.removerAgendamento(this.agendamento);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		if (this.cadastro != null && this.cadastro.getId() != null)
			resposta = "redirect_cadastro";
		return resposta;
	}

	public String actionAlterarDataAgendamento() {
		String resposta = REDIRECT;
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			controller.alterarDataAgendamento(tenant, this.agendamento);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		if (this.cadastro != null && this.cadastro.getId() != null)
			resposta = "redirect_cadastro";
		return resposta;
	}

	public String actionEditarAgendamento() {
		String resposta = REDIRECT;
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			controller.editarAgendamento(tenant, this.agendamento);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		if (this.cadastro != null && this.cadastro.getId() != null)
			resposta = "redirect_cadastro";
		return resposta;
	}

	public String actionCadastrarAgendamento() {
		String resposta = REDIRECT;
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			controller.cadastrarAgendamento(tenant, this.agendamento);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		if (this.cadastro != null && this.cadastro.getId() != null)
			resposta = "redirect_cadastro";
		return resposta;
	}

	public String actionAgenda() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.agendamentos = controller.getAgendamentosByMes(tenant, null);
			//Setar valores iniciais
			this.agendamento = new Agendamento();
			this.agendamento.setDataInicio(new Date());
			this.agendamento.setDuracao(Agendamento.DURACAO_DEFAULT);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	// 888888888888888888888888888888888888888888888888888888888888888888888888

	public String getAgendamentos() {
		return agendamentos;
	}

	public void setAgendamentos(String agendamentos) {
		this.agendamentos = agendamentos;
	}

	public Agendamento getAgendamento() {
		return agendamento;
	}

	public void setAgendamento(Agendamento agendamento) {
		this.agendamento = agendamento;
	}

	public Cadastro getCadastro() {
		return cadastro;
	}

	public void setCadastro(Cadastro cadastro) {
		this.cadastro = cadastro;
	}

	public String getAba() {
		return aba;
	}

	public void setAba(String aba) {
		this.aba = aba;
	}

}
