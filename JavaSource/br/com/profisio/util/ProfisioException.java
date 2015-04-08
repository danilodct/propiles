package br.com.profisio.util;

@SuppressWarnings("serial")
public class ProfisioException extends RuntimeException {

	public static final String EXCEPTION_MSG = "Ocorreu um erro interno e sua requisição não pode ser processada. O administrador foi notificado e pedimos que tente novamente em breve. Desculpe-nos pelo transtorno.";

	public ProfisioException(String messageKey, Object... params) {
		super(ProfisioBundleUtil.getMsgError(messageKey, params));
	}
}
