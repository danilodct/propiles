package br.com.profisio.basics.enums;

public enum StatusConta {
	
	PENDENTE("Pendente"), PAGO("Pago");
	
	private String valor;
	
	private StatusConta(String valor) {
		this.valor = valor;
	}
	
	public String getValor() {
		return this.valor;
	}
	
	public String getValue() {
		return this.name();
	}
	
	public static StatusConta createEnum(String value) {
		StatusConta retorno = null;
		for (StatusConta tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}
	
}
