package br.com.profisio.util;

@SuppressWarnings("serial")
public class ProfisioException extends RuntimeException {

	public static final String EXCEPTION_MSG = "Ocorreu um erro de sistema e o administrador está sendo notificado. Desculpe-nos pelo transtorno.";

	public ProfisioException(String messageKey) {
		super(ProfisioBundleUtil.getMsgError(messageKey));
	}
}
