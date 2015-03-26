package br.com.profisio.servico;

import java.util.Collection;

import br.com.profisio.basics.CentroCusto;
import br.com.profisio.basics.Servico;
import br.com.profisio.util.ProfisioActionSupport;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.ProfisioException;
import br.com.profisio.util.ProfisioSessionUtil;
import br.com.profisio.util.Tenant;

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
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.controller.editarCentroCusto(tenant, this.centroCusto);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionRemoverCentroCusto() {
		try {
			this.controller.removerCentroCusto(this.centroCusto);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionCadastrarCentroCusto() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.controller.cadastrarCentroCusto(tenant, this.centroCusto);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionCentrosCusto() {
		try {
			// não precisa fazer nada pq no get ele ja vai chamar o metodo q
			// chama a funcao
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionEditarServico() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.controller.editarServico(tenant, this.servico);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionServico() {
		try {
			this.servico = this.controller.getServico(this.servico);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionRemoverServico() {
		try {
			this.controller.removerServico(this.servico);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionCadastrarServico() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.controller.cadastrarServico(tenant, this.servico);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionServicos() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.servicos = this.controller.getServicos(tenant, null);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public Collection<CentroCusto> getCentrosCusto() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.centrosCusto = this.controller.getCentrosCusto(tenant);
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
