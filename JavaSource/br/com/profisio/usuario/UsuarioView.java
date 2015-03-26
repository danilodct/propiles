package br.com.profisio.usuario;

import br.com.profisio.basics.Usuario;
import br.com.profisio.util.ProfisioActionSupport;

public class UsuarioView extends ProfisioActionSupport {

	private static final long serialVersionUID = 4742339788981156278L;

	private final UsuarioControl controller;

	private Usuario usuario;

	public UsuarioView() {
		controller = UsuarioControl.getInstance();
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

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}
