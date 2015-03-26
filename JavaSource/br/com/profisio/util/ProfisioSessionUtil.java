package br.com.profisio.util;

import java.util.Map;

import br.com.profisio.basics.Usuario;

import com.opensymphony.xwork2.ActionContext;

public class ProfisioSessionUtil {

	public static final String SESSION_USER = "profisio_user";
	public static final String SESSION_TENANT = "profisio_tenant";

	public static Map<String, Object> getSession() {
		return ActionContext.getContext().getSession();
	}

	public static void setSession(Map<String, Object> session) {
		ActionContext.getContext().setSession(session);
	}

	public static boolean isLogado() {
		return getSession().containsKey(SESSION_USER);
	}

	public static Usuario getUserSession() {
		return (Usuario) getSession().get(SESSION_USER);
	}

	public static Tenant getTenantSession() {
		Tenant tenant = null;
		Usuario user = (Usuario) getSession().get(SESSION_USER);
		if (user != null)
			tenant = user.getTenant();
		return tenant;
	}
}
