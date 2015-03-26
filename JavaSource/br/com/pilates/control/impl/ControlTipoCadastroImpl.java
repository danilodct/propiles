package br.com.pilates.control.impl;

import java.util.Collection;

import br.com.pilates.base.TipoCadastro;
import br.com.pilates.control.ControlTipoCadastro;
import br.com.pilates.dao.DAOTipoCadastro;
import br.com.pilates.dao.impl.DAOTipoCadastroImpl;

public class ControlTipoCadastroImpl implements ControlTipoCadastro {
	
	private DAOTipoCadastro dao;
	
	public ControlTipoCadastroImpl() {
		this.dao = new DAOTipoCadastroImpl();
	}
	
	@Override
	public Collection<TipoCadastro> getAllTiposCadastro() {
		return this.dao.getAllTiposCadastro();
	}
	
}
