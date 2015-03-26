package br.com.pilates.base.enums;

public enum Retracao {
	
	RETRACAO_A("A"), RETRACAO_Pv("P");
	
	private String valor;
	
	private Retracao(String valor) {
		this.valor = valor;
	}
	
	public String getValor() {
		return this.valor;
	}
	
	public String getValue() {
		return this.name();
	}
	
	public static Retracao createEnum(String value) {
		Retracao retorno = null;
		for (Retracao tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}
	
}
