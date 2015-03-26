package br.com.pilates.actions;

import java.util.Collection;

import br.com.pilates.base.Cadastro;
import br.com.pilates.base.Cliente;
import br.com.pilates.base.ContaReceber;
import br.com.pilates.base.Frequencia;
import br.com.pilates.base.Professor;
import br.com.pilates.excecao.CPFExistenteException;
import br.com.pilates.fachada.IProxy;
import br.com.pilates.fachada.Proxy;
import br.com.pilates.util.PilatesBundleUtil;
import br.com.pilates.util.SystemUtils;

@SuppressWarnings("serial")
public class ClienteAction extends PilatesActionSupport {

	private final IProxy proxy;

	private Collection<Cadastro> cadastros;
	private Collection<Cliente> clientes;
	private Collection<Professor> professores;
	private Collection<Frequencia> frequencias;
	private Collection<ContaReceber> contasReceber;
	private Cliente cliente;

	private String pesquisa;
	private String param;

	public ClienteAction() {
		proxy = Proxy.getInstance();
	}

	public String actionAniversariantes() {
		String resposta = "";
		try {
			this.clientes = this.proxy.getProximosAniversariantesClientes();
			this.professores = this.proxy.getProximosAniversariantesFuncionarios();
			resposta = SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionPesquisarCliente() {
		String xml = XML_HEAD;
		try {
			this.clientes = proxy.pesquisarClientes(pesquisa, param);
			xml += "<clientes>";
			if (this.clientes != null && this.clientes.size() > 0) {
				for (Cliente cliente : this.clientes) {
					xml += "<cliente id=\"" + cliente.getId() + "\" dataNascimento=\"" + SystemUtils.parseDataToString(cliente.getDataNascimento()) + "\" >";
					xml += "<nome>";
					xml += cliente.getNome();
					xml += "</nome>";
					xml += "<telefoneFixo>";
					xml += cliente.getFoneFixo();
					xml += "</telefoneFixo>";
					xml += "<telefoneCelular>";
					xml += cliente.getFoneCelular();
					xml += "</telefoneCelular>";
					xml += "</cliente>";
				}
			}
			xml += "</clientes>";
		} catch (Exception e) {
			e.printStackTrace();
			xml += parseExceptionToXML(e);
		}
		printResponse(xml);
		return null;
	}

	public String actionRemoverCliente() {
		String resposta = "";
		try {
			proxy.removerCliente(cliente);
			resposta = SUCCESS;
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionEditarCliente() {
		String resposta = "";
		try {
			if (this.param != null && !this.param.equalsIgnoreCase("")) {
				cliente.setConhecimentoStudio(this.param);
			}
			proxy.editarCliente(cliente);
			resposta = SUCCESS;
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionEditarClienteRedirect() {
		String resposta = "";
		try {
			this.cliente = proxy.lerCliente(cliente);
			resposta = SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionLerCliente() {
		String resposta = "";
		try {
			this.cliente = proxy.lerCliente(cliente);
			this.cadastros = proxy.getCadastrosAtivosByCliente(this.cliente);
			this.frequencias = proxy.getFrequenciasByCliente(this.cliente);
			this.contasReceber = proxy.getContasReceberByCliente(this.cliente);
			resposta = SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionInserirCliente() {
		String resposta = "";
		try {
			if (this.param != null && !this.param.equalsIgnoreCase("")) {
				cliente.setConhecimentoStudio(this.param);
			}
			proxy.inserirCliente(cliente);
			resposta = SUCCESS;
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.CADASTRO_SUCESSO));
		} catch (CPFExistenteException e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			this.cliente = this.proxy.getClienteByCPF(this.cliente.getCpf());
			resposta = ERROR_CPF;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	@Override
	public String redirect() {
		try {
			this.clientes = proxy.getPoucosClientes();
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public Collection<Cliente> getClientes() {
		return clientes;
	}

	public void setClientes(Collection<Cliente> clientes) {
		this.clientes = clientes;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
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

	public Collection<Cadastro> getCadastros() {
		return cadastros;
	}

	public void setCadastros(Collection<Cadastro> cadastros) {
		this.cadastros = cadastros;
	}

	@Override
	public Collection<Professor> getProfessores() {
		return professores;
	}

	public void setProfessores(Collection<Professor> professores) {
		this.professores = professores;
	}

	public Collection<Frequencia> getFrequencias() {
		return frequencias;
	}

	public void setFrequencias(Collection<Frequencia> frequencias) {
		this.frequencias = frequencias;
	}

	public Collection<ContaReceber> getContasReceber() {
		return contasReceber;
	}

	public void setContasReceber(Collection<ContaReceber> contasReceber) {
		this.contasReceber = contasReceber;
	}

}
