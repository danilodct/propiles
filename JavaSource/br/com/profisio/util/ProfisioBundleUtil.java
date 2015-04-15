package br.com.profisio.util;

import java.text.MessageFormat;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

public class ProfisioBundleUtil {

	public static final String PROPERTIES_ERROR = "error";
	public static final String PROPERTIES_MSG = "msg";

	public static final String ERRO_ENVIO_EMAIL = "ERRO_ENVIO_EMAIL";
	public static final String NO_OBJECT_SELECTED = "NO_OBJECT_SELECTED";
	public static final String LOGIN_INCORRETO = "LOGIN_INCORRETO";
	public static final String NOME_OBRIGATORIO = "NOME_OBRIGATORIO";
	public static final String CPF_CLIENTE_OBRIGATORIO = "CPF_CLIENTE_OBRIGATORIO";
	public static final String CPF_JA_CADASTRADO = "CPF_JA_CADASTRADO";
	public static final String NENHUM_COLABORADOR_SELECIONADO = "NENHUM_COLABORADOR_SELECIONADO";
	public static final String CADASTRO_SUCESSO = "CADASTRO_SUCESSO";
	public static final String ALTERACAO_SUCESSO = "ALTERACAO_SUCESSO";
	public static final String REMOCAO_SUCESSO = "REMOCAO_SUCESSO";
	public static final String INFORME_QTD_PRODUTOS = "INFORME_QTD_PRODUTOS";
	public static final String LOGIN_OBRIGATORIO = "LOGIN_OBRIGATORIO";
	public static final String SENHA_OBRIGATORIA = "SENHA_OBRIGATORIA";
	public static final String LOGIN_JA_EXISTE = "LOGIN_JA_EXISTE";
	public static final String INFORME_COLABORADOR = "INFORME_COLABORADOR";
	public static final String INFORME_SERVICO = "INFORME_SERVICO";
	public static final String CENTRO_CUSTO_OBRIGATORIO = "CENTRO_CUSTO_OBRIGATORIO";
	public static final String FORMA_CONHECIMENTO_INVALIDA = "FORMA_CONHECIMENTO_INVALIDA";
	public static final String NOME_CLIENTE_OBRIGATORIO = "NOME_CLIENTE_OBRIGATORIO";
	public static final String CLIENTE_NAO_INFORMADO = "CLIENTE_NAO_INFORMADO";
	public static final String CONTRATO_NAO_INFORMADO = "CONTRATO_NAO_INFORMADO";
	public static final String INFORME_DATA = "INFORME_DATA";
	public static final String INFORME_ATIVIDADE = "INFORME_ATIVIDADE";
	public static final String INFORME_FORMA_PAGAMENTO = "INFORME_FORMA_PAGAMENTO";
	public static final String INFORME_VALOR = "INFORME_VALOR";
	public static final String INFORME_CATEGORIA = "INFORME_CATEGORIA";
	public static final String INFORME_STATUS = "INFORME_STATUS";
	public static final String INFORME_TIPO_CUSTO = "INFORME_TIPO_CUSTO";
	public static final String TIPO_INVALIDO = "TIPO_INVALIDO";
	public static final String ATIVIDADE_JA_EXISTE = "ATIVIDADE_JA_EXISTE";
	public static final String INFORME_VENDEDOR = "INFORME_VENDEDOR";
	public static final String INFORME_PRODUTO = "INFORME_PRODUTO";
	public static final String INFORME_MES_COMPETENCIA = "INFORME_MES_COMPETENCIA";
	public static final String ATIVIDADE_DUPLICADA = "ATIVIDADE_DUPLICADA";
	public static final String INFORME_QTDSESSOES = "INFORME_QTDSESSOES";
	public static final String INFORME_PAGAMENTO_FREQUENCIA = "INFORME_PAGAMENTO_FREQUENCIA";
	public static final String QTD_MAX_SESSOES_ATINGIDAS_PAGAMENTO = "QTD_MAX_SESSOES_ATINGIDAS_PAGAMENTO";
	public static final String INFORME_TITULO = "INFORME_TITULO";
	public static final String ITEM_NAO_PERTENCE_TENANT = "ITEM_NAO_PERTENCE_TENANT";
	public static final String INFORME_TODOS_DADOS = "INFORME_TODOS_DADOS";
	public static final String EMAIL_OBRIGATORIO = "EMAIL_OBRIGATORIO";
	public static final String EMAIL_JA_CADASTRADO = "EMAIL_JA_CADASTRADO";
	public static final String VERIFIQUE_EMAIL = "VERIFIQUE_EMAIL";
	public static final String ERRO_CONFIRMAR_CADASTRO = "ERRO_CONFIRMAR_CADASTRO";
	public static final String CADASTRO_NAO_CONFIRMADO = "CADASTRO_NAO_CONFIRMADO";
	public static final String REENVIADO_EMAIL_CONFIRMACAO = "REENVIADO_EMAIL_CONFIRMACAO";
	public static final String ERRO_REENVIAR_CONFIRMACAO = "ERRO_REENVIAR_CONFIRMACAO";
	public static final String CONFIRMADO_SUCESSO = "CONFIRMADO_SUCESSO";
	public static final String INFORME_EMAIL = "INFORME_EMAIL";
	public static final String ESQUECEU_SENHA_ENVIADO = "ESQUECEU_SENHA_ENVIADO";
	public static final String EMAIL_INEXISTENTE = "EMAIL_INEXISTENTE";
	public static final String MENSAGEM_ENVIADA = "MENSAGEM_ENVIADA";
	public static final String INFORME_EMAIL_FONE = "INFORME_EMAIL_FONE";
	public static final String FILE_SIZE_MAXIMO = "FILE_SIZE_MAXIMO";
	public static final String ERRO_SALVAR_ARQUIVO = "ERRO_SALVAR_ARQUIVO";
	public static final String INFORME_PLANO = "INFORME_PLANO";
	public static final String ERRO_COMUNICACAO_EMPRESA_PAGAMENTO = "ERRO_COMUNICACAO_EMPRESA_PAGAMENTO";
	public static final String ERRO_ATUALIZACAO_PAGAMENTO = "ERRO_ATUALIZACAO_PAGAMENTO";

	public static String getMsgError(String key, Object... params) {
		return getMsgFile("error", key, params);
	}

	public static String getMsg(String key, Object... params) {
		return getMsgFile("msg", key, params);
	}

	public static String getMsgFile(String file, String key, Object... params) {
		ResourceBundle bundle = ResourceBundle.getBundle(file);
		return MessageFormat.format(bundle.getString(key), params);
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
