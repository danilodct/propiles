package br.com.profisio.usuario;

import java.util.Date;
import java.util.Map;

import br.com.profisio.basics.Usuario;
import br.com.profisio.basics.enums.StatusObjeto;
import br.com.profisio.basics.enums.TipoUser;
import br.com.profisio.util.ControllerBase;
import br.com.profisio.util.Plano;
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
		Usuario usuarioBD = null;
		if (usuario != null && usuario.getLogin() != null && usuario.getSenha() != null)
			usuarioBD = this.dao.getUsuarioByLoginSenha(usuario);
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

	public void cadastro(Usuario usuario) {
		if (usuario == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_TODOS_DADOS);
		if (usuario.getNome() == null || usuario.getNome().trim().equals(""))
			throw new ProfisioException(ProfisioBundleUtil.NOME_OBRIGATORIO);
		if (usuario.getEmail() == null || usuario.getEmail().trim().equals(""))
			throw new ProfisioException(ProfisioBundleUtil.EMAIL_OBRIGATORIO);

		usuario.setLogin(usuario.getEmail());
		Usuario userBd = this.dao.getUsuarioByLogin(usuario.getLogin());
		if (userBd != null)
			throw new ProfisioException(ProfisioBundleUtil.EMAIL_JA_CADASTRADO);

		if (usuario.getTenant() == null || usuario.getTenant().getNome().trim().equals(""))
			usuario.setTenant(new Tenant(usuario.getNome(), new Date(), Plano.PLANO_1));

		//retirar qd colocar para o usuario escolher o plano 
		usuario.getTenant().setPlano(Plano.PLANO_1);

		usuario.getTenant().setDataCriacao(new Date());
		this.dao.cadastrar(usuario.getTenant());

		usuario.setStatusObjeto(StatusObjeto.ATIVO);
		usuario.setTipo(TipoUser.ADMINISTRADOR);
		this.dao.cadastrar(usuario);

		this.registrarUsuario(usuario, usuario.getTenant());
	}
}
