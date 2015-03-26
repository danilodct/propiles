package br.com.profisio.usuario;

import java.util.HashMap;
import java.util.Map;

import br.com.profisio.basics.Usuario;
import br.com.profisio.util.DAOBase;

public class UsuarioDAO extends DAOBase {

	public UsuarioDAO() {
	}

	public static Object daoFactory() {
		return DAOBase.DAOFactory(UsuarioDAO.class);
	}

	@SuppressWarnings("unchecked")
	public Usuario getUsuarioByLoginSenha(Usuario usuario) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("login", usuario.getLogin());
		params.put("senha", usuario.getSenha());
		return (Usuario) imp.queryObject("getUsuarioByLoginSenha", params);
	}

	@SuppressWarnings("unchecked")
	public Usuario getUsuarioByLogin(String login) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("login", login);
		return (Usuario) imp.queryObject("getUsuarioByLogin", params);
	}

}
