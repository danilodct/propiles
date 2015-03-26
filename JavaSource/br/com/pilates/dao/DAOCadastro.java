package br.com.pilates.dao;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Cadastro;
import br.com.pilates.base.Cliente;
import br.com.pilates.base.Professor;

public interface DAOCadastro extends IHibernateDAO<Cadastro> {

	Collection<Cadastro> getCadastrosAtivosByCliente(Cliente cliente);

	Collection<Cadastro> relatorioAlunos(Date dataInicial, Date dataFinal, Professor professor, String ordenacao);

	Collection<Cadastro> getCadastrosAnteriores(Cadastro cad);

}
