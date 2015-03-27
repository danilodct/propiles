package br.com.profisio.usuario;

import java.util.Map;

import br.com.profisio.basics.Usuario;
import br.com.profisio.util.ControllerBase;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.ProfisioException;
import br.com.profisio.util.ProfisioSessionUtil;
import br.com.profisio.util.SystemUtils;
import br.com.profisio.util.Tenant;

public class UsuarioControl extends ControllerBase {

	private static UsuarioControl instance = null;
	private UsuarioDAO dao = null;

	private UsuarioControl() {
		dao = (UsuarioDAO) UsuarioDAO.daoFactory();
	}

	public static UsuarioControl getInstance() {
		if (instance == null)
			instance = new UsuarioControl();
		return instance;
	}

	public void login(Usuario usuario) {
		Usuario usuarioBD = this.dao.getUsuarioByLoginSenha(usuario);
		if (usuarioBD == null) {
			throw new ProfisioException(ProfisioBundleUtil.LOGIN_INCORRETO);
		}
		Tenant tenant = this.dao.getTenantByUsuario(usuarioBD);
		registrarUsuario(usuarioBD, tenant);
	}

	private void registrarUsuario(Usuario usuario, Tenant tenant) {
		Map<String, Object> session = SystemUtils.getHttpSession();
		session.put(ProfisioSessionUtil.SESSION_USER, usuario);
		session.put(ProfisioSessionUtil.SESSION_TENANT, tenant);
	}

	public void logout() {
		Map<String, Object> session = SystemUtils.getHttpSession();
		session.clear();
	}

	public boolean checkLoginExiste(String login) {
		Usuario user = getUsuarioByLogin(login);
		return user != null;
	}

	private Usuario getUsuarioByLogin(String login) {
		return this.dao.getUsuarioByLogin(login);
	}
}