package br.com.pilates.base.enums;

public enum EstadoCivil {

	CASADO("Casado(a)"), SOLTEIRO("Solteiro(a)"), DIVORCIADO("Divorciado(a)"), VIUVO("Viúvo(a)");

	private String valor;

	private EstadoCivil(String valor) {
		this.valor = valor;
	}

	public String getValor() {
		return this.valor;
	}

	public String getValue() {
		return this.name();
	}

	public static EstadoCivil createEnum(String value) {
		EstadoCivil retorno = null;
		for (EstadoCivil tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}
}
