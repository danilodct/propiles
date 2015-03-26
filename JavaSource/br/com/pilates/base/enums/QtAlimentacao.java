package br.com.pilates.base.enums;

public enum QtAlimentacao {
	
	POUCA("Pouca"), NORMAL("Normal"), EXCESSIVA("Excessiva");
	
	private String valor;
	
	private QtAlimentacao(String valor) {
		this.valor = valor;
	}
	
	public String getValue() {
		return name();
	}
	
	public String getValor() {
		return valor;
	}
	
	public static QtAlimentacao createEnum(String value) {
		QtAlimentacao retorno = null;
		for (QtAlimentacao tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}
}
