package br.com.pilates.dao.impl;

import java.util.HashMap;
import java.util.Map;

import br.com.pilates.base.Usuario;
import br.com.pilates.dao.DAOUsuario;

public class DAOUsuarioImpl extends HibernateDAO<Usuario> implements DAOUsuario {
	
	@Override
	public Usuario getUsuarioByLoginSenha(Usuario usuario) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put(DAOUsuario.PARAM_LOGIN, usuario.getLogin());
		params.put(DAOUsuario.PARAM_SENHA, usuario.getSenha());
		return (Usuario) queryObject(DAOUsuario.QUERY_GET_USUARIO_BY_LOGIN_SENHA, params);
	}
	
}
