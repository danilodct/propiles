package br.com.pilates.fachada;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Avaliacao;
import br.com.pilates.base.Cadastro;
import br.com.pilates.base.CentroCusto;
import br.com.pilates.base.Cliente;
import br.com.pilates.base.Configuracao;
import br.com.pilates.base.ContaPagar;
import br.com.pilates.base.ContaReceber;
import br.com.pilates.base.Contrato;
import br.com.pilates.base.Estoque;
import br.com.pilates.base.Frequencia;
import br.com.pilates.base.ObjetoBasico;
import br.com.pilates.base.Produto;
import br.com.pilates.base.Professor;
import br.com.pilates.base.RelatorioMidia;
import br.com.pilates.base.Servico;
import br.com.pilates.base.TipoCadastro;
import br.com.pilates.base.TipoContaPagar;
import br.com.pilates.base.TipoContaReceber;
import br.com.pilates.base.Usuario;
import br.com.pilates.base.enums.Sexo;
import br.com.pilates.base.enums.TipoCusto;
import br.com.pilates.base.util.FormaConhecimento;
import br.com.pilates.base.util.RelatorioFormaPagamento;
import br.com.pilates.control.ControlCentroCusto;
import br.com.pilates.control.ControlCliente;
import br.com.pilates.control.ControlConfiguracoes;
import br.com.pilates.control.ControlContaPagar;
import br.com.pilates.control.ControlContaReceber;
import br.com.pilates.control.ControlEstoque;
import br.com.pilates.control.ControlFrequencia;
import br.com.pilates.control.ControlProduto;
import br.com.pilates.control.ControlProfessor;
import br.com.pilates.control.ControlServico;
import br.com.pilates.control.impl.ControlCentroCustoImpl;
import br.com.pilates.control.impl.ControlClienteImpl;
import br.com.pilates.control.impl.ControlConfiguracoesImpl;
import br.com.pilates.control.impl.ControlContaPagarImpl;
import br.com.pilates.control.impl.ControlContaReceberImpl;
import br.com.pilates.control.impl.ControlEstoqueImpl;
import br.com.pilates.control.impl.ControlFrequenciaImpl;
import br.com.pilates.control.impl.ControlProdutoImpl;
import br.com.pilates.control.impl.ControlProfessorImpl;
import br.com.pilates.control.impl.ControlServicoImpl;

public class Proxy implements IProxy {

	private static IProxy instance;

	private final ControlFrequencia controlFrequencia;
	private final ControlProfessor controlProfessor;
	private final ControlProduto controlProduto;
	private final ControlEstoque controlEstoque;
	private final ControlContaReceber controlContasReceber;
	private final ControlCliente controlCliente;
	private final ControlContaPagar controlContaPagar;
	private final ControlServico controlServico;
	private final ControlCentroCusto controlCentroCusto;
	private final ControlConfiguracoes controlConfiguracoes;

	public Proxy() {
		this.controlFrequencia = new ControlFrequenciaImpl();
		this.controlProfessor = new ControlProfessorImpl();
		this.controlProduto = new ControlProdutoImpl();
		this.controlEstoque = new ControlEstoqueImpl();
		this.controlContasReceber = new ControlContaReceberImpl();
		this.controlCliente = new ControlClienteImpl();
		this.controlContaPagar = new ControlContaPagarImpl();
		this.controlServico = new ControlServicoImpl();
		this.controlCentroCusto = new ControlCentroCustoImpl();
		this.controlConfiguracoes = new ControlConfiguracoesImpl();
	}

	public static IProxy getInstance() {
		if (instance == null) {
			instance = (IProxy) ProxyInterceptor.newProxy(new Proxy());
		}
		return instance;
	}

	@SuppressWarnings({ "rawtypes" })
	@Override
	public ObjetoBasico read(Class clazz, Integer id) {
		return FachadaGeral.getInstance().read(clazz, id);
	}

	@Override
	public void insert(ObjetoBasico mat) {
		FachadaGeral.getInstance().save(mat);
	}

	@Override
	public void update(ObjetoBasico pergunta) {
		FachadaGeral.getInstance().update(pergunta);
	}

	@Override
	public void delete(ObjetoBasico obj) {
		FachadaGeral.getInstance().delete(obj);
	}

	@Override
	public void login(Usuario usuario) {
		FachadaUsuario.getInstance().login(usuario);
	}

	@Override
	public void logout() {
		FachadaUsuario.getInstance().logout();
	}

