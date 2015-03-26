package br.com.pilates.base.enums;

public enum EstriaAparecimento {
	
	ADOLESCENCIA("Adolescência"), GRAVIDEZ("Gravidez"), OBESIDADE("Obesidade"), HIPERTROFIA("Hipertrofia"), APOS_MEDICACAO("Após Medicação");
	
	private String valor;
	
	private EstriaAparecimento(String valor) {
		this.valor = valor;
	}
	
	public String getValue() {
		return name();
	}
	
	public String getValor() {
		return valor;
	}
	
	public static EstriaAparecimento createEnum(String value) {
		EstriaAparecimento retorno = null;
		for (EstriaAparecimento tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}
}
