package br.com.pilates.dao;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Cliente;
import br.com.pilates.base.Servico;
import br.com.pilates.base.Usuario;
import br.com.pilates.base.enums.EstadoCivil;
import br.com.pilates.base.enums.Sexo;

public interface DAOCliente extends IHibernateDAO<Cliente> {

	Collection<Cliente> getAllClientes();

	Collection<Cliente> getClienteByCpf(String cpf);

	Collection<Cliente> pesquisarClientesByCPF(String pesquisa);

	Collection<Cliente> pesquisarClientesByNome(String pesquisa);

	Collection<Cliente> getClientesByProfessor(Usuario userSession);

	Cliente getClienteByCPF(String cpf);

	Collection<Cliente> pesquisarClientesByCPF(String pesquisa, Usuario userSession);

	Collection<Cliente> pesquisarClientesByNome(String pesquisa, Usuario userSession);

	Collection<Cliente> getProximosAniversariantesClientes(String mesAtual, String mesProximo);

	Collection<Cliente> getBairrosClientes();

	int getQtdClientesAtivosPorBairro(String bairro, Date dataInicial, Date dataFinal);

	int getQtdClientesPorServicoSexo(Servico servico, Sexo sexo, Date dataFinal);

	int getQtdClientesAtivosPorEstadoCivil(EstadoCivil estadoCivil, Date dataInicial, Date dataFinal);

	int getQtdClientesAtivosPorSexo(Sexo sexo, Date dataInicial, Date dataFinal);

	int getQtdClientesAtivosPorFaixaEtaria(int idadeMenor, int idadeMaior, Date dataInicial, Date dataFinal);

	Collection<Cliente> getClientesPorServicoSexo(Servico servico, Sexo sexo, Date dataFinal);

	int getQtdClientesAtivosPorServicoSexo(Servico servico, Sexo sexo, Date dataInicial, Date dataFinal);

	Collection<Cliente> getFormasConhecimento();

	int getQtdClientesByMidia(String conhecimentoStudio);

	int getQtdClientesSemMidia();

	Collection<Cliente> getCadastros(Date dataInicial, Date dataFinal);

	Integer getQtdClientesQueContrataramServico(Date dataInicial, Date dataFinal);

}
