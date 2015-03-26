package br.com.pilates.control.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Cliente;
import br.com.pilates.base.Servico;
import br.com.pilates.base.enums.EstadoCivil;
import br.com.pilates.base.enums.Sexo;
import br.com.pilates.base.util.FormaConhecimento;
import br.com.pilates.control.ControlCliente;
import br.com.pilates.control.ControlServico;
import br.com.pilates.dao.DAOCliente;
import br.com.pilates.dao.impl.DAOClienteImpl;
import br.com.pilates.excecao.CPFExistenteException;
import br.com.pilates.excecao.PilatesException;
import br.com.pilates.util.PilatesBundleUtil;
import br.com.pilates.util.SystemUtils;

public class ControlClienteImpl implements ControlCliente {

	private final DAOCliente dao;

	public ControlClienteImpl() {
		this.dao = new DAOClienteImpl();
	}

	@Override
	public Collection<Cliente> getAllClientes() {
		// Usuario userSession = PilatesSessionUtil.getUserSession();
		Collection<Cliente> clientes = null;
		// if (userSession.getTipo() == TipoUser.PROFESSOR) {
		// clientes = this.dao.getClientesByProfessor(userSession);
		// } else {
		clientes = this.dao.getAllClientes();
		// }
		return clientes;
	}

	@Override
	public void inserirCliente(Cliente cliente) {
		if (cliente == null) {
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		}
		if (cliente.getNome() == null || cliente.getNome().equals("")) {
			throw new PilatesException(PilatesBundleUtil.NOME_CLIENTE_OBRIGATORIO);
		}
		if (cliente.getCpf() == null || cliente.getCpf().equals("")) {
			throw new PilatesException(PilatesBundleUtil.CPF_CLIENTE_OBRIGATORIO);
		}
		if (!this.isCPFDisponivel(cliente.getCpf())) {
			throw new CPFExistenteException();
		}
		gerarNiver(cliente);
		cliente.setDataCadastro(new Date());
		this.dao.insert(cliente);
	}

	private void gerarNiver(Cliente cliente) {
		if (cliente.getDataNascimento() != null) {
			Calendar instance = Calendar.getInstance();
			instance.setTime(cliente.getDataNascimento());
			String mes = (instance.get(Calendar.MONTH) + 1) + "";
			if (mes.length() == 1) {
				mes = "0" + mes;
			}
			String dia = instance.get(Calendar.DAY_OF_MONTH) + "";
			if (dia.length() == 1) {
				dia = "0" + dia;
			}
			String mesDia = mes + "/" + dia;
			cliente.setNiver(mesDia);
		}
	}

	@Override
	public boolean isCPFDisponivel(String cpf) {
		boolean retorno = true;
		Collection<Cliente> clientes = this.dao.getClienteByCpf(cpf);
		if (clientes != null && clientes.size() > 0) {
			retorno = false;
		}
		return retorno;
	}

	@Override
	public Cliente lerCliente(Cliente cliente) {
		return this.dao.read(Cliente.class, cliente.getId());
	}

	@Override
	public void editarCliente(Cliente cliente) {
		if (cliente == null) {
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		}
		if (cliente.getNome() == null || cliente.getNome().equals("")) {
			throw new PilatesException(PilatesBundleUtil.NOME_CLIENTE_OBRIGATORIO);
		}
		if (cliente.getCpf() == null || cliente.getCpf().equals("")) {
			throw new PilatesException(PilatesBundleUtil.CPF_CLIENTE_OBRIGATORIO);
		}
		this.gerarNiver(cliente);
		this.dao.update(cliente);
	}

	@Override
	public void removerCliente(Cliente cliente) {
		this.dao.delete(cliente);
	}

	@Override
	public Collection<Cliente> pesquisarClientes(String pesquisa, String param) {
		Collection<Cliente> clientes = null;
		// Usuario userSession = PilatesSessionUtil.getUserSession();
		if (param.equals("cpf")) {
			// if (userSession.getTipo() == TipoUser.PROFESSOR) {
			// clientes = this.dao.pesquisarClientesByCPF(pesquisa,
			// userSession);
			// } else {
			clientes = this.dao.pesquisarClientesByCPF(pesquisa);
			// }
		} else {
			// if (userSession.getTipo() == TipoUser.PROFESSOR) {
			// clientes = this.dao.pesquisarClientesByNome(pesquisa,
			// userSession);
			// } else {
			clientes = this.dao.pesquisarClientesByNome(pesquisa);
			// }
		}
		return clientes;
	}

