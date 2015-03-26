package br.com.pilates.actions;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.CentroCusto;
import br.com.pilates.base.ContaPagar;
import br.com.pilates.base.TipoContaPagar;
import br.com.pilates.base.enums.TipoCusto;
import br.com.pilates.fachada.IProxy;
import br.com.pilates.fachada.Proxy;
import br.com.pilates.util.PilatesBundleUtil;
import br.com.pilates.util.SystemUtils;

@SuppressWarnings("serial")
public class ContaPagarAction extends PilatesActionSupport {

	private final IProxy proxy;

	private Collection<ContaPagar> contasPagar;
	private ContaPagar contaPagar;
	private String novoTipoContaPagar;
	private double soma;
	private Date dataInicial;
	private Date dataFinal;
	private CentroCusto centroCusto;

	public ContaPagarAction() {
		proxy = Proxy.getInstance();
	}

	@Override
	public String redirect() {
		try {
			TipoCusto tipo = null;
			if (contaPagar != null)
				tipo = contaPagar.getTipoCusto();
			this.contasPagar = this.proxy.getContasPagarMesAtual(tipo, dataInicial, dataFinal, centroCusto);
			for (ContaPagar conta : this.contasPagar) {
				this.soma += conta.getValor();
			}
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String actionRemoverContaPagar() {
		String resposta = "";
		try {
			proxy.delete(contaPagar);
			resposta = SUCCESS;
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionInserirContaPagar() {
		String resposta = "";
		try {
			if (this.contaPagar.getTipo().getNome().equals("Outro") && this.novoTipoContaPagar != null && !this.novoTipoContaPagar.trim().equals("")) {
				this.novoTipoContaPagar = novoTipoContaPagar.replace(',', ' ');
				this.novoTipoContaPagar = novoTipoContaPagar.replace(';', ' ');
				contaPagar.setTipo(new TipoContaPagar(this.novoTipoContaPagar));
				this.proxy.insert(this.contaPagar.getTipo());
			}
			proxy.inserirContaPagar(contaPagar);
			resposta = SUCCESS;
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public ContaPagar getContaPagar() {
		return contaPagar;
	}

	public void setContaPagar(ContaPagar contaPagar) {
		this.contaPagar = contaPagar;
	}

	public String getNovoTipoContaPagar() {
		return novoTipoContaPagar;
	}

	public void setNovoTipoContaPagar(String novoTipoContaPagar) {
		this.novoTipoContaPagar = novoTipoContaPagar;
	}

	public Collection<ContaPagar> getContasPagar() {
		return contasPagar;
	}

	public void setContasPagar(Collection<ContaPagar> contasPagar) {
		this.contasPagar = contasPagar;
	}

	public double getSoma() {
		return soma;
	}

	public void setSoma(double soma) {
		this.soma = soma;
	}

	public Date getDataInicial() {
		return dataInicial;
	}

	public String getDataInicialStr() {
		return SystemUtils.parseDataToString(dataInicial);
	}

	public void setDataInicialStr(String dataInicial) {
		this.dataInicial = SystemUtils.parseStringToDate(dataInicial);
	}

	public void setDataInicial(Date dataInicial) {
		this.dataInicial = dataInicial;
	}

	public String getDataFinalStr() {
		return SystemUtils.parseDataToString(dataFinal);
	}

	public Date getDataFinal() {
		return dataFinal;
	}

	public void setDataFinalStr(String dataFinal) {
		this.dataFinal = SystemUtils.parseStringToDate(dataFinal);
	}

	public void setDataFinal(Date dataFinal) {
		this.dataFinal = dataFinal;
	}

	@Override
	public CentroCusto getCentroCusto() {
		return centroCusto;
	}

	@Override
	public void setCentroCusto(CentroCusto centroCusto) {
		this.centroCusto = centroCusto;
	}

}
