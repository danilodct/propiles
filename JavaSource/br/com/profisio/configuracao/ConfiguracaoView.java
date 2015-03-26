package br.com.profisio.configuracao;

import br.com.profisio.basics.Configuracao;
import br.com.profisio.util.ProfisioActionSupport;
import br.com.profisio.util.ProfisioBundleUtil;

public class ConfiguracaoView extends ProfisioActionSupport {

	private static final long serialVersionUID = 4742339788981156278L;

	private final ConfiguracaoControl controller;

	private Configuracao configuracao;

	public ConfiguracaoView() {
		controller = ConfiguracaoControl.getInstance();
	}

	public String actionGerenciarCaixa() {
		try {
			if (this.configuracao == null)
				this.configuracao = this.controller.getConfiguracao();
			else {
				this.controller.editarConfiguracao(this.configuracao);
				addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
			}
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public Configuracao getConfiguracao() {
		return configuracao;
	}

	public void setConfiguracao(Configuracao configuracao) {
		this.configuracao = configuracao;
	}

}
