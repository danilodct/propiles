package br.com.profisio.colaborador;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import br.com.profisio.basics.Colaborador;
import br.com.profisio.basics.Contrato;
import br.com.profisio.basics.Servico;
import br.com.profisio.basics.Usuario;
import br.com.profisio.util.DAOBase;
import br.com.profisio.util.Tenant;

public class ColaboradorDAO extends DAOBase {

	public ColaboradorDAO() {
	}

	public static Object daoFactory() {
		return DAOBase.DAOFactory(ColaboradorDAO.class);
	}

	@SuppressWarnings("unchecked")
	public Collection<Colaborador> getProximosAniversariantes(Tenant tenant, String mesAtual, String mesProximo) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("mesAtual", mesAtual + "/%");
		params.put("mesProximo", mesProximo + "/%");
		return imp.createNamedQuery("getProximosAniversariantesColaboradores", params).list();
	}

	@SuppressWarnings("unchecked")
	public Collection<Colaborador> getColaboradores(Tenant tenant, String nomeColaborador) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		if (nomeColaborador != null)
			params.put("nomeColaborador", nomeColaborador + "%");
		else
			params.put("nomeColaborador", nomeColaborador);
		return this.imp.createNamedQuery("getColaboradores", params).list();
	}

	@SuppressWarnings("unchecked")
	public Colaborador getColaboradorById(Integer id) {
		return (Colaborador) this.imp.read(Colaborador.class, id);
	}

	@SuppressWarnings("unchecked")
	public void cadastrar(Colaborador colaborador) {
		this.imp.insert(colaborador);
	}

	@SuppressWarnings("unchecked")
	public void editar(Colaborador colaborador) {
		this.imp.update(colaborador);
	}

	@SuppressWarnings("unchecked")
	public Contrato getContratoById(Integer id) {
		return (Contrato) this.imp.read(Contrato.class, id);
	}

	@SuppressWarnings("unchecked")
	public void editar(Contrato contrato) {
		this.imp.update(contrato);
	}

	@SuppressWarnings("unchecked")
	public void cadastrar(Contrato contrato) {
		this.imp.insert(contrato);
	}

	@SuppressWarnings("unchecked")
	public Collection<Contrato> getContratosByColaborador(Colaborador colaborador) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("colaborador", colaborador);
		return imp.createNamedQuery("getContratosByColaborador", params).list();
	}

	@SuppressWarnings("unchecked")
	public Collection<Colaborador> getColaboradoresByServico(Servico servico) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("servico", servico);
		return imp.createNamedQuery("getColaboradoresByServico", params).list();
	}

	@SuppressWarnings("unchecked")
	public Collection<Contrato> getContratosByServico(Servico servico) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("servico", servico);
		return this.imp.createNamedQuery("getContratosByServico", params).list();
	}

	@SuppressWarnings("unchecked")
	public Usuario getUsuarioById(Integer id) {
		return (Usuario) this.imp.read(Usuario.class, id);
	}

	@SuppressWarnings("unchecked")
	public void editar(Usuario userBD) {
		this.imp.update(userBD);
	}

	@SuppressWarnings("unchecked")
	public Contrato getContratoByColaboradorServico(Colaborador colaborador, Servico servico) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("colaborador", colaborador);
		params.put("servico", servico);
		return (Contrato) this.imp.queryObject("getContratoByColaboradorServico", params);
	}

	@SuppressWarnings("unchecked")
	public Servico getServicoById(Integer id) {
		return (Servico) this.imp.read(Servico.class, id);
	}

}
