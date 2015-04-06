package br.com.profisio.frequencia;

import java.util.Collection;
import java.util.Date;

import br.com.profisio.basics.Cadastro;
import br.com.profisio.basics.Frequencia;
import br.com.profisio.util.ProfisioActionSupport;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.ProfisioSessionUtil;
import br.com.profisio.util.SystemUtils;
import br.com.profisio.util.Tenant;

public class FrequenciaView extends ProfisioActionSupport {

	private static final long serialVersionUID = 4742339788981156278L;

	private final FrequenciaControl controller;

	private Collection<Frequencia> frequencias;
	private Frequencia frequencia;
	private Date dataInicial, dataFinal;
	private Cadastro cadastro;

	public FrequenciaView() {
		controller = FrequenciaControl.getInstance();
	}

	public String actionCadastrarFrequencia() {
		try {
			
			controller.cadastrarFrequencia(getTenant(), frequencia);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionRemoverFrequencia() {
		String resposta = REDIRECT;
		try {
			
			controller.remover(getTenant(), frequencia);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		if (this.cadastro != null && this.cadastro.getId() != null)
			resposta = "redirect_cadastro";
		return resposta;
	}

	public String actionFrequencia() {
		try {
			
			this.frequencias = controller.getFrequencias(getTenant(), dataInicial, dataFinal);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public Date getDataInicial() {
		return dataInicial;
	}

	public void setDataInicial(Date dataInicial) {
		this.dataInicial = dataInicial;
	}

	public Date getDataFinal() {
		return dataFinal;
	}

	public void setDataFinal(Date dataFinal) {
		this.dataFinal = dataFinal;
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

	public Collection<Frequencia> getFrequencias() {
		return frequencias;
	}

	public void setFrequencias(Collection<Frequencia> frequencias) {
		this.frequencias = frequencias;
	}

	public Frequencia getFrequencia() {
		return frequencia;
	}

	public void setFrequencia(Frequencia frequencia) {
		this.frequencia = frequencia;
	}

	public Cadastro getCadastro() {
		return cadastro;
	}

	public void setCadastro(Cadastro cadastro) {
		this.cadastro = cadastro;
	}

}
