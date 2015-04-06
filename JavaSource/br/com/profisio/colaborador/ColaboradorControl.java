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
import br.com.profisio.util.Tenant;

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

	public Collection<Colaborador> getProximosAniversariantes(Tenant tenant) {
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
		return this.dao.getProximosAniversariantes(tenant, mesAtual, mesProximo);
	}

	public Collection<Colaborador> getColaboradores(Tenant tenant, String nomeColaborador) {
		return this.dao.getColaboradores(tenant, nomeColaborador);
	}

	public Colaborador getColaboradorById(Tenant tenant, Integer id) {
		if (id == null)
			throw new ProfisioException(ProfisioBundleUtil.NO_OBJECT_SELECTED);
		Colaborador colaborador = this.dao.getColaboradorById(id);
		SystemUtils.assertObjectIsFromTenant(tenant, colaborador);
		return colaborador;
	}

	public void cadastrarColaborador(Tenant tenant, Colaborador colaborador) {
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
		colaborador.setTenant(tenant);
		this.dao.cadastrar(colaborador);
	}

	private boolean checkLoginExiste(Colaborador colaborador) {
		return UsuarioControl.getInstance().checkLoginExiste(colaborador.getLogin());
	}

	public void editarColaborador(Tenant tenant, Colaborador colaborador) {
		SystemUtils.assertObjectIsNotNullHasId(colaborador);
		if (colaborador == null)
			throw new ProfisioException(ProfisioBundleUtil.NO_OBJECT_SELECTED);
		if (colaborador.getNome() == null || colaborador.getNome().equals(""))
			throw new ProfisioException(ProfisioBundleUtil.NOME_OBRIGATORIO);

		colaborador.setStatusObjeto(StatusObjeto.ATIVO);
		SystemUtils.gerarNiver(colaborador);
		colaborador.setTenant(tenant);
		this.dao.editar(colaborador);
	}

	public void removerColaborador(Tenant tenant, Colaborador colaborador) {
		SystemUtils.assertObjectIsNotNullHasId(colaborador);
		colaborador = this.dao.getColaboradorById(colaborador.getId());
		colaborador.setStatusObjeto(StatusObjeto.MORTO);
		colaborador.setTenant(tenant);
		this.dao.editar(colaborador);
	}

	public void removerContrato(Tenant tenant, Contrato contrato) {
		SystemUtils.assertObjectIsNotNullHasId(contrato);
		contrato = this.dao.getContratoById(contrato.getId());
		contrato.setStatusObjeto(StatusObjeto.MORTO);
		contrato.setTenant(tenant);
		this.dao.editar(contrato);
	}

	public void cadastrarContrato(Tenant tenant, Contrato contrato) {
		if (contrato == null)
			throw new ProfisioException(ProfisioBundleUtil.NO_OBJECT_SELECTED);
		if (contrato.getColaborador() == null || contrato.getColaborador().getId() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_COLABORADOR);
		if (contrato.getServico() == null || contrato.getServico().getId() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_SERVICO);

		contrato.setStatusObjeto(StatusObjeto.ATIVO);
		contrato.setTenant(tenant);
		this.dao.cadastrar(contrato);
	}

	public void editarContrato(Tenant tenant, Contrato contrato) {
		SystemUtils.assertObjectIsNotNullHasId(contrato);
		double percentual = contrato.getPercentual();
		contrato = this.dao.getContratoById(contrato.getId());
		contrato.setPercentual(percentual);
		contrato.setTenant(tenant);
		this.dao.editar(contrato);
	}

	public Collection<Contrato> getContratosByColaborador(Tenant tenant, Colaborador colaborador) {
		SystemUtils.assertObjectIsNotNullHasId(colaborador);
		colaborador = this.dao.getColaboradorById(colaborador.getId());
		SystemUtils.assertObjectIsFromTenant(tenant, colaborador);
		return this.dao.getContratosByColaborador(colaborador);
	}

	public Collection<Contrato> getContratosByServico(Tenant tenant, Servico servico) {
		SystemUtils.assertObjectIsNotNullHasId(servico);
		servico = this.dao.getServicoById(servico.getId());
		SystemUtils.assertObjectIsFromTenant(tenant, servico);
		return this.dao.getContratosByServico(servico);
	}

	public void alterarSenha(Tenant tenant, Colaborador colaborador) {
		SystemUtils.assertObjectIsNotNullHasId(colaborador);
		if (colaborador.getSenha() == null || colaborador.getSenha().equals(""))
			throw new ProfisioException(ProfisioBundleUtil.SENHA_OBRIGATORIA);
		String senha = colaborador.getSenha();
		Usuario userBD = this.dao.getUsuarioById(colaborador.getId());
		userBD.setSenha(senha);
		userBD.setTenant(tenant);
		this.dao.editar(userBD);
	}

	public Contrato getContratoByColaboradorServico(Tenant tenant, Colaborador colaborador, Servico servico) {
		SystemUtils.assertObjectIsNotNullHasId(colaborador);
		SystemUtils.assertObjectIsNotNullHasId(servico);
		servico = this.dao.getServicoById(servico.getId());
		SystemUtils.assertObjectIsFromTenant(tenant, servico);
		colaborador = this.dao.getColaboradorById(colaborador.getId());
		SystemUtils.assertObjectIsFromTenant(tenant, colaborador);
		Contrato contrato = this.dao.getContratoByColaboradorServico(colaborador, servico);
		return contrato;
	}
}
