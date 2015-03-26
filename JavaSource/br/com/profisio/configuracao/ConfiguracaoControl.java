package br.com.profisio.configuracao;

import br.com.profisio.basics.Configuracao;
import br.com.profisio.util.ControllerBase;
import br.com.profisio.util.SystemUtils;
import br.com.profisio.util.Tenant;

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

	public Configuracao getConfiguracao(Tenant tenant) {
		return this.dao.getConfiguracao(tenant);
	}

	public void editarConfiguracao(Tenant tenant, Configuracao configuracao) {
		SystemUtils.assertObjectIsNotNull(configuracao);
		Configuracao confBD = this.dao.getConfiguracaoByTenant(tenant);
		SystemUtils.assertObjectIsNotNullHasId(confBD);
		configuracao.setId(confBD.getId());
		configuracao.setTenant(tenant);
		this.dao.editar(configuracao);
	}

}
