package br.com.pilates.base.enums;

public enum TipoRuga {
	
	PROFUNDA("Profunda"), SUPERFICIAL("Superficial");
	
	private String valor;
	
	private TipoRuga(String valor) {
		this.valor = valor;
	}
	
	public String getValue() {
		return name();
	}
	
	public String getValor() {
		return valor;
	}
	
	public static TipoRuga createEnum(String value) {
		TipoRuga retorno = null;
		for (TipoRuga tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}
}