	@Override
	public Collection<Cliente> getPoucosClientes() {
		return FachadaCliente.getInstance().getPoucosClientes();
	}

	@Override
	public void inserirCliente(Cliente cliente) {
		FachadaCliente.getInstance().inserirCliente(cliente);
	}

	@Override
	public boolean isCPFDisponivel(String cpf) {
		return FachadaCliente.getInstance().isCPFDisponivel(cpf);
	}

	@Override
	public Cliente lerCliente(Cliente cliente) {
		return FachadaCliente.getInstance().lerCliente(cliente);
	}

	@Override
	public void editarCliente(Cliente cliente) {
		FachadaCliente.getInstance().editarCliente(cliente);
	}

	@Override
	public void removerCliente(Cliente cliente) {
		FachadaCliente.getInstance().removerCliente(cliente);
	}

	@Override
	public void editarFuncionario(Professor funcionario) {
		FachadaProfessor.getInstance().editarFuncionario(funcionario);
	}

	@Override
	public Collection<Professor> getPoucosFuncionarios() {
		return FachadaProfessor.getInstance().getPoucosFuncionarios();
	}

	@Override
	public Collection<Professor> getFuncionarios() {
		return FachadaProfessor.getInstance().getFuncionarios();
	}

	@Override
	public void inserirFuncionario(Professor funcionario) {
		FachadaProfessor.getInstance().inserirFuncionario(funcionario);
	}

	@Override
	public Professor lerFuncionario(Professor funcionario) {
		return FachadaProfessor.getInstance().lerFuncionario(funcionario);
	}

	@Override
	public void removerFuncionario(Professor funcionario) {
		FachadaProfessor.getInstance().removerFuncionario(funcionario);
	}

	@Override
	public Collection<Cliente> pesquisarClientes(String pesquisa, String param) {
		return FachadaCliente.getInstance().pesquisarClientes(pesquisa, param);
	}

	@Override
	public Collection<Professor> pesquisarProfessores(String pesquisa, String param) {
		return FachadaProfessor.getInstance().pesquisarProfessores(pesquisa, param);
	}

	@Override
	public Collection<Contrato> getContratosFuncionario(Professor funcionario) {
		return FachadaContrato.getInstance().getContratosFuncionario(funcionario);
	}

	@Override
	public void inserirContrato(Contrato contrato) {
		FachadaContrato.getInstance().inserirContrato(contrato);
	}

	@Override
	public void editarContrato(Contrato contrato) {
		FachadaContrato.getInstance().editarContrato(contrato);
	}

	@Override
	public void removerContrato(Contrato contrato) {
		FachadaContrato.getInstance().removerContrato(contrato);
	}

	@Override
	public Collection<Professor> getProfessoresByModalidade(Servico servico) {
		return FachadaProfessor.getInstance().getProfessoresByModalidade(servico);
	}

	@Override
	public Collection<TipoCadastro> getAllTiposCadastro() {
		return FachadaCadastro.getInstance().getAllTiposCadastro();
	}

	@Override
	public void inserirCadastro(Cadastro cadastro) {
		FachadaCadastro.getInstance().inserirCadastro(cadastro);
	}

	@Override
	public Collection<Cadastro> getCadastrosAtivosByCliente(Cliente cliente) {
		return FachadaCadastro.getInstance().getCadastrosAtivosByCliente(cliente);
	}

	@Override
	public void removerCadastro(Cadastro cadastro) {
		FachadaCadastro.getInstance().removerCadastro(cadastro);
	}

	@Override
	public Avaliacao getLastAvaliacaoByModalidadeCliente(Servico servico, Cliente cliente) {
		return FachadaCadastro.getInstance().getLastAvaliacaoByModalidadeCliente(servico, cliente);
	}

	@Override
	public void inserirContaReceberCadastro(ContaReceber contaReceber, Cadastro cadastro) {
		FachadaContaReceber.getInstance().inserirContaReceberCadastro(contaReceber, cadastro);
	}

	@Override
	public Cadastro lerCadastro(Cadastro cadastro) {
		return FachadaCadastro.getInstance().lerCadastro(cadastro);
	}

	@Override
	public Collection<ContaReceber> getContasReceberByCadastro(Cadastro cadastro) {
		return FachadaContaReceber.getInstance().getContasReceberByCadastro(cadastro);
	}

	@Override
	public void removerContaReceberCadastro(ContaReceber contaReceber) {
		FachadaContaReceber.getInstance().removerContaReceberCadastro(contaReceber);
	}

