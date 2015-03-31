package br.com.profisio.bi;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.com.profisio.basics.Cadastro;
import br.com.profisio.basics.CentroCusto;
import br.com.profisio.basics.Endereco;
import br.com.profisio.basics.FormaConhecimento;
import br.com.profisio.basics.Servico;
import br.com.profisio.basics.TipoContaPagar;
import br.com.profisio.basics.enums.EstadoCivil;
import br.com.profisio.basics.enums.Sexo;
import br.com.profisio.basics.enums.TipoCusto;
import br.com.profisio.util.DAOBase;
import br.com.profisio.util.Tenant;

public class BIDAO extends DAOBase {

	public BIDAO() {
	}

	public static Object daoFactory() {
		return DAOBase.DAOFactory(BIDAO.class);
	}

	@SuppressWarnings("unchecked")
	public Integer getQtdNovosCadastros(Tenant tenant, Date dataInicial, Date dataFinal, String nome) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("midia", nome);
		return ((Long) this.imp.queryObject("getQtdCadastrosByMidia", params)).intValue();
	}

	@SuppressWarnings("unchecked")
	public Collection<FormaConhecimento> getAllMidiasOrderQtdCadastros(Tenant tenant, Date dataInicial, Date dataFinal) {
		Collection<FormaConhecimento> retorno = new ArrayList<FormaConhecimento>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		Collection<Cadastro> cadastros = this.imp.createNamedQuery("getAllMidiasOrderQtdCadastros", params).list();
		if (cadastros != null && cadastros.size() > 0) {
			for (Cadastro cadastro : cadastros) {
				retorno.add(new FormaConhecimento(cadastro.getConhecimentoStudio()));
			}
		}
		return retorno;
	}

	@SuppressWarnings("unchecked")
	public Collection<String> getBairrosOrderByQtdCadastros(Tenant tenant, Date dataInicial, Date dataFinal) {
		Collection<String> retorno = new ArrayList<String>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		List<Endereco> enderecos = this.imp.createNamedQuery("getBairrosOrderByQtdCadastrosAtivos", params).list();
		if (enderecos != null && enderecos.size() > 0) {
			for (Endereco ende : enderecos) {
				retorno.add(ende.getBairro());
			}
		}
		return retorno;
	}

	@SuppressWarnings("unchecked")
	public Integer getQtdCadastrosAtivosByBairro(Tenant tenant, Date dataInicial, Date dataFinal, String bairro) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("bairro", bairro);
		return ((BigInteger) this.imp.queryObject("getQtdCadastrosAtivosByBairro", params)).intValue();
	}

	@SuppressWarnings("unchecked")
	public Integer getQtdCadastrosAtivosBySexo(Tenant tenant, Date dataInicial, Date dataFinal, Sexo sexo) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("sexo", sexo.getValue());
		return ((BigInteger) this.imp.queryObject("getQtdCadastrosAtivosBySexo", params)).intValue();
	}

	@SuppressWarnings("unchecked")
	public Integer getQtdCadastrosAtivosByEstadoCivil(Tenant tenant, Date dataInicial, Date dataFinal, EstadoCivil estado) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("estadoCivil", estado.getValue());
		return ((BigInteger) this.imp.queryObject("getQtdCadastrosAtivosByEstadoCivil", params)).intValue();
	}

	@SuppressWarnings("unchecked")
	public Integer getQtdCadastrosAtivosByFaixaEtaria(Tenant tenant, Date dataInicial, Date dataFinal, Date dataMin, Date dataMax) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("dataMin", dataMax);
		params.put("dataMax", dataMax);
		Calendar cal = Calendar.getInstance();
		if (dataMin != null) {
			cal.setTime(dataMin);
			params.put("dataMin", cal.get(Calendar.YEAR));
		}
		if (dataMax != null) {
			cal.setTime(dataMax);
			params.put("dataMax", cal.get(Calendar.YEAR));
		}
		return ((BigInteger) this.imp.queryObject("getQtdCadastrosAtivosByFaixaEtaria", params)).intValue();
	}

	@SuppressWarnings("unchecked")
	public Integer getQtdCadastrosByServico(Tenant tenant, Date dataInicial, Date dataFinal, Servico servico) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("servico", servico);
		Object resultado = this.imp.queryObject("getQtdCadastrosByServico", params);
		if (resultado == null)
			resultado = new Long(0);
		return ((Long) resultado).intValue();
	}

	@SuppressWarnings("unchecked")
	public Double getSomaFaturamentoByServico(Tenant tenant, Date dataInicial, Date dataFinal, Servico servico) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("servico", servico);
		Object resultado = this.imp.queryObject("getSomaFaturamentoByServico", params);
		if (resultado == null)
			resultado = new Double(0);
		return ((Double) resultado);
	}

	@SuppressWarnings("unchecked")
	public Double getSomaCustoByCentroCusto(Tenant tenant, Date dataInicial, Date dataFinal, CentroCusto centro) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("centro", centro);
		Object resultado = this.imp.queryObject("getSomaCustoByCentroCusto", params);
		if (resultado == null)
			resultado = new Double(0);
		return ((Double) resultado);
	}

	@SuppressWarnings("unchecked")
	public Integer getQtdAtendimentosServico(Tenant tenant, Date dataInicial, Date dataFinal, Servico servico) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("servico", servico);
		Object resultado = this.imp.queryObject("getQtdAtendimentosServico", params);
		if (resultado == null)
			resultado = new Long(0);
		return ((BigInteger) resultado).intValue();
	}

	@SuppressWarnings("unchecked")
	public Double getSomaCustosByTipo(Tenant tenant, Date dataInicial, Date dataFinal, TipoContaPagar tipo) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("tipo", tipo);
		Object resultado = this.imp.queryObject("getSomaCustosByTipo", params);
		if (resultado == null)
			resultado = new Double(0);
		return ((Double) resultado);
	}

	@SuppressWarnings("unchecked")
	public Collection<TipoContaPagar> getAllTiposContaPagarByTipoCusto(Tenant tenant, TipoCusto tipoCusto) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("tipoCusto", tipoCusto);
		return this.imp.createNamedQuery("getAllTiposContaPagarByTipoCusto", params).list();
	}

	@SuppressWarnings("unchecked")
	public Double getSomaFaturamentoVendas(Tenant tenant, Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		Object resultado = this.imp.queryObject("getSomaVendas", params);
		if (resultado == null)
			resultado = new Double(0);
		return ((Double) resultado);
	}

	@SuppressWarnings("unchecked")
	public Double getSomaFaturamentoAvulso(Tenant tenant, Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		Object resultado = this.imp.queryObject("getSomaFaturamentoAvulso", params);
		if (resultado == null)
			resultado = new Double(0);
		return ((Double) resultado);
	}

	@SuppressWarnings("unchecked")
	public Integer getQtdFrequenciasByServico(Tenant tenant, Date dataInicial, Date dataFinal, Servico servico) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant.getId().intValue());
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("servico", servico.getId().intValue());
		Object resultado = this.imp.queryObject("getQtdFrequenciasByServico", params);
		if (resultado == null)
			resultado = new Long(0);
		return ((BigInteger) resultado).intValue();
	}

}
