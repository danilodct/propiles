package br.com.pilates.fachada;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Avaliacao;
import br.com.pilates.base.Cadastro;
import br.com.pilates.base.Cliente;
import br.com.pilates.base.Professor;
import br.com.pilates.base.Servico;
import br.com.pilates.base.TipoCadastro;
import br.com.pilates.control.ControlAvaliacao;
import br.com.pilates.control.ControlCadastro;
import br.com.pilates.control.ControlTipoCadastro;
import br.com.pilates.control.impl.ControlAvaliacaoImpl;
import br.com.pilates.control.impl.ControlCadastroImpl;
import br.com.pilates.control.impl.ControlTipoCadastroImpl;

public class FachadaCadastro {

	private static FachadaCadastro instance;

	private final ControlTipoCadastro controlTipoCadastro;
	private final ControlCadastro controlCadastro;
	private final ControlAvaliacao controlAvaliacao;

	private FachadaCadastro() {
		this.controlTipoCadastro = new ControlTipoCadastroImpl();
		this.controlCadastro = new ControlCadastroImpl();
		this.controlAvaliacao = new ControlAvaliacaoImpl();
	}

	public static FachadaCadastro getInstance() {
		if (instance == null) {
			instance = new FachadaCadastro();
		}
		return instance;
	}

	public Collection<TipoCadastro> getAllTiposCadastro() {
		return this.controlTipoCadastro.getAllTiposCadastro();
	}

	public void inserirCadastro(Cadastro cadastro) {
		this.controlCadastro.inserirCadastro(cadastro);
	}

	public Collection<Cadastro> getCadastrosAtivosByCliente(Cliente cliente) {
		return this.controlCadastro.getCadastrosAtivosByCliente(cliente);
	}

	public void removerCadastro(Cadastro cadastro) {
		this.controlCadastro.removerCadastro(cadastro);
	}

	public Avaliacao getLastAvaliacaoByModalidadeCliente(Servico servico, Cliente cliente) {
		return this.controlAvaliacao.getLastAvaliacaoByModalidadeCliente(servico, cliente);
	}

	public Cadastro lerCadastro(Cadastro cadastro) {
		return this.controlCadastro.lerCadastro(cadastro);
	}

	public Avaliacao getAvaliacao(Avaliacao avaliacao) {
		return this.controlAvaliacao.getAvaliacao(avaliacao);
	}

	public void atualizarAvaliacao(Avaliacao avaliacao) {
		this.controlAvaliacao.atualizarAvaliacao(avaliacao);
	}

	public Collection<Cadastro> relatorioAlunos(Date dataInicial, Date dataFinal, Professor professor, String ordenacao) {
		return this.controlCadastro.relatorioAlunos(dataInicial, dataFinal, professor, ordenacao);
	}

	public void mudarProfessor(Cadastro cadastro) {
		this.controlCadastro.mudarProfessor(cadastro);
	}

}
