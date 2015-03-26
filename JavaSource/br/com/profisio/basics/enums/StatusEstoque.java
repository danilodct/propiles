package br.com.profisio.basics.enums;

public enum StatusEstoque {

	DISPONIVEL("Disponível"), VENDIDO("Vendido");

	private String valor;

	private StatusEstoque(String valor) {
		this.valor = valor;
	}

	public String getValue() {
		return name();
	}

	public String getValor() {
		return valor;
	}

	public static StatusEstoque createEnum(String value) {
		StatusEstoque retorno = null;
		if (value != null) {
			for (StatusEstoque tipo : values()) {
				if (tipo.name().equals(value)) {
					retorno = tipo;
				}
			}
		}
		return retorno;
	}
}
