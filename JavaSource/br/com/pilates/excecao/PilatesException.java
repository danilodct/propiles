package br.com.pilates.excecao;

import br.com.pilates.util.PilatesBundleUtil;

@SuppressWarnings("serial")
public class PilatesException extends RuntimeException {
	
	public PilatesException(String messageKey) {
		super(PilatesBundleUtil.getMsgError(messageKey));
	}
}
