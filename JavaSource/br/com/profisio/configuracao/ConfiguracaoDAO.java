package br.com.profisio.configuracao;

import br.com.profisio.basics.Configuracao;
import br.com.profisio.util.DAOBase;

public class ConfiguracaoDAO extends DAOBase {

	public ConfiguracaoDAO() {
	}

	public static Object daoFactory() {
		return DAOBase.DAOFactory(ConfiguracaoDAO.class);
	}

	@SuppressWarnings("unchecked")
	public Configuracao getConfiguracao() {
		return (Configuracao) this.imp.read(Configuracao.class, 1);
	}

	@SuppressWarnings("unchecked")
	public void editar(Configuracao configuracao) {
		this.imp.update(configuracao);
	}

}
