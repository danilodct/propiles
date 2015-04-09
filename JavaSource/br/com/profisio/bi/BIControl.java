package br.com.profisio.bi;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.TreeMap;

import br.com.profisio.basics.Cadastro;
import br.com.profisio.basics.CentroCusto;
import br.com.profisio.basics.FormaConhecimento;
import br.com.profisio.basics.Servico;
import br.com.profisio.basics.TipoContaPagar;
import br.com.profisio.basics.enums.EstadoCivil;
import br.com.profisio.basics.enums.Sexo;
import br.com.profisio.basics.enums.TipoCusto;
import br.com.profisio.relatorio.RelatorioControl;
import br.com.profisio.servico.ServicoControl;
import br.com.profisio.util.ControllerBase;
import br.com.profisio.util.OrdenadorMapDouble;
import br.com.profisio.util.OrdenadorMapInteger;
import br.com.profisio.util.OrdenadorMapIntegerDouble;
import br.com.profisio.util.SystemUtils;

public class BIControl extends ControllerBase {

	private final static List<String> colors = Arrays.asList("#7BB3AA", "#1D8E88", "#57A587", "#D31F3A", "#F88C20", "#5F4A49", "#E4DC17", "#F6F5AB", "#A1B347", "#B48051", "#B8B45D", "#D2D3E6", "#FCDE96", "#8CB8A9", "#86664F", "#DD4D07", "#B1D0A4", "#607AAD", "#84CAD7", "#E49263", "#55897D");

	private static BIControl instance = null;
	private BIDAO dao = null;

	private BIControl() {
		dao = (BIDAO) BIDAO.daoFactory();
	}

	public static BIControl getInstance() {
		if (instance == null)
			instance = new BIControl();
		return instance;
	}

