package br.com.pilates.fachada;

import br.com.pilates.base.ObjetoBasico;
import br.com.pilates.control.ControlObjetoBasico;
import br.com.pilates.control.impl.ControlObjetoBasicoImpl;

public class FachadaGeral {
	
	private static FachadaGeral instance;
	private final ControlObjetoBasico controlObjetoBasico;
	
	private FachadaGeral() {
		this.controlObjetoBasico = new ControlObjetoBasicoImpl();
	}
	
	public static FachadaGeral getInstance() {
		if (instance == null) {
			instance = new FachadaGeral();
		}
		return instance;
	}
	
	@SuppressWarnings("unchecked")
	public ObjetoBasico read(Class clazz, Integer id) {
		return this.controlObjetoBasico.read(clazz, id);
	}
	
	public void save(ObjetoBasico mat) {
		this.controlObjetoBasico.save(mat);
	}
	
	public void update(ObjetoBasico pergunta) {
		this.controlObjetoBasico.update(pergunta);
	}
	
	public void delete(ObjetoBasico obj) {
		this.controlObjetoBasico.delete(obj);
	}
	
}
