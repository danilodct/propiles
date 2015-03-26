package br.com.pilates.actions;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Estoque;
import br.com.pilates.base.Produto;
import br.com.pilates.base.Professor;
import br.com.pilates.fachada.IProxy;
import br.com.pilates.fachada.Proxy;
import br.com.pilates.util.PilatesBundleUtil;
import br.com.pilates.util.SystemUtils;

@SuppressWarnings("serial")
public class EstoqueAction extends PilatesActionSupport {

	private final IProxy proxy;

	private Collection<Produto> allProdutos;
	private Collection<Professor> vendedores;
	private Collection<Estoque> estoques;
	private Estoque estoque;
	private Professor vendedor;

	private Date dataInicial, dataFinal;
	private String status, nome;
	private int qtd;
	private double valorTotal, valorVendedor;

	public EstoqueAction() {
		proxy = Proxy.getInstance();
	}

	public String action_estoque() {
		try {
			this.estoques = this.proxy.getEstoques(dataInicial, dataFinal, status, nome);
			this.allProdutos = this.proxy.getProdutos();
			this.vendedores = this.proxy.getColaboradores();
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String action_removerEstoque() {
		try {
			this.proxy.removerEstoque(this.estoque);
			this.addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String action_addEstoque() {
		try {
			for (int i = 0; i < this.qtd; i += 1) {
				this.proxy.addEstoque(this.estoque);
			}
			this.addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String action_venderEstoque() {
		try {
			// informa o item do estoque, vendedor, o valor e a data
			this.proxy.venderEstoque(this.estoque);
			this.addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public Collection<Estoque> getEstoques() {
		return estoques;
	}

	public void setEstoques(Collection<Estoque> estoques) {
		this.estoques = estoques;
	}

	public Date getDataInicial() {
		return dataInicial;
	}

	public void setDataInicial(String dataInicial) {
		this.dataInicial = SystemUtils.parseStringToDate(dataInicial);
	}

	public Date getDataFinal() {
		return dataFinal;
	}

	public void setDataFinal(String dataFinal) {
		this.dataFinal = SystemUtils.parseStringToDate(dataFinal);
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public IProxy getProxy() {
		return proxy;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getQtd() {
		return qtd;
	}

	public void setQtd(int qtd) {
		this.qtd = qtd;
	}

	public Estoque getEstoque() {
		return estoque;
	}

	public void setEstoque(Estoque estoque) {
		this.estoque = estoque;
	}

	public Collection<Produto> getAllProdutos() {
		return allProdutos;
	}

	public void setAllProdutos(Collection<Produto> allProdutos) {
		this.allProdutos = allProdutos;
	}

	public Collection<Professor> getVendedores() {
		return vendedores;
	}

	public void setVendedores(Collection<Professor> vendedores) {
		this.vendedores = vendedores;
	}

	public Professor getVendedor() {
		return vendedor;
	}

	public void setVendedor(Professor vendedor) {
		this.vendedor = vendedor;
	}

	public String getValorTotal() {
		return SystemUtils.parseDoubleToString(this.valorTotal);
	}

	public String getValorVendedor() {
		return SystemUtils.parseDoubleToString(this.valorVendedor);
	}

}
