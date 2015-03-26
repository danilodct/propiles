package br.com.profisio.configuracao;

import br.com.profisio.basics.Configuracao;
import br.com.profisio.util.ControllerBase;
import br.com.profisio.util.SystemUtils;

public class ConfiguracaoControl extends ControllerBase {

	private static ConfiguracaoControl instance = null;
	private ConfiguracaoDAO dao = null;

	private ConfiguracaoControl() {
		dao = (ConfiguracaoDAO) ConfiguracaoDAO.daoFactory();
	}

	public static ConfiguracaoControl getInstance() {
		if (instance == null)
			instance = new ConfiguracaoControl();
		return instance;
	}

	public Configuracao getConfiguracao() {
		return this.dao.getConfiguracao();
	}

	public void editarConfiguracao(Configuracao configuracao) {
		SystemUtils.assertObjectIsNotNull(configuracao);
		if (configuracao.getId() == null)
			configuracao.setId(1);
		this.dao.editar(configuracao);
	}

}
