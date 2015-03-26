package br.com.pilates.base;

import br.com.pilates.base.enums.TipoUser;

public class Usuario extends Pessoa {

	private String login;
	private String senha;
	private TipoUser tipo;

	public Usuario() {
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getTipoStr() {
		String tipoStr = "";
		if (this.tipo != null)
			tipoStr = this.tipo.getValue();
		return tipoStr;
	}

	public TipoUser getTipo() {
		return tipo;
	}

	public void setTipo(TipoUser tipo) {
		this.tipo = tipo;
	}

}
