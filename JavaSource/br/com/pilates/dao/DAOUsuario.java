package br.com.pilates.dao;

import br.com.pilates.base.Usuario;

public interface DAOUsuario extends IHibernateDAO<Usuario> {
	
	String QUERY_GET_USUARIO_BY_LOGIN_SENHA = "getUsuarioByLoginSenha";
	
	String PARAM_LOGIN = "login";
	String PARAM_SENHA = "senha";
	
	Usuario getUsuarioByLoginSenha(Usuario usuario);
	
}