	@Override
	public Avaliacao getAvaliacao(Avaliacao avaliacao) {
		return FachadaCadastro.getInstance().getAvaliacao(avaliacao);
	}

	@Override
	public void atualizarAvaliacao(Avaliacao avaliacao) {
		FachadaCadastro.getInstance().atualizarAvaliacao(avaliacao);
	}

	@Override
	public Collection<TipoContaReceber> getAllTiposContaReceber() {
		return FachadaContaReceber.getInstance().getAllTiposContaReceber();
	}

	@Override
	public Cliente getClienteByCPF(String cpf) {
		return FachadaCliente.getInstance().getClienteByCPF(cpf);
	}

	@Override
	public Collection<Cadastro> relatorioAlunos(Date dataInicial, Date dataFinal, Professor professor, String ordenacao) {
		return FachadaCadastro.getInstance().relatorioAlunos(dataInicial, dataFinal, professor, ordenacao);
	}

	@Override
	public Collection<Cliente> relatorioAlunosAtivos(Date dataInicial, Date dataFinal, Professor professor, Servico servico, String ordenacao) {
		return controlFrequencia.relatorioAlunosAtivos(dataInicial, dataFinal, professor, servico, ordenacao);
	}

	@Override
	public Collection<RelatorioFormaPagamento> relatorioFormaPagamento(Date dataInicial, Date dataFinal, String ordenacao) {
		return FachadaRelatorio.getInstance().relatorioFormaPagamento(dataInicial, dataFinal, ordenacao);
	}

	@Override
	public Collection<RelatorioMidia> relatorioMidia(Date dataInicial, Date dataFinal, String ordenacao) {
		return FachadaRelatorio.getInstance().relatorioMidia(dataInicial, dataFinal, ordenacao);
	}

	@Override
	public void inserirContaPagar(ContaPagar contaPagar) {
		FachadaContaPagar.getInstance().inserirContaPagar(contaPagar);
	}

	@Override
	public Collection<TipoContaPagar> getAllTiposContaPagar() {
		return FachadaContaPagar.getInstance().getAllTiposContaPagar();
	}

	@Override
	public Collection<ContaPagar> getContasPagarMesAtual(TipoCusto tipoCusto, Date dataInicial, Date dataFinal, CentroCusto centroCusto) {
		return controlContaPagar.getContasPagarMesAtual(tipoCusto, dataInicial, dataFinal, centroCusto);
	}

	@Override
	public Collection<ContaReceber> getContasReceberMesAtual(Date dataInicial, Date dataFinal) {
		return FachadaContaReceber.getInstance().getContasReceberMesAtual(dataInicial, dataFinal);
	}

	@Override
	public void inserirContaReceber(ContaReceber contaReceber) {
		FachadaContaReceber.getInstance().inserirContaReceber(contaReceber);
	}

	@Override
	public Collection<ContaPagar> getContasPagarByData(Date dataInicial, Date dataFinal) {
		return FachadaContaPagar.getInstance().getContasPagarByData(dataInicial, dataFinal);
	}

	@Override
	public Collection<ContaReceber> getContasReceberByProfessorData(Date dataInicial, Date dataFinal, Professor professor) {
		return FachadaContaReceber.getInstance().getContasReceberByProfessorData(dataInicial, dataFinal, professor);
	}

	@Override
	public double getSomaEntradasByProfessorData(Date dataInicial, Date dataFinal, Professor professor) {
		return FachadaContaReceber.getInstance().getSomaEntradasByProfessorData(dataInicial, dataFinal, professor);
	}

	@Override
	public double getSomaPercentagemProfessorByProfessorData(Date dataInicial, Date dataFinal, Professor professor) {
		return FachadaContaReceber.getInstance().getSomaPercentagemProfessorByProfessorData(dataInicial, dataFinal, professor);
	}

	@Override
	public double getSomaSaidasByData(Date dataInicial, Date dataFinal, TipoCusto tipoCusto) {
		return FachadaContaPagar.getInstance().getSomaSaidasByData(dataInicial, dataFinal, tipoCusto);
	}

	@Override
	public double getSomaPercentagemAllProfessoresByData(Date dataInicial, Date dataFinal) {
		return FachadaContaReceber.getInstance().getSomaPercentagemAllProfessoresByData(dataInicial, dataFinal);
	}

	@Override
	public Collection<Cliente> getProximosAniversariantesClientes() {
		return FachadaCliente.getInstance().getProximosAniversariantes();
	}

