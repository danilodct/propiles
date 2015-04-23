package br.com.profisio.venda;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import br.com.profisio.basics.Colaborador;
import br.com.profisio.basics.Estoque;
import br.com.profisio.basics.Movimentacao;
import br.com.profisio.basics.Produto;
import br.com.profisio.util.DAOBase;
import br.com.profisio.util.Tenant;

public class VendaDAO extends DAOBase {

	public VendaDAO() {
	}

	public static Object daoFactory() {
		return DAOBase.DAOFactory(VendaDAO.class);
	}

	@SuppressWarnings("unchecked")
	public Collection<Produto> getProdutos(Tenant tenant, String categoria, Integer start, Integer end) {
		Collection<Produto> retorno = null;
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("categoria", categoria);
		if (start != null) {
			retorno = imp.createNamedQuery("getProdutos", params).list().subList(start, end);
		} else {
			retorno = this.imp.createNamedQuery("getProdutos", params).list();
		}
		return retorno;
	}

	@SuppressWarnings("unchecked")
	public Collection<String> getCategoriasProduto(Tenant tenant) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		return this.imp.createNamedQuery("getCategoriasProduto", params).list();
	}

	@SuppressWarnings("unchecked")
	public void remover(Produto produto) {
		this.imp.delete(produto);
	}

	@SuppressWarnings("unchecked")
	public Produto getProdutoById(Integer id) {
		return (Produto) this.imp.read(Produto.class, id);
	}

	@SuppressWarnings("unchecked")
	public void editarProduto(Produto produto) {
		this.imp.update(produto);
	}

	@SuppressWarnings("unchecked")
	public void cadastrarProduto(Produto produto) {
		this.imp.insert(produto);
	}

	@SuppressWarnings("unchecked")
	public Integer getQtdProdutos(Tenant tenant, String categoria) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("categoria", categoria);
		return ((Long) this.imp.createNamedQuery("getQtdProdutos", params).uniqueResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public Collection<Estoque> getEstoque(Tenant tenant, Produto produto, Colaborador vendedor, Date dataInicial, Date dataFinal, String status) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		if (status != null && status.equals(""))
			status = null;
		params.put("status", status);
		params.put("produto", produto);
		params.put("vendedor", vendedor);
		return this.imp.createNamedQuery("getEstoque", params).list();
	}

	@SuppressWarnings("unchecked")
	public Estoque getEstoqueById(Integer id) {
		return (Estoque) this.imp.read(Estoque.class, id);
	}

	@SuppressWarnings("unchecked")
	public void editarEstoque(Estoque estoque) {
		this.imp.update(estoque);
	}

	@SuppressWarnings("unchecked")
	public void cadastrarEstoque(Estoque estoque) {
		this.imp.insert(estoque);
	}

	@SuppressWarnings("unchecked")
	public void removerEstoque(Estoque estoque) {
		this.imp.delete(estoque);
	}

	@SuppressWarnings("unchecked")
	public Collection<Estoque> getEstoquesVendidos(Tenant tenant, Date dataInicial, Date dataFinal, Produto produto, Colaborador colaborador, Integer start, Integer end) {
		Collection<Estoque> retorno = null;
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("produto", produto);
		params.put("colaborador", colaborador);

		if (start != null) {
			retorno = this.imp.createNamedQuery("getEstoquesVendidos", params).list().subList(start, end);
		} else {
			retorno = this.imp.createNamedQuery("getEstoquesVendidos", params).list();
		}
		return retorno;
	}

	@SuppressWarnings("unchecked")
	public void cadastrarMovimentacao(Movimentacao mov) {
		this.imp.insert(mov);
	}

	@SuppressWarnings("unchecked")
	public Integer getQtdEstoquesVendidos(Tenant tenant, Date dataInicial, Date dataFinal, Produto produto, Colaborador vendedor) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		params.put("produto", produto);
		params.put("colaborador", vendedor);
		return ((Long) this.imp.createNamedQuery("getQtdEstoquesVendidos", params).uniqueResult()).intValue();
	}

}
