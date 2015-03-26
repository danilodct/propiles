package br.com.pilates.base.enums;

public enum TipoUser {

	ADMINISTRADOR, PROFESSOR, RECEPCIONISTA, AUX_ADMINISTRATIVO;

	public String getValue() {
		return this.name();
	}

	public static TipoUser createEnum(String value) {
		TipoUser retorno = null;
		for (TipoUser tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}
}