	@Override
	public Collection<Professor> getProximosAniversariantesFuncionarios() {
		return FachadaProfessor.getInstance().getProximosAniversariantesFuncionarios();
	}

	@Override
	public void mudarProfessor(Cadastro cadastro) {
		FachadaCadastro.getInstance().mudarProfessor(cadastro);
	}

	@Override
	public Collection<Frequencia> getFrequencias(Date dataInicial, Date dataFinal) {
		return controlFrequencia.getFrequencias(dataInicial, dataFinal);
	}

	@Override
	public void removerFrequencia(Frequencia frequencia) {
		this.controlFrequencia.removerFrequencia(frequencia);
	}

	@Override
	public void addFrequencia(Frequencia frequencia) {
		this.controlFrequencia.addFrequencia(frequencia);
	}

	@Override
	public Collection<Professor> getColaboradores() {
		return this.controlProfessor.getColaboradores();
	}

	@Override
	public Collection<Frequencia> getFrequenciasByCliente(Cliente cliente) {
		return this.controlFrequencia.getFrequenciasByCliente(cliente);
	}

	@Override
	public Collection<Produto> getProdutos() {
		return this.controlProduto.getProdutos();
	}

	@Override
	public Produto getProduto(Produto produto) {
		return this.controlProduto.getProduto(produto);
	}

	@Override
	public void editarProduto(Produto produto) {
		this.controlProduto.editarProduto(produto);
	}

	@Override
	public void addProduto(Produto produto) {
		this.controlProduto.addProduto(produto);
	}

	@Override
	public void removerProduto(Produto produto) {
		this.controlProduto.removerProduto(produto);
	}

	@Override
	public Collection<Estoque> getEstoques(Date dataInicial, Date dataFinal, String status, String nome) {
		return this.controlEstoque.getEstoques(dataInicial, dataFinal, status, nome);
	}

	@Override
	public void addEstoque(Estoque estoque) {
		this.controlEstoque.addEstoque(estoque);
	}

	@Override
	public void removerEstoque(Estoque estoque) {
		this.controlEstoque.removerEstoque(estoque);
	}

	@Override
	public void venderEstoque(Estoque estoque) {
		this.controlEstoque.venderEstoque(estoque);
	}

	@Override
	public Collection<Estoque> getEstoquesVendido(Date dataInicial, Date dataFinal, Professor vendedor) {
		return this.controlEstoque.getEstoquesVendido(dataInicial, dataFinal, vendedor);
	}

	@Override
	public double getSomaVendasByProfessorData(Date dataInicial, Date dataFinal, Professor professor) {
		return this.controlEstoque.getSomaVendasByProfessorData(dataInicial, dataFinal, professor);
	}

	@Override
	public double getPorcentagemVendasByProfessorData(Date dataInicial, Date dataFinal, Professor professor) {
		return this.controlEstoque.getPorcentagemVendasByProfessorData(dataInicial, dataFinal, professor);
	}

	@Override
	public double getSomaVendasData(Date dataInicial, Date dataFinal) {
		return this.controlEstoque.getSomaVendas(dataInicial, dataFinal);
	}

	@Override
	public Collection<ContaReceber> getContasReceberAvulso(Date dataInicial, Date dataFinal) {
		return this.controlContasReceber.getContasReceberAvulso(dataInicial, dataFinal);
	}

	@Override
	public double getSomaEntradasAvulso(Date dataInicial, Date dataFinal) {
		return this.controlContasReceber.getSomaEntradasAvulso(dataInicial, dataFinal);
	}

	@Override
	public String getQtdClientesPorBairroStr(Date dataInicial, Date dataFinal) {
		return this.controlFrequencia.getQtdClientesAtivosByBairroStr(dataInicial, dataFinal);
	}

	@Override
	public String getQtdClientesPorServicoSexoStr(Sexo sexo, Date dataInicial, Date dataFinal) {
		return this.controlFrequencia.getQtdClientesAtivosByServicoStr(sexo, dataInicial, dataFinal);
	}

	@Override
	public String getQtdClientesPorEstadoCivilStr(Date dataInicial, Date dataFinal) {
		return this.controlFrequencia.getQtdClientesAtivosByEstadoCivilStr(dataInicial, dataFinal);
	}

	@Override
	public String getQtdClientesAtivosPorSexoStr(Date dataInicial, Date dataFinal) {
		return this.controlFrequencia.getQtdClientesAtivosBySexoStr(dataInicial, dataFinal);
	}

