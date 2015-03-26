package br.com.pilates.actions;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Cliente;
import br.com.pilates.base.Frequencia;
import br.com.pilates.fachada.IProxy;
import br.com.pilates.fachada.Proxy;
import br.com.pilates.util.PilatesBundleUtil;
import br.com.pilates.util.SystemUtils;

@SuppressWarnings("serial")
public class FrequenciaAction extends PilatesActionSupport {

	private final IProxy proxy;

	private Collection<Frequencia> frequencias;
	private Frequencia frequencia;
	private Cliente cliente;

	private Date dataInicial, dataFinal;

	private String pesquisa;
	private String param;

	public FrequenciaAction() {
		proxy = Proxy.getInstance();
	}

	public String action_addFrequencia() {
		try {
			this.proxy.addFrequencia(this.frequencia);
			this.addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String action_removerFrequencia() {
		String resposta = REDIRECT;
		try {
			this.proxy.removerFrequencia(this.frequencia);
			this.addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.REMOCAO_SUCESSO));
			if (this.cliente != null) {
				resposta = "redirect_cliente";
			}
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return resposta;
	}

	public String action_frequencia() {
		try {
			this.frequencias = this.proxy.getFrequencias(dataInicial, dataFinal);
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public Collection<Frequencia> getFrequencias() {
		return frequencias;
	}

	public void setFrequencias(Collection<Frequencia> frequencias) {
		this.frequencias = frequencias;
	}

	public String getPesquisa() {
		return pesquisa;
	}

	public void setPesquisa(String pesquisa) {
		this.pesquisa = pesquisa;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

	public IProxy getProxy() {
		return proxy;
	}

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

	public Frequencia getFrequencia() {
		return frequencia;
	}

	public void setFrequencia(Frequencia frequencia) {
		this.frequencia = frequencia;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

}
