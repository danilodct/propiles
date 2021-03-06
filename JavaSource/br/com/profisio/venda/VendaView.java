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
import br.com.profisio.util.ProfisioLoggerUtil;
import br.com.profisio.util.SystemUtils;

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
		ProfisioLoggerUtil.info("VendaView.actionVendidos()");
		try {

			if (getPagAtual() == null)
				setPagAtual(1);
			if (produto != null && produto.getId() == null)
				produto = null;
			if (vendedor != null && vendedor.getId() == null)
				vendedor = null;
			this.qtdProdutos = controller.getQtdEstoquesVendidos(getTenant(), dataInicial, dataFinal, produto, vendedor);
			this.setQtdPaginas(this.controller.getQtdPaginasEstoqueVendidos(getTenant(), dataInicial, dataFinal, produto, vendedor));
			this.estoques = this.controller.getEstoquesVendidos(getTenant(), dataInicial, dataFinal, produto, vendedor, getPagAtual());
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionRemoverEstoque() {
		ProfisioLoggerUtil.info("VendaView.actionRemoverEstoque()");
		String resposta = REDIRECT;
		try {
			this.controller.removerEstoque(getTenant(), this.estoque);
			this.addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		if (this.page != null && this.page.equals("contasReceber"))
			resposta = "redirect_contasReceber";
		if (this.page != null && this.page.equals("vendidos"))
			resposta = "redirect_vendidos";
		return resposta;
	}

	public String actionVenderEstoque() {
		ProfisioLoggerUtil.info("VendaView.actionVenderEstoque()");
		try {

			// informa o item do estoque, vendedor, o valor e a data
			this.controller.venderEstoque(getTenant(), this.estoque);
			this.addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionAddEstoque() {
		ProfisioLoggerUtil.info("VendaView.actionAddEstoque()");
		try {

			if (qtdProdutos == null)
				throw new ProfisioException(ProfisioBundleUtil.INFORME_QTD_PRODUTOS);
			for (int i = 0; i < this.qtdProdutos; i += 1) {
				this.controller.addEstoque(getTenant(), this.estoque);
			}
			this.addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionEstoque() {
		ProfisioLoggerUtil.info("VendaView.actionEstoque()");
		try {
			this.estoques = this.controller.getEstoque(getTenant(), produto, vendedor, dataInicial, dataFinal, StatusEstoque.DISPONIVEL.getValue());
			if (this.estoques != null && this.estoques.size() > 0)
				this.qtdEstoque = this.estoques.size();
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionCadastrarProduto() {
		ProfisioLoggerUtil.info("VendaView.actionCadastrarProduto()");
		try {

			if (produto != null && produto.getCategoria() != null && produto.getCategoria().equals("-1"))
				produto.setCategoria(novaCategoria);
			controller.cadastrarProduto(getTenant(), produto);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.CADASTRO_SUCESSO));
			produto = null;
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionEditarProduto() {
		ProfisioLoggerUtil.info("VendaView.actionEditarProduto()");
		String resposta = null;
		try {

			if (produto != null && produto.getCategoria() != null && produto.getCategoria().equals("-1"))
				produto.setCategoria(novaCategoria);
			controller.editarProduto(getTenant(), produto);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.ALTERACAO_SUCESSO));
			resposta = SUCCESS;
			this.produto = null;
		} catch (Exception e) {
			this.dealException(e);
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionViewProduto() {
		ProfisioLoggerUtil.info("VendaView.actionViewProduto()");
		String resposta = "";
		try {
			this.produto = controller.getProduto(getTenant(), produto);
			resposta = SUCCESS;
		} catch (Exception e) {
			this.dealException(e);
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionRemoverProduto() {
		ProfisioLoggerUtil.info("VendaView.actionRemoverProduto()");
		try {

			controller.removerProduto(getTenant(), produto);
			addActionMessage(ProfisioBundleUtil.getMsg(ProfisioBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionProdutos() {
		ProfisioLoggerUtil.info("VendaView.actionProdutos()");
		try {
			String categoria = null;
			if (produto != null && produto.getCategoria() != null) {
				categoria = produto.getCategoria();
				if (categoria.equals("-1") || categoria.trim().equals("")) {
					categoria = null;
					produto.setCategoria(null);
				}
			}

			if (getPagAtual() == null)
				setPagAtual(1);
			this.qtdProdutos = controller.getQtdProdutos(getTenant(), categoria);
			this.setQtdPaginas(this.controller.getQtdPaginasProdutos(getTenant(), categoria));
			this.produtos = controller.getProdutos(getTenant(), categoria, getPagAtual());
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	// 9888888888888888888888888888888888888888888888888888

	public Collection<ItemGeralUI> getCategoriasProduto() {
		Collection<String> categoriasProduto = VendaControl.getInstance().getCategoriasProduto(getTenant());
		Collection<ItemGeralUI> retorno = new ArrayList<ItemGeralUI>();
		if (categoriasProduto != null && categoriasProduto.size() > 0) {
			for (String str : categoriasProduto)
				retorno.add(new ItemGeralUI(str, str));
		}
		retorno.add(new ItemGeralUI("-1", "Outro"));
		return retorno;
	}

	public Collection<Produto> getAllProdutos() {
		Collection<Produto> retorno = new ArrayList<Produto>();
		retorno = this.controller.getProdutos(getTenant(), null, null);
		return retorno;
	}

	public Collection<Colaborador> getAllVendedores() {

		Collection<Colaborador> retorno = new ArrayList<Colaborador>();
		retorno = ColaboradorControl.getInstance().getColaboradores(getTenant(), null);
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
