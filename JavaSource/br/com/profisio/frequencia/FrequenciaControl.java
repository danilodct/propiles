package br.com.profisio.frequencia;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;

import br.com.profisio.basics.Colaborador;
import br.com.profisio.basics.ContaReceber;
import br.com.profisio.basics.Frequencia;
import br.com.profisio.cadastro.CadastroControl;
import br.com.profisio.financeiro.FinanceiroControl;
import br.com.profisio.util.ControllerBase;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.ProfisioException;
import br.com.profisio.util.SystemUtils;
import br.com.profisio.util.Tenant;

public class FrequenciaControl extends ControllerBase {

	private static FrequenciaControl instance = null;
	private FrequenciaDAO dao = null;

	private FrequenciaControl() {
		dao = (FrequenciaDAO) FrequenciaDAO.daoFactory();
	}

	public static FrequenciaControl getInstance() {
		if (instance == null)
			instance = new FrequenciaControl();
		return instance;
	}

	public Collection<Frequencia> getFrequencias(Tenant tenant, Date dataInicial, Date dataFinal) {
		Calendar calendar = null;
		if (dataInicial == null && dataFinal == null) {
			calendar = GregorianCalendar.getInstance();
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			dataFinal = calendar.getTime();
			calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - 1);
			dataInicial = calendar.getTime();
		}
		calendar = GregorianCalendar.getInstance();
		if (dataInicial != null) {
			calendar.setTime(dataInicial);
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.AM_PM, Calendar.AM);
			dataInicial = calendar.getTime();
		}
		if (dataFinal != null) {
			calendar.setTime(dataFinal);
			calendar.set(Calendar.HOUR, 11);
			calendar.set(Calendar.MINUTE, 59);
			calendar.set(Calendar.AM_PM, Calendar.PM);
			dataFinal = calendar.getTime();
		}
		return this.dao.getFrequencias(tenant, dataInicial, dataFinal);
	}

	public void remover(Tenant tenant, Frequencia frequencia) {
		SystemUtils.assertObjectIsNotNullHasId(frequencia);
		frequencia = this.dao.getFrequenciaById(frequencia.getId());
		SystemUtils.assertObjectIsFromTenant(tenant, frequencia);
		this.dao.delete(frequencia);
	}

	public void cadastrarFrequencia(Tenant tenant, Frequencia frequencia) {
		SystemUtils.assertObjectIsNotNull(frequencia);
		if (frequencia.getData() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_DATA);
		if (frequencia.getAtividade() == null || frequencia.getAtividade().getId() == null || frequencia.getAtividade().getId().intValue() == -1)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_ATIVIDADE);

		if (frequencia.getContaReceber() != null && (frequencia.getContaReceber().getId() == null || frequencia.getContaReceber().getId().intValue() == -1))
			frequencia.setContaReceber(null);

		if (frequencia.getContaReceber() != null) {
			ContaReceber contaReceber = FinanceiroControl.getInstance().getContaReceber(tenant, frequencia.getContaReceber());
			if (contaReceber.getQtdSessoes() > 0) {
				Integer qtdFrequencias = this.dao.getQtdFrequenciasByPagamento(contaReceber);
				if (qtdFrequencias >= contaReceber.getQtdSessoes())
					throw new ProfisioException(ProfisioBundleUtil.QTD_MAX_SESSOES_ATINGIDAS_PAGAMENTO);
			}
		}

		if (frequencia.getColaborador() != null && (frequencia.getColaborador().getId() == null || frequencia.getColaborador().getId().intValue() == -1))
			frequencia.setColaborador(null);

		frequencia.setNovo(true);
		frequencia.setTenant(tenant);
		this.dao.cadastar(frequencia);
		CadastroControl.getInstance().setCadastroAtivoByFrequencia(frequencia);
	}

	public Integer getQtdFrequenciasByPagamento(Tenant tenant, ContaReceber conta) {
		SystemUtils.assertObjectIsNotNullHasId(conta);
		// já faz a checagem de posse do tenant
		conta = FinanceiroControl.getInstance().getContaReceber(tenant, conta);
		return this.dao.getQtdFrequenciasByPagamento(conta);
	}

	public Collection<Frequencia> getFrequencias(Tenant tenant, Colaborador colab, Date dataInicial, Date dataFinal) {
		Collection<Frequencia> retorno = new ArrayList<Frequencia>();
		if (colab != null)
			retorno = this.dao.getFrequencias(tenant, colab, dataInicial, dataFinal);
		return retorno;
	}

}
