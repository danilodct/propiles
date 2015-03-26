package br.com.pilates.util;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

public class PilatesBundleUtil {
	
	public static final String PROPERTIES_ERROR = "error";
	public static final String PROPERTIES_MSG = "msg";
	
	public static final String ERRO_ENVIO_EMAIL = "ERRO_ENVIO_EMAIL";
	public static final String NO_OBJECT_SELECTED = "NO_OBJECT_SELECTED";
	public static final String LOGIN_INCORRETO = "LOGIN_INCORRETO";
	public static final String NOME_CLIENTE_OBRIGATORIO = "NOME_CLIENTE_OBRIGATORIO";
	public static final String CPF_CLIENTE_OBRIGATORIO = "CPF_CLIENTE_OBRIGATORIO";
	public static final String CPF_JA_CADASTRADO = "CPF_JA_CADASTRADO";
	public static final String NENHUM_PROFESSOR_SELECIONADO = "NENHUM_PROFESSOR_SELECIONADO";
	public static final String CADASTRO_SUCESSO = "CADASTRO_SUCESSO";
	public static final String ALTERACAO_SUCESSO = "ALTERACAO_SUCESSO";
	public static final String REMOCAO_SUCESSO = "REMOCAO_SUCESSO";
	
	public static String getMsgError(String key) {
		return getMsg("error", key);
	}
	
	public static String getMsg(String key) {
		return getMsg("msg", key);
	}
	
	public static String getMsgError(String key, ArrayList<String> params) {
		return getMsg("error", key, params);
	}
	
	public static String getMsg(String key, ArrayList<String> params) {
		return getMsg("msg", key, params);
	}
	
	public static String getMsg(String file, String key) {
		ResourceBundle bundle = ResourceBundle.getBundle(file);
		return bundle.getString(key);
	}
	
	public static String getMsg(String file, String key, ArrayList<String> params) {
		ResourceBundle bundle = ResourceBundle.getBundle(file);
		String str = bundle.getString(key);
		if (params != null) {
			for (int i = 0; i < params.size(); i += 1) {
				str = str.replaceAll("\\[" + i + "\\]", params.get(i));
			}
		}
		return str;
	}
	
	public static Enumeration<String> getAllKeys(String file) {
		ResourceBundle bundle = ResourceBundle.getBundle(file);
		return bundle.getKeys();
	}
	
	public static Map<String, String> getAllKeysMap(String file) {
		Map<String, String> map = new HashMap<String, String>();
		Enumeration<String> allKeys = getAllKeys(file);
		String key = "";
		while (allKeys.hasMoreElements()) {
			key = allKeys.nextElement();
			map.put(key, getMsg(file, key));
		}
		return map;
	}
}
