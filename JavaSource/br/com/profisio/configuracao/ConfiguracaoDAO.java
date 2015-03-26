package br.com.profisio.configuracao;

import java.util.HashMap;
import java.util.Map;

import br.com.profisio.basics.Configuracao;
import br.com.profisio.util.DAOBase;
import br.com.profisio.util.Tenant;

public class ConfiguracaoDAO extends DAOBase {

	public ConfiguracaoDAO() {
	}

	public static Object daoFactory() {
		return DAOBase.DAOFactory(ConfiguracaoDAO.class);
	}

	@SuppressWarnings("unchecked")
	public Configuracao getConfiguracao(Tenant tenant) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		return (Configuracao) this.imp.queryObject("getConfiguracao", params);
	}

	@SuppressWarnings("unchecked")
	public void editar(Configuracao configuracao) {
		this.imp.update(configuracao);
	}

	@SuppressWarnings("unchecked")
	public Configuracao getConfiguracaoByTenant(Tenant tenant) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		return (Configuracao) this.imp.queryObject("getConfiguracaoByTenant", params);
	}

}
