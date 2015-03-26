package br.com.pilates.actions;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.ContaPagar;
import br.com.pilates.base.ContaReceber;
import br.com.pilates.base.Estoque;
import br.com.pilates.base.Professor;
import br.com.pilates.base.TipoContaReceber;
import br.com.pilates.fachada.IProxy;
import br.com.pilates.fachada.Proxy;
import br.com.pilates.util.PilatesBundleUtil;
import br.com.pilates.util.SystemUtils;

@SuppressWarnings("serial")
public class ContaReceberAction extends PilatesActionSupport {

	private final IProxy proxy;

	private Collection<ContaPagar> contasPagar;
	private Collection<ContaReceber> contasReceber, contasReceberAvulso;
	private Collection<Estoque> estoques;
	private ContaReceber contaReceber;
	private String novoTipoContaReceber;
	private double soma, somaEstoque, somaTotal, somaAvulso = 0;
	private double entradasCaixa, entradasVendasCaixa, saidasCaixa, descontosEntradasCaixa, saldoCaixa, saldoAnteriorCaixa = 0;
	private Date dataInicial;
	private Date dataFinal;
	private Professor professor;

	public ContaReceberAction() {
		proxy = Proxy.getInstance();
	}

	public String actionCaixa() {
		try {
			this.saldoAnteriorCaixa = this.proxy.getSaldoAnteriorCaixa(dataInicial);

			this.contasReceber = this.proxy.getContasReceberMesAtual(dataInicial, dataFinal);
			if (this.contasReceber != null && this.contasReceber.size() > 0) {
				for (ContaReceber contaRec : this.contasReceber) {
					this.entradasCaixa += contaRec.getCaixa();
				}
			}
			// this.descontosEntradasCaixa =
			// this.proxy.getDescontosEntradasCaixa(dataInicial);
			this.estoques = this.proxy.getEstoquesVendido(dataInicial, dataFinal, null);
			if (this.estoques != null && this.estoques.size() > 0) {
				for (Estoque estoque : this.estoques) {
					this.entradasVendasCaixa += estoque.getValor();
				}
			}
			this.contasPagar = this.proxy.getContasPagarByData(dataInicial, dataFinal);
			if (this.contasPagar != null && this.contasPagar.size() > 0) {
				for (ContaPagar contaPagar : this.contasPagar) {
					this.saidasCaixa += contaPagar.getValor();
				}
			}
			this.saldoCaixa = this.saldoAnteriorCaixa + this.entradasCaixa + entradasVendasCaixa - saidasCaixa;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	@Override
	public String redirect() {
		try {
			this.contasReceber = this.proxy.getContasReceberByProfessorData(dataInicial, dataFinal, professor);
			for (ContaReceber conta : this.contasReceber) {
				this.soma += conta.getValor();
				this.somaTotal += conta.getValor();
			}

			this.contasReceberAvulso = this.proxy.getContasReceberAvulso(dataInicial, dataFinal);
			for (ContaReceber conta : this.contasReceberAvulso) {
				this.somaAvulso += conta.getValor();
				this.somaTotal += conta.getValor();
			}

			this.estoques = this.proxy.getEstoquesVendido(dataInicial, dataFinal, professor);
			for (Estoque estoque : this.estoques) {
				this.somaEstoque += estoque.getValor();
				this.somaTotal += estoque.getValor();
			}
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String actionRemoverContaReceber() {
		String resposta = "";
		try {
			proxy.delete(contaReceber);
			resposta = SUCCESS;
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionInserirContaReceber() {
		String resposta = "";
		try {
			if (this.contaReceber.getTipo().getNome().equals("Outro") && this.novoTipoContaReceber != null && !this.novoTipoContaReceber.trim().equals("")) {
				this.novoTipoContaReceber = novoTipoContaReceber.replace(',', ' ');
				this.novoTipoContaReceber = novoTipoContaReceber.replace(';', ' ');
				contaReceber.setTipo(new TipoContaReceber(this.novoTipoContaReceber));
				this.proxy.insert(this.contaReceber.getTipo());
			}
			proxy.inserirContaReceber(contaReceber);
			resposta = SUCCESS;
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public ContaReceber getContaReceber() {
		return contaReceber;
	}

	public void setContaReceber(ContaReceber contaReceber) {
		this.contaReceber = contaReceber;
	}

	public String getNovoTipoContaReceber() {
		return novoTipoContaReceber;
	}

	public void setNovoTipoContaReceber(String novoTipoContaReceber) {
		this.novoTipoContaReceber = novoTipoContaReceber;
	}

	public Collection<ContaReceber> getContasReceber() {
		return contasReceber;
	}

	public void setContasReceber(Collection<ContaReceber> contasReceber) {
		this.contasReceber = contasReceber;
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

	public void setDataInicial(Date dataInicial) {
		this.dataInicial = dataInicial;
	}

	public Date getDataInicialStr() {
		return dataInicial;
	}

	public void setDataInicialStr(String dataInicial) {
		this.dataInicial = SystemUtils.parseStringToDate(dataInicial);
	}

	public Date getDataFinal() {
		return dataFinal;
	}

	public void setDataFinal(Date dataFinal) {
		this.dataFinal = dataFinal;
	}

	public Date getDataFinalStr() {
		return dataFinal;
	}

	public void setDataFinalStr(String dataFinal) {
		this.dataFinal = SystemUtils.parseStringToDate(dataFinal);
	}

	public Professor getProfessor() {
		return professor;
	}

	public void setProfessor(Professor professor) {
		this.professor = professor;
	}

	public Collection<Estoque> getEstoques() {
		return estoques;
	}

	public void setEstoques(Collection<Estoque> estoques) {
		this.estoques = estoques;
	}

	public double getSomaEstoque() {
		return somaEstoque;
	}

	public void setSomaEstoque(double somaEstoque) {
		this.somaEstoque = somaEstoque;
	}

	public double getSomaTotal() {
		return somaTotal;
	}

	public void setSomaTotal(double somaTotal) {
		this.somaTotal = somaTotal;
	}

	public Collection<ContaReceber> getContasReceberAvulso() {
		return contasReceberAvulso;
	}

	public void setContasReceberAvulso(Collection<ContaReceber> contasReceberAvulso) {
		this.contasReceberAvulso = contasReceberAvulso;
	}

	public double getSomaAvulso() {
		return somaAvulso;
	}

	public void setSomaAvulso(double somaAvulso) {
		this.somaAvulso = somaAvulso;
	}

	public double getEntradasCaixa() {
		return entradasCaixa;
	}

	public void setEntradasCaixa(double entradasCaixa) {
		this.entradasCaixa = entradasCaixa;
	}

	public double getEntradasVendasCaixa() {
		return entradasVendasCaixa;
	}

	public void setEntradasVendasCaixa(double entradasVendasCaixa) {
		this.entradasVendasCaixa = entradasVendasCaixa;
	}

	public double getSaidasCaixa() {
		return saidasCaixa;
	}

	public void setSaidasCaixa(double saidasCaixa) {
		this.saidasCaixa = saidasCaixa;
	}

	public double getDescontosEntradasCaixa() {
		return descontosEntradasCaixa;
	}

	public void setDescontosEntradasCaixa(double descontosEntradasCaixa) {
		this.descontosEntradasCaixa = descontosEntradasCaixa;
	}

	public double getSaldoCaixa() {
		return saldoCaixa;
	}

	public void setSaldoCaixa(double saldoCaixa) {
		this.saldoCaixa = saldoCaixa;
	}

	public Collection<ContaPagar> getContasPagar() {
		return contasPagar;
	}

	public void setContasPagar(Collection<ContaPagar> contasPagar) {
		this.contasPagar = contasPagar;
	}

	public double getSaldoAnteriorCaixa() {
		return saldoAnteriorCaixa;
	}

	public void setSaldoAnteriorCaixa(double saldoAnteriorCaixa) {
		this.saldoAnteriorCaixa = saldoAnteriorCaixa;
	}

}
