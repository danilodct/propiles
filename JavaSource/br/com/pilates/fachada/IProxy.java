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

@SuppressWarnings("unchecked")
public interface IProxy {

	public void insert(ObjetoBasico mat);

	public void update(ObjetoBasico pergunta);

	public void delete(ObjetoBasico obj);

	public ObjetoBasico read(Class clazz, Integer id);

	public void login(Usuario usuario);

	public void logout();

	public Collection<Cliente> getPoucosClientes();

	public void inserirCliente(Cliente cliente);

	public boolean isCPFDisponivel(String cpf);

	public Cliente lerCliente(Cliente cliente);

	public void editarCliente(Cliente cliente);

	public void removerCliente(Cliente cliente);

	public void removerFuncionario(Professor funcionario);

	public void editarFuncionario(Professor funcionario);

	public Professor lerFuncionario(Professor funcionario);

	public void inserirFuncionario(Professor funcionario);

	public Collection<Professor> getPoucosFuncionarios();

	public Collection<Cliente> pesquisarClientes(String pesquisa, String param);

	public Collection<Professor> pesquisarProfessores(String pesquisa, String param);

	public Collection<Contrato> getContratosFuncionario(Professor funcionario);

	public void inserirContrato(Contrato contrato);

	public void editarContrato(Contrato contrato);

	public void removerContrato(Contrato contrato);

	public Collection<Professor> getProfessoresByModalidade(Servico servico);

	public Collection<TipoCadastro> getAllTiposCadastro();

	public void inserirCadastro(Cadastro cadastro);

	public Collection<Cadastro> getCadastrosAtivosByCliente(Cliente cliente);

	public void removerCadastro(Cadastro cadastro);

	public Avaliacao getLastAvaliacaoByModalidadeCliente(Servico servico, Cliente cliente);

	public void inserirContaReceberCadastro(ContaReceber contaReceber, Cadastro cadastro);

	public Cadastro lerCadastro(Cadastro cadastro);

	public Collection<ContaReceber> getContasReceberByCadastro(Cadastro cadastro);

	public void removerContaReceberCadastro(ContaReceber contaReceber);

	public Avaliacao getAvaliacao(Avaliacao avaliacao);

	public void atualizarAvaliacao(Avaliacao avaliacao);

	public Collection<TipoContaReceber> getAllTiposContaReceber();

	public Cliente getClienteByCPF(String cpf);

	public Collection<Cadastro> relatorioAlunos(Date dataInicial, Date dataFinal, Professor professor, String ordenacao);

	public Collection<RelatorioFormaPagamento> relatorioFormaPagamento(Date dataInicial, Date dataFinal, String ordenacao);

	public Collection<RelatorioMidia> relatorioMidia(Date dataInicial, Date dataFinal, String ordenacao);

	public void inserirContaPagar(ContaPagar contaPagar);

	public Collection<TipoContaPagar> getAllTiposContaPagar();

	public Collection<ContaPagar> getContasPagarMesAtual(TipoCusto tipoCusto, Date dataInicial, Date dataFinal, CentroCusto centroCusto);

	public Collection<ContaReceber> getContasReceberMesAtual(Date dataInicial, Date dataFinal);

	public void inserirContaReceber(ContaReceber contaReceber);

	public Collection<ContaPagar> getContasPagarByData(Date dataInicial, Date dataFinal);

	public Collection<ContaReceber> getContasReceberByProfessorData(Date dataInicial, Date dataFinal, Professor professor);

	public double getSomaEntradasByProfessorData(Date dataInicial, Date dataFinal, Professor professor);

	public double getSomaPercentagemProfessorByProfessorData(Date dataInicial, Date dataFinal, Professor professor);

	public double getSomaSaidasByData(Date dataInicial, Date dataFinal, TipoCusto tipo);

	public double getSomaPercentagemAllProfessoresByData(Date dataInicial, Date dataFinal);

	public Collection<Cliente> getProximosAniversariantesClientes();

