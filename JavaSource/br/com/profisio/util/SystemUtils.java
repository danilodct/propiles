package br.com.profisio.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.swing.ImageIcon;

import org.apache.struts2.StrutsStatics;

import br.com.profisio.basics.ObjetoBasico;
import br.com.profisio.basics.Pessoa;
import br.com.profisio.basics.Usuario;

import com.opensymphony.xwork2.ActionContext;

public class SystemUtils {

	// PARSE 8888888888888888888888888888888888888888888888888888

	public static boolean parseStringBoolean(String valor) {
		boolean atividade = false;
		if (valor != null && (valor.equals("on") || (valor.equals("checked"))))
			atividade = true;
		else
			atividade = false;
		return atividade;
	}

	public static String parseDoubleToString(Double valor) {
		String valorStr = "";
		if (valor != null) {
			valorStr = "" + Math.abs(valor);
			String[] partes = valorStr.split("\\.");
			if ((partes[1]).length() == 1)
				valorStr = valorStr + "0";
			else if ((partes[1]).length() > 2)
				valorStr = valorStr.substring(0, valorStr.indexOf(".") + 3);
			valorStr = valorStr.replaceAll("\\.", ",");

			partes = valorStr.split(",");
			valorStr = partes[0];
			boolean temNumero = valorStr.length() > 3;
			while (temNumero) {
				String[] valorTemp = valorStr.split("\\.");
				String substring1 = valorStr.substring(0, valorTemp[0].length() - 3);
				String substring2 = valorStr.substring(valorTemp[0].length() - 3, valorStr.length());
				valorStr = substring1 + "." + substring2;
				temNumero = substring1.length() > 3;
			}
			valorStr += "," + partes[1];
			if (valor < 0)
				valorStr = "-" + valorStr;
		}
		return valorStr;
	}

	public static Double parseStringDouble(String valor) {
		Double valorDouble = 0.0;
		if (valor != null && !valor.trim().equals("")) {
			valor = valor.replaceAll("\\.", "");
			valor = valor.replaceAll("\\,", ".");
			valorDouble = Double.parseDouble(valor);
		}
		return valorDouble;
	}

	public static String parseDataToString(Date data) {
		String string = null;
		if (data != null) {
			Calendar cal = Calendar.getInstance();
			cal.setTime(data);
			String dia = cal.get(Calendar.DATE) + "";
			String mes = (cal.get(Calendar.MONTH) + 1) + "";
			String ano = cal.get(Calendar.YEAR) + "";
			if (data != null) {
				cal.setTime(data);
				if (dia.length() == 1) {
					dia = "0" + dia;
				}
				if (mes.length() == 1) {
					mes = "0" + mes;
				}
				if (ano.length() == 1) {
					ano = "0" + ano;
				}
			}
			string = dia + "/" + mes + "/" + ano;
		}
		return string;
	}

	public static String parseDataToStringEUA(Date data) {
		String string = null;
		if (data != null) {
			Calendar cal = Calendar.getInstance();
			cal.setTime(data);
			String dia = cal.get(Calendar.DATE) + "";
			String mes = (cal.get(Calendar.MONTH) + 1) + "";
			String ano = cal.get(Calendar.YEAR) + "";
			if (data != null) {
				cal.setTime(data);
				if (dia.length() == 1) {
					dia = "0" + dia;
				}
				if (mes.length() == 1) {
					mes = "0" + mes;
				}
				if (ano.length() == 1) {
					ano = "0" + ano;
				}
			}
			string = ano + "-" + mes + "-" + dia;
		}
		return string;
	}

	public static Date parseStringToDate(String data) {
		Date date = null;
		if (data != null && data.length() > 0) {
			String[] partes = data.split("[//-]");
			Calendar instance = GregorianCalendar.getInstance();
			instance.set(Calendar.YEAR, Integer.parseInt(partes[2]));
			instance.set(Calendar.MONTH, Integer.parseInt(partes[1]) - 1);
			instance.set(Calendar.DATE, Integer.parseInt(partes[0]));
			date = instance.getTime();
		}
		return date;
	}

	public static String parseFileName(String fileName) {
		fileName = removeAcentuacao(fileName);
		fileName = removeEspaco(fileName);
		return System.currentTimeMillis() + fileName;
	}

	public static String parseExceptionToXML(Exception e) {
		return "<error msg=\"" + e.getMessage() + "\" />";
	}

	// DATA
	// 888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

