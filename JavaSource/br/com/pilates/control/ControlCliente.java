package br.com.pilates.control;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Cliente;
import br.com.pilates.base.enums.Sexo;
import br.com.pilates.base.util.FormaConhecimento;

public interface ControlCliente {

	Collection<Cliente> getAllClientes();

	void inserirCliente(Cliente cliente);

	boolean isCPFDisponivel(String cpf);

	Cliente lerCliente(Cliente cliente);

	void editarCliente(Cliente cliente);

	void removerCliente(Cliente cliente);

	Collection<Cliente> pesquisarClientes(String pesquisa, String param);

	Cliente getClienteByCPF(String cpf);

	Collection<Cliente> getProximosAniversariantes();

	String getQtdClientesByBairroStr(Date dataInicial, Date dataFinal);

	int getQtdClientesAtivosPorBairro(String bairro, Date dataInicial, Date dataFinal);

	Collection<Cliente> getBairrosClientes();

	String getQtdClientesByServicoStr(Sexo sexo, Date dataInicial, Date dataFinal);

	String getQtdClientesByEstadoCivilStr(Date dataInicial, Date dataFinal);

	String getQtdClientesAtivosBySexoStr(Date dataInicial, Date dataFinal);

	String getQtdClientesAtivosByFaixaEtariaStr(Date dataInicial, Date dataFinal);

	Collection<FormaConhecimento> getAllFormasConhecimento();

	Collection<Cliente> getNovosCadastros(Date dataInicial, Date dataFinal);

	Integer getQtdClientesQueContrataramServico(Date dataInicial, Date dataFinal);

}
