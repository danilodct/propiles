package br.com.profisio.usuario;

import java.util.Date;
import java.util.Map;

import br.com.profisio.basics.TransacaoPagamento;
import br.com.profisio.basics.Usuario;
import br.com.profisio.basics.enums.StatusObjeto;
import br.com.profisio.basics.enums.TipoUser;
import br.com.profisio.util.ControllerBase;
import br.com.profisio.util.Mailer;
import br.com.profisio.util.Pagseguro;
import br.com.profisio.util.Plano;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.ProfisioException;
import br.com.profisio.util.ProfisioSessionUtil;
import br.com.profisio.util.SystemUtils;
import br.com.profisio.util.Tenant;
import br.com.uol.pagseguro.domain.Transaction;
import br.com.uol.pagseguro.enums.TransactionStatus;

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
		if (usuario.getTenant() == null || usuario.getTenant().getPlano() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_PLANO);

		Usuario userBd = this.dao.getUsuarioByLogin(usuario.getLogin());
		if (userBd != null)
			throw new ProfisioException(ProfisioBundleUtil.EMAIL_JA_CADASTRADO);

		Tenant tenant = usuario.getTenant();
		if (usuario.getTenant().getNome().trim().equals("")) {
			tenant.setNome(usuario.getNomeUser());
			usuario.setTenant(tenant);
		}
		tenant.setDataCriacao(new Date());

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

	public String confirmarCadastro(Usuario usuario) {
		String url = null;
		if (usuario == null || usuario.getId() == null)
			throw new ProfisioException(ProfisioBundleUtil.ERRO_CONFIRMAR_CADASTRO);
		usuario = this.dao.getUsuarioById(usuario.getId());
		if (!usuario.getConfirmado()) {
			Tenant tenant = usuario.getTenant();
			if (tenant.getPlano() == Plano.PLANO_1) {
				usuario.setConfirmado(true);
				this.dao.editar(usuario);
				registrarUsuario(usuario);
			} else {
				Pagseguro pagseguro = new Pagseguro();
				TransacaoPagamento transacao = pagseguro.doPagamento(usuario.getId() + "", tenant.getPlano().getValor(), tenant.getPlano().getCusto(), usuario.getNomeUser(), usuario.getLogin());
				url = transacao.getUrl();
				transacao.setUsuario(usuario);
				transacao.setData(new Date());
				this.dao.cadastrar(transacao);
			}
		}
		return url;
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

	public void setNomeTenant(Tenant tenant, String empresa) {
		SystemUtils.assertObjectIsNotNullHasId(tenant);
		tenant.setNome(empresa);
		this.dao.editar(tenant);
		Usuario userSession = ProfisioSessionUtil.getUserSession();
		userSession.setTenant(tenant);
		this.registrarUsuario(userSession);
	}

	public void setNomeUsuario(Usuario usuario, String nome) {
		SystemUtils.assertObjectIsNotNullHasId(usuario);
		usuario.setNomeUser(nome);
		this.dao.editar(usuario);
		this.registrarUsuario(usuario);
	}

	public void atualizacaoPagamento(String transactionCode) {
		if (transactionCode != null) {
			Pagseguro pagseguro = new Pagseguro();
			Transaction transaction = pagseguro.checkTransaction(transactionCode);
			TransacaoPagamento transacaoPagamento = this.dao.getTransacaoPagamentoByCodigo(transaction.getCode());
			if (transacaoPagamento != null) {
				transacaoPagamento.setStatus(transaction.getStatus().name());
				this.dao.atualizarTransacao(transacaoPagamento);

				Usuario usuario = transacaoPagamento.getUsuario();

				String situacaoPagamento = "";
				if (transaction.getStatus() == TransactionStatus.PAID) {
					situacaoPagamento = "confirmado!";
					usuario.setConfirmado(true);
					this.dao.editar(usuario);
				} else if (transaction.getStatus() == TransactionStatus.CANCELLED) {
					situacaoPagamento = "cancelado!";
				} else if (transaction.getStatus() == TransactionStatus.CONTESTATION) {
					situacaoPagamento = "contestado.";
				} else if (transaction.getStatus() == TransactionStatus.IN_ANALYSIS) {
					situacaoPagamento = "em análise.";
				} else if (transaction.getStatus() == TransactionStatus.IN_DISPUTE) {
					situacaoPagamento = "em disputa.";
				} else if (transaction.getStatus() == TransactionStatus.INITIATED) {
					situacaoPagamento = "iniciado.";
				} else if (transaction.getStatus() == TransactionStatus.WAITING_PAYMENT) {
					situacaoPagamento = "aguardando pagamento.";
				}

				Mailer mailer = new Mailer();
				String msgCorpo = "Status atual do seu pagamento: " + situacaoPagamento;
				String msg = Mailer.EMAIL_PARTE_CIMA_ATE_IMAGEM + Mailer.IMG_CONTATO + Mailer.EMAIL_POS_IMAGEM_PRE_CONTEUDO + msgCorpo + Mailer.EMAIL_POS_CONTEUDO;
				mailer.sendMail("danilo.dct@gmail.com", "[ProPilEs] Atualização do seu pagamento", msg);
			}
		}
	}
}
