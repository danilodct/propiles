package br.com.pilates.base.enums;

public enum TipoCusto {

	FIXO("Fixo"), VARIAVEL("Variável");

	private String valor;

	private TipoCusto(String valor) {
		this.valor = valor;
	}

	public String getValor() {
		return this.valor;
	}

	public String getValue() {
		return this.name();
	}

	public static TipoCusto createEnum(String value) {
		TipoCusto retorno = null;
		for (TipoCusto tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}
}
