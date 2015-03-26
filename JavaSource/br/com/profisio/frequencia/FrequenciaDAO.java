package br.com.profisio.frequencia;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import br.com.profisio.basics.Colaborador;
import br.com.profisio.basics.ContaReceber;
import br.com.profisio.basics.Frequencia;
import br.com.profisio.util.DAOBase;
import br.com.profisio.util.Tenant;

public class FrequenciaDAO extends DAOBase {

	public FrequenciaDAO() {
	}

	public static Object daoFactory() {
		return DAOBase.DAOFactory(FrequenciaDAO.class);
	}

	@SuppressWarnings("unchecked")
	public Collection<Frequencia> getFrequencias(Tenant tenant, Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		return imp.createNamedQuery("getFrequenciasByPeriodo", params).list();
	}

	@SuppressWarnings("unchecked")
	public void delete(Frequencia frequencia) {
		imp.delete(frequencia);
	}

	@SuppressWarnings("unchecked")
	public void cadastar(Frequencia frequencia) {
		this.imp.insert(frequencia);
	}

	@SuppressWarnings("unchecked")
	public Integer getQtdFrequenciasByPagamento(ContaReceber contaReceber) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("contaReceber", contaReceber);
		return ((Long) imp.queryObject("getQtdFrequenciasByPagamento", params)).intValue();
	}

	@SuppressWarnings("unchecked")
	public Collection<Frequencia> getFrequencias(Colaborador colab, Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("colaborador", colab);
		return imp.createNamedQuery("getFrequenciasByColaborador", params).list();
	}

}
