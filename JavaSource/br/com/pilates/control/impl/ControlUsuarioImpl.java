package br.com.pilates.control.impl;

import java.util.Map;

import br.com.pilates.base.Usuario;
import br.com.pilates.control.ControlUsuario;
import br.com.pilates.dao.DAOUsuario;
import br.com.pilates.dao.impl.DAOUsuarioImpl;
import br.com.pilates.excecao.PilatesException;
import br.com.pilates.util.PilatesBundleUtil;
import br.com.pilates.util.PilatesSessionUtil;
import br.com.pilates.util.SystemUtils;

public class ControlUsuarioImpl implements ControlUsuario {

	private final DAOUsuario dao;

	public ControlUsuarioImpl() {
		dao = new DAOUsuarioImpl();
	}

	@Override
	public void login(Usuario usuario) {
		Usuario usuarioBD = this.dao.getUsuarioByLoginSenha(usuario);
		if (usuarioBD == null) {
			throw new PilatesException(PilatesBundleUtil.LOGIN_INCORRETO);
		}
		registrarUsuario(usuarioBD);
	}

	private void registrarUsuario(Usuario usuario) {
		Map<String, Object> session = SystemUtils.getHttpSession();
		session.put(PilatesSessionUtil.SESSION_USER, usuario);
	}

	@Override
	public void logout() {
		Map<String, Object> session = SystemUtils.getHttpSession();
		session.clear();
	}
}
