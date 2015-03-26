package br.com.pilates.base.enums;

public enum GrauCelulite {
	
	BRANCA("Branca"), NEGRA("Negra"), AMARELA("Amarela");
	
	private String valor;
	
	private GrauCelulite(String valor) {
		this.valor = valor;
	}
	
	public String getValue() {
		return name();
	}
	
	public String getValor() {
		return valor;
	}
	
	public static GrauCelulite createEnum(String value) {
		GrauCelulite retorno = null;
		for (GrauCelulite tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}
}
