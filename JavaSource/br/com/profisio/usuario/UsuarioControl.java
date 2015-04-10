package br.com.profisio.usuario;

import java.util.Date;
import java.util.Map;

import br.com.profisio.basics.Usuario;
import br.com.profisio.basics.enums.StatusObjeto;
import br.com.profisio.basics.enums.TipoUser;
import br.com.profisio.util.ControllerBase;
import br.com.profisio.util.Mailer;
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
		if (!usuarioBD.getConfirmado()) {
			throw new ProfisioException(ProfisioBundleUtil.CADASTRO_NAO_CONFIRMADO, usuarioBD.getIdCript());
		}
		registrarUsuario(usuarioBD);
	}

	private void registrarUsuario(Usuario usuario) {
		Map<String, Object> session = SystemUtils.getHttpSession();
		session.put(ProfisioSessionUtil.SESSION_USER, usuario);
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
		if (usuario.getNomeUser() == null || usuario.getNomeUser().trim().equals(""))
			throw new ProfisioException(ProfisioBundleUtil.NOME_OBRIGATORIO);
		if (usuario.getLogin() == null || usuario.getLogin().trim().equals(""))
			throw new ProfisioException(ProfisioBundleUtil.EMAIL_OBRIGATORIO);

		Usuario userBd = this.dao.getUsuarioByLogin(usuario.getLogin());
		if (userBd != null)
			throw new ProfisioException(ProfisioBundleUtil.EMAIL_JA_CADASTRADO);

		if (usuario.getTenant() == null || usuario.getTenant().getNome().trim().equals(""))
			usuario.setTenant(new Tenant(usuario.getNome(), new Date(), Plano.PLANO_1));

		// retirar qd colocar para o usuario escolher o plano
		usuario.getTenant().setPlano(Plano.PLANO_1);

		usuario.setConfirmado(false);
		usuario.getTenant().setDataCriacao(new Date());
		this.dao.cadastrar(usuario.getTenant());

		usuario.setStatusObjeto(StatusObjeto.ATIVO);
		usuario.setTipo(TipoUser.ADMINISTRADOR);
		this.dao.cadastrar(usuario);

		enviarEmailConfirmacao(usuario);
	}

	private void enviarEmailConfirmacao(Usuario usuario) {
		Mailer mailer = new Mailer();
		String msg = Mailer.EMAIL_PARTE_CIMA_ATE_IMAGEM + Mailer.IMG_CADASTRO + Mailer.EMAIL_POS_IMAGEM_PRE_CONTEUDO + "Olá " + usuario.getNome() + ", bem-vindo(a) ao ProPilEs!<br /><br />Para finalizarmos o seu cadastro precisamos apenas que você clique no link abaixo. Caso não consiga abrir o link após clicar, por favor copie a url abaixo e cole no seu navegador." + Mailer.EMAIL_POS_CONTEUDO_PRE_LINK_URL + "http://localhost:8080/propiles/confirmar?usuario.idCript=" + usuario.getIdCript() + Mailer.EMAIL_POS_LINK_URL_PRE_LINK_TXT + "http://localhost:8080/propiles/confirmar?usuario.idCript=" + usuario.getIdCript() + Mailer.EMAIL_POS_LINK_TXT;
		mailer.sendMail("danilo.dct@gmail.com", "[ProPilEs] Novo Cadastro", msg);
	}

	public void confirmarCadastro(Usuario usuario) {
		if (usuario == null || usuario.getId() == null)
			throw new ProfisioException(ProfisioBundleUtil.ERRO_CONFIRMAR_CADASTRO);
		usuario = this.dao.getUsuarioById(usuario.getId());
		usuario.setConfirmado(true);
		this.dao.editar(usuario);
		registrarUsuario(usuario);
	}

	public Usuario reenviarConfirmacao(Usuario usuario) {
		if (usuario == null || usuario.getId() == null)
			throw new ProfisioException(ProfisioBundleUtil.ERRO_REENVIAR_CONFIRMACAO);

		usuario = this.dao.getUsuarioById(usuario.getId());

		enviarEmailConfirmacao(usuario);
		return usuario;
	}

	public void esqueceuSenha(Usuario usuario) {
		if (usuario == null || usuario.getLogin() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_EMAIL);

		usuario = this.dao.getUsuarioByLogin(usuario.getLogin());
		if (usuario == null || usuario.getLogin() == null)
			throw new ProfisioException(ProfisioBundleUtil.EMAIL_INEXISTENTE);

		Mailer mailer = new Mailer();
		String msg = Mailer.EMAIL_PARTE_CIMA_ATE_IMAGEM + Mailer.IMG_RECUPERE_SENHA + Mailer.EMAIL_POS_IMAGEM_PRE_CONTEUDO + "Olá " + usuario.getNome() + ", não está conseguindo acessar o ProPilEs por ter esquecido a senha? Não se preocupe, nós lembramos para você: <br /><br />Por questões de segurança sugerimos que você remova este e-mail para que outras pessoas que acessem o seu e-mail não tenham acesso à sua senha." + Mailer.EMAIL_POS_CONTEUDO_PRE_LINK_URL + "#" + Mailer.EMAIL_POS_LINK_URL_PRE_LINK_TXT + "sua senha é: " + usuario.getSenha() + Mailer.EMAIL_POS_LINK_TXT;
		mailer.sendMail("danilo.dct@gmail.com", "[ProPilEs] Esqueceu sua senha?", msg);
	}

	public void contato(String nome, String empresa, String fone, String email, String mensagem) {
		if ((email == null || email.trim().equals("")) && (fone == null || fone.trim().equals("")))
			throw new ProfisioException(ProfisioBundleUtil.INFORME_EMAIL_FONE);

		Mailer mailer = new Mailer();
		String msgCorpo = nome + "<br />Empresa: " + empresa + "<br />" + fone + "<br />E-mail: " + email + "<br /><br />" + mensagem;
		String msg = Mailer.EMAIL_PARTE_CIMA_ATE_IMAGEM + Mailer.IMG_CONTATO + Mailer.EMAIL_POS_IMAGEM_PRE_CONTEUDO + msgCorpo + Mailer.EMAIL_POS_CONTEUDO;
		mailer.sendMail("danilo.dct@gmail.com", "[ProPilEs] Mensagem de contato", msg);
	}

	public void setLogoTenant(Tenant tenant, String logo) {
		SystemUtils.assertObjectIsNotNullHasId(tenant);
		tenant.setLogo(logo);
		this.dao.editar(tenant);
		Usuario userSession = ProfisioSessionUtil.getUserSession();
		userSession.setTenant(tenant);
		this.registrarUsuario(userSession);
	}

	public void setCorTenant(Tenant tenant, String cor) {
		SystemUtils.assertObjectIsNotNullHasId(tenant);
		tenant.setCor(cor);
		this.dao.editar(tenant);
		Usuario userSession = ProfisioSessionUtil.getUserSession();
		userSession.setTenant(tenant);
		this.registrarUsuario(userSession);

	}
}