	@Override
	public Cliente getClienteByCPF(String cpf) {
		return this.dao.getClienteByCPF(cpf);
	}

	@Override
	public Collection<Cliente> getProximosAniversariantes() {
		Calendar calendar = Calendar.getInstance();
		int month = calendar.get(Calendar.MONTH) + 1;
		String mesAtual = "" + month;
		if (mesAtual.length() == 1) {
			mesAtual = "0" + mesAtual;
		}
		String mesProximo = "" + (month + 1);
		if (mesProximo.length() == 1) {
			mesProximo = "0" + mesProximo;
		}
		return this.dao.getProximosAniversariantesClientes(mesAtual, mesProximo);
	}

	@Override
	public String getQtdClientesByBairroStr(Date dataInicial, Date dataFinal) {
		String retorno = "";
		Collection<Cliente> bairros = this.getBairrosClientes();
		for (Cliente bairro : bairros) {
			int qtdClientesPorBairro = this.getQtdClientesAtivosPorBairro(bairro.getEndereco().getBairro(), dataInicial, dataFinal);
			retorno += bairro.getEndereco().getBairro() + "," + qtdClientesPorBairro + ";";
		}
		if (retorno.length() > 0) {
			retorno = retorno.substring(0, retorno.length() - 1);
		}
		retorno = SystemUtils.orderLabelValue(retorno);
		return retorno;
	}

	@Override
	public int getQtdClientesAtivosPorBairro(String bairro, Date dataInicial, Date dataFinal) {
		return this.dao.getQtdClientesAtivosPorBairro(bairro, dataInicial, dataFinal);
	}

	@Override
	public Collection<Cliente> getBairrosClientes() {
		return this.dao.getBairrosClientes();
	}

	@Override
	public String getQtdClientesByServicoStr(Sexo sexo, Date dataInicial, Date dataFinal) {
		String retorno = "";
		ControlServico controlServico = new ControlServicoImpl();
		Collection<Servico> allServicos = controlServico.getAllServicos();
		for (Servico servico : allServicos) {
			int qtdClientesPorServico = this.getQtdClientesAtivosPorServicoSexo(servico, sexo, dataInicial, dataFinal);
			retorno += servico.getNome() + "," + qtdClientesPorServico + ";";
		}
		if (retorno.length() > 0) {
			retorno = retorno.substring(0, retorno.length() - 1);
		}
		return retorno;
	}

	private int getQtdClientesAtivosPorServicoSexo(Servico servico, Sexo sexo, Date dataInicial, Date dataFinal) {
		return this.dao.getQtdClientesAtivosPorServicoSexo(servico, sexo, dataInicial, dataFinal);
	}

	@Override
	public String getQtdClientesByEstadoCivilStr(Date dataInicial, Date dataFinal) {
		String retorno = "";
		EstadoCivil[] estadosCivil = EstadoCivil.values();
		for (EstadoCivil estadoCivil : estadosCivil) {
			int qtdClientesPorEstadoCivil = this.getQtdClientesAtivosPorEstadoCivil(estadoCivil, dataInicial, dataFinal);
			retorno += estadoCivil.getValor() + "," + qtdClientesPorEstadoCivil + ";";
		}
		if (retorno.length() > 0) {
			retorno = retorno.substring(0, retorno.length() - 1);
		}
		return retorno;
	}

	private int getQtdClientesAtivosPorEstadoCivil(EstadoCivil estadoCivil, Date dataInicial, Date dataFinal) {
		return this.dao.getQtdClientesAtivosPorEstadoCivil(estadoCivil, dataInicial, dataFinal);
	}

