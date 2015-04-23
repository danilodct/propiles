package br.com.profisio.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.struts2.ServletActionContext;

import br.com.profisio.basics.Servico;
import br.com.profisio.servico.ServicoControl;

import com.opensymphony.xwork2.ActionSupport;

public class ProfisioActionSupport extends ActionSupport {

	private static final long serialVersionUID = -4501839851158225405L;

	public static final String XML_HEAD = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>";
	public static final String ERROR_CPF = "error_cpf";
	public static final String REDIRECT = "redirect";
	public static final String LOGADO = "logado";
	public static final String SEPARADOR = "-";
	public static final String SEPARADOR_ESPACO = " ";
	public static final String OUTRA = "OUTRA";

	//PAGINAÇÃO
	private Integer pagAtual, qtdPaginas, qtdItens;

	//variáveis do getCEP
	private String cep;
	private static final String URL_WEBSERVICE_BUSCAR_CEP = "http://viacep.com.br/ws/";

	public String redirect() {
		return REDIRECT;
	}

	// GET CEP  8888888888888888888888888888888888888888888888888888888888888888

	public String actionBuscarCEP() {
		String retorno = sendGetRequest(URL_WEBSERVICE_BUSCAR_CEP + cep + "/xml/", null);
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			if (response != null) {
				response.setContentType("text/xml");
				response.getWriter().print(retorno);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	private static String sendGetRequest(String endpoint, String requestParameters) {
		String result = null;
		if (endpoint.startsWith("http://")) {
			try {
				String urlStr = endpoint;
				if ((requestParameters != null) && (requestParameters.length() > 0)) {
					urlStr = urlStr + "?" + requestParameters;
				}
				URL url = new URL(urlStr);
				URLConnection conn = url.openConnection();

				BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuffer sb = new StringBuffer();
				String line;
				while ((line = rd.readLine()) != null) {
					sb.append(line);
				}
				rd.close();
				result = sb.toString();
				/*
				 * try { byte[] tituloBytes = result.getBytes("UTF-8"); result =
				 * new String(tituloBytes); } catch
				 * (UnsupportedEncodingException e) { e.printStackTrace(); }
				 */
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public String getCep() {
		return this.cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	// 8888888888888888888888888888888888888888888888888888888888888888888888888
	// XML

	public void printResponse(String xml) {
		xml = StringEscapeUtils.escapeXml(xml);
		xml = xml.replaceAll("&lt;", "<");
		xml = xml.replaceAll("&gt;", ">");
		xml = xml.replaceAll("&apos;", "'");
		xml = xml.replaceAll("&quot;", "'");
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			if (response != null) {
				response.setContentType("text/xml");
				response.getWriter().print(xml);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 8888888888888888888888888888888888888888888888888888888888888888888888888
	// EXCEPTION

	public void dealException(Exception e) {
		String message = e.getMessage();
		if (!(e instanceof ProfisioException) || e.getMessage().equalsIgnoreCase("Objeto Nulo")) {
			e.printStackTrace();
			message = ProfisioException.EXCEPTION_MSG;
			Mailer mailer = new Mailer();
			mailer.sendMail("danilo.dct@gmail.com", "[ProPilEs Vanity] Error", "Usuário: " + ProfisioSessionUtil.getUserSession().getId() + " \n" + ExceptionUtils.getStackTrace(e));
			System.out.println("mandou gerar o email...");
		}
		addActionError(message);
	}

	// 8888888888888888888888888888888888888888888888888888888888888888888888888

	public Collection<Servico> getAllServicos() {
		return ServicoControl.getInstance().getServicos(null);
	}

	// 8888888888888888888888888888888888888888888888888888888888888888888888888
	//PAGINAÇÃO

	public Integer getPagAtual() {
		return pagAtual;
	}

	public void setPagAtual(Integer pagAtual) {
		this.pagAtual = pagAtual;
	}

	public void setQtdPaginas(Double qtdPaginas) {
		this.qtdPaginas = new Double(Math.round(Math.ceil(qtdPaginas))).intValue();
	}

	public Collection<ItemGeralUI> getQtdPaginas() {
		Collection<ItemGeralUI> qtdPaginas = new ArrayList<ItemGeralUI>();
		if (this.qtdPaginas > 0) {
			for (int i = 1; i <= this.qtdPaginas; i += 1) {
				qtdPaginas.add(new ItemGeralUI(i + "", i + ""));
			}
		}
		return qtdPaginas;
	}

	public Integer getQtdItens() {
		return qtdItens;
	}

	public void setQtdItens(Integer qtdItens) {
		this.qtdItens = qtdItens;
	}

}
