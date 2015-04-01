package br.com.profisio.servico;

import java.util.Collection;

import br.com.profisio.basics.CentroCusto;
import br.com.profisio.basics.Servico;
import br.com.profisio.basics.enums.StatusObjeto;
import br.com.profisio.util.ControllerBase;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.ProfisioException;
import br.com.profisio.util.SystemUtils;
import br.com.profisio.util.Tenant;

public class ServicoControl extends ControllerBase {

	private static ServicoControl instance = null;
	private ServicoDAO dao = null;

	private ServicoControl() {
		dao = (ServicoDAO) ServicoDAO.daoFactory();
	}

	public static ServicoControl getInstance() {
		if (instance == null)
			instance = new ServicoControl();
		return instance;
	}

	public Collection<Servico> getServicos(Tenant tenant, CentroCusto centroCusto) {
		return this.dao.getServicos(tenant, centroCusto);
	}

	public void cadastrarServico(Tenant tenant, Servico servico) {
		SystemUtils.assertObjectIsNotNull(servico);
		if (servico.getNome() == null || servico.getNome().equalsIgnoreCase(""))
			throw new ProfisioException(ProfisioBundleUtil.NOME_OBRIGATORIO);

		if (servico.getCentroCusto() != null && (servico.getCentroCusto().getId() == null || servico.getCentroCusto().getId().intValue() == -1))
			servico.setCentroCusto(null);

		servico.setTenant(tenant);
		this.dao.cadastrar(servico);
	}

	public void removerServico(Tenant tenant, Servico servico) {
		SystemUtils.assertObjectIsNotNullHasId(servico);
		servico = this.dao.getServicoById(servico.getId());
		SystemUtils.assertObjectIsFromTenant(tenant, servico);
		this.dao.remover(servico);
	}

	public Servico getServico(Tenant tenant, Servico servico) {
		SystemUtils.assertObjectIsNotNullHasId(servico);
		servico = this.dao.getServicoById(servico.getId());
		SystemUtils.assertObjectIsFromTenant(tenant, servico);
		return servico;
	}

	public void editarServico(Tenant tenant, Servico servico) {
		SystemUtils.assertObjectIsNotNullHasId(servico);
		if (servico.getCentroCusto() != null && (servico.getCentroCusto().getId() == null || servico.getCentroCusto().getId().intValue() == -1))
			servico.setCentroCusto(null);
		servico.setTenant(tenant);
		this.dao.editar(servico);
	}

	public Collection<CentroCusto> getCentrosCusto(Tenant tenant) {
		return this.dao.getCentrosCusto(tenant);
	}

	public void editarCentroCusto(Tenant tenant, CentroCusto centroCusto) {
		SystemUtils.assertObjectIsNotNullHasId(centroCusto);
		String nome = centroCusto.getNome();
		centroCusto = this.dao.getCentroCustoById(centroCusto.getId());
		centroCusto.setNome(nome);
		centroCusto.setStatusObjeto(StatusObjeto.ATIVO);
		centroCusto.setTenant(tenant);
		this.dao.editar(centroCusto);
	}

	public void removerCentroCusto(Tenant tenant, CentroCusto centroCusto) {
		SystemUtils.assertObjectIsNotNullHasId(centroCusto);
		centroCusto = this.dao.getCentroCustoById(centroCusto.getId());
		SystemUtils.assertObjectIsFromTenant(tenant, centroCusto);
		centroCusto.setStatusObjeto(StatusObjeto.MORTO);
		this.dao.editar(centroCusto);
	}

	public void cadastrarCentroCusto(Tenant tenant, CentroCusto centroCusto) {
		SystemUtils.assertObjectIsNotNull(centroCusto);
		if (centroCusto.getNome() == null || centroCusto.getNome().equalsIgnoreCase(""))
			throw new ProfisioException(ProfisioBundleUtil.NOME_OBRIGATORIO);
		centroCusto.setTenant(tenant);
		centroCusto.setStatusObjeto(StatusObjeto.ATIVO);
		this.dao.cadastrar(centroCusto);
	}

}
