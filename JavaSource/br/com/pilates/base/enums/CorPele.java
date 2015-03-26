package br.com.pilates.base.enums;

public enum CorPele {
	
	BRANCA("Branca"), NEGRA("Negra"), AMARELA("Amarela");
	
	private String valor;
	
	private CorPele(String valor) {
		this.valor = valor;
	}
	
	public String getValue() {
		return name();
	}
	
	public String getValor() {
		return valor;
	}
	
	public static CorPele createEnum(String value) {
		CorPele retorno = null;
		for (CorPele tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}
}
