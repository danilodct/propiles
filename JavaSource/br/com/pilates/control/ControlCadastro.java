package br.com.pilates.control;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Cadastro;
import br.com.pilates.base.Cliente;
import br.com.pilates.base.Professor;

public interface ControlCadastro {

	void inserirCadastro(Cadastro cadastro);

	Collection<Cadastro> getCadastrosAtivosByCliente(Cliente cliente);

	void removerCadastro(Cadastro cadastro);

	Cadastro lerCadastro(Cadastro cadastro);

	Collection<Cadastro> relatorioAlunos(Date dataInicial, Date dataFinal, Professor professor, String ordenacao);

	void mudarProfessor(Cadastro cadastro);

}
