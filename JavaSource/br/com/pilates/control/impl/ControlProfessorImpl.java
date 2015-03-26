package br.com.pilates.control.impl;

import java.util.Calendar;
import java.util.Collection;

import br.com.pilates.base.Professor;
import br.com.pilates.base.Servico;
import br.com.pilates.base.enums.StatusObjeto;
import br.com.pilates.control.ControlProfessor;
import br.com.pilates.dao.DAOProfessor;
import br.com.pilates.dao.impl.DAOProfessorImpl;
import br.com.pilates.excecao.CPFExistenteException;
import br.com.pilates.excecao.PilatesException;
import br.com.pilates.util.PilatesBundleUtil;

public class ControlProfessorImpl implements ControlProfessor {

	private final DAOProfessor dao;

	public ControlProfessorImpl() {
		this.dao = new DAOProfessorImpl();
	}

	@Override
	public void editarFuncionario(Professor funcionario) {
		if (funcionario == null) {
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		}
		if (funcionario.getNome() == null || funcionario.getNome().equals("")) {
			throw new PilatesException(PilatesBundleUtil.NOME_CLIENTE_OBRIGATORIO);
		}
		if (funcionario.getCpf() == null || funcionario.getCpf().equals("")) {
			throw new PilatesException(PilatesBundleUtil.CPF_CLIENTE_OBRIGATORIO);
		}
		this.gerarNiver(funcionario);
		this.dao.update(funcionario);
	}

	@Override
	public void inserirFuncionario(Professor funcionario) {
		if (funcionario == null) {
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		}
		if (funcionario.getNome() == null || funcionario.getNome().equals("")) {
			throw new PilatesException(PilatesBundleUtil.NOME_CLIENTE_OBRIGATORIO);
		}
		if (funcionario.getCpf() == null || funcionario.getCpf().equals("")) {
			throw new PilatesException(PilatesBundleUtil.CPF_CLIENTE_OBRIGATORIO);
		}
		if (!this.isCPFDisponivel(funcionario.getCpf())) {
			throw new CPFExistenteException();
		}
		funcionario.setStatusObjeto(StatusObjeto.ATIVO);
		this.gerarNiver(funcionario);
		this.dao.insert(funcionario);
	}

	private void gerarNiver(Professor funcionario) {
		if (funcionario.getDataNascimento() != null) {
			Calendar instance = Calendar.getInstance();
			instance.setTime(funcionario.getDataNascimento());
			String mes = (instance.get(Calendar.MONTH) + 1) + "";
			if (mes.length() == 1) {
				mes = "0" + mes;
			}
			String dia = instance.get(Calendar.DAY_OF_MONTH) + "";
			if (dia.length() == 1) {
				dia = "0" + dia;
			}
			String mesDia = mes + "/" + dia;
			funcionario.setNiver(mesDia);
		}
	}

	public boolean isCPFDisponivel(String cpf) {
		boolean retorno = true;
		Collection<Professor> professores = this.dao.getProfessorByCpf(cpf);
		if (professores != null && professores.size() > 0) {
			retorno = false;
		}
		return retorno;
	}

	@Override
	public Collection<Professor> getPoucosFuncionarios() {
		return this.dao.getPoucosFuncionarios();
	}

	@Override
	public Collection<Professor> getFuncionarios() {
		return this.dao.getFuncionarios();
	}

	@Override
	public Professor lerFuncionario(Professor funcionario) {
		return this.dao.read(Professor.class, funcionario.getId());
	}

	@Override
	public void removerFuncionario(Professor funcionario) {
		if (funcionario == null)
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		funcionario = this.dao.read(Professor.class, funcionario.getId());
		funcionario.setStatusObjeto(StatusObjeto.MORTO);
		this.dao.update(funcionario);
	}

	@Override
	public Collection<Professor> pesquisarProfessores(String pesquisa, String param) {
		Collection<Professor> professores = null;
		if (param.equals("cpf")) {
			professores = this.dao.pesquisarProfessoresByCPF(pesquisa);
		} else {
			professores = this.dao.pesquisarProfessoresByNome(pesquisa);
		}
		return professores;
	}

	@Override
	public Collection<Professor> getProfessoresByModalidade(Servico servico) {
		return this.dao.getProfessoresByModalidade(servico);
	}

	@Override
	public Collection<Professor> getProximosAniversariantesFuncionarios() {
		Calendar calendar = Calendar.getInstance();
		int month = calendar.get(Calendar.MONTH) + 1;
		String mesAtual = "" + month;
		if (mesAtual.length() == 1) {
			mesAtual = "0" + mesAtual;
		}
		String mesProximo = "" + (month + 1);
		if (mesProximo.length() == 1) {
			mesProximo = "0" + mesProximo;
		}
		return this.dao.getProximosAniversariantesFunc(mesAtual, mesProximo);
	}

	@Override
	public Collection<Professor> getColaboradores() {
		return this.dao.getFuncionarios();
	}

}
