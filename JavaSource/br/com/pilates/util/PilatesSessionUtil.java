package br.com.pilates.util;

import java.util.Map;

import br.com.pilates.base.Usuario;

import com.opensymphony.xwork2.ActionContext;

public class PilatesSessionUtil {
	
	public static final String SESSION_USER = "pilates_user";
	
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
}
