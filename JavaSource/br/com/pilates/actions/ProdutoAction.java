package br.com.pilates.actions;

import java.util.Collection;

import br.com.pilates.base.Produto;
import br.com.pilates.fachada.IProxy;
import br.com.pilates.fachada.Proxy;
import br.com.pilates.util.PilatesBundleUtil;

@SuppressWarnings("serial")
public class ProdutoAction extends PilatesActionSupport {

	private final IProxy proxy;
	private Collection<Produto> produtos;
	private Produto produto;

	public ProdutoAction() {
		proxy = Proxy.getInstance();
	}

	public String action_produtos() {
		try {
			this.produtos = this.proxy.getProdutos();
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String action_produto() {
		try {
			this.produto = this.proxy.getProduto(this.produto);
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String action_editarProduto() {
		String resposta = "";
		try {
			this.proxy.editarProduto(this.produto);
			resposta = SUCCESS;
			this.addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			resposta = ERROR;
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return resposta;
	}

	public String action_addProduto() {
		String resposta = "";
		try {
			this.proxy.addProduto(this.produto);
			resposta = SUCCESS;
			this.addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			resposta = ERROR;
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return resposta;
	}

	public String action_removerProduto() {
		try {
			this.proxy.removerProduto(this.produto);
			this.addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

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

}
