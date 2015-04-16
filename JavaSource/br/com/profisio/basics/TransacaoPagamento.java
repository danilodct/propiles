package br.com.profisio.basics;

import java.util.Date;

public class TransacaoPagamento extends ObjetoBasico {

	private String url, codigo, status;
	private Usuario usuario;
	private Date data;

	public TransacaoPagamento() {
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
		this.extrairCodigo(url);
	}

	private void extrairCodigo(String url) {
		if (url != null) {
			String[] split = url.split("t=");
			String param = "";
			if (split.length == 1)
				split = url.split("code=");
			if (split.length == 2)
				param = split[1];
			String[] verify = param.split("&");
			this.codigo = verify[0];
		}
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
