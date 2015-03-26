package br.com.pilates.base.enums;

public enum QualidadePele {
	
	FINA("Fina"), GROSSA("Grossa"), DESIDRATADA("Desidratada"), HIDRATADA("Hidratada"), SECA("Seca/Alípica"), OLEOSA("Oleosa"), FLACIDA("Flácida"), ASPERA("Áspera"), TURGOR("Turgor");
	
	private String valor;
	
	private QualidadePele(String valor) {
		this.valor = valor;
	}
	
	public String getValue() {
		return name();
	}
	
	public String getValor() {
		return valor;
	}
	
	public static QualidadePele createEnum(String value) {
		QualidadePele retorno = null;
		for (QualidadePele tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}
}
