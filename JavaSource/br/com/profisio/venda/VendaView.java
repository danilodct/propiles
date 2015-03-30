package br.com.profisio.venda;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import br.com.profisio.basics.Colaborador;
import br.com.profisio.basics.Estoque;
import br.com.profisio.basics.Produto;
import br.com.profisio.basics.enums.StatusEstoque;
import br.com.profisio.colaborador.ColaboradorControl;
import br.com.profisio.util.ItemGeralUI;
import br.com.profisio.util.ProfisioActionSupport;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.ProfisioException;
import br.com.profisio.util.ProfisioSessionUtil;
import br.com.profisio.util.SystemUtils;
import br.com.profisio.util.Tenant;

public class VendaView extends ProfisioActionSupport {

	private static final long serialVersionUID = 4742339788981156278L;

	private final VendaControl controller;

	private Collection<Produto> produtos;
	private Collection<Estoque> estoques;
	private Estoque estoque;
	private Produto produto;
	private Colaborador vendedor, colaborador;
	private String novaCategoria, status, page, formaPagamentoStr, statusContaPagarStr;
	private Date dataInicial, dataFinal;
	private Integer qtdProdutos, qtdVendidos, qtdEstoque;

	public VendaView() {
		controller = VendaControl.getInstance();
	}

	public String actionVendidos() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.estoques = this.controller.getEstoquesVendidos(tenant, dataInicial, dataFinal, produto, colaborador);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionRemoverEstoque() {
		String resposta = REDIRECT;
		try {
			this.controller.removerEstoque(this.estoque);
			this.addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		if (this.page != null && this.page.equals("contasReceber"))
			resposta = "redirect_contasReceber";
		return resposta;
	}

	public String actionVenderEstoque() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			// informa o item do estoque, vendedor, o valor e a data
			this.controller.venderEstoque(tenant, this.estoque);
			this.addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionAddEstoque() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			if (qtdProdutos == null)
				throw new ProfisioException(ProfisioBundleUtil.INFORME_QTD_PRODUTOS);
			for (int i = 0; i < this.qtdProdutos; i += 1) {
				this.controller.addEstoque(tenant, this.estoque);
			}
			this.addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionEstoque() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			this.estoques = this.controller.getEstoque(tenant, produto, vendedor, dataInicial, dataFinal, StatusEstoque.DISPONIVEL.getValue());
			this.qtdVendidos = this.getQtdVendidos(this.estoques);
			if (this.estoques != null && this.estoques.size() > 0)
				this.qtdEstoque = this.estoques.size();
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	private Integer getQtdVendidos(Collection<Estoque> estoques) {
		Integer qtd = 0;
		if (estoques != null && estoques.size() > 0) {
			for (Estoque est : estoques) {
				if (est.getStatus() == StatusEstoque.VENDIDO)
					qtd += 1;
			}
		}
		return qtd;
	}

	public String actionCadastrarProduto() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			if (produto != null && produto.getCategoria() != null && produto.getCategoria().equals("-1"))
				produto.setCategoria(novaCategoria);
			controller.cadastrarProduto(tenant, produto);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.CADASTRO_SUCESSO));
			produto = null;
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionEditarProduto() {
		String resposta = null;
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			if (produto != null && produto.getCategoria() != null && produto.getCategoria().equals("-1"))
				produto.setCategoria(novaCategoria);
			controller.editarProduto(tenant, produto);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
			resposta = SUCCESS;
		} catch (Exception e) {
			this.dealException(e);
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionViewProduto() {
		String resposta = "";
		try {
			this.produto = controller.getProduto(produto);
			resposta = SUCCESS;
		} catch (Exception e) {
			this.dealException(e);
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionRemoverProduto() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			controller.removerProduto(tenant, produto);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionProdutos() {
		try {
			Tenant tenant = ProfisioSessionUtil.getTenantSession();
			String categoria = null;
			if (produto != null && produto.getCategoria() != null) {
				categoria = produto.getCategoria();
				if (categoria.equals("-1"))
					categoria = null;
			}
			this.produtos = controller.getProdutos(tenant, categoria);
			this.qtdProdutos = controller.getQtdTotalProdutos(tenant);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public Collection<ItemGeralUI> getCategoriasProduto() {
		Tenant tenant = ProfisioSessionUtil.getTenantSession();
		Collection<String> categoriasProduto = VendaControl.getInstance().getCategoriasProduto(tenant);
		Collection<ItemGeralUI> retorno = new ArrayList<ItemGeralUI>();
		if (categoriasProduto != null && categoriasProduto.size() > 0) {
			for (String str : categoriasProduto)
				retorno.add(new ItemGeralUI(str, str));
		}
		return retorno;
	}

	// 9888888888888888888888888888888888888888888888888888

	public Collection<Produto> getAllProdutos() {
		Collection<Produto> retorno = new ArrayList<Produto>();
		Tenant tenant = ProfisioSessionUtil.getTenantSession();
		retorno = this.controller.getProdutos(tenant, null);
		return retorno;
	}

	public Collection<Colaborador> getAllVendedores() {
		Tenant tenant = ProfisioSessionUtil.getTenantSession();
		Collection<Colaborador> retorno = new ArrayList<Colaborador>();
		retorno = ColaboradorControl.getInstance().getColaboradores(tenant, null);
		return retorno;
	}

	// 9888888888888888888888888888888888888888888888888888

	public Collection<Produto> getProdutos() {
		return produtos;
	}

	public void setProdutos(Collection<Produto> produtos) {
		this.produtos = produtos;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public VendaControl getController() {
		return controller;
	}

	public String getNovaCategoria() {
		return novaCategoria;
	}

	public void setNovaCategoria(String novaCategoria) {
		this.novaCategoria = novaCategoria;
	}

	public Integer getQtdProdutos() {
		return qtdProdutos;
	}

	public void setQtdProdutos(Integer qtdProdutos) {
		this.qtdProdutos = qtdProdutos;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDataInicialStr() {
		return SystemUtils.parseDataToString(dataInicial);
	}

	public void setDataInicialStr(String dataInicial) {
		this.dataInicial = SystemUtils.parseStringToDate(dataInicial);
	}

	public String getDataFinalStr() {
		return SystemUtils.parseDataToString(dataFinal);
	}

	public void setDataFinalStr(String dataFinal) {
		this.dataFinal = SystemUtils.parseStringToDate(dataFinal);
	}

	public Collection<Estoque> getEstoques() {
		return estoques;
	}

	public void setEstoques(Collection<Estoque> estoques) {
		this.estoques = estoques;
	}

	public Estoque getEstoque() {
		return estoque;
	}

	public void setEstoque(Estoque estoque) {
		this.estoque = estoque;
	}

	public Colaborador getVendedor() {
		return vendedor;
	}

	public void setVendedor(Colaborador vendedor) {
		this.vendedor = vendedor;
	}

	public Integer getQtdVendidos() {
		return qtdVendidos;
	}

	public void setQtdVendidos(Integer qtdVendidos) {
		this.qtdVendidos = qtdVendidos;
	}

	public Integer getQtdEstoque() {
		return qtdEstoque;
	}

	public void setQtdEstoque(Integer qtdEstoque) {
		this.qtdEstoque = qtdEstoque;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public Colaborador getColaborador() {
		return colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}

	public String getFormaPagamentoStr() {
		return formaPagamentoStr;
	}

	public void setFormaPagamentoStr(String formaPagamentoStr) {
		this.formaPagamentoStr = formaPagamentoStr;
	}

	public String getStatusContaPagarStr() {
		return statusContaPagarStr;
	}

	public void setStatusContaPagarStr(String statusContaPagarStr) {
		this.statusContaPagarStr = statusContaPagarStr;
	}

}
