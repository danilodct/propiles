package br.com.profisio.util;

import org.apache.log4j.Logger;

import br.com.profisio.basics.Usuario;

public class ProfisioLoggerUtil {

	public static void info(String info) {
		Logger logger = Logger.getLogger("propiles");
		Usuario userSession = ProfisioSessionUtil.getUserSession();
		if (userSession != null && userSession.getId() != null)
			info = "[USER: " + userSession.getId() + "] " + info;
		logger.info(info);
	}

}
