package br.com.profisio.util;

public enum Plano {

	PLANO_1("Plano 1"), // apenas um usuário
						// nao ve financeiro
	PLANO_2("Plano 2"), // asdf
						// asdf
	PLANO_3("Plano 3"), // asdf
						// asdf
	PLANO_4("Plano 4"); // asdf
						// asdf

	private String valor;

	private Plano(String valor) {
		this.valor = valor;
	}

	public String getValor() {
		return this.valor;
	}

	public String getValue() {
		return this.name();
	}

	public static Plano createEnum(String value) {
		Plano retorno = null;
		for (Plano tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}

}
