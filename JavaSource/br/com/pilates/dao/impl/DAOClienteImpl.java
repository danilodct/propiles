package br.com.pilates.dao.impl;

import java.math.BigInteger;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import br.com.pilates.base.Cliente;
import br.com.pilates.base.Servico;
import br.com.pilates.base.Usuario;
import br.com.pilates.base.enums.EstadoCivil;
import br.com.pilates.base.enums.Sexo;
import br.com.pilates.dao.DAOCliente;

public class DAOClienteImpl extends HibernateDAO<Cliente> implements DAOCliente {

	@Override
	public Collection<Cliente> getAllClientes() {
		return this.list("getAllClientes");
	}

	@Override
	public Collection<Cliente> getClienteByCpf(String cpf) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cpf", cpf);
		return this.list("getClienteByCpf", params);
	}

	@Override
	public Collection<Cliente> pesquisarClientesByCPF(String cpf, Usuario userSession) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cpf", cpf + "%");
		params.put("user", userSession);
		return this.list("pesquisarClientesByCpfProfessor", params);
	}

	@Override
	public Collection<Cliente> pesquisarClientesByCPF(String cpf) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cpf", cpf + "%");
		return this.list("pesquisarClientesByCpf", params);
	}

	@Override
	public Collection<Cliente> pesquisarClientesByNome(String nome, Usuario userSession) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("nome", nome + "%");
		params.put("user", userSession);
		return this.list("pesquisarClientesByNomeProfessor", params);
	}

	@Override
	public Collection<Cliente> pesquisarClientesByNome(String nome) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("nome", nome + "%");
		return this.list("pesquisarClientesByNome", params);
	}

	@Override
	public Collection<Cliente> getClientesByProfessor(Usuario userSession) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("user", userSession);
		return this.list("getClientesByProfessor", params);
	}

	@Override
	public Cliente getClienteByCPF(String cpf) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cpf", cpf);
		return (Cliente) this.queryObject("getClienteByCPF", params);
	}

	@Override
	public Collection<Cliente> getProximosAniversariantesClientes(String mesAtual, String mesProximo) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("mesAtual", mesAtual + "/%");
		params.put("mesProximo", mesProximo + "/%");
		return this.list("getProximosAniversariantesClientes", params);
	}

	@Override
	public Collection<Cliente> getBairrosClientes() {
		return this.list("getBairrosClientes");
	}

	@Override
	public int getQtdClientesAtivosPorBairro(String bairro, Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("bairro", bairro);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		return ((Long) this.queryObject("getQtdClientesAtivosPorBairro", params)).intValue();
	}

	@Override
	public int getQtdClientesPorServicoSexo(Servico servico, Sexo sexo, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("servico", servico);
		if (sexo != null) {
			params.put("sexo", sexo.getValue());
		} else {
			params.put("sexo", sexo);
		}
		params.put("dataFinal", dataFinal);
		return ((BigInteger) this.queryObject("getQtdClientesPorServicoSexo", params)).intValue();
	}

	@Override
	public Collection<Cliente> getClientesPorServicoSexo(Servico servico, Sexo sexo, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("servico", servico);
		if (sexo != null) {
			params.put("sexo", sexo.getValue());
		} else {
			params.put("sexo", sexo);
		}
		params.put("dataFinal", dataFinal);
		return this.list("getClientesPorServicoSexo", params);
	}

	@Override
	public int getQtdClientesAtivosPorEstadoCivil(EstadoCivil estadoCivil, Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("estadoCivil", estadoCivil);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		return ((Long) this.queryObject("getQtdClientesAtivosPorEstadoCivil", params)).intValue();
	}

	@Override
	public int getQtdClientesAtivosPorSexo(Sexo sexo, Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("sexo", sexo);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		return ((Long) this.queryObject("getQtdClientesAtivosPorSexo", params)).intValue();
	}

	@Override
	public int getQtdClientesAtivosPorFaixaEtaria(int idadeMenor, int idadeMaior, Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		Calendar calendar = GregorianCalendar.getInstance();
		params.put("idadeMenor", calendar.get(Calendar.YEAR) - idadeMaior);
		params.put("idadeMaior", calendar.get(Calendar.YEAR) - idadeMenor);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		return ((Long) this.queryObject("getQtdClientesAtivosPorFaixaEtaria", params)).intValue();
	}

	@Override
	public int getQtdClientesAtivosPorServicoSexo(Servico servico, Sexo sexo, Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("servico", servico);
		params.put("sexo", sexo);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		return ((Long) this.queryObject("getQtdClientesAtivosPorServicoSexo", params)).intValue();
	}

	@Override
	public Collection<Cliente> getFormasConhecimento() {
		return this.list("getFormasConhecimento");
	}

	@Override
	public int getQtdClientesByMidia(String conhecimentoStudio) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("conhecimentoStudio", conhecimentoStudio);
		return ((Long) this.queryObject("getQtdClientesByMidia", params)).intValue();
	}

	@Override
	public Collection<Cliente> getCadastros(Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		return this.list("getClientes", params);
	}

	@Override
	public int getQtdClientesSemMidia() {
		return ((Long) this.queryObject("getQtdClientesSemMidia")).intValue();
	}

	@Override
	public Integer getQtdClientesQueContrataramServico(Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		return ((BigInteger) this.queryObject("getQtdClientesQueContrataramServico", params)).intValue();
	}
}
