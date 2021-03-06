package br.com.profisio.basics;

import br.com.profisio.basics.enums.StatusObjeto;
import br.com.profisio.util.Encriptador;
import br.com.profisio.util.Tenant;

public class ObjetoBasico {

	private Integer id;
	private StatusObjeto statusObjeto;
	private Tenant tenant;
	private Boolean geral;// se precisa ou nao de tenant

	public ObjetoBasico() {
	}

	public String getIdCript() {
		return Encriptador.encode(String.valueOf(this.id));
	}

	public void setIdCript(String id) {
		if (id != null && !id.equals("")) {
			String decode = Encriptador.decode(id);
			if (decode == null || decode.equals(""))
				decode = id;
			this.id = Integer.parseInt(decode);
		}
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public StatusObjeto getStatusObjeto() {
		return statusObjeto;
	}

	public void setStatusObjeto(StatusObjeto statusObjeto) {
		this.statusObjeto = statusObjeto;
	}

	public Tenant getTenant() {
		return tenant;
	}

	public void setTenant(Tenant tenant) {
		this.tenant = tenant;
	}

	public Boolean getGeral() {
		return geral;
	}

	public void setGeral(Boolean geral) {
		this.geral = geral;
	}

}
