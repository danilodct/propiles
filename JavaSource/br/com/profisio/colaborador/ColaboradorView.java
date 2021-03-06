package br.com.profisio.colaborador;

import java.util.Collection;

import br.com.profisio.basics.Colaborador;
import br.com.profisio.basics.Contrato;
import br.com.profisio.basics.Servico;
import br.com.profisio.basics.Usuario;
import br.com.profisio.basics.enums.Sexo;
import br.com.profisio.basics.enums.TipoUser;
import br.com.profisio.util.ProfisioActionSupport;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.ProfisioLoggerUtil;
import br.com.profisio.util.ProfisioSessionUtil;
import br.com.profisio.util.SystemUtils;

public class ColaboradorView extends ProfisioActionSupport {

	private static final long serialVersionUID = 4742339788981156278L;

	private final ColaboradorControl controller;

	private Collection<Colaborador> colaboradores;
	private Collection<Contrato> contratos;
	private Colaborador colaborador;
	private Contrato contrato;
	private String nomeColaborador, aba;
	private Servico servico;

	public ColaboradorView() {
		controller = ColaboradorControl.getInstance();
	}

	public String actionAlterarSenha() {
		ProfisioLoggerUtil.info("ColaboradorView.actionAlterarSenha()");
		String resposta = REDIRECT;
		try {

			if (this.colaborador != null) {
				Usuario userSession = ProfisioSessionUtil.getUserSession();
				this.colaborador.setId(userSession.getId());
				this.controller.alterarSenha(getTenant(), this.colaborador);
				addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
				resposta = "redirect_home";
			}
		} catch (Exception e) {
			this.dealException(e);
		}
		return resposta;
	}

	public String actionGetContratosByServico() {
		ProfisioLoggerUtil.info("ColaboradorView.actionGetContratosByServico()");
		String xml = XML_HEAD;
		try {

			this.contratos = null;

			xml += "<contratos>";
			if (this.servico != null) {
				this.contratos = this.controller.getContratosByServico(getTenant(), this.servico);
				if (this.contratos != null && this.contratos.size() > 0) {
					for (Contrato contrato : this.contratos) {
						xml += "<contrato id=\"" + contrato.getIdCript() + "\"  >";
						xml += "<colaborador>";
						xml += contrato.getColaborador().getNome();
						xml += "</colaborador>";
						xml += "</contrato>";
					}
				}
			}
			xml += "</contratos>";
		} catch (Exception e) {
			this.dealException(e);
			xml += SystemUtils.parseExceptionToXML(e);
		}
		printResponse(xml);
		return null;
	}

	public String actionEditarContrato() {
		ProfisioLoggerUtil.info("ColaboradorView.actionEditarContrato()");
		try {

			this.controller.editarContrato(getTenant(), contrato);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionCadastrarContrato() {
		ProfisioLoggerUtil.info("ColaboradorView.actionCadastrarContrato()");
		try {

			this.controller.cadastrarContrato(getTenant(), contrato);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionRemoverContrato() {
		ProfisioLoggerUtil.info("ColaboradorView.actionRemoverContrato()");
		try {

			this.controller.removerContrato(getTenant(), contrato);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionRemoverColaborador() {
		ProfisioLoggerUtil.info("ColaboradorView.actionRemoverColaborador()");
		try {

			this.controller.removerColaborador(getTenant(), colaborador);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionEditarColaborador() {
		ProfisioLoggerUtil.info("ColaboradorView.actionEditarColaborador()");
		try {

			this.controller.editarColaborador(getTenant(), colaborador);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionCadastrarColaborador() {
		ProfisioLoggerUtil.info("ColaboradorView.actionCadastrarColaborador()");
		String resposta = null;
		try {

			this.controller.cadastrarColaborador(getTenant(), colaborador);
			resposta = SUCCESS;
		} catch (Exception e) {
			this.dealException(e);
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionColaborador() {
		ProfisioLoggerUtil.info("ColaboradorView.actionColaborador()");
		String resposta = null;
		try {
			Integer id = null;
			if (this.colaborador != null && this.colaborador.getId() != null)
				id = this.colaborador.getId();

			this.colaborador = this.controller.getColaboradorById(getTenant(), id);
			this.contratos = this.controller.getContratosByColaborador(getTenant(), this.colaborador);
			resposta = SUCCESS;
		} catch (Exception e) {
			this.dealException(e);
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionColaboradores() {
		ProfisioLoggerUtil.info("ColaboradorView.actionColaboradores()");
		try {

			this.colaboradores = this.controller.getColaboradores(getTenant(), nomeColaborador);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	// 888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

	public Sexo[] getSexos() {
		return Sexo.values();
	}

	public TipoUser[] getTiposUser() {
		TipoUser[] tipos = TipoUser.values();
		TipoUser[] retorno = new TipoUser[tipos.length - 1];
		int i = 0;
		for (TipoUser tipo : tipos) {
			if (tipo != TipoUser.ADMINISTRADOR) {
				retorno[i] = tipo;
				i += 1;
			}
		}
		return retorno;
	}

	// 888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

	public String getNomeColaborador() {
		return nomeColaborador;
	}

	public void setNomeColaborador(String nomeColaborador) {
		this.nomeColaborador = nomeColaborador;
	}

	public Collection<Colaborador> getColaboradores() {
		return colaboradores;
	}

	public void setColaboradores(Collection<Colaborador> colaboradores) {
		this.colaboradores = colaboradores;
	}

	public Colaborador getColaborador() {
		return colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}

	public Collection<Contrato> getContratos() {
		return contratos;
	}

	public void setContratos(Collection<Contrato> contratos) {
		this.contratos = contratos;
	}

	public Contrato getContrato() {
		return contrato;
	}

	public void setContrato(Contrato contrato) {
		this.contrato = contrato;
	}

	public Servico getServico() {
		return servico;
	}

	public void setServico(Servico servico) {
		this.servico = servico;
	}

	public String getAba() {
		return aba;
	}

	public void setAba(String aba) {
		this.aba = aba;
	}

}
