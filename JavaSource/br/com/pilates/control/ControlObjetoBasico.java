package br.com.pilates.control;

import br.com.pilates.base.ObjetoBasico;

public interface ControlObjetoBasico {
	
	@SuppressWarnings("unchecked")
	ObjetoBasico read(Class clazz, Integer id);
	
	void save(ObjetoBasico mat);
	
	void update(ObjetoBasico pergunta);
	
	void delete(ObjetoBasico obj);
	
}
