package br.com.pilates.base.enums;

public enum CategoriaRuga {
	
	GRAVITACIONAIS("Rugas Gravitacionais"), EXPRESSAO("Rugas de Expressão");
	
	private String valor;
	
	private CategoriaRuga(String valor) {
		this.valor = valor;
	}
	
	public String getValue() {
		return name();
	}
	
	public String getValor() {
		return valor;
	}
	
	public static CategoriaRuga createEnum(String value) {
		CategoriaRuga retorno = null;
		for (CategoriaRuga tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}
}
