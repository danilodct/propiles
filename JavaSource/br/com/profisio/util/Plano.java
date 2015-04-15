package br.com.profisio.util;

public enum Plano {

	PLANO_1("Plano 1", "0.00"), // apenas um usuário
	// nao ve financeiro
	PLANO_2("Plano 2", "1.00"), // asdf
	// asdf
	PLANO_3("Plano 3", "1.10"), // asdf
	// asdf
	PLANO_4("Plano 4", "1.20"); // asdf
	// asdf

	private String valor, custo;

	private Plano(String nome, String custo) {
		this.valor = nome;
		this.custo = custo;
	}

	public String getValor() {
		return this.valor;
	}

	public String getValue() {
		return this.name();
	}

	public String getCusto() {
		return custo;
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
