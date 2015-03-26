package br.com.pilates.base.enums;

public enum Modalidade {

	CRIPOLISE("Cripólise"), DAY_SPA("Day Spa"), DEPILACAO_LASER("Depilação a Laser"), DERMATOLOGIA("Dermatologia"), DESIGN_CILIOS_SOBRANCELHAS("Design de cilios e sobrancelha"), GL_FEG("GL e FEG"), HIDROGINASTICA("Hidroginástica"), LIMPEZA_PELE("Limpeza de pele"), MASSAGENS_RELAXANTES_TERAPEUTICAS("Massagens relaxantes e terapêuticas"), MICROPIGMENTACAO("Micropigmentação"), NATACAO_INFANTIL("Natação Infantil"), PEELING("Peeling"), PROJETO_100_DIAS("Projeto 100 dias"), OPERATORIO_CIRURGIA("Pré e pós operatóroio Cirurgia Plástica"), POS_MASTECTOMIA("Pós Mastectomia"), TRATAMENTO_ESTRIAS("Tratamento para estrias"), TRATAMENTO_FACIAL("Tratamento facial"), TRATAMENTO_GESTANTE("Tratamento para Gestantes"), TREINAMENTO_FUNCIONAL("Treinamento funcional"), NUTRICAO("Nutrição"), POWER_SHAPE("Power shape");

	private String valor;

	private Modalidade(String valor) {
		this.valor = valor;
	}

	public String getValor() {
		return valor;
	}

	public String getValue() {
		return name();
	}

	public static Modalidade createEnum(String value) {
		Modalidade retorno = null;
		for (Modalidade tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}
}
