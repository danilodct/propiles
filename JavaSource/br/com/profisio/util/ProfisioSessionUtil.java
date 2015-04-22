package br.com.profisio.util;

import java.util.Map;

import br.com.profisio.basics.Usuario;

import com.opensymphony.xwork2.ActionContext;

public class ProfisioSessionUtil {

	public static final String SESSION_USER = "profisio_user";

	public static final int FUNC_RELATORIO_FREQUENTES = 0;
	public static final int FUNC_RELATORIO_EFETIVIDADE = 1;
	public static final int FUNC_RELATORIOS = 2;
	public static final int FUNC_BIS = 3;

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

	public static boolean hasAccess(int funcRelatorioFrequentes, Tenant tenant) {
		boolean access = false;
		SystemUtils.assertObjectIsNotNullHasId(tenant);
		if (funcRelatorioFrequentes == FUNC_RELATORIO_FREQUENTES || funcRelatorioFrequentes == FUNC_RELATORIO_EFETIVIDADE || funcRelatorioFrequentes == FUNC_RELATORIOS || funcRelatorioFrequentes == FUNC_BIS) {
			if (tenant.getPlano() == Plano.PLANO_3 && !tenant.getAguardandoPagamento())
				access = true;
		}
		return access;
	}
}
