package br.com.profisio.colaborador;

import java.util.Calendar;
import java.util.Collection;

import br.com.profisio.basics.Colaborador;
import br.com.profisio.basics.Contrato;
import br.com.profisio.basics.Servico;
import br.com.profisio.basics.Usuario;
import br.com.profisio.basics.enums.StatusObjeto;
import br.com.profisio.usuario.UsuarioControl;
import br.com.profisio.util.ControllerBase;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.ProfisioException;
import br.com.profisio.util.SystemUtils;

public class ColaboradorControl extends ControllerBase {

	private static ColaboradorControl instance = null;
	private ColaboradorDAO dao = null;

	private ColaboradorControl() {
		dao = (ColaboradorDAO) ColaboradorDAO.daoFactory();
	}

	public static ColaboradorControl getInstance() {
		if (instance == null)
			instance = new ColaboradorControl();
		return instance;
	}

	public Collection<Colaborador> getProximosAniversariantes() {
		Calendar calendar = Calendar.getInstance();
		int month = calendar.get(Calendar.MONTH) + 1;
		String mesAtual = "" + month;
		if (mesAtual.length() == 1) {
			mesAtual = "0" + mesAtual;
		}
		int mesProximoInt = month + 1;
		if (mesProximoInt == 13)
			mesProximoInt = 1;
		String mesProximo = "" + mesProximoInt;
		if (mesProximo.length() == 1) {
			mesProximo = "0" + mesProximo;
		}
		return this.dao.getProximosAniversariantes(mesAtual, mesProximo);
	}

	public Collection<Colaborador> getColaboradores(String nomeColaborador) {
		return this.dao.getColaboradores(nomeColaborador);
	}

	public Colaborador getColaboradorById(Integer id) {
		if (id == null)
			throw new ProfisioException(ProfisioBundleUtil.NO_OBJECT_SELECTED);
		return this.dao.getColaboradorById(id);
	}

	public void cadastrarColaborador(Colaborador colaborador) {
		if (colaborador == null)
			throw new ProfisioException(ProfisioBundleUtil.NO_OBJECT_SELECTED);
		if (colaborador.getNome() == null || colaborador.getNome().equals(""))
			throw new ProfisioException(ProfisioBundleUtil.NOME_OBRIGATORIO);
		if (colaborador.getLogin() == null || colaborador.getLogin().equals(""))
			throw new ProfisioException(ProfisioBundleUtil.LOGIN_OBRIGATORIO);
		if (colaborador.getSenha() == null || colaborador.getSenha().equals(""))
			throw new ProfisioException(ProfisioBundleUtil.SENHA_OBRIGATORIA);
		if (this.checkLoginExiste(colaborador))
			throw new ProfisioException(ProfisioBundleUtil.LOGIN_JA_EXISTE);

		colaborador.setStatusObjeto(StatusObjeto.ATIVO);
		SystemUtils.gerarNiver(colaborador);
		this.dao.cadastrar(colaborador);
	}

	private boolean checkLoginExiste(Colaborador colaborador) {
		return UsuarioControl.getInstance().checkLoginExiste(colaborador.getLogin());
	}

	public void editarColaborador(Colaborador colaborador) {
		SystemUtils.assertObjectIsNotNullHasId(colaborador);
		if (colaborador == null)
			throw new ProfisioException(ProfisioBundleUtil.NO_OBJECT_SELECTED);
		if (colaborador.getNome() == null || colaborador.getNome().equals(""))
			throw new ProfisioException(ProfisioBundleUtil.NOME_OBRIGATORIO);

		colaborador.setStatusObjeto(StatusObjeto.ATIVO);
		SystemUtils.gerarNiver(colaborador);
		this.dao.editar(colaborador);
	}

	public void removerColaborador(Colaborador colaborador) {
		SystemUtils.assertObjectIsNotNullHasId(colaborador);
		colaborador = this.dao.getColaboradorById(colaborador.getId());
		colaborador.setStatusObjeto(StatusObjeto.MORTO);
		this.dao.editar(colaborador);
	}

	public void removerContrato(Contrato contrato) {
		SystemUtils.assertObjectIsNotNullHasId(contrato);
		contrato = this.dao.getContratoById(contrato.getId());
		contrato.setStatusObjeto(StatusObjeto.MORTO);
		this.dao.editar(contrato);
	}

	public void cadastrarContrato(Contrato contrato) {
		if (contrato == null)
			throw new ProfisioException(ProfisioBundleUtil.NO_OBJECT_SELECTED);
		if (contrato.getColaborador() == null || contrato.getColaborador().getId() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_COLABORADOR);
		if (contrato.getServico() == null || contrato.getServico().getId() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_SERVICO);

		contrato.setStatusObjeto(StatusObjeto.ATIVO);
		this.dao.cadastrar(contrato);
	}

	public void editarContrato(Contrato contrato) {
		SystemUtils.assertObjectIsNotNullHasId(contrato);
		double percentual = contrato.getPercentual();
		contrato = this.dao.getContratoById(contrato.getId());
		contrato.setPercentual(percentual);
		this.dao.editar(contrato);
	}

	public Collection<Contrato> getContratosByColaborador(Colaborador colaborador) {
		SystemUtils.assertObjectIsNotNullHasId(colaborador);
		return this.dao.getContratosByColaborador(colaborador);
	}

	public Collection<Contrato> getContratosByServico(Servico servico) {
		SystemUtils.assertObjectIsNotNullHasId(servico);
		return this.dao.getContratosByServico(servico);
	}

	public void alterarSenha(Colaborador colaborador) {
		SystemUtils.assertObjectIsNotNullHasId(colaborador);
		if (colaborador.getSenha() == null || colaborador.getSenha().equals(""))
			throw new ProfisioException(ProfisioBundleUtil.SENHA_OBRIGATORIA);
		String senha = colaborador.getSenha();
		Usuario userBD = this.dao.getUsuarioById(colaborador.getId());
		userBD.setSenha(senha);
		this.dao.editar(userBD);
	}

	public Contrato getContratoByColaboradorServico(Colaborador colaborador, Servico servico) {
		SystemUtils.assertObjectIsNotNullHasId(colaborador);
		SystemUtils.assertObjectIsNotNullHasId(servico);
		Contrato contrato = this.dao.getContratoByColaboradorServico(colaborador, servico);
		return contrato;
	}
}
