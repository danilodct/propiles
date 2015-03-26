package br.com.pilates.base;

import br.com.pilates.base.enums.StatusObjeto;

public class ObjetoBasico {
	
	private Integer id;
	private StatusObjeto statusObjeto;
	
	public ObjetoBasico() {}
	
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
	
}
