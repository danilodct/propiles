package br.com.pilates.base.enums;

public enum Sexo {
	
	MASCULINO("Masculino"), FEMININO("Feminino");
	
	private String valor;
	
	private Sexo(String valor) {
		this.valor = valor;
	}
	
	public String getValor() {
		return this.valor;
	}
	
	public String getValue() {
		return this.name();
	}
	
	public static Sexo createEnum(String value) {
		Sexo retorno = null;
		for (Sexo tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}
}
