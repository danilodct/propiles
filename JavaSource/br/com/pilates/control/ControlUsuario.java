package br.com.pilates.control;

import br.com.pilates.base.Usuario;

public interface ControlUsuario {
	
	void login(Usuario usuario);
	
	void logout();
	
}
