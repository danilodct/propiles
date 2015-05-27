package br.com.profisio.servico;

import java.util.Collection;

import br.com.profisio.basics.CentroCusto;
import br.com.profisio.basics.Servico;
import br.com.profisio.util.ProfisioActionSupport;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.ProfisioException;
import br.com.profisio.util.ProfisioLoggerUtil;

public class ServicoView extends ProfisioActionSupport {

	private static final long serialVersionUID = 4742339788981156278L;

	private final ServicoControl controller;

	private Collection<Servico> servicos;
	private Collection<CentroCusto> centrosCusto;
	private Servico servico;
	private CentroCusto centroCusto;

	public ServicoView() {
		controller = ServicoControl.getInstance();
	}

	public String actionEditarCentroCusto() {
		ProfisioLoggerUtil.info("ServicoView.actionEditarCentroCusto()");
		try {

			this.controller.editarCentroCusto(getTenant(), this.centroCusto);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionRemoverCentroCusto() {
		ProfisioLoggerUtil.info("ServicoView.actionRemoverCentroCusto()");
		try {

			this.controller.removerCentroCusto(getTenant(), this.centroCusto);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionCadastrarCentroCusto() {
		ProfisioLoggerUtil.info("ServicoView.actionCadastrarCentroCusto()");
		try {

			this.controller.cadastrarCentroCusto(getTenant(), this.centroCusto);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionCentrosCusto() {
		ProfisioLoggerUtil.info("ServicoView.actionCentrosCusto()");
		try {
			// não precisa fazer nada pq no get ele ja vai chamar o metodo q
			// chama a funcao
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionEditarServico() {
		ProfisioLoggerUtil.info("ServicoView.actionEditarServico()");
		try {

			this.controller.editarServico(getTenant(), this.servico);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionServico() {
		ProfisioLoggerUtil.info("ServicoView.actionServico()");
		try {
			this.servico = this.controller.getServico(getTenant(), this.servico);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionRemoverServico() {
		ProfisioLoggerUtil.info("ServicoView.actionRemoverServico()");
		try {
			this.controller.removerServico(getTenant(), this.servico);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionCadastrarServico() {
		ProfisioLoggerUtil.info("ServicoView.actionCadastrarServico()");
		try {

			this.controller.cadastrarServico(getTenant(), this.servico);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionServicos() {
		ProfisioLoggerUtil.info("ServicoView.actionServicos()");
		try {

			this.servicos = this.controller.getServicos(getTenant(), null);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public Collection<CentroCusto> getCentrosCusto() {
		ProfisioLoggerUtil.info("ServicoView.getCentrosCusto()");
		try {

			this.centrosCusto = this.controller.getCentrosCusto(getTenant());
		} catch (Exception e) {
			if (!(e instanceof ProfisioException))
				e.printStackTrace();
		}
		return this.centrosCusto;
	}

	// 888888888888888888888888888888888888888888888888888888888

	public Collection<Servico> getServicos() {
		return servicos;
	}

	public void setServicos(Collection<Servico> servicos) {
		this.servicos = servicos;
	}

	public Servico getServico() {
		return servico;
	}

	public void setServico(Servico servico) {
		this.servico = servico;
	}

	public CentroCusto getCentroCusto() {
		return centroCusto;
	}

	public void setCentroCusto(CentroCusto centroCusto) {
		this.centroCusto = centroCusto;
	}

	public void setCentrosCusto(Collection<CentroCusto> centrosCusto) {
		this.centrosCusto = centrosCusto;
	}

}
