package br.com.pilates.control.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Cadastro;
import br.com.pilates.base.Cliente;
import br.com.pilates.base.Contrato;
import br.com.pilates.base.Professor;
import br.com.pilates.base.TipoCadastro;
import br.com.pilates.base.enums.StatusObjeto;
import br.com.pilates.control.ControlCadastro;
import br.com.pilates.control.ControlContrato;
import br.com.pilates.dao.DAOCadastro;
import br.com.pilates.dao.DAOTipoCadastro;
import br.com.pilates.dao.impl.DAOCadastroImpl;
import br.com.pilates.dao.impl.DAOTipoCadastroImpl;
import br.com.pilates.dao.impl.HibernateUtil;
import br.com.pilates.excecao.PilatesException;
import br.com.pilates.util.PilatesBundleUtil;

public class ControlCadastroImpl implements ControlCadastro {

	private final DAOCadastro dao;
	private final DAOTipoCadastro daoTipoCadastro;
	private final ControlContrato controlContrato;

	public ControlCadastroImpl() {
		this.dao = new DAOCadastroImpl();
		this.daoTipoCadastro = new DAOTipoCadastroImpl();
		this.controlContrato = new ControlContratoImpl();
	}

	@Override
	public void inserirCadastro(Cadastro cadastro) {
		if (cadastro != null && cadastro.getCliente() != null && cadastro.getModalidade() != null) {
			Contrato contrato = this.controlContrato.getContratoByModalidadeProfessor(cadastro.getModalidade().getServico(), cadastro.getModalidade().getProfessor());
			cadastro.setModalidade(contrato);
			if (cadastro.getTipo() != null && (cadastro.getTipo().getId() == null || cadastro.getTipo().getId() == -1)) {
				TipoCadastro tipo = cadastro.getTipo();
				this.daoTipoCadastro.insert(tipo);
				cadastro.setTipo(tipo);
			}
			cadastro.setStatusObjeto(StatusObjeto.ATIVO);
			this.dao.insert(cadastro);
		} else {
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		}
	}

	@Override
	public Collection<Cadastro> getCadastrosAtivosByCliente(Cliente cliente) {
		return this.dao.getCadastrosAtivosByCliente(cliente);
	}

	@Override
	public void removerCadastro(Cadastro cadastro) {
		cadastro = this.dao.read(Cadastro.class, cadastro.getId());
		cadastro.setStatusObjeto(StatusObjeto.MORTO);
		this.dao.update(cadastro);
	}

	@Override
	public Cadastro lerCadastro(Cadastro cadastro) {
		HibernateUtil.getInstance().getCurrentSession().evict(cadastro);
		return this.dao.read(Cadastro.class, cadastro.getId());
	}

	@Override
	public Collection<Cadastro> relatorioAlunos(Date dataInicial, Date dataFinal, Professor professor, String ordenacao) {
		Collection<Cadastro> retorno = new ArrayList<Cadastro>();
		Collection<Cadastro> cadastros = this.dao.relatorioAlunos(dataInicial, dataFinal, professor, ordenacao);
		if (cadastros != null) {
			for (Cadastro cad : cadastros) {
				Collection<Cadastro> cadastrosAnteriores = this.dao.getCadastrosAnteriores(cad);
				if (cadastrosAnteriores == null || cadastrosAnteriores.size() == 0) {
					retorno.add(cad);
				}
			}
		}
		return retorno;
	}

	@Override
	public void mudarProfessor(Cadastro cadastro) {
		Cadastro cadastroBD = this.dao.read(Cadastro.class, cadastro.getId());
		Contrato contrato = this.controlContrato.getContratoByModalidadeProfessor(cadastro.getModalidade().getServico(), cadastro.getModalidade().getProfessor());
		cadastroBD.setModalidade(contrato);
		this.dao.update(cadastroBD);
	}

}
