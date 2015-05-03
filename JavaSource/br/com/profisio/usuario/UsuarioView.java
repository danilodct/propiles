package br.com.profisio.usuario;

import java.io.File;

import br.com.profisio.basics.Usuario;
import br.com.profisio.util.Plano;
import br.com.profisio.util.ProfisioActionSupport;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.ProfisioSessionUtil;
import br.com.profisio.util.SystemUtils;
import br.com.profisio.util.Tenant;

public class UsuarioView extends ProfisioActionSupport {

	private static final long serialVersionUID = 4742339788981156278L;

	private final UsuarioControl controller;

	private Usuario usuario;
	private Tenant tenant;
	private String page, nome, empresa, fone, email, mensagem, transacaoId;
	private Plano plano;

	private String logoFileName;
	private String logoContentType;
	private File logo;

	public UsuarioView() {
		controller = UsuarioControl.getInstance();
	}

	public String actionTour() {
		try {
			this.controller.tour();
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.PEDIDO_PERSONALIZADO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return null;
	}

	public String actionPersonalizado() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.controller.personalizado(tenant);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.PEDIDO_PERSONALIZADO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionUpgrade() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.setUrl(this.controller.upgrade(tenant, this.plano));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionAtualizacaoPagamento() {
		try {
			this.controller.atualizacaoPagamento(transacaoId);
		} catch (Exception e) {
			this.dealException(e);
		}
		return null;
	}

	public String actionRetornoPagamento() {
		try {
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.RETORNO_PAGAMENTO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionMudarDados() {
		try {
			Tenant tenantSessao = ProfisioSessionUtil.getTenantSession();
			// empresa
			String empresa = this.tenant.getNome();
			this.controller.setNomeTenant(tenantSessao, empresa);

			Usuario userSessao = ProfisioSessionUtil.getUserSession();
			// nome
			String nome = this.usuario.getNomeUser();
			this.controller.setNomeUsuario(userSessao, nome);

			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionDados() {
		try {
			this.usuario = ProfisioSessionUtil.getUserSession();
			this.tenant = ProfisioSessionUtil.getTenantSession();
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionMudarAparencia() {
		try {
			Tenant tenantSessao = ProfisioSessionUtil.getTenantSession();
			// cor
			String cor = tenant.getCor();
			this.controller.setCorTenant(tenantSessao, cor);

			// logo
			String logo = tenant.getLogo();
			if (this.logo != null) {
				this.assertFileSizeOk(this.logo);
				this.copyFile(this.logo, "logos/" + SystemUtils.tratarFileName(logoFileName));
				logo = SystemUtils.tratarFileName(logoFileName);
				this.controller.setLogoTenant(tenantSessao, logo);
			}
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionAparencia() {
		try {
			this.tenant = ProfisioSessionUtil.getTenantSession();
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionDuvidas() {
		try {
			controller.duvidas(mensagem);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.MENSAGEM_ENVIADA));
		} catch (Exception e) {
			this.dealException(e);
		}
		mensagem = null;
		return null;
	}

	public String actionContato() {
		try {
			controller.contato(nome, empresa, fone, email, mensagem);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.MENSAGEM_ENVIADA));
		} catch (Exception e) {
			this.dealException(e);
		}
		this.page = "contato";

		nome = null;
		empresa = null;
		fone = null;
		email = null;
		mensagem = null;

		return REDIRECT;
	}

	public String actionEsqueceuSenha() {
		try {
			controller.esqueceuSenha(usuario);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ESQUECEU_SENHA_ENVIADO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionReenviarConfirmacao() {
		try {
			usuario = controller.reenviarConfirmacao(usuario);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.REENVIADO_EMAIL_CONFIRMACAO, usuario.getLogin()));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionConfirmar() {
		String resposta = SUCCESS;
		try {
			this.setUrl(controller.confirmarCadastro(usuario));
			if (this.getUrl() != null && !this.getUrl().trim().equals(""))
				resposta = REDIRECT;
			else
				addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.CONFIRMADO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionCadastrese() {
		try {
			if (usuario != null && tenant != null)
				usuario.setTenant(tenant);
			controller.cadastro(usuario);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.VERIFIQUE_EMAIL));
		} catch (Exception e) {
			this.dealException(e);
		}
		page = "cadastro";
		return REDIRECT;
	}

	public String actionLogin() {
		String resposta = "";
		try {
			controller.login(usuario);
			resposta = SUCCESS;
		} catch (Exception e) {
			this.dealException(e);
			resposta = ERROR;
		}
		this.page = "login";
		return resposta;
	}

	public String actionLogout() {
		try {
			controller.logout();
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	// ===================================

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	@Override
	public Tenant getTenant() {
		return tenant;
	}

	public void setTenant(Tenant tenant) {
		this.tenant = tenant;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmpresa() {
		return empresa;
	}

	public void setEmpresa(String empresa) {
		this.empresa = empresa;
	}

	public String getFone() {
		return fone;
	}

	public void setFone(String fone) {
		this.fone = fone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMensagem() {
		return mensagem;
	}

	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}

	public String getLogoFileName() {
		return logoFileName;
	}

	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}

	public String getLogoContentType() {
		return logoContentType;
	}

	public void setLogoContentType(String logoContentType) {
		this.logoContentType = logoContentType;
	}

	public File getLogo() {
		return logo;
	}

	public void setLogo(File logo) {
		this.logo = logo;
	}

	public void setPlano(String planoStr) {
		if (this.tenant == null)
			this.tenant = new Tenant();
		Plano plano = Plano.createEnum(planoStr);
		tenant.setPlano(plano);
	}

	public String getTransacaoId() {
		return transacaoId;
	}

	public void setTransacaoId(String transaction) {
		this.transacaoId = transaction;
	}

	public Plano getPlano() {
		return plano;
	}

	public String getPlanoStr() {
		String planoStr = "";
		if (this.plano != null)
			planoStr = this.plano.getValue();
		return planoStr;
	}

	public void setPlanoStr(String plano) {
		this.plano = Plano.createEnum(plano);
	}

}
