package br.com.pilates.base.enums;

public enum FormaPagamento {

	DEBITO("Débito", 0.025, 0), DINHEIRO("Dinheiro", 0.0, 0), CHEQUE_1("Cheque 1x", 0.0, 1), CHEQUE_2("Cheque 2x", 0.0, 2), CHEQUE_3("Cheque 3x", 0.0, 3), CHEQUE_4("Cheque 4x", 0.0, 4), CHEQUE_5("Cheque 5x", 0.0, 5), CHEQUE_6("Cheque 6x", 0.0, 6), CREDITO_1("Crédito 1x", 0.025, 1), CREDITO_2("Crédito 2x", 0.0425, 2), CREDITO_3("Crédito 3x", 0.0425, 3), CREDITO_4("Crédito 4x", 0.0425, 4), CREDITO_5("Crédito 5x", 0.0425, 5), CREDITO_6("Crédito 6x", 0.0425, 6);

	private String valor;
	private double desconto;
	private int qtdParcelas;

	private FormaPagamento(String valor, double desconto, int qtdParcelas) {
		this.valor = valor;
		this.desconto = desconto;
		this.qtdParcelas = qtdParcelas;
	}

	public double getQtdParcelas() {
		return qtdParcelas;
	}

	public double getDesconto() {
		return desconto;
	}

	public String getValor() {
		return valor;
	}

	public String getValue() {
		return name();
	}

	public static FormaPagamento createEnum(String value) {
		FormaPagamento retorno = null;
		for (FormaPagamento tipo : values()) {
			if (tipo.name().equals(value)) {
				retorno = tipo;
			}
		}
		return retorno;
	}

}
