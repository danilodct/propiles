package br.com.profisio.util;

import java.lang.reflect.Method;
import java.util.Map;

public class ControllerBase {

	/**
	 * ASSERTION sanity check.
	 * 
	 * @param params
	 * @param list
	 * @return
	 */
	protected boolean assertParams(Map<String, Object> params, Method method) {
		// gets the param list stuff.
		ParamList plist = method.getAnnotation(ParamList.class);

		if (plist == null)
			return false;

		for (String param : plist.value()) {

			Object obj = params.get(param);

			if (obj == null)
				return false;
		}

		return true;
	}

	/**
	 * This is a neat hack to the get the current method we are in.
	 * 
	 * @param o
	 * @return
	 */
	public static final Method getCurrentMethod(Object o) {

		String s = Thread.currentThread().getStackTrace()[2].getMethodName();

		Method cm = null;
		for (Method m : o.getClass().getMethods()) {
			if (m.getName().equals(s)) {
				cm = m;
				break;
			}
		}

		return cm;
	}
}
