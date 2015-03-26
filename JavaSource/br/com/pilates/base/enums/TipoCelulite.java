package br.com.pilates.base.enums;

public enum TipoCelulite {
	
	BRANCA("Branca"), NEGRA("Negra"), AMARELA("Amarela");
	
	private String valor;
	
	private TipoCelulite(String valor) {
		this.valor = valor;
	}
	
	public String getValue() {
		return name();
	}
	
	public String getValor() {
		return valor;
	}
	
	public static TipoCelulite createEnum(String value) {
		TipoCelulite retorno = null;
		for (TipoCelulite tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}
}