	public Collection<Professor> getProximosAniversariantesFuncionarios();

	public void mudarProfessor(Cadastro cadastro);

	public Collection<Professor> getFuncionarios();

	public Collection<Frequencia> getFrequencias(Date dataInicial, Date dataFinal);

	public void removerFrequencia(Frequencia frequencia);

	public void addFrequencia(Frequencia frequencia);

	public Collection<Professor> getColaboradores();

	public Collection<Frequencia> getFrequenciasByCliente(Cliente cliente);

	public Collection<Produto> getProdutos();

	public Produto getProduto(Produto produto);

	public void editarProduto(Produto produto);

	public void addProduto(Produto produto);

	public void removerProduto(Produto produto);

	public Collection<Estoque> getEstoques(Date dataInicial, Date dataFinal, String status, String nome);

	public void addEstoque(Estoque estoque);

	public void removerEstoque(Estoque estoque);

	public void venderEstoque(Estoque estoque);

	public Collection<Estoque> getEstoquesVendido(Date dataInicial, Date dataFinal, Professor vendedor);

	public double getSomaVendasByProfessorData(Date dataInicial, Date dataFinal, Professor professor);

	public double getPorcentagemVendasByProfessorData(Date dataInicial, Date dataFinal, Professor professor);

	public double getSomaVendasData(Date dataInicial, Date dataFinal);

	public Collection<ContaReceber> getContasReceberAvulso(Date dataInicial, Date dataFinal);

	public double getSomaEntradasAvulso(Date dataInicial, Date dataFinal);

	public String getQtdClientesPorBairroStr(Date dataInicial, Date dataFinal);

	public String getQtdClientesPorServicoSexoStr(Sexo sexo, Date dataInicial, Date dataFinal);

	public String getQtdClientesPorEstadoCivilStr(Date dataInicial, Date dataFinal);

	public String getQtdClientesAtivosPorSexoStr(Date dataInicial, Date dataFinal);

	public String getQtdClientesAtivosPorFaixaEtariaStr(Date dataInicial, Date dataFinal);

	public String getRendimentoServicosStr(Date dataInicial, Date dataFinal);

	public String getGastosPorTipoStr(Date dataInicial, Date dataFinal);

	public Collection<Cliente> relatorioAlunosAtivos(Date dataInicial, Date dataFinal, Professor professor, Servico servico, String ordenacao);

	public Collection<ContaReceber> getContasReceberByCliente(Cliente cliente);

	public Collection<FormaConhecimento> getAllFormasConhecimento();

	public Collection<Cliente> relatorioEfetividade(Date dataInicial, Date dataFinal, String ordenacao);

	public double getEntradasCaixa(Date dataInicial);

	public double getSaldoCaixa(Date dataInicial);

	public double getEntradasVendasCaixa(Date dataInicial);

	public double getSaidasCaixa(Date dataInicial);

	public double getDescontosEntradasCaixa(Date dataInicial);

	public Collection<Servico> getAllServicos();

	public void inserirServico(Servico servico);

	public void removerServico(Servico servico);

	public Servico readServico(Servico servico);

	public void editarServico(Servico servico);

	public Collection<CentroCusto> getAllCentroCusto();

	public void editarCentroCusto(CentroCusto centroCusto);

	public CentroCusto readCentroCusto(CentroCusto centroCusto);

	public void removerCentroCusto(CentroCusto centroCusto);

	public void inserirCentroCusto(CentroCusto centroCusto);

	public Configuracao getConfiguracoes();

	public void editarConfiguracoesCaixa(Configuracao configuracoes);

	public double getSaldoAnteriorCaixa(Date dataInicial);

	public String gerarDemonstrativoResultado(Date dataInicial, Date dataFinal);

	public String getQtdClientesAtivosPorPeriodoStr(Date dataInicial, Date dataFinal);

	public Integer getQtdClientesQueContrataramServico(Date dataInicial, Date dataFinal);

}
