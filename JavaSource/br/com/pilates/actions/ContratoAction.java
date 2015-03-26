package br.com.pilates.actions;

import br.com.pilates.base.Contrato;
import br.com.pilates.base.Professor;
import br.com.pilates.fachada.IProxy;
import br.com.pilates.fachada.Proxy;
import br.com.pilates.util.PilatesBundleUtil;

@SuppressWarnings("serial")
public class ContratoAction extends PilatesActionSupport {
	
	private final IProxy proxy;
	
	private Contrato contrato;
	private Professor funcionario;
	
	public ContratoAction() {
		proxy = Proxy.getInstance();
	}
	
	public String actionRemoverContrato() {
		String resposta = "";
		try {
			proxy.removerContrato(contrato);
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.REMOCAO_SUCESSO));
			resposta = SUCCESS;
		}
		catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}
	
	public String actionEditarContrato() {
		String resposta = "";
		try {
			Contrato contrato = (Contrato) this.proxy.read(Contrato.class, this.contrato.getId());
			contrato.setPercentual(this.contrato.getPercentual());
			proxy.editarContrato(contrato);
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.ALTERACAO_SUCESSO));
			resposta = SUCCESS;
		}
		catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}
	
	public String actionInserirContrato() {
		String resposta = "";
		try {
			proxy.inserirContrato(contrato);
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.CADASTRO_SUCESSO));
			resposta = SUCCESS;
		}
		catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}
	
	public Professor getFuncionario() {
		return funcionario;
	}
	
	public void setFuncionario(Professor funcionario) {
		this.funcionario = funcionario;
	}
	
	public Contrato getContrato() {
		return contrato;
	}
	
	public void setContrato(Contrato contrato) {
		this.contrato = contrato;
	}
	
}