	public static String parseDataToNomeMes(Date mesCompetencia) {
		String resultado = "";
		if (mesCompetencia != null) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(mesCompetencia);
			int mes = calendar.get(Calendar.MONTH) + 1;
			if (mes == 1) {
				resultado = "Janeiro";
			} else if (mes == 2) {
				resultado = "Fevereiro";
			} else if (mes == 3) {
				resultado = "Março";
			} else if (mes == 4) {
				resultado = "Abril";
			} else if (mes == 5) {
				resultado = "Maio";
			} else if (mes == 6) {
				resultado = "Junho";
			} else if (mes == 7) {
				resultado = "Julho";
			} else if (mes == 8) {
				resultado = "Agosto";
			} else if (mes == 9) {
				resultado = "Setembro";
			} else if (mes == 10) {
				resultado = "Outubro";
			} else if (mes == 11) {
				resultado = "Novembro";
			} else if (mes == 12) {
				resultado = "Dezembro";
			}
		}
		return resultado;
	}

	public static Date setHoraData(Date dataFinal, int AM_PM, int hora, int minutos, int segundos) {
		if (dataFinal != null) {
			Calendar cal = GregorianCalendar.getInstance();
			cal.setTime(dataFinal);
			cal.set(Calendar.AM_PM, AM_PM);
			cal.set(Calendar.HOUR_OF_DAY, hora);
			cal.set(Calendar.MINUTE, minutos);
			cal.set(Calendar.SECOND, segundos);
			dataFinal = cal.getTime();
		}
		return dataFinal;
	}

	public static Date getDataAtual() {
		return new Date(System.currentTimeMillis());
	}

	public static void gerarNiver(Pessoa colaborador) {
		if (colaborador.getDataNascimento() != null) {
			Calendar instance = Calendar.getInstance();
			instance.setTime(colaborador.getDataNascimento());
			String mes = (instance.get(Calendar.MONTH) + 1) + "";
			if (mes.length() == 1) {
				mes = "0" + mes;
			}
			String dia = instance.get(Calendar.DAY_OF_MONTH) + "";
			if (dia.length() == 1) {
				dia = "0" + dia;
			}
			String mesDia = mes + "/" + dia;
			colaborador.setNiver(mesDia);
		}
	}

	// SESSÃO 8888888888888888888888888888888888888888888888888888

	public static Map<String, Object> getHttpSession() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		if (session == null) {
			session = new HashMap<String, Object>();
		}
		return session;
	}

	public static Usuario getUserSession() {
		return (Usuario) getHttpSession().get(ProfisioSessionUtil.SESSION_USER);
	}

	public static void setHttpSession(Map<String, Object> session) {
		ActionContext.getContext().setSession(session);
	}

	public static String getPath() {
		ServletContext sc = (ServletContext) ActionContext.getContext().get(StrutsStatics.SERVLET_CONTEXT);
		return sc.getRealPath("");
	}

	// IMAGEM 88888888888888888888888888888888888888888888888

	public static Integer[] getDimensoesImagem(String img) {
		Integer[] dimensoes = new Integer[2];
		ImageIcon icon = new ImageIcon(getPath() + img);
		dimensoes[0] = icon.getIconWidth();
		dimensoes[1] = icon.getIconHeight();
		return dimensoes;
	}

	// STRING 888888888888888888888888888888888888888888888888888888888888888

	public static String removeAcentuacao(String s) {
		s = s.replaceAll("[èéêëÈÉÊË]", "e");
		s = s.replaceAll("[ûùüúÛÙÜÚ]", "u");
		s = s.replaceAll("[íÍ]", "i");
		s = s.replaceAll("[àãâáÀÃÂÁ]", "a");
		s = s.replaceAll("[ôõóÔÕÓ]", "o");
		s = s.replaceAll("[çÇ]", "c");
		s = s.replaceAll("[ÈÉÊË]", "E");
		s = s.replaceAll("[ÛÙÜÚ]", "U");
		s = s.replaceAll("[Í]", "I");
		s = s.replaceAll("[ÀÃÂÁ]", "A");
		s = s.replaceAll("[ÔÕÓ]", "O");
		s = s.replaceAll("[Ç]", "C");
		return s;
	}

	public static String removeEspaco(String s) {
		return s.replaceAll(" ", "_");
	}

	public static String[] getApenasTags(String tags) {
		tags = tags.toLowerCase();
		tags = " " + tags + " ";
		String preposicoes_e_artigos[] = { "a", "ante", "apos", "ate", "com", "contra", "de", "desde", "em", "entre", "para", "per", "perante", "por", "sem", "sob", "sobre", "tras" };

		tags = tags.replace(" ", "  ");
		for (int i = 0; i < preposicoes_e_artigos.length; i++) {
			tags = tags.replace(" " + preposicoes_e_artigos[i] + " ", " ");
		}

		String result[] = tags.split(" ");

		tags = " ";
		for (int i = 0; i < result.length; i++) {
			if ((result[i].length() > 1) && !(tags).contains(" " + result[i] + " ")) {
				tags += result[i] + " ";
			}
		}

		result = tags.split(" ");

		return result;
	}

	public static String setNomeArquivo(String url) {
		url = removeAcentuacao(url);
		url = removeEspaco(url);
		return url.toLowerCase();
	}

	public static String formatarNumeroQtdAlgarismos(Integer valor, Integer qtd) {
		String retorno = "";
		if (valor != null && qtd != null) {
			int valorQtd = ("" + valor).length();
			for (int i = qtd - valorQtd; i > 0; i -= 1) {
				retorno += "0";
			}
			retorno += valor;
		}
		return retorno;
	}

	public static String retirarUltimoCaracter(String str) {
		if (str.length() > 0) {
			str = str.substring(0, str.length() - 1);
		}
		return str;
	}

	public static String gerarNumRefPagamento(Integer num) {
		String numRef = "";
		if (num == null)
			throw new ProfisioException(ProfisioBundleUtil.NO_OBJECT_SELECTED);
		Integer qtdNum = 5;
		numRef = "" + num;
		while (numRef.length() < qtdNum) {
			numRef = "0" + numRef;
		}
		return numRef;
	}

	// ORDENACAO 888888888888888888888888888888888888888888888888888888888888888

	public static String orderLabelValue(String valores) {
		String retorno = "";
		String[] partesOriginal = valores.split(";");
		boolean mudou = false;
		for (int i = 0; i < partesOriginal.length; i += 1) {
			String dadosStr = partesOriginal[i];
			String[] dados = dadosStr.split(",");
			Double valor = Double.parseDouble(dados[1]);
			int novoI = i;
			for (int j = i + 1; j < partesOriginal.length; j += 1) {
				String[] proximosDados = partesOriginal[j].split(",");
				Double proximoValor = Double.parseDouble(proximosDados[1]);
				if (valor > proximoValor) {
					partesOriginal[novoI] = partesOriginal[j];
					partesOriginal[j] = dadosStr;
					novoI = j;
					mudou = true;
				}
			}
			if (mudou) {
				i = -1;
				mudou = false;
			}
		}
		for (int i = partesOriginal.length - 1; i >= 0; i -= 1) {
			String valoresRetorno = partesOriginal[i];
			String[] valoresRetornoArray = valoresRetorno.split(",");
			retorno += valoresRetornoArray[0] + "," + valoresRetornoArray[1] + ";";
		}
		if (retorno.length() > 0) {
			retorno = retorno.substring(0, retorno.length() - 1);
		}
		return retorno;
	}

	@SuppressWarnings("resource")
	public void copyFile(File in, File out) {
		try {
			FileChannel sourceChannel = new FileInputStream(in).getChannel();
			FileChannel destinationChannel = new FileOutputStream(out).getChannel();
			sourceChannel.transferTo(0L, sourceChannel.size(), destinationChannel);
			sourceChannel.close();
			destinationChannel.close();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

	// ASSERTS
	// 88888888888888888888888888888888888888888888888888888888888888888888888

	public static void assertObjectIsNotNullHasId(ObjetoBasico objeto) {
		if (objeto == null || objeto.getId() == null || objeto.getId().intValue() == -1)
			throw new ProfisioException(ProfisioBundleUtil.NO_OBJECT_SELECTED);
	}

	public static void assertObjectIsNotNull(ObjetoBasico objeto) {
		if (objeto == null)
			throw new ProfisioException(ProfisioBundleUtil.NO_OBJECT_SELECTED);
	}

	public static Date getPrimeiroDiaMesAtual(Date mes) {
		Calendar calendar = Calendar.getInstance();
		if (mes != null)
			calendar.setTime(mes);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.set(Calendar.AM_PM, Calendar.AM);
		calendar.set(Calendar.HOUR, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		return calendar.getTime();
	}

	public static Date getUltimoDiaMesAtual(Date mes) {
		Calendar calendar = Calendar.getInstance();
		if (mes != null)
			calendar.setTime(mes);
		calendar.set(Calendar.AM_PM, Calendar.PM);
		calendar.set(Calendar.HOUR, 11);
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 59);
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		return calendar.getTime();
	}

	public static Date getHoje() {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.AM_PM, Calendar.AM);
		calendar.set(Calendar.HOUR, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		return calendar.getTime();
	}

	public static Date setHoraData(Date data, String hora) {
		if (data != null) {
			Calendar calendar = GregorianCalendar.getInstance();
			calendar.setTime(data);
			if (hora == null) {
				String minutos = String.valueOf(calendar.get(Calendar.MINUTE));
				if (minutos.length() == 1)
					minutos = "0" + minutos;
				hora = calendar.get(Calendar.HOUR_OF_DAY) + ":" + minutos;
			} else {
				if (hora.length() == 1)
					hora = "0" + hora + ":00";
				else if (hora.length() == 2)
					hora = hora + ":00";
				else if (hora.length() == 3)
					hora = hora + "00";
				else if (hora.length() == 4)
					hora = hora + "0";
			}

			String[] split = hora.split(":");
			if (Integer.parseInt(split[0]) > 12) {
				split[0] = "" + (Integer.parseInt(split[0]) - 12);
				calendar.set(Calendar.AM_PM, Calendar.PM);
			} else {
				calendar.set(Calendar.AM_PM, Calendar.AM);
			}
			calendar.set(Calendar.HOUR, Integer.parseInt(split[0]));
			calendar.set(Calendar.MINUTE, Integer.parseInt(split[1]));
			data = calendar.getTime();
		}
		return data;
	}

	public static String getHoraData(Date data) {
		String horario = "";
		if (data != null) {
			Calendar calendar = GregorianCalendar.getInstance();
			calendar.setTime(data);
			String hora = calendar.get(Calendar.HOUR_OF_DAY) + "";
			String minutos = calendar.get(Calendar.MINUTE) + "";
			if (hora.length() == 1)
				hora = "0" + hora;
			if (minutos.length() == 1)
				minutos = "0" + minutos;
			horario = hora + ":" + minutos;
		}
		return horario;
	}

	public static Date aumentarMinutosData(Date data, String duracaoStr) {
		if (data != null && duracaoStr != null && !duracaoStr.trim().equals("")) {
			Double duracao = Double.parseDouble(duracaoStr);
			String horaData = SystemUtils.getHoraData(data);
			String[] partes = horaData.split(":");
			Double horas = Double.parseDouble(partes[0]);
			Double minutos = Double.parseDouble(partes[1]);
			Double minutosTotal = (horas * 60) + minutos + duracao;
			Double horasFinal = Math.floor(minutosTotal / 60);
			Double decimais = (minutosTotal / 60) - horasFinal;
			Double minutosFinal = decimais * 60;
			data = SystemUtils.setHoraData(data, SystemUtils.formatarNumeroQtdAlgarismos(horasFinal.intValue(), 2) + ":" + SystemUtils.formatarNumeroQtdAlgarismos(minutosFinal.intValue(), 2));
		}
		return data;
	}

	public static Double parseBytesToMegabytes(Double length) {
		return (length / 1024) / 1024;
	}

	public static String tratarFileName(String url) {
		if (url != null) {
			url = removeAcentuacao(url);
			url = replaceEspacoUnderLine(url);
			url = url.toLowerCase();
		}
		return url;
	}

	public static String replaceEspacoUnderLine(String s) {
		if (s != null)
			s = s.replaceAll(" ", "_");
		return s;
	}

	// 88888888888888888888888888888888888888888888888888888888888888888888888888888888

	public static void assertObjectIsFromTenant(Tenant tenant, ObjetoBasico objeto) {
		if (tenant != null && objeto != null) {
			if (tenant.getId() != null && objeto.getTenant() != null && objeto.getTenant().getId() != null) {
				if (tenant.getId().intValue() != objeto.getTenant().getId().intValue())
					throw new ProfisioException(ProfisioBundleUtil.ITEM_NAO_PERTENCE_TENANT);
			}
		}
	}

	// 88888888888888888888888888888888888888888888888888888888888888888888888888888888
	//PAGINACAO

	public static int getStartPaginacao(Integer pagAtual, Integer pagSize) {
		return (pagAtual - 1) * pagSize;
	}

	public static int getEndPaginacao(Integer pagAtual, Double qtdPag, Integer pagSizeFixed) {
		Double round = Math.floor(qtdPag);
		Integer pagSize = pagSizeFixed;
		if (round.intValue() == pagAtual - 1) {
			long round2 = Math.round(Math.floor(qtdPag));
			double d = qtdPag - round2;
			double e = d * pagSizeFixed;
			pagSize = new Double(e).intValue();
		}
		int start = SystemUtils.getStartPaginacao(pagAtual, pagSizeFixed);
		return start + pagSize;
	}
}
