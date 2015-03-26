package br.com.pilates.base.enums;

public enum StatusObjeto {
	
	ATIVO("Ativo"), MORTO("Excluído");
	
	private String valor;
	
	private StatusObjeto(String valor) {
		this.valor = valor;
	}
	
	public String getValor() {
		return this.valor;
	}
	
	public String getValue() {
		return this.name();
	}
	
	public static StatusObjeto createEnum(String value) {
		StatusObjeto retorno = null;
		for (StatusObjeto tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}
}
