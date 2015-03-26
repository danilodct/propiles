package br.com.profisio.bi;

import java.util.Collection;
import java.util.Date;

import br.com.profisio.basics.FormaConhecimento;
import br.com.profisio.basics.Servico;
import br.com.profisio.basics.enums.TipoCusto;
import br.com.profisio.cadastro.CadastroControl;
import br.com.profisio.util.ProfisioActionSupport;
import br.com.profisio.util.ProfisioSessionUtil;
import br.com.profisio.util.SystemUtils;
import br.com.profisio.util.Tenant;

public class BIView extends ProfisioActionSupport {

	private static final long serialVersionUID = 4742339788981156278L;

	private final BIControl controller;

	private Date dataInicial, dataFinal;
	private String midia, dados1, dados2, dados3, dados4;
	private Servico servico;

	public BIView() {
		controller = BIControl.getInstance();
	}

	public String actionEntradas() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.dados1 = this.controller.getBIEvolutivoEntradas(tenant, dataInicial, dataFinal);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionEvolutivoDespesas() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.dados1 = this.controller.getBIEvolutivoDespesas(tenant, dataInicial, dataFinal);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionCrescimentoServicos() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.dados1 = this.controller.getBICrescimentoServico(tenant, dataInicial, dataFinal, servico);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionDespesas() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.dados1 = this.controller.getBITiposCustoCustosos(tenant, dataInicial, dataFinal, TipoCusto.FIXO);
			this.dados2 = this.controller.getBITiposCustoCustosos(tenant, dataInicial, dataFinal, TipoCusto.VARIAVEL);
			this.dados3 = this.controller.getBICentrosCustoCustosos(tenant, dataInicial, dataFinal);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionVisaoGeralServicos() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.dados1 = this.controller.getBIServicosRequisitados(tenant, dataInicial, dataFinal);
			this.dados2 = this.controller.getBIServicosFaturamento(tenant, dataInicial, dataFinal);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionEfetividade() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.dados1 = this.controller.getBITaxaEfetividade(tenant, dataInicial, dataFinal);
			this.dados2 = this.controller.getBIAtivos(tenant, dataInicial, dataFinal);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionPerfilClientes() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.dados1 = this.controller.getBICadastrosByBairro(tenant, dataInicial, dataFinal);
			this.dados2 = this.controller.getBICadastrosBySexo(tenant, dataInicial, dataFinal);
			this.dados3 = this.controller.getBICadastrosByEstadoCivil(tenant, dataInicial, dataFinal);
			this.dados4 = this.controller.getBICadastrosByFaixaEtaria(tenant, dataInicial, dataFinal);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionCaptacao() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			if (this.midia == null || this.midia != null && (this.midia.equals("") || this.midia.equals("-1")))
				this.dados1 = this.controller.getBIUsoMidias(tenant, dataInicial, dataFinal);
			else
				this.dados2 = this.controller.getBIEvolucaoMidiaCadastros(tenant, dataInicial, dataFinal, midia);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	// 8888888888888888888888888888888888888888888888888888888888

	public Collection<FormaConhecimento> getAllMidias() {
		Tenant tenant = ProfisioSessionUtil.getTenantSession();
		Collection<FormaConhecimento> formas = CadastroControl.getInstance().getAllFormasConhecimento(tenant);
		return formas;
	}

	// 8888888888888888888888888888888888888888888888888888888888

	public String getDataInicialStr() {
		return SystemUtils.parseDataToString(dataInicial);
	}

	public void setDataInicialStr(String dataInicial) {
		this.dataInicial = SystemUtils.parseStringToDate(dataInicial);
	}

	public String getDataFinalStr() {
		return SystemUtils.parseDataToString(dataFinal);
	}

	public void setDataFinalStr(String dataFinal) {
		this.dataFinal = SystemUtils.parseStringToDate(dataFinal);
	}

	public String getDados1() {
		return dados1;
	}

	public void setDados1(String dados1) {
		this.dados1 = dados1;
	}

	public String getDados2() {
		return dados2;
	}

	public void setDados2(String dados2) {
		this.dados2 = dados2;
	}

	public String getDados3() {
		return dados3;
	}

	public void setDados3(String dados3) {
		this.dados3 = dados3;
	}

	public String getMidia() {
		return midia;
	}

	public void setMidia(String midia) {
		this.midia = midia;
	}

	public String getDados4() {
		return dados4;
	}

	public void setDados4(String dados4) {
		this.dados4 = dados4;
	}

	public Servico getServico() {
		return servico;
	}

	public void setServico(Servico servico) {
		this.servico = servico;
	}

}
