package br.com.profisio.util;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;
import org.apache.struts2.interceptor.SessionAware;

import br.com.profisio.basics.Usuario;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

@SuppressWarnings("serial")
public class LoginInterceptor implements SessionAware, Interceptor {

	public static final String NOT_LOGGED = "not_logged";
	public static final String PAGE_REQUIRED = "pageRequired";

	@SuppressWarnings("unused")
	private Map<String, Object> session;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		String status = null;
		ActionContext context = invocation.getInvocationContext();
		HttpServletRequest request = (HttpServletRequest) context.get(StrutsStatics.HTTP_REQUEST);
		Map<String, Object> session = SystemUtils.getHttpSession();
		Usuario user = (Usuario) session.get(ProfisioSessionUtil.SESSION_USER);
		if (user == null) {
			session.put(PAGE_REQUIRED, request.getRequestURL());
			status = NOT_LOGGED;
		} else {
			status = invocation.invoke();
		}
		return status;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public void destroy() {
	}

	@Override
	public void init() {
	}
}
