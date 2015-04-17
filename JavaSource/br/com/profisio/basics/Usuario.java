package br.com.profisio.basics;

import br.com.profisio.basics.enums.TipoUser;
import br.com.profisio.util.Encriptador;

public class Usuario extends Pessoa {

	private String login, senha, nomeUser;
	private TipoUser tipo;
	private Boolean confirmado, aguardandoPagamento;//aguardandoPagamento serve para os plaanos 2 e 3 qd o usuario cofirmou o email, porém ainda nao confirmou o pagamento

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

	public String getSenhaCript() {
		return Encriptador.encode(senha);
	}

	public void setSenhaCript(String senha) {
		this.senha = Encriptador.decode(senha);
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

	public void setTipoStr(String tipo) {
		this.tipo = TipoUser.createEnum(tipo);
	}

	public Boolean getConfirmado() {
		return confirmado;
	}

	public void setConfirmado(Boolean confirmado) {
		this.confirmado = confirmado;
	}

	public String getNomeUser() {
		return nomeUser;
	}

	public void setNomeUser(String nomeUser) {
		this.nomeUser = nomeUser;
	}

	public Boolean getAguardandoPagamento() {
		return aguardandoPagamento;
	}

	public void setAguardandoPagamento(Boolean aguardandoPagamento) {
		this.aguardandoPagamento = aguardandoPagamento;
	}

}
