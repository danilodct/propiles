package br.com.pilates.control;

import java.util.Collection;

import br.com.pilates.base.Produto;

public interface ControlProduto {

	Collection<Produto> getProdutos();

	Produto getProduto(Produto produto);

	void editarProduto(Produto produto);

	void addProduto(Produto produto);

	void removerProduto(Produto produto);

}
