package br.com.pilates.excecao;

import br.com.pilates.util.PilatesBundleUtil;

@SuppressWarnings("serial")
public class CPFExistenteException extends PilatesException {
	
	public CPFExistenteException() {
		super(PilatesBundleUtil.CPF_JA_CADASTRADO);
	}
	
}
