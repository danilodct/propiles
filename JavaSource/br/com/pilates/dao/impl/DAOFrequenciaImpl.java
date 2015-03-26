package br.com.pilates.dao.impl;

import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import br.com.pilates.base.Cliente;
import br.com.pilates.base.Frequencia;
import br.com.pilates.base.Professor;
import br.com.pilates.base.Servico;
import br.com.pilates.base.enums.EstadoCivil;
import br.com.pilates.base.enums.Sexo;
import br.com.pilates.dao.DAOFrequencia;

public class DAOFrequenciaImpl extends HibernateDAO<Frequencia> implements DAOFrequencia {

	@Override
	public Collection<Frequencia> getFrequenciasByData(Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		return this.list("getFrequenciasByData", params);
	}

	@Override
	public Collection<Frequencia> getFrequenciasByCliente(Cliente cliente) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cliente", cliente);
		// antes estava limitado a 60. nao sei pq!!
		return this.list("getFrequenciasByCliente", params);
	}

	@Override
	public Collection<Frequencia> getFrequenciasByDataProfessor(Date dataInicial, Date dataFinal, Professor professor, String ordenacao) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("professor", professor);
		if (ordenacao == null) {
			ordenacao = "data";
		}
		return this.list("getFrequenciasByDataProfessor", params, ordenacao);
	}

	@Override
	public Collection<Frequencia> getFrequenciasByDataModalidadeSexoBairroEstadocivilFaixaetariaProfessorOrdenacao(Date dataInicial, Date dataFinal, Servico servico, Sexo sexo, String bairro, EstadoCivil estado, int idadeMinima, int idadeMaxima, Professor prof, String ordenacao) {
		Map<String, Object> params = new HashMap<String, Object>();
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.AM_PM, Calendar.AM);
		if (dataInicial != null) {
			calendar.setTime(dataInicial);
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			dataInicial = calendar.getTime();
		}
		params.put("dataInicial", dataInicial);

		if (dataFinal != null) {
			calendar.setTime(dataFinal);
			calendar.set(Calendar.AM_PM, Calendar.PM);
			calendar.set(Calendar.HOUR, 11);
			calendar.set(Calendar.MINUTE, 59);
			calendar.set(Calendar.SECOND, 59);
			dataFinal = calendar.getTime();
		}
		params.put("dataFinal", dataFinal);
		params.put("servico", servico);
		params.put("profissional", prof);
		if (bairro != null && bairro.equals(""))
			bairro = null;
		params.put("bairro", bairro);
		params.put("estado", estado);
		if (estado != null)
			params.put("estado", estado.getValue());
		params.put("sexo", sexo);
		if (sexo != null)
			params.put("sexo", sexo.getValue());
		if (idadeMaxima != -1) {
			params.put("faixaMinima", calendar.get(Calendar.YEAR) - idadeMaxima);
		} else
			params.put("faixaMinima", -1);
		if (idadeMinima != -1) {
			params.put("faixaMaxima", calendar.get(Calendar.YEAR) - idadeMinima);
		} else
			params.put("faixaMaxima", -1);
		if (ordenacao == null || ordenacao.equals("")) {
			ordenacao = "fre";
		}
		return this.list("getFrequenciasByDataModalidadeSexoBairroEstadocivilFaixaetariaProfessorOrdenacao", params, ordenacao);
	}

	@Override
	public Collection<Frequencia> getFrequenciasByCliente(Cliente cli, Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("cliente", cli);
		return this.list("getFrequenciasByClienteData", params);
	}

}
