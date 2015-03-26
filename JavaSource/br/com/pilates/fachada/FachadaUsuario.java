package br.com.pilates.fachada;

import br.com.pilates.base.Usuario;
import br.com.pilates.control.ControlUsuario;
import br.com.pilates.control.impl.ControlUsuarioImpl;

public class FachadaUsuario {
	
	private static FachadaUsuario instance;
	private ControlUsuario controlUsuario;
	
	private FachadaUsuario() {
		this.controlUsuario = new ControlUsuarioImpl();
	}
	
	public static FachadaUsuario getInstance() {
		if (instance == null) {
			instance = new FachadaUsuario();
		}
		return instance;
	}
	
	public void login(Usuario usuario) {
		this.controlUsuario.login(usuario);
	}
	
	public void logout() {
		this.controlUsuario.logout();
	}
	
}
