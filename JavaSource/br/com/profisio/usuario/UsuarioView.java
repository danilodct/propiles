package br.com.profisio.usuario;

import br.com.profisio.basics.Usuario;
import br.com.profisio.util.ProfisioActionSupport;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.Tenant;

public class UsuarioView extends ProfisioActionSupport {

	private static final long serialVersionUID = 4742339788981156278L;

	private final UsuarioControl controller;

	private Usuario usuario;
	private Tenant tenant;
	private String page;

	public UsuarioView() {
		controller = UsuarioControl.getInstance();
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
			controller.confirmarCadastro(usuario);
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

}
