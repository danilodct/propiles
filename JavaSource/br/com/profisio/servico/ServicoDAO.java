package br.com.profisio.servico;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import br.com.profisio.basics.CentroCusto;
import br.com.profisio.basics.Servico;
import br.com.profisio.util.DAOBase;
import br.com.profisio.util.Tenant;

public class ServicoDAO extends DAOBase {

	public ServicoDAO() {
	}

	public static Object daoFactory() {
		return DAOBase.DAOFactory(ServicoDAO.class);
	}

	@SuppressWarnings("unchecked")
	public Collection<Servico> getServicos(Tenant tenant, CentroCusto centroCusto) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("centroCusto", centroCusto);
		return this.imp.createNamedQuery("getServicos", params).list();
	}

	@SuppressWarnings("unchecked")
	public void cadastrar(Servico servico) {
		this.imp.insert(servico);
	}

	@SuppressWarnings("unchecked")
	public void remover(Servico servico) {
		this.imp.delete(servico);
	}

	@SuppressWarnings("unchecked")
	public Servico getServicoById(Integer id) {
		return (Servico) this.imp.read(Servico.class, id);
	}

	@SuppressWarnings("unchecked")
	public void editar(Servico servico) {
		this.imp.update(servico);
	}

	@SuppressWarnings("unchecked")
	public Collection<CentroCusto> getCentrosCusto(Tenant tenant) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		return this.imp.createNamedQuery("getCentrosCusto", params).list();
	}

	@SuppressWarnings("unchecked")
	public CentroCusto getCentroCustoById(Integer id) {
		return (CentroCusto) this.imp.read(CentroCusto.class, id);
	}

	@SuppressWarnings("unchecked")
	public void editar(CentroCusto centroCusto) {
		this.imp.update(centroCusto);
	}

	@SuppressWarnings("unchecked")
	public void cadastrar(CentroCusto centroCusto) {
		this.imp.insert(centroCusto);

	}

}
