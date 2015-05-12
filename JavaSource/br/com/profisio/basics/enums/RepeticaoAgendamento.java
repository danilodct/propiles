package br.com.profisio.basics.enums;

public enum RepeticaoAgendamento {

	NAO_REPETIR("Não repetir", 0), SEMANALMENTE("Semanalmente", 7);

	private String nome;
	private Integer qtdDias;

	private RepeticaoAgendamento(String nome, Integer qtdDias) {
		this.nome = nome;
		this.qtdDias = qtdDias;
	}

	public String getValor() {
		return this.nome;
	}

	public String getValue() {
		return this.name();
	}

	public Integer getQtdDias() {
		return qtdDias;
	}

	public static RepeticaoAgendamento createEnum(String value) {
		RepeticaoAgendamento retorno = null;
		for (RepeticaoAgendamento tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}

}
