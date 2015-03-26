package br.com.pilates.dao;

import java.util.Collection;

import br.com.pilates.base.Produto;

public interface DAOProduto extends IHibernateDAO<Produto> {

	Collection<Produto> getProdutos();

}
