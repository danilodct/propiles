package br.com.profisio.servico;

import java.util.Collection;

import br.com.profisio.basics.CentroCusto;
import br.com.profisio.basics.Servico;
import br.com.profisio.util.ControllerBase;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.ProfisioException;
import br.com.profisio.util.SystemUtils;

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

	public Collection<Servico> getServicos(CentroCusto centroCusto) {
		return this.dao.getServicos(centroCusto);
	}

	public void cadastrarServico(Servico servico) {
		SystemUtils.assertObjectIsNotNull(servico);
		if (servico.getNome() == null || servico.getNome().equalsIgnoreCase(""))
			throw new ProfisioException(ProfisioBundleUtil.NOME_OBRIGATORIO);
		if (servico.getCentroCusto() == null || servico.getCentroCusto().getId() == null || servico.getCentroCusto().getId().intValue() == -1)
			throw new ProfisioException(ProfisioBundleUtil.CENTRO_CUSTO_OBRIGATORIO);

		this.dao.cadastrar(servico);
	}

	public void removerServico(Servico servico) {
		SystemUtils.assertObjectIsNotNullHasId(servico);
		this.dao.remover(servico);
	}

	public Servico getServico(Servico servico) {
		SystemUtils.assertObjectIsNotNullHasId(servico);
		return this.dao.getServicoById(servico.getId());
	}

	public void editarServico(Servico servico) {
		SystemUtils.assertObjectIsNotNullHasId(servico);
		if (servico.getCentroCusto() != null && (servico.getCentroCusto().getId() == null || servico.getCentroCusto().getId().intValue() == -1))
			servico.setCentroCusto(null);
		this.dao.editar(servico);
	}

	public Collection<CentroCusto> getCentrosCusto() {
		return this.dao.getCentrosCusto();
	}

	public void editarCentroCusto(CentroCusto centroCusto) {
		SystemUtils.assertObjectIsNotNullHasId(centroCusto);
		String nome = centroCusto.getNome();
		centroCusto = this.dao.getCentroCustoById(centroCusto.getId());
		centroCusto.setNome(nome);
		this.dao.editar(centroCusto);
	}

	public void removerCentroCusto(CentroCusto centroCusto) {
		SystemUtils.assertObjectIsNotNullHasId(centroCusto);
		this.dao.remover(centroCusto);
	}

	public void cadastrarCentroCusto(CentroCusto centroCusto) {
		SystemUtils.assertObjectIsNotNull(centroCusto);
		if (centroCusto.getNome() == null || centroCusto.getNome().equalsIgnoreCase(""))
			throw new ProfisioException(ProfisioBundleUtil.NOME_OBRIGATORIO);
		this.dao.cadastrar(centroCusto);
	}

}