	public String getBIUsoMidias(Date dataInicial, Date dataFinal) {
		String retorno = "[";
		// se o usuário nao informou data inicio e fim, vai pegar o mes atual
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);
		}
		Collection<FormaConhecimento> allFormasConhecimento = this.dao.getAllMidiasOrderQtdCadastros(dataInicial, dataFinal);
		if (allFormasConhecimento != null && allFormasConhecimento.size() > 0) {
			for (FormaConhecimento forma : allFormasConhecimento) {
				Integer qtd = this.dao.getQtdNovosCadastros(dataInicial, dataFinal, forma.getNome());
				retorno += ",{\"MIDIA\":\"" + forma.getNome() + "\", \"valor\":" + qtd + ", \"cor\":\"" + pickColor() + "\"}";
			}
		}
		if (allFormasConhecimento.size() > 0)
			retorno = retorno.replace("[,", "[");
		retorno += "]";
		return retorno;
	}

	public String getBIEvolucaoMidiaCadastros(Date dataInicial, Date dataFinal, String midia) {
		String retorno = "[";
		// se o usuário nao informou data inicio e fim, vai pegar o mes atual
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);
		}
		if (dataFinal == null)
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);

		while (dataInicial.compareTo(dataFinal) < 0) {
			// pegar o ultimo dia do mes referente a dataInicial
			Calendar cal = Calendar.getInstance();
			cal.setTime(dataInicial);
			cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
			cal.setTime(SystemUtils.setHoraData(cal.getTime(), Calendar.PM, 23, 59, 59));

			Integer qtdMidias = this.dao.getQtdNovosCadastros(dataInicial, cal.getTime(), midia);
			Integer qtdCadastros = this.dao.getQtdNovosCadastros(dataInicial, cal.getTime(), null);
			retorno += ",{\"AM_REF\":\"" + cal.get(Calendar.YEAR) + "/" + SystemUtils.formatarNumeroQtdAlgarismos(cal.get(Calendar.MONTH) + 1, 2) + "\", \"qtdMidia\":" + qtdMidias + ", \"qtdCadastros\":" + qtdCadastros + ", \"cor\":\"" + pickColor() + "\"}";

			cal.setTime(dataInicial);
			cal.set(Calendar.MONTH, cal.get(Calendar.MONTH) + 1);
			dataInicial = cal.getTime();
		}
		if (retorno.length() > 1)
			retorno = retorno.replace("[,", "[");
		retorno += "]";
		return retorno;
	}

	private String pickColor() {
		Random randomGenerator = new Random();
		String cor = colors.get(randomGenerator.nextInt(colors.size()));
		return cor;
	}

	public String getBICadastrosByBairro(Date dataInicial, Date dataFinal) {
		String retorno = "[";
		// se o usuário nao informou data inicio e fim, vai pegar o mes atual
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);
		}
		if (dataFinal == null)
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);

		Collection<String> bairros = this.dao.getBairrosOrderByQtdCadastros(dataInicial, dataFinal);
		if (bairros != null && bairros.size() > 0) {
			for (String bairro : bairros) {
				Integer qtdCadastros = this.dao.getQtdCadastrosAtivosByBairro(dataInicial, dataFinal, bairro);
				retorno += ",{\"BAIRRO\":\"" + bairro + "\", \"qtdCadastros\":" + qtdCadastros + ", \"cor\":\"" + pickColor() + "\"}";
			}
		}

		if (retorno.length() > 1)
			retorno = retorno.replace("[,", "[");
		retorno += "]";
		return retorno;
	}

	public String getBICadastrosBySexo(Date dataInicial, Date dataFinal) {
		String retorno = "[";
		// se o usuário nao informou data inicio e fim, vai pegar o mes atual
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);
		}
		if (dataFinal == null)
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);

		Integer qtdCadastros = this.dao.getQtdCadastrosAtivosBySexo(dataInicial, dataFinal, Sexo.MASCULINO);
		retorno += ",{\"SEXO\":\"Masculino\", \"qtdCadastros\":" + qtdCadastros + ", \"cor\":\"" + pickColor() + "\"}";

		qtdCadastros = this.dao.getQtdCadastrosAtivosBySexo(dataInicial, dataFinal, Sexo.FEMININO);
		retorno += ",{\"SEXO\":\"Feminino\", \"qtdCadastros\":" + qtdCadastros + ", \"cor\":\"" + pickColor() + "\"}";

		if (retorno.length() > 1)
			retorno = retorno.replace("[,", "[");
		retorno += "]";
		return retorno;
	}

	public String getBICadastrosByEstadoCivil(Date dataInicial, Date dataFinal) {
		String retorno = "[";
		// se o usuário nao informou data inicio e fim, vai pegar o mes atual
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);
		}
		if (dataFinal == null)
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);

		Integer qtdCadastros = this.dao.getQtdCadastrosAtivosByEstadoCivil(dataInicial, dataFinal, EstadoCivil.CASADO);
		retorno += ",{\"ESTADO\":\"Casado\", \"qtdCadastros\":" + qtdCadastros + ", \"cor\":\"" + pickColor() + "\"}";
		qtdCadastros = this.dao.getQtdCadastrosAtivosByEstadoCivil(dataInicial, dataFinal, EstadoCivil.DIVORCIADO);
		retorno += ",{\"ESTADO\":\"Divorciado\", \"qtdCadastros\":" + qtdCadastros + ", \"cor\":\"" + pickColor() + "\"}";
		qtdCadastros = this.dao.getQtdCadastrosAtivosByEstadoCivil(dataInicial, dataFinal, EstadoCivil.SOLTEIRO);
		retorno += ",{\"ESTADO\":\"Solteiro\", \"qtdCadastros\":" + qtdCadastros + ", \"cor\":\"" + pickColor() + "\"}";
		qtdCadastros = this.dao.getQtdCadastrosAtivosByEstadoCivil(dataInicial, dataFinal, EstadoCivil.VIUVO);
		retorno += ",{\"ESTADO\":\"Viúvo\", \"qtdCadastros\":" + qtdCadastros + ", \"cor\":\"" + pickColor() + "\"}";

		if (retorno.length() > 1)
			retorno = retorno.replace("[,", "[");
		retorno += "]";
		return retorno;
	}

	public String getBITaxaEfetividade(Date dataInicial, Date dataFinal) {
		String retorno = "[";
		// se o usuário nao informou data inicio e fim, vai pegar o mes atual
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);
		}
		if (dataFinal == null)
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);

		while (dataInicial.compareTo(dataFinal) < 0) {
			// pegar o ultimo dia do mes referente a dataInicial
			Calendar cal = Calendar.getInstance();
			cal.setTime(dataInicial);
			cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
			cal.setTime(SystemUtils.setHoraData(cal.getTime(), Calendar.PM, 23, 59, 59));

			Collection<Cadastro> novosCadastros = RelatorioControl.getInstance().getNovosCadastros(dataInicial, cal.getTime());
			int somaEfetividade = 0, somaCadastros = 0;
			if (novosCadastros != null && novosCadastros.size() > 0) {
				for (Cadastro cli : novosCadastros) {
					if (cli.isVirouNovoCliente())
						somaEfetividade += 1;
					somaCadastros += 1;
				}
			}
			double porcentagemEfetividade = 0;
			if (somaCadastros > 0)
				porcentagemEfetividade = ((double) somaEfetividade / somaCadastros) * 100;
			retorno += ",{\"AM_REF\":\"" + cal.get(Calendar.YEAR) + "/" + SystemUtils.formatarNumeroQtdAlgarismos(cal.get(Calendar.MONTH) + 1, 2) + "\", \"taxa\":" + SystemUtils.parseDoubleToString(porcentagemEfetividade).replace(".", "").replace(",", ".") + ", \"cor\":\"" + pickColor() + "\"}";

			cal.setTime(dataInicial);
			cal.set(Calendar.MONTH, cal.get(Calendar.MONTH) + 1);
			dataInicial = cal.getTime();
		}

		if (retorno.length() > 1)
			retorno = retorno.replace("[,", "[");
		retorno += "]";
		return retorno;
	}

	public String getBICadastrosByFaixaEtaria(Date dataInicial, Date dataFinal) {
		String retorno = "[";
		// se o usuário nao informou data inicio e fim, vai pegar o mes atual
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);
		}
		if (dataFinal == null)
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);

		Calendar cal = Calendar.getInstance();
		Date hoje = cal.getTime();

		// 0 - 10
		cal.set(Calendar.YEAR, cal.get(Calendar.YEAR) - 10);
		Integer qtdCadastros = this.dao.getQtdCadastrosAtivosByFaixaEtaria(dataInicial, dataFinal, cal.getTime(), null);
		retorno += ",{\"FAIXA\":\"0 - 10\", \"qtdCadastros\":" + qtdCadastros + ", \"cor\":\"" + pickColor() + "\"}";
		// 11 - 19
		cal.setTime(hoje);
		cal.set(Calendar.YEAR, cal.get(Calendar.YEAR) - 10);
		Date dataMax = cal.getTime();
		cal.set(Calendar.YEAR, cal.get(Calendar.YEAR) - 10);
		Date dataMin = cal.getTime();
		qtdCadastros = this.dao.getQtdCadastrosAtivosByFaixaEtaria(dataInicial, dataFinal, dataMin, dataMax);
		retorno += ",{\"FAIXA\":\"11 - 19\", \"qtdCadastros\":" + qtdCadastros + ", \"cor\":\"" + pickColor() + "\"}";
		// 20 - 39
		cal.setTime(hoje);
		cal.set(Calendar.YEAR, cal.get(Calendar.YEAR) - 20);
		dataMax = cal.getTime();
		cal.set(Calendar.YEAR, cal.get(Calendar.YEAR) - 20);
		dataMin = cal.getTime();
		qtdCadastros = this.dao.getQtdCadastrosAtivosByFaixaEtaria(dataInicial, dataFinal, dataMin, dataMax);
		retorno += ",{\"FAIXA\":\"20 - 39\", \"qtdCadastros\":" + qtdCadastros + ", \"cor\":\"" + pickColor() + "\"}";
		// 40 - 59
		cal.setTime(hoje);
		cal.set(Calendar.YEAR, cal.get(Calendar.YEAR) - 40);
		dataMax = cal.getTime();
		cal.set(Calendar.YEAR, cal.get(Calendar.YEAR) - 20);
		dataMin = cal.getTime();
		qtdCadastros = this.dao.getQtdCadastrosAtivosByFaixaEtaria(dataInicial, dataFinal, dataMin, dataMax);
		retorno += ",{\"FAIXA\":\"40 - 59\", \"qtdCadastros\":" + qtdCadastros + ", \"cor\":\"" + pickColor() + "\"}";
		// 60 - 79
		cal.setTime(hoje);
		cal.set(Calendar.YEAR, cal.get(Calendar.YEAR) - 60);
		dataMax = cal.getTime();
		cal.set(Calendar.YEAR, cal.get(Calendar.YEAR) - 20);
		dataMin = cal.getTime();
		qtdCadastros = this.dao.getQtdCadastrosAtivosByFaixaEtaria(dataInicial, dataFinal, dataMin, dataMax);
		retorno += ",{\"FAIXA\":\"60 - 79\", \"qtdCadastros\":" + qtdCadastros + ", \"cor\":\"" + pickColor() + "\"}";
		// > 80
		cal.setTime(hoje);
		cal.set(Calendar.YEAR, cal.get(Calendar.YEAR) - 80);
		dataMax = cal.getTime();
		qtdCadastros = this.dao.getQtdCadastrosAtivosByFaixaEtaria(dataInicial, dataFinal, null, dataMax);
		retorno += ",{\"FAIXA\":\" > 80\", \"qtdCadastros\":" + qtdCadastros + ", \"cor\":\"" + pickColor() + "\"}";

		if (retorno.length() > 1)
			retorno = retorno.replace("[,", "[");
		retorno += "]";
		return retorno;
	}

	public String getBIAtivos(Date dataInicial, Date dataFinal) {
		String retorno = "[";
		// se o usuário nao informou data inicio e fim, vai pegar o mes atual
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);
		}
		if (dataFinal == null)
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);

		String color1 = "#CDCEE1";
		String color2 = "#57A385";
		while (dataInicial.compareTo(dataFinal) < 0) {
			// pegar o ultimo dia do mes referente a dataInicial
			Calendar cal = Calendar.getInstance();
			cal.setTime(dataInicial);
			cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
			cal.setTime(SystemUtils.setHoraData(cal.getTime(), Calendar.PM, 23, 59, 59));

			Collection<Cadastro> novosCadastros = RelatorioControl.getInstance().getNovosCadastros(dataInicial, cal.getTime());
			int somaEfetividade = 0, somaCadastros = 0;
			if (novosCadastros != null && novosCadastros.size() > 0) {
				for (Cadastro cli : novosCadastros) {
					if (cli.isVirouNovoCliente())
						somaEfetividade += 1;
					somaCadastros += 1;
				}
			}
			retorno += ",{\"AM_REF\":\"" + cal.get(Calendar.YEAR) + "/" + SystemUtils.formatarNumeroQtdAlgarismos(cal.get(Calendar.MONTH) + 1, 2) + "\", \"qtdClientes\":" + somaEfetividade + ", \"qtdCadastros\":" + somaCadastros + ", \"cor1\":\"" + color1 + "\", \"cor2\":\"" + color2 + "\"}";

			cal.setTime(dataInicial);
			cal.set(Calendar.MONTH, cal.get(Calendar.MONTH) + 1);
			dataInicial = cal.getTime();
		}

		if (retorno.length() > 1)
			retorno = retorno.replace("[,", "[");
		retorno += "]";
		return retorno;
	}

	public String getBIServicosRequisitados(Date dataInicial, Date dataFinal) {
		String retorno = "[";
		// se o usuário nao informou data inicio e fim, vai pegar o mes atual
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		}
		if (dataInicial != null) {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
		}
		if (dataFinal == null)
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);

		dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);

		Collection<Servico> servicos = ServicoControl.getInstance().getServicos(null);
		Map<Integer, Integer> ordenador = new HashMap<Integer, Integer>();
		if (servicos != null && servicos.size() > 0) {
			for (Servico servico : servicos) {
				Integer qtd = this.dao.getQtdFrequenciasByServico(dataInicial, dataFinal, servico);
				if (qtd > 0)
					ordenador.put(servico.getId().intValue(), qtd);
			}
		}

		OrdenadorMapInteger bvc = new OrdenadorMapInteger(ordenador, true);
		TreeMap<Integer, Integer> sorted_map = new TreeMap<Integer, Integer>(bvc);
		sorted_map.putAll(ordenador);
		for (Integer key : sorted_map.keySet()) {
			Servico servico = null;
			for (Servico serv : servicos) {
				if (serv.getId().intValue() == key)
					servico = serv;
			}
			retorno += ",{\"SERVICO\":\"" + servico.getNome() + "\", \"qtdClientes\":" + ordenador.get(key) + ", \"cor\":\"" + pickColor() + "\"}";
		}
		if (retorno.length() > 1)
			retorno = retorno.replace("[,", "[");
		retorno += "]";
		return retorno;
	}

	public String getBIServicosFaturamento(Date dataInicial, Date dataFinal) {
		String retorno = "[";
		// se o usuário nao informou data inicio e fim, vai pegar o mes atual
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		}
		if (dataInicial != null) {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
		}
		if (dataFinal == null)
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);

		dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);

		Collection<Servico> servicos = ServicoControl.getInstance().getServicos(null);
		Map<Integer, Double> ordenador = new HashMap<Integer, Double>();
		if (servicos != null && servicos.size() > 0) {
			for (Servico servico : servicos) {
				Double soma = this.dao.getSomaFaturamentoByServico(dataInicial, dataFinal, servico);
				if (soma > 0)
					ordenador.put(servico.getId().intValue(), soma);
			}
		}

		OrdenadorMapDouble bvc = new OrdenadorMapDouble(ordenador, true);
		TreeMap<Integer, Double> sorted_map = new TreeMap<Integer, Double>(bvc);
		sorted_map.putAll(ordenador);
		for (Integer key : sorted_map.keySet()) {
			Servico servico = null;
			for (Servico serv : servicos) {
				if (serv.getId().intValue() == key)
					servico = serv;
			}
			retorno += ",{\"SERVICO\":\"" + servico.getNome() + "\", \"faturamento\":" + ordenador.get(key) + ", \"cor\":\"" + pickColor() + "\"}";
		}

		if (retorno.length() > 1)
			retorno = retorno.replace("[,", "[");
		retorno += "]";
		return retorno;
	}

	public String getBICentrosCustoCustosos(Date dataInicial, Date dataFinal) {
		String retorno = "[";
		// se o usuário nao informou data inicio e fim, vai pegar o mes atual
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);
		}
		if (dataFinal == null)
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);

		Collection<CentroCusto> centrosCustos = ServicoControl.getInstance().getCentrosCusto();
		Map<Integer, Double> ordenador = new HashMap<Integer, Double>();
		if (centrosCustos != null && centrosCustos.size() > 0) {
			for (CentroCusto centro : centrosCustos) {
				Double soma = this.dao.getSomaCustoByCentroCusto(dataInicial, dataFinal, centro);
				if (soma > 0)
					ordenador.put(centro.getId().intValue(), soma);
			}
		}

		OrdenadorMapDouble bvc = new OrdenadorMapDouble(ordenador, true);
		TreeMap<Integer, Double> sorted_map = new TreeMap<Integer, Double>(bvc);
		sorted_map.putAll(ordenador);
		for (Integer key : sorted_map.keySet()) {
			CentroCusto centroCusto = null;
			for (CentroCusto centro : centrosCustos) {
				if (centro.getId().intValue() == key)
					centroCusto = centro;
			}
			retorno += ",{\"CENTRO\":\"" + centroCusto.getNome() + "\", \"custo\":" + ordenador.get(key) + ", \"cor\":\"" + pickColor() + "\"}";
		}

		if (retorno.length() > 1)
			retorno = retorno.replace("[,", "[");
		retorno += "]";
		return retorno;
	}

	public String getBICrescimentoServico(Date dataInicial, Date dataFinal, Servico servico) {
		String retorno = "[";
		// se o usuário nao informou data inicio e fim, vai pegar o mes atual
		if (dataInicial != null || dataFinal != null) {
			if (dataFinal == null)
				dataFinal = SystemUtils.getUltimoDiaMesAtual(null);

			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);

			if (servico != null && (servico.getId() == null || servico.getId().intValue() == -1))
				servico = null;

			Integer acumulado = 0, acumuladoAnterior = 0;

			while (dataInicial.compareTo(dataFinal) < 0) {
				// pegar o ultimo dia do mes referente a dataInicial
				Calendar cal = Calendar.getInstance();
				cal.setTime(dataInicial);
				cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
				cal.setTime(SystemUtils.setHoraData(cal.getTime(), Calendar.PM, 23, 59, 59));

				Integer qtdServicos = this.dao.getQtdAtendimentosServico(dataInicial, cal.getTime(), servico);

				Calendar calAnterior = Calendar.getInstance();
				calAnterior.setTime(dataInicial);
				calAnterior.set(Calendar.YEAR, calAnterior.get(Calendar.YEAR) - 1);
				Calendar calAnterior2 = Calendar.getInstance();
				calAnterior2.setTime(cal.getTime());
				calAnterior2.set(Calendar.YEAR, calAnterior2.get(Calendar.YEAR) - 1);
				Integer qtdServicosAnoAnterior = this.dao.getQtdAtendimentosServico(calAnterior.getTime(), calAnterior2.getTime(), servico);

				acumulado += qtdServicos;
				acumuladoAnterior += qtdServicosAnoAnterior;

				retorno += ",{\"AM_REF\":\"" + cal.get(Calendar.YEAR) + "/" + SystemUtils.formatarNumeroQtdAlgarismos(cal.get(Calendar.MONTH) + 1, 2) + "\", \"qtdAtendimentosMes\":" + qtdServicos + ", \"qtdAtendimentos\":" + acumulado + ", \"qtdAtendimentosMesAnterior\":" + qtdServicosAnoAnterior + ", \"qtdAtendimentosAnterior\":" + acumuladoAnterior + ", \"cor\":\"" + pickColor() + "\"}";

				cal.setTime(dataInicial);
				cal.set(Calendar.MONTH, cal.get(Calendar.MONTH) + 1);
				dataInicial = cal.getTime();
			}
		}

		if (retorno.length() > 1)
			retorno = retorno.replace("[,", "[");
		retorno += "]";
		return retorno;
	}

	public String getBITiposCustoCustosos(Date dataInicial, Date dataFinal, TipoCusto tipoCusto) {
		String retorno = "[";
		// se o usuário nao informou data inicio e fim, vai pegar o mes atual
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);
		}
		if (dataFinal == null)
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);

		Collection<TipoContaPagar> allTiposContaPagar = this.dao.getAllTiposContaPagarByTipoCusto(tipoCusto);
		Map<Integer, Double> ordenador = new HashMap<Integer, Double>();
		if (allTiposContaPagar != null && allTiposContaPagar.size() > 0) {
			for (TipoContaPagar tipo : allTiposContaPagar) {
				Double soma = this.dao.getSomaCustosByTipo(dataInicial, dataFinal, tipo);
				if (soma > 0)
					ordenador.put(tipo.getId(), soma);
			}
		}

		OrdenadorMapIntegerDouble bvc = new OrdenadorMapIntegerDouble(ordenador, true);
		TreeMap<Integer, Double> sorted_map = new TreeMap<Integer, Double>(bvc);
		sorted_map.putAll(ordenador);
		for (Integer key : sorted_map.keySet()) {
			TipoContaPagar tipo = null;
			for (TipoContaPagar tipo2 : allTiposContaPagar) {
				if (tipo2.getId().intValue() == key)
					tipo = tipo2;
			}
			retorno += ",{\"TIPO\":\"" + tipo.getNome() + "\", \"soma\":" + ordenador.get(key) + ", \"cor\":\"" + pickColor() + "\"}";
		}
		if (retorno.length() > 1)
			retorno = retorno.replace("[,", "[");
		retorno += "]";
		return retorno;
	}

	public String getBIEvolutivoDespesas(Date dataInicial, Date dataFinal) {
		String retorno = "[";
		// se o usuário nao informou data inicio e fim, vai pegar o mes atual
		if (dataInicial != null || dataFinal != null) {
			if (dataFinal == null)
				dataFinal = SystemUtils.getUltimoDiaMesAtual(null);

			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);

			Double acumulado = 0.0, acumuladoAnterior = 0.0;

			while (dataInicial.compareTo(dataFinal) < 0) {
				// pegar o ultimo dia do mes referente a dataInicial
				Calendar cal = Calendar.getInstance();
				cal.setTime(dataInicial);
				cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
				cal.setTime(SystemUtils.setHoraData(cal.getTime(), Calendar.PM, 23, 59, 59));

				Double somaCustos = this.dao.getSomaCustosByTipo(dataInicial, cal.getTime(), null);

				Calendar calAnterior = Calendar.getInstance();
				calAnterior.setTime(dataInicial);
				calAnterior.set(Calendar.YEAR, calAnterior.get(Calendar.YEAR) - 1);
				Calendar calAnterior2 = Calendar.getInstance();
				calAnterior2.setTime(cal.getTime());
				calAnterior2.set(Calendar.YEAR, calAnterior2.get(Calendar.YEAR) - 1);
				Double somaCustosAnoAnterior = this.dao.getSomaCustosByTipo(calAnterior.getTime(), calAnterior2.getTime(), null);

				acumulado += somaCustos;
				acumuladoAnterior += somaCustosAnoAnterior;

				retorno += ",{\"AM_REF\":\"" + cal.get(Calendar.YEAR) + "/" + SystemUtils.formatarNumeroQtdAlgarismos(cal.get(Calendar.MONTH) + 1, 2) + "\", \"somaCustosMes\":" + somaCustos + ", \"somaCustos\":" + acumulado + ", \"somaCustosMesAnterior\":" + somaCustosAnoAnterior + ", \"somaCustosAnterior\":" + acumuladoAnterior + ", \"cor\":\"" + pickColor() + "\"}";

				cal.setTime(dataInicial);
				cal.set(Calendar.MONTH, cal.get(Calendar.MONTH) + 1);
				dataInicial = cal.getTime();
			}
		}

		if (retorno.length() > 1)
			retorno = retorno.replace("[,", "[");
		retorno += "]";
		return retorno;
	}

	public String getBIEvolutivoEntradas(Date dataInicial, Date dataFinal) {
		String retorno = "[";
		// se o usuário nao informou data inicio e fim, vai pegar o mes atual
		if (dataInicial != null || dataFinal != null) {
			if (dataFinal == null)
				dataFinal = SystemUtils.getUltimoDiaMesAtual(null);

			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);

			Double acumulado = 0.0, acumuladoAnterior = 0.0;

			while (dataInicial.compareTo(dataFinal) < 0) {
				// pegar o ultimo dia do mes referente a dataInicial
				Calendar cal = Calendar.getInstance();
				cal.setTime(dataInicial);
				cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
				cal.setTime(SystemUtils.setHoraData(cal.getTime(), Calendar.PM, 23, 59, 59));

				Double somaEntradas = this.dao.getSomaFaturamentoByServico(dataInicial, cal.getTime(), null);
				Double somaAvulso = this.dao.getSomaFaturamentoAvulso(dataInicial, cal.getTime());
				Double somaVendas = this.dao.getSomaFaturamentoVendas(dataInicial, cal.getTime());
				somaEntradas += somaAvulso + somaVendas;

				Calendar calAnterior = Calendar.getInstance();
				calAnterior.setTime(dataInicial);
				calAnterior.set(Calendar.YEAR, calAnterior.get(Calendar.YEAR) - 1);
				Calendar calAnterior2 = Calendar.getInstance();
				calAnterior2.setTime(cal.getTime());
				calAnterior2.set(Calendar.YEAR, calAnterior2.get(Calendar.YEAR) - 1);
				Double somaEntradasAnoAnterior = this.dao.getSomaFaturamentoByServico(calAnterior.getTime(), calAnterior2.getTime(), null);

				acumulado += somaEntradas;
				acumuladoAnterior += somaEntradasAnoAnterior;

				retorno += ",{\"AM_REF\":\"" + cal.get(Calendar.YEAR) + "/" + SystemUtils.formatarNumeroQtdAlgarismos(cal.get(Calendar.MONTH) + 1, 2) + "\", \"somaEntradasMes\":" + somaEntradas + ", \"somaEntradas\":" + acumulado + ", \"somaEntradasMesAnterior\":" + somaEntradasAnoAnterior + ", \"somaEntadasAnterior\":" + acumuladoAnterior + ", \"cor\":\"" + pickColor() + "\"}";

				cal.setTime(dataInicial);
				cal.set(Calendar.MONTH, cal.get(Calendar.MONTH) + 1);
				dataInicial = cal.getTime();
			}
		}

		if (retorno.length() > 1)
			retorno = retorno.replace("[,", "[");
		retorno += "]";
		return retorno;
	}

}
