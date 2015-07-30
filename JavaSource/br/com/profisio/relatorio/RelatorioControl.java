package br.com.profisio.relatorio;

import java.util.Calendar;
import java.util.Collection;
import java.util.Date;

import br.com.profisio.basics.Cadastro;
import br.com.profisio.basics.Colaborador;
import br.com.profisio.basics.ContaReceber;
import br.com.profisio.basics.Estoque;
import br.com.profisio.basics.Frequencia;
import br.com.profisio.basics.Servico;
import br.com.profisio.basics.enums.TipoCusto;
import br.com.profisio.financeiro.FinanceiroControl;
import br.com.profisio.frequencia.FrequenciaControl;
import br.com.profisio.util.ControllerBase;
import br.com.profisio.util.SystemUtils;
import br.com.profisio.util.Tenant;
import br.com.profisio.venda.VendaControl;

public class RelatorioControl extends ControllerBase {

	private static RelatorioControl instance = null;
	private RelatorioDAO dao = null;

	private RelatorioControl() {
		dao = (RelatorioDAO) RelatorioDAO.daoFactory();
	}

	public static RelatorioControl getInstance() {
		if (instance == null)
			instance = new RelatorioControl();
		return instance;
	}

	public Collection<Cadastro> getClientesFrequentes(Tenant tenant, Date dataInicial, Date dataFinal, Colaborador colaborador, Servico servico) {
		// se o usuário nao informou data inicio e fim, vai pegar paenas
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);
		}
		if (colaborador != null && (colaborador.getId() == null || colaborador.getId().intValue() == -1))
			colaborador = null;
		if (servico != null && (servico.getId() == null || servico.getId().intValue() == -1))
			servico = null;
		return this.dao.getClientesFrequentes(tenant, dataInicial, dataFinal, colaborador, servico);
	}

	public Collection<Cadastro> getNovosCadastros(Tenant tenant, Date dataInicial, Date dataFinal) {
		// se o usuário nao informou data inicio e fim, vai pegar paenas
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);
		}
		Collection<Cadastro> novosCadastros = this.dao.getNovosCadastros(tenant, dataInicial, dataFinal);
		if (novosCadastros != null && novosCadastros.size() > 0) {
			for (Cadastro cli : novosCadastros) {
				Collection<Frequencia> frequencias = this.dao.getFrequenciasByCadastro(cli, dataInicial, dataFinal);
				if (frequencias != null && frequencias.size() > 0)
					cli.setVirouNovoCliente(true);
				else
					cli.setVirouNovoCliente(false);
			}
		}
		return novosCadastros;
	}

	public String gerarDemonstrativoResultado(Tenant tenant, Date dataInicial, Date dataFinal) {
		// esta funcao nao deve considerar o dia e sim o ano/mes
		String retorno = "";
		if (dataInicial != null || dataFinal != null) {
			Calendar calendar1 = Calendar.getInstance();
			Calendar calendar2 = Calendar.getInstance();
			// se nao tem dataInicial bota pra 01/08/2012
			if (dataInicial == null) {
				calendar1.set(Calendar.YEAR, 2012);
				calendar1.set(Calendar.MONTH, 8);
				calendar1.set(Calendar.DATE, 1);
			} else {
				calendar1.setTime(dataInicial);
			}
			// seta a dataInicio para o dia 01
			calendar1.set(Calendar.DATE, 1);
			calendar1.setTime(SystemUtils.setHoraData(calendar1.getTime(), Calendar.AM, 0, 0, 0));

			// Se não disse a dataFinal bota como hoje
			if (dataFinal != null) {
				calendar2.setTime(dataFinal);
			} else {
				dataFinal = new Date();
			}
			calendar2.set(Calendar.DAY_OF_MONTH, calendar2.getActualMaximum(Calendar.DAY_OF_MONTH));
			calendar2.setTime(SystemUtils.setHoraData(calendar2.getTime(), Calendar.PM, 23, 59, 59));

			// Se data inicial for maior q final, troca
			if (calendar1.compareTo(calendar2) > 0) {
				Date timeTemp = calendar1.getTime();
				calendar1.setTime(calendar2.getTime());
				calendar1.setTime(SystemUtils.setHoraData(calendar1.getTime(), Calendar.AM, 0, 0, 0));
				calendar2.setTime(timeTemp);
				calendar2.setTime(SystemUtils.setHoraData(calendar2.getTime(), Calendar.PM, 23, 59, 59));
			}

			double somaFat = 0;
			double somaContasVar = 0;
			double somaMargem = 0;
			double somaContasFixas = 0;
			double somaResultados = 0;

			int qtdMeses = 0;
			boolean mesIgual = false;
			// a cada interacao incrementa 1 mês até que chegue ao mês final
			while (!mesIgual) {
				// pega o último dia do mês corrente
				Calendar calendarProximoMes = Calendar.getInstance();
				calendarProximoMes.setTime(calendar1.getTime());
				calendarProximoMes.set(Calendar.DAY_OF_MONTH, calendarProximoMes.getActualMaximum(Calendar.DAY_OF_MONTH));
				Date proximoMes = SystemUtils.setHoraData(calendarProximoMes.getTime(), Calendar.PM, 23, 59, 59);

				// layout da string de retorno:
				// ano/mes=receitasBrutas=contasPagarVar=MC=contasPagarFixas=(MC-ContasFixas
				// =
				// Resultado)|Totais=SomaFat=SomaContasVar=SomaMC=SomaContasFix=SomaResul|Percentuais=100,00=
				// coloca o ANO/MES para depois colocar o valor
				retorno += "AM_REF:" + calendar1.get(Calendar.YEAR) + "/" + SystemUtils.formatarNumeroQtdAlgarismos((calendar1.get(Calendar.MONTH) + 1), 2) + ";";
				// seta o boolean caso seja igual ao ano/mes da data final
				mesIgual = calendar1.get(Calendar.YEAR) == calendar2.get(Calendar.YEAR) && calendar1.get(Calendar.MONTH) == calendar2.get(Calendar.MONTH);

				// FATURAMENTO
				Double receitasBruto = this.getFaturamentoBruto(tenant, calendar1.getTime(), proximoMes);
				retorno += "FAT:" + SystemUtils.parseDoubleToString(receitasBruto) + ";";
				somaFat += receitasBruto;

				// CONTAS PAGAR VARIAVEIS
				Double contasPagarVariaveis = this.dao.getSomaContasPagar(tenant, calendar1.getTime(), proximoMes, TipoCusto.VARIAVEL);
				retorno += "VAR:" + SystemUtils.parseDoubleToString(contasPagarVariaveis) + ";";
				somaContasVar += contasPagarVariaveis;

				// MARGEM CONTRIBUICAO
				double valorMargemContribuicao = receitasBruto - contasPagarVariaveis;
				retorno += "MC:" + SystemUtils.parseDoubleToString(valorMargemContribuicao) + ";";
				somaMargem += valorMargemContribuicao;

				// CONTAS FIXAS
				Double contasPagarFixos = this.dao.getSomaContasPagar(tenant, calendar1.getTime(), proximoMes, TipoCusto.FIXO);
				retorno += "FIX:" + SystemUtils.parseDoubleToString(contasPagarFixos) + ";";
				somaContasFixas += contasPagarFixos;

				// RESULTADO
				double valorResultados = valorMargemContribuicao - contasPagarFixos;
				retorno += "RES:" + SystemUtils.parseDoubleToString(valorResultados) + "|";
				somaResultados += valorResultados;

				if (!mesIgual)
					calendar1.set(Calendar.MONTH, calendar1.get(Calendar.MONTH) + 1);

				qtdMeses += 1;
			}

			Integer qtdClientesAtivos = this.getQtdClientesFrequentes(tenant, dataInicial, dataFinal);
			Collection<ContaReceber> contasReceberAvulso = FinanceiroControl.getInstance().getContasReceberAvulso(tenant, dataInicial, dataFinal, null, null);
			Double somaAvulso = 0.0;
			if (contasReceberAvulso != null && contasReceberAvulso.size() > 0) {
				for (ContaReceber conta : contasReceberAvulso) {
					somaAvulso += conta.getValorCheioComDesconto();
				}
			}
			String ticket = "0,00";
			if (qtdClientesAtivos > 0)
				ticket = SystemUtils.parseDoubleToString(((somaFat - somaAvulso) / qtdClientesAtivos) / qtdMeses);

			retorno += "TOTAL_FAT:" + SystemUtils.parseDoubleToString(somaFat) + ";TOTAL_VAR:" + SystemUtils.parseDoubleToString(somaContasVar) + ";TOTAL_MC:" + SystemUtils.parseDoubleToString(somaMargem) + ";TOTAL_FIX:" + SystemUtils.parseDoubleToString(somaContasFixas) + ";TOTAL_RES:" + SystemUtils.parseDoubleToString(somaResultados) + ";";
			String contasVarSobFat = "0,00";
			String margemSobFat = "0,00";
			String contasFixasSobFat = "0,00";
			String resultadosSobFat = "0,00";
			if (somaFat > 0) {
				contasVarSobFat = SystemUtils.parseDoubleToString((somaContasVar / somaFat) * 100);
				margemSobFat = SystemUtils.parseDoubleToString((somaMargem / somaFat) * 100);
				contasFixasSobFat = SystemUtils.parseDoubleToString((somaContasFixas / somaFat) * 100);
				resultadosSobFat = SystemUtils.parseDoubleToString((somaResultados / somaFat) * 100);
			}
			retorno += "PER_FAT:100,00%;PER_VAR:" + contasVarSobFat + "%;PER_MC:" + margemSobFat + "%;PER_FIX:" + contasFixasSobFat + "%;PER_RES:" + resultadosSobFat + "%;PER_TICKET:" + ticket;
		}
		return retorno;
	}

	public Integer getQtdClientesFrequentes(Tenant tenant, Date dataInicial, Date dataFinal) {
		return this.dao.getQtdClientesFrequentes(tenant, dataInicial, dataFinal);
	}

	// pega todo o faturamento (contaReceber + vendas) e retira os descontos da
	// formaPagamento
	private double getFaturamentoBruto(Tenant tenant, Date dataInicial, Date proximoMes) {
		double soma = 0;
		Collection<ContaReceber> contas = FinanceiroControl.getInstance().getContasReceber(tenant, dataInicial, proximoMes, null, null, null, null);
		Collection<ContaReceber> contasAvulso = FinanceiroControl.getInstance().getContasReceberAvulso(tenant, dataInicial, proximoMes, null, null);
		Collection<Estoque> estoques = VendaControl.getInstance().getEstoquesVendidos(tenant, dataInicial, proximoMes, null, null, null);
		if (contas != null && contas.size() > 0) {
			for (ContaReceber conta : contas)
				soma += conta.getValorCheioComDesconto();
		}
		if (contasAvulso != null && contasAvulso.size() > 0) {
			for (ContaReceber conta : contasAvulso)
				soma += conta.getValorCheioComDesconto();
		}
		if (estoques != null && estoques.size() > 0) {
			for (Estoque estoque : estoques)
				soma += estoque.getValor();
		}
		return soma;
	}

	public String getAtividadesClientesCSV(Tenant tenant, Date dataInicial, Date dataFinal) {
		String csv = "CLIENTE;E-MAIL;DATA NASCIMENTO;BAIRRO;SEXO;SERVIÇO;DATA FREQUENCIA\n";
		// se o usuário nao informou data inicio e fim, vai pegar paenas
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 23, 59, 59);
		}
		Collection<Frequencia> frequencias = FrequenciaControl.getInstance().getFrequencias(tenant, dataInicial, dataFinal);
		if (frequencias != null && frequencias.size() > 0) {
			for (Frequencia frequencia : frequencias) {
				csv += frequencia.getCadastro().getNome() + ";" + frequencia.getCadastro().getEmail() + ";" + frequencia.getCadastro().getDataNascimentoStr() + ";" + frequencia.getCadastro().getEndereco().getBairro() + ";" + frequencia.getCadastro().getSexoStr() + ";" + frequencia.getServicoCerto().getNome() + ";" + SystemUtils.parseDataToString(frequencia.getData()) + "\n";
			}
		}
		return csv;
	}

	public String getNovosCadastrosCSV(Tenant tenant, Date dataInicial, Date dataFinal) {
		String csv = "CLIENTE;E-MAIL;TELEFONE;DATA CADASTRO;TORNOU-SE CLIENTE\n";
		// se o usuário nao informou data inicio e fim, vai pegar paenas
		if (dataInicial == null && dataFinal == null) {
			dataInicial = SystemUtils.getPrimeiroDiaMesAtual(null);
			dataFinal = SystemUtils.getUltimoDiaMesAtual(null);
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 11, 59, 59);
		}
		Collection<Cadastro> novosCadastros = this.dao.getNovosCadastros(tenant, dataInicial, dataFinal);
		if (novosCadastros != null && novosCadastros.size() > 0) {
			for (Cadastro cli : novosCadastros) {
				Collection<Frequencia> frequencias = this.dao.getFrequenciasByCadastro(cli, dataInicial, dataFinal);
				if (frequencias != null && frequencias.size() > 0)
					cli.setVirouNovoCliente(true);
				else
					cli.setVirouNovoCliente(false);
			}
		}

		if (novosCadastros != null && novosCadastros.size() > 0) {
			for (Cadastro cadastro : novosCadastros) {
				csv += cadastro.getNome() + ";" + cadastro.getEmail() + ";" + cadastro.getFoneFixo() + " " + cadastro.getFoneCelular() + ";" + cadastro.getDataCadastroStr() + ";" + SystemUtils.parseBooleanToSimNao(cadastro.isVirouNovoCliente()) + "\n";
			}
		}
		return csv;
	}

}
