package br.com.profisio.basics.enums;

public enum StatusAgendamento {

	FALTOU("Faltou"), COMPARECEU("Compareceu"), INDEFINIDO("Indefinido");

	private String nome;

	private StatusAgendamento(String nome) {
		this.nome = nome;
	}

	public String getValor() {
		return this.nome;
	}

	public String getValue() {
		return this.name();
	}

	public static StatusAgendamento createEnum(String value) {
		StatusAgendamento retorno = null;
		for (StatusAgendamento tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}

}
