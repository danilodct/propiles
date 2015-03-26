package br.com.profisio.basics.enums;

public enum TipoMovimentacao {

	CONTA_PAGAR("Conta a pagar"), CONTA_RECEBER("Conta a receber"), VENDA("Vendas");

	private String valor;

	private TipoMovimentacao(String valor) {
		this.valor = valor;
	}

	public String getValor() {
		return this.valor;
	}

	public String getValue() {
		return this.name();
	}

	public static TipoMovimentacao createEnum(String value) {
		TipoMovimentacao retorno = null;
		for (TipoMovimentacao tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}

}