	@Override
	public String getQtdClientesAtivosPorFaixaEtariaStr(Date dataInicial, Date dataFinal) {
		return this.controlFrequencia.getQtdClientesAtivosByFaixaEtariaStr(dataInicial, dataFinal);
	}

	@Override
	public String getRendimentoServicosStr(Date dataInicio, Date dataFinal) {
		return this.controlContasReceber.getRendimentoServicosStr(dataInicio, dataFinal);
	}

	@Override
	public String getGastosPorTipoStr(Date dataInicio, Date dataFinal) {
		return this.controlContaPagar.getGastosPorTipoStr(dataInicio, dataFinal);
	}

	@Override
	public Collection<ContaReceber> getContasReceberByCliente(Cliente cliente) {
		return this.controlContasReceber.getContasReceberByCliente(cliente);
	}

	@Override
	public Collection<FormaConhecimento> getAllFormasConhecimento() {
		return controlCliente.getAllFormasConhecimento();
	}

	@Override
	public Collection<Cliente> relatorioEfetividade(Date dataInicial, Date dataFinal, String ordenacao) {
		return this.controlFrequencia.relatorioEfetividade(dataInicial, dataFinal, ordenacao);
	}

	@Override
	public double getEntradasCaixa(Date dataInicial) {
		return this.controlContasReceber.getEntradasCaixa(dataInicial);
	}

	@Override
	public double getSaldoCaixa(Date dataInicial) {
		return this.controlContasReceber.getSaldoCaixa(dataInicial);
	}

	@Override
	public double getEntradasVendasCaixa(Date dataInicial) {
		return this.controlContasReceber.getEntradasVendasCaixa(dataInicial);
	}

	@Override
	public double getSaidasCaixa(Date dataInicial) {
		return this.controlContasReceber.getSaidasCaixa(dataInicial);
	}

	@Override
	public double getDescontosEntradasCaixa(Date dataInicial) {
		return this.controlContasReceber.getDescontosEntradasCaixa(dataInicial);
	}

	@Override
	public Collection<Servico> getAllServicos() {
		return this.controlServico.getAllServicos();
	}

	@Override
	public void inserirServico(Servico servico) {
		this.controlServico.inserirServico(servico);
	}

	@Override
	public void removerServico(Servico servico) {
		this.controlServico.removerServico(servico);
	}

	@Override
	public Servico readServico(Servico servico) {
		return this.controlServico.readServico(servico);
	}

	@Override
	public void editarServico(Servico servico) {
		this.controlServico.editarServico(servico);
	}

	@Override
	public Collection<CentroCusto> getAllCentroCusto() {
		return this.controlCentroCusto.getAllCentroCusto();
	}

	@Override
	public void editarCentroCusto(CentroCusto centroCusto) {
		this.controlCentroCusto.editarCentroCusto(centroCusto);
	}

	@Override
	public CentroCusto readCentroCusto(CentroCusto centroCusto) {
		return this.controlCentroCusto.readCentroCusto(centroCusto);
	}

	@Override
	public void removerCentroCusto(CentroCusto centroCusto) {
		this.controlCentroCusto.removerCentroCusto(centroCusto);
	}

	@Override
	public void inserirCentroCusto(CentroCusto centroCusto) {
		this.controlCentroCusto.inserirCentroCusto(centroCusto);
	}

	@Override
	public Configuracao getConfiguracoes() {
		return this.controlConfiguracoes.getConfiguracoes();
	}

	@Override
	public void editarConfiguracoesCaixa(Configuracao configuracoes) {
		this.controlConfiguracoes.editarConfiguracoesCaixa(configuracoes);
	}

	@Override
	public double getSaldoAnteriorCaixa(Date dataInicial) {
		return this.controlContasReceber.getSaldoAnteriorCaixa(dataInicial);
	}

	@Override
	public String gerarDemonstrativoResultado(Date dataInicial, Date dataFinal) {
		return this.controlContasReceber.gerarDemonstrativoResultado(dataInicial, dataFinal);
	}

	@Override
	public String getQtdClientesAtivosPorPeriodoStr(Date dataInicial, Date dataFinal) {
		return this.controlFrequencia.getQtdClientesAtivosPorPeriodoStr(dataInicial, dataFinal);
	}

	@Override
	public Integer getQtdClientesQueContrataramServico(Date dataInicial, Date dataFinal) {
		return this.controlCliente.getQtdClientesQueContrataramServico(dataInicial, dataFinal);
	}

}
