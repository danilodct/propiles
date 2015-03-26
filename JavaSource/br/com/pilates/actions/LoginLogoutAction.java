package br.com.pilates.actions;

import br.com.pilates.base.Usuario;
import br.com.pilates.fachada.IProxy;
import br.com.pilates.fachada.Proxy;

@SuppressWarnings("serial")
public class LoginLogoutAction extends PilatesActionSupport {
	
	private final IProxy proxy;
	private Usuario usuario;
	
	public LoginLogoutAction() {
		this.proxy = Proxy.getInstance();
	}
	
	public String actionLogout() {
		String resposta = "";
		try {
			this.proxy.logout();
			resposta = SUCCESS;
		}
		catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}
	
	public String actionLogin() {
		String resposta = "";
		try {
			this.proxy.login(this.usuario);
			resposta = SUCCESS;
		}
		catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}
	
	public Usuario getUsuario() {
		return usuario;
	}
	
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
}
