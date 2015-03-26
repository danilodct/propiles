package br.com.pilates.actions;

import java.util.Collection;

import br.com.pilates.base.Contrato;
import br.com.pilates.base.Professor;
import br.com.pilates.base.Servico;
import br.com.pilates.base.enums.TipoUser;
import br.com.pilates.excecao.CPFExistenteException;
import br.com.pilates.fachada.IProxy;
import br.com.pilates.fachada.Proxy;
import br.com.pilates.util.PilatesBundleUtil;
import br.com.pilates.util.SystemUtils;

@SuppressWarnings("serial")
public class FuncionarioAction extends PilatesActionSupport {

	private final IProxy proxy;

	private Collection<Contrato> contratos;
	private Collection<Professor> funcionarios;
	private Professor funcionario;
	private Servico servico;
	private String recepcionista;

	private String pesquisa;
	private String param;

	public FuncionarioAction() {
		proxy = Proxy.getInstance();
	}

	public String actionGetFuncionariosByModalidade() {
		String xml = XML_HEAD;
		try {
			this.funcionarios = proxy.getProfessoresByModalidade(this.servico);
			xml += "<funcionarios>";
			if (this.funcionarios != null && this.funcionarios.size() > 0) {
				for (Professor funcionario : this.funcionarios) {
					xml += parseFuncionarioToXML(funcionario);
				}
			}
			xml += "</funcionarios>";
		} catch (Exception e) {
			e.printStackTrace();
			xml += parseExceptionToXML(e);
		}
		printResponse(xml);
		return null;
	}

	public String actionPesquisarFuncionario() {
		String xml = XML_HEAD;
		try {
			this.funcionarios = proxy.pesquisarProfessores(pesquisa, param);
			xml += "<funcionarios>";
			if (this.funcionarios != null && this.funcionarios.size() > 0) {
				for (Professor funcionario : this.funcionarios) {
					xml += parseFuncionarioToXML(funcionario);
				}
			}
			xml += "</funcionarios>";
		} catch (Exception e) {
			e.printStackTrace();
			xml += parseExceptionToXML(e);
		}
		printResponse(xml);
		return null;
	}

	public String actionRemoverFuncionario() {
		String resposta = "";
		try {
			proxy.removerFuncionario(funcionario);
			resposta = SUCCESS;
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionEditarFuncionario() {
		String resposta = "";
		try {
			if (this.recepcionista != null && (this.recepcionista.equals("on") || this.recepcionista.equals("checked")))
				this.funcionario.setTipo(TipoUser.RECEPCIONISTA);
			else
				this.funcionario.setTipo(TipoUser.PROFESSOR);
			proxy.editarFuncionario(funcionario);
			resposta = SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionEditarFuncionarioRedirect() {
		String resposta = "";
		try {
			this.funcionario = proxy.lerFuncionario(funcionario);
			resposta = SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionLerFuncionario() {
		String resposta = "";
		try {
			this.funcionario = proxy.lerFuncionario(funcionario);
			this.contratos = proxy.getContratosFuncionario(this.funcionario);
			resposta = SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionInserirFuncionario() {
		String resposta = "";
		try {
			if (this.recepcionista != null && (this.recepcionista.equals("on") || this.recepcionista.equals("checked")))
				this.funcionario.setTipo(TipoUser.RECEPCIONISTA);
			proxy.inserirFuncionario(funcionario);
			resposta = SUCCESS;
		} catch (CPFExistenteException e) {
			e.printStackTrace();
			addActionError(e.getMessage());
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
			this.funcionarios = proxy.getFuncionarios();
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	private String parseFuncionarioToXML(Professor funcionario) {
		String xml = "";
		xml += "<funcionario id=\"" + funcionario.getId() + "\" dataNascimento=\"" + SystemUtils.parseDataToString(funcionario.getDataNascimento()) + "\" >";
		xml += "<nome>";
		xml += funcionario.getNome();
		xml += "</nome>";
		xml += "<telefoneFixo>";
		xml += funcionario.getFoneFixo();
		xml += "</telefoneFixo>";
		xml += "<telefoneCelular>";
		xml += funcionario.getFoneCelular();
		xml += "</telefoneCelular>";
		xml += "</funcionario>";
		return xml;
	}

	public Collection<Professor> getFuncionarios() {
		return funcionarios;
	}

	public void setFuncionarios(Collection<Professor> funcionarios) {
		this.funcionarios = funcionarios;
	}

	public Professor getFuncionario() {
		return funcionario;
	}

	public void setFuncionario(Professor funcionario) {
		this.funcionario = funcionario;
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

	public Collection<Contrato> getContratos() {
		return contratos;
	}

	public void setContratos(Collection<Contrato> contratos) {
		this.contratos = contratos;
	}

	public String getRecepcionista() {
		return recepcionista;
	}

	public void setRecepcionista(String recepcionista) {
		this.recepcionista = recepcionista;
	}

	public Servico getServico() {
		return servico;
	}

	public void setServico(Servico servico) {
		this.servico = servico;
	}

}
