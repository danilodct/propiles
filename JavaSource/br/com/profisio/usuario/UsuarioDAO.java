package br.com.profisio.usuario;

import java.util.HashMap;
import java.util.Map;

import br.com.profisio.basics.Usuario;
import br.com.profisio.util.DAOBase;
import br.com.profisio.util.Tenant;

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

	@SuppressWarnings("unchecked")
	public void cadastrar(Usuario usuario) {
		this.imp.insert(usuario);
	}

	@SuppressWarnings("unchecked")
	public void cadastrar(Tenant tenant) {
		this.imp.insert(tenant);
	}

	@SuppressWarnings("unchecked")
	public Usuario getUsuarioById(Integer id) {
		return (Usuario) this.imp.read(Usuario.class, id);
	}

	@SuppressWarnings("unchecked")
	public void editar(Usuario usuario) {
		this.imp.update(usuario);
	}

}