	@Override
	public String getQtdClientesAtivosBySexoStr(Date dataInicial, Date dataFinal) {
		String retorno = "";
		Sexo[] sexos = Sexo.values();
		for (Sexo sexo : sexos) {
			int qtdClientesPorSexo = this.getQtdClientesAtivosPorSexo(sexo, dataInicial, dataFinal);
			retorno += sexo.getValor() + "," + qtdClientesPorSexo + ";";
		}
		if (retorno.length() > 0) {
			retorno = retorno.substring(0, retorno.length() - 1);
		}
		return retorno;
	}

	private int getQtdClientesAtivosPorSexo(Sexo sexo, Date dataInicial, Date dataFinal) {
		return this.dao.getQtdClientesAtivosPorSexo(sexo, dataInicial, dataFinal);
	}

	@Override
	public String getQtdClientesAtivosByFaixaEtariaStr(Date dataInicial, Date dataFinal) {
		String retorno = "";

		int qtdClientesPorFaixaEtaria = this.dao.getQtdClientesAtivosPorFaixaEtaria(0, 10, dataInicial, dataFinal);
		retorno += "0 - 10," + qtdClientesPorFaixaEtaria + ";";

		qtdClientesPorFaixaEtaria = this.dao.getQtdClientesAtivosPorFaixaEtaria(11, 19, dataInicial, dataFinal);
		retorno += "11 - 19," + qtdClientesPorFaixaEtaria + ";";

		qtdClientesPorFaixaEtaria = this.dao.getQtdClientesAtivosPorFaixaEtaria(20, 39, dataInicial, dataFinal);
		retorno += "20 - 39," + qtdClientesPorFaixaEtaria + ";";

		qtdClientesPorFaixaEtaria = this.dao.getQtdClientesAtivosPorFaixaEtaria(40, 59, dataInicial, dataFinal);
		retorno += "40 - 59," + qtdClientesPorFaixaEtaria + ";";

		qtdClientesPorFaixaEtaria = this.dao.getQtdClientesAtivosPorFaixaEtaria(60, 79, dataInicial, dataFinal);
		retorno += "60 - 79," + qtdClientesPorFaixaEtaria + ";";

		qtdClientesPorFaixaEtaria = this.dao.getQtdClientesAtivosPorFaixaEtaria(80, 200, dataInicial, dataFinal);
		retorno += "80," + qtdClientesPorFaixaEtaria;

		return retorno;
	}

	@Override
	public Collection<FormaConhecimento> getAllFormasConhecimento() {
		Collection<FormaConhecimento> retorno = new ArrayList<FormaConhecimento>();
		Collection<Cliente> clientes = this.dao.getFormasConhecimento();
		for (Cliente cliente : clientes) {
			retorno.add(new FormaConhecimento(cliente.getConhecimentoStudio()));
		}
		return retorno;
	}

	@Override
	public Collection<Cliente> getNovosCadastros(Date dataInicial, Date dataFinal) {
		if (dataInicial != null) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(dataInicial);
			calendar.set(Calendar.AM_PM, Calendar.AM);
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			dataInicial = calendar.getTime();
		}
		if (dataFinal != null) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(dataFinal);
			calendar.set(Calendar.AM_PM, Calendar.PM);
			calendar.set(Calendar.HOUR, 11);
			calendar.set(Calendar.MINUTE, 59);
			calendar.set(Calendar.SECOND, 59);
			dataFinal = calendar.getTime();
		}
		return this.dao.getCadastros(dataInicial, dataFinal);
	}

	@Override
	public Integer getQtdClientesQueContrataramServico(Date dataInicial, Date dataFinal) {
		if (dataInicial != null) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(dataInicial);
			calendar.set(Calendar.AM_PM, Calendar.AM);
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			dataInicial = calendar.getTime();
		}
		if (dataFinal != null) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(dataFinal);
			calendar.set(Calendar.AM_PM, Calendar.PM);
			calendar.set(Calendar.HOUR, 11);
			calendar.set(Calendar.MINUTE, 59);
			calendar.set(Calendar.SECOND, 59);
			dataFinal = calendar.getTime();
		}
		return this.dao.getQtdClientesQueContrataramServico(dataInicial, dataFinal);
	}
}
