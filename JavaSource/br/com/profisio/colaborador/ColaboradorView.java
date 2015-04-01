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
import br.com.profisio.util.ProfisioSessionUtil;
import br.com.profisio.util.SystemUtils;
import br.com.profisio.util.Tenant;

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
		String resposta = REDIRECT;
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			if (this.colaborador != null) {
				Usuario userSession = ProfisioSessionUtil.getUserSession();
				this.colaborador.setId(userSession.getId());
				this.controller.alterarSenha(tenant, this.colaborador);
				addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
				resposta = "redirect_home";
			}
		} catch (Exception e) {
			this.dealException(e);
		}
		return resposta;
	}

	public String actionGetContratosByServico() {
		String xml = XML_HEAD;
		try {
			this.contratos = this.controller.getContratosByServico(this.servico);
			xml += "<contratos>";
			if (this.contratos != null && this.contratos.size() > 0) {
				for (Contrato contrato : this.contratos) {
					xml += "<contrato id=\"" + contrato.getIdCript() + "\"  >";
					xml += "<colaborador>";
					xml += contrato.getColaborador().getNome();
					xml += "</colaborador>";
					xml += "</contrato>";
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
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.controller.editarContrato(tenant, contrato);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionCadastrarContrato() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.controller.cadastrarContrato(tenant, contrato);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionRemoverContrato() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.controller.removerContrato(tenant, contrato);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionRemoverColaborador() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.controller.removerColaborador(tenant, colaborador);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionEditarColaborador() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.controller.editarColaborador(tenant, colaborador);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionCadastrarColaborador() {
		String resposta = null;
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.controller.cadastrarColaborador(tenant, colaborador);
			resposta = SUCCESS;
		} catch (Exception e) {
			this.dealException(e);
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionColaborador() {
		String resposta = null;
		try {
			Integer id = null;
			if (this.colaborador != null && this.colaborador.getId() != null)
				id = this.colaborador.getId();
			this.colaborador = this.controller.getColaboradorById(id);
			this.contratos = this.controller.getContratosByColaborador(this.colaborador);
			resposta = SUCCESS;
		} catch (Exception e) {
			this.dealException(e);
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionColaboradores() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.colaboradores = this.controller.getColaboradores(tenant, nomeColaborador);
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
