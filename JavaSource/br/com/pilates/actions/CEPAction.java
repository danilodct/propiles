package br.com.pilates.actions;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import br.com.pilates.util.byjg.webservices.ByJGBaseWebService;
import br.com.pilates.util.byjg.webservices.cep.CEPService;

@SuppressWarnings("serial")
public class CEPAction extends PilatesActionSupport {

	private String cep;
	private static final String URL_WEBSERVICE_BUSCAR_CEP = "http://viacep.com.br/ws/";// 54230-151/xml/";

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

	public String actionTeste() {
		try {
			CEPService cep = new CEPService(ByJGBaseWebService.USER, ByJGBaseWebService.PASSWORD);
			this.cep = (cep.obterVersao());
			this.cep += " - ";
			this.cep += cep.obterLogradouro("53130410");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return REDIRECT;
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
}
