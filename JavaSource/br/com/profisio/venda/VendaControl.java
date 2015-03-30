package br.com.profisio.venda;

import java.util.Calendar;
import java.util.Collection;
import java.util.Date;

import br.com.profisio.basics.Colaborador;
import br.com.profisio.basics.Estoque;
import br.com.profisio.basics.Movimentacao;
import br.com.profisio.basics.Produto;
import br.com.profisio.basics.enums.StatusEstoque;
import br.com.profisio.basics.enums.StatusObjeto;
import br.com.profisio.basics.enums.TipoMovimentacao;
import br.com.profisio.colaborador.ColaboradorControl;
import br.com.profisio.util.ControllerBase;
import br.com.profisio.util.ProfisioBundleUtil;
import br.com.profisio.util.ProfisioException;
import br.com.profisio.util.SystemUtils;
import br.com.profisio.util.Tenant;

public class VendaControl extends ControllerBase {

	private static VendaControl instance = null;
	private VendaDAO dao = null;

	private VendaControl() {
		dao = (VendaDAO) VendaDAO.daoFactory();
	}

	public static VendaControl getInstance() {
		if (instance == null)
			instance = new VendaControl();
		return instance;
	}

	public Collection<Produto> getProdutos(Tenant tenant, String categoria) {
		return this.dao.getProdutos(tenant, categoria);
	}

	public Collection<String> getCategoriasProduto(Tenant tenant) {
		Collection<String> categorias = this.dao.getCategoriasProduto(tenant);
		return categorias;
	}

	public void removerProduto(Tenant tenant, Produto produto) {
		SystemUtils.assertObjectIsNotNullHasId(produto);
		produto = this.dao.getProdutoById(produto.getId());
		produto.setStatusObjeto(StatusObjeto.MORTO);
		produto.setTenant(tenant);
		this.dao.editarProduto(produto);
	}

	public Produto getProduto(Produto produto) {
		SystemUtils.assertObjectIsNotNullHasId(produto);
		return this.dao.getProdutoById(produto.getId());
	}

	public void editarProduto(Tenant tenant, Produto produto) {
		SystemUtils.assertObjectIsNotNullHasId(produto);
		if (produto.getCategoria() == null || produto.getCategoria().equals(""))
			throw new ProfisioException(ProfisioBundleUtil.INFORME_CATEGORIA);
		if (produto.getNome() == null || produto.getNome().equals(""))
			throw new ProfisioException(ProfisioBundleUtil.NOME_OBRIGATORIO);
		if (produto.getValor() == null || produto.getValor() == 0)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_VALOR);
		produto.setStatusObjeto(StatusObjeto.ATIVO);
		produto.setTenant(tenant);
		this.dao.editarProduto(produto);
	}

	public void cadastrarProduto(Tenant tenant, Produto produto) {
		SystemUtils.assertObjectIsNotNull(produto);
		if (produto.getCategoria() == null || produto.getCategoria().equals(""))
			throw new ProfisioException(ProfisioBundleUtil.INFORME_CATEGORIA);
		if (produto.getNome() == null || produto.getNome().equals(""))
			throw new ProfisioException(ProfisioBundleUtil.NOME_OBRIGATORIO);
		if (produto.getValor() == null || produto.getValor() == 0)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_VALOR);

		produto.setStatusObjeto(StatusObjeto.ATIVO);
		produto.setTenant(tenant);
		this.dao.cadastrarProduto(produto);
	}

	public Integer getQtdTotalProdutos(Tenant tenant) {
		return this.dao.getQtdTotalProdutos(tenant);
	}

	public Collection<Estoque> getEstoque(Tenant tenant, Produto produto, Colaborador vendedor, Date dataInicial, Date dataFinal, String status) {
		if (status == null || status.equals("") || status.equals("-1"))
			status = null;
		if (produto != null && (produto.getId() == null || produto.getId().intValue() == -1))
			produto = null;
		if (vendedor != null && (vendedor.getId() == null || vendedor.getId().intValue() == -1))
			vendedor = null;
		dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
		dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 11, 59, 59);
		return this.dao.getEstoque(tenant, produto, vendedor, dataInicial, dataFinal, status);
	}

	public void venderEstoque(Tenant tenant, Estoque estoque) {
		SystemUtils.assertObjectIsNotNullHasId(estoque);
		if (estoque.getData() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_DATA);
		if (estoque.getValor() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_VALOR);
		if (estoque.getVendedor() == null)
			throw new ProfisioException(ProfisioBundleUtil.INFORME_VENDEDOR);
		Colaborador vend = estoque.getVendedor();
		Date data = estoque.getData();
		data = SystemUtils.setHoraData(data, Calendar.PM, 12, 0, 0);
		Double valor = estoque.getValor();
		estoque = this.dao.getEstoqueById(estoque.getId());
		estoque.setStatus(StatusEstoque.VENDIDO);
		estoque.setVendedor(vend);
		estoque.setData(data);
		estoque.setValor(valor);
		estoque.setTenant(tenant);
		this.dao.editarEstoque(estoque);

		Produto produto = this.dao.getProdutoById(estoque.getProduto().getId());
		Colaborador vendedor = ColaboradorControl.getInstance().getColaboradorById(estoque.getVendedor().getId());
		Movimentacao mov = new Movimentacao(estoque.getValor(), estoque.getData(), produto.getNome() + "; Vendedor: " + vendedor.getNome(), TipoMovimentacao.VENDA);
		mov.setTenant(tenant);
		this.dao.cadastrarMovimentacao(mov);

		estoque.setMovimentacao(mov);
		this.dao.editarEstoque(estoque);
	}

	public void addEstoque(Tenant tenant, Estoque estoque) {
		SystemUtils.assertObjectIsNotNull(estoque);
		estoque.setStatus(StatusEstoque.DISPONIVEL);
		estoque.setTenant(tenant);
		this.dao.cadastrarEstoque(estoque);
	}

	public void removerEstoque(Estoque estoque) {
		SystemUtils.assertObjectIsNotNullHasId(estoque);
		estoque = this.dao.getEstoqueById(estoque.getId());
		this.dao.removerEstoque(estoque);
	}

	public Collection<Estoque> getEstoquesVendidos(Tenant tenant, Date dataInicial, Date dataFinal, Produto produto, Colaborador colaborador) {
		// se o usuário nao informou data inicio e fim, vai pegar paenas
		if (dataInicial == null && dataFinal == null) {
			Calendar calendar = Calendar.getInstance();
			calendar.set(Calendar.DAY_OF_MONTH, 1);
			calendar.set(Calendar.AM_PM, Calendar.AM);
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			dataInicial = calendar.getTime();
			calendar = Calendar.getInstance();
			calendar.set(Calendar.AM_PM, Calendar.PM);
			calendar.set(Calendar.HOUR, 23);
			calendar.set(Calendar.MINUTE, 59);
			calendar.set(Calendar.SECOND, 59);
			calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
			dataFinal = calendar.getTime();
		} else {
			dataInicial = SystemUtils.setHoraData(dataInicial, Calendar.AM, 0, 0, 0);
			dataFinal = SystemUtils.setHoraData(dataFinal, Calendar.PM, 11, 59, 59);
		}

		if (produto != null && (produto.getId() == null || produto.getId().intValue() == -1))
			produto = null;
		if (colaborador != null && (colaborador.getId() == null || colaborador.getId().intValue() == -1))
			colaborador = null;

		return this.dao.getEstoquesVendidos(tenant, dataInicial, dataFinal, produto, colaborador);
	}

}
