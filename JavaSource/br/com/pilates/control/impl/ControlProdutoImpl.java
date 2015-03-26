package br.com.pilates.control.impl;

import java.util.Collection;

import br.com.pilates.base.Produto;
import br.com.pilates.control.ControlProduto;
import br.com.pilates.dao.DAOProduto;
import br.com.pilates.dao.impl.DAOProdutoImpl;
import br.com.pilates.excecao.PilatesException;
import br.com.pilates.util.PilatesBundleUtil;

public class ControlProdutoImpl implements ControlProduto {

	private final DAOProduto dao;

	public ControlProdutoImpl() {
		this.dao = new DAOProdutoImpl();
	}

	@Override
	public Collection<Produto> getProdutos() {
		return this.dao.getProdutos();
	}

	@Override
	public Produto getProduto(Produto produto) {
		return this.dao.read(Produto.class, produto.getId());
	}

	@Override
	public void editarProduto(Produto produto) {
		if (produto == null || produto.getId() == null)
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		this.dao.update(produto);
	}

	@Override
	public void addProduto(Produto produto) {
		this.dao.insert(produto);
	}

	@Override
	public void removerProduto(Produto produto) {
		this.dao.delete(produto);
	}

}
