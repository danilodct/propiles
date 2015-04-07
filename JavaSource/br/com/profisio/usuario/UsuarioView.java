package br.com.profisio.usuario;

import br.com.profisio.basics.Usuario;
import br.com.profisio.util.ProfisioActionSupport;
import br.com.profisio.util.Tenant;

public class UsuarioView extends ProfisioActionSupport {

	private static final long serialVersionUID = 4742339788981156278L;

	private final UsuarioControl controller;

	private Usuario usuario;
	private Tenant tenant;

	public UsuarioView() {
		controller = UsuarioControl.getInstance();
	}

	public String actionCadastrese() {
		String resposta = "";
		try {
			if (usuario != null && tenant != null)
				usuario.setTenant(tenant);
			controller.cadastro(usuario);
			resposta = SUCCESS;
		} catch (Exception e) {
			this.dealException(e);
			resposta = ERROR;
		}
		return resposta;
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

	//===================================

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

}
