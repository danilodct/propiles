package br.com.pilates.util;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.swing.ImageIcon;

import br.com.pilates.base.Usuario;

import com.opensymphony.xwork2.ActionContext;

public class SystemUtils {

	public static boolean parseStringBoolean(String atividadeFisica) {
		boolean atividade = false;
		if (atividadeFisica != null && atividadeFisica.equals("on"))
			atividade = true;
		else
			atividade = false;
		return atividade;
	}

	public static Map<String, Object> getHttpSession() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		if (session == null) {
			session = new HashMap<String, Object>();
		}
		return session;
	}

	public static String parseDoubleToString(Double valor) {
		String valorStr = "";
		if (valor != null) {
			valorStr = "" + valor;
			String[] partes = valorStr.split("\\.");
			if ((partes[1]).length() == 1)
				valorStr = valorStr + "0";
			else if ((partes[1]).length() > 2)
				valorStr = valorStr.substring(0, valorStr.indexOf(".") + 3);
			valorStr = valorStr.replaceAll("\\.", ",");
		}
		String[] partes = valorStr.split(",");
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
		return valorStr;
	}

	public static Usuario getUserSession() {
		return (Usuario) getHttpSession().get(PilatesSessionUtil.SESSION_USER);
	}

	public static void setHttpSession(Map<String, Object> session) {
		ActionContext.getContext().setSession(session);
	}

	public static String getPath() {
		ServletContext sc = (ServletContext) ActionContext.getContext().get("com.opensymphony.xwork2.dispatcher.ServletContext");
		return sc.getRealPath("");
	}

	public static Integer[] getDimensoesImagem(String img) {
		Integer[] dimensoes = new Integer[2];
		ImageIcon icon = new ImageIcon(getPath() + img);
		dimensoes[0] = icon.getIconWidth();
		dimensoes[1] = icon.getIconHeight();
		return dimensoes;
	}

	public static Date getDataAtual() {
		return new Date(System.currentTimeMillis());
	}

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

	public static String parseDataToString(Date data) {
		String string = "";
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

	public static String parseFileName(String fileName) {
		fileName = removeAcentuacao(fileName);
		fileName = removeEspaco(fileName);
		return System.currentTimeMillis() + fileName;
	}

	public static String parseDataToMesNome(Date mesCompetencia) {
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
}
