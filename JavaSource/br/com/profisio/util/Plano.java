package br.com.profisio.util;

public enum Plano {

	PLANO_1("Plano Grátis", "0.00"), // apenas um usuário
	// nao ve financeiro
	PLANO_2("Plano Básico", "228.00"), // ilimitado usuario
	// asdf
	PLANO_3("Plano Avançado", "339.00"), // ilimitado usuario + todos modulos
	// asdf
	PLANO_4("Plano Personalizado", "0.00"); // personalizado
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
