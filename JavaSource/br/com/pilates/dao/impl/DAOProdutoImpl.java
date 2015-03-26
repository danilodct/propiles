package br.com.pilates.dao.impl;

import java.util.Collection;

import br.com.pilates.base.Produto;
import br.com.pilates.dao.DAOProduto;

public class DAOProdutoImpl extends HibernateDAO<Produto> implements DAOProduto {

	@Override
	public Collection<Produto> getProdutos() {
		return this.list("getProdutos");
	}

}
