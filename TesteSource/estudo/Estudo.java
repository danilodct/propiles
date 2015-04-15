package estudo;

import br.com.profisio.basics.TransacaoPagamento;

public class Estudo {

	public static void main(String[] args) {
		TransacaoPagamento trans = new TransacaoPagamento();
		trans.setUrl("https://sandbox.pagseguro.uol.com.br/checkout/nc/sender-identification.jhtml?f=asdf&t=de6fd074e5a02cb62e341285768c81fd&d=danilo.dct@gmail.com");
		System.out.println(trans.getCodigo());
	}

}