package br.com.pilates.base.enums;

public enum AspectoPele {
	
	BRANCA("Branca"), NEGRA("Negra"), AMARELA("Amarela");
	
	private String valor;
	
	private AspectoPele(String valor) {
		this.valor = valor;
	}
	
	public String getValue() {
		return name();
	}
	
	public String getValor() {
		return valor;
	}
	
	public static AspectoPele createEnum(String value) {
		AspectoPele retorno = null;
		for (AspectoPele tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}
}
