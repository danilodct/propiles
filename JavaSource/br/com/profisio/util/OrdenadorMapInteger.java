package br.com.profisio.util;

import java.util.Comparator;
import java.util.Map;

public class OrdenadorMapInteger implements Comparator<Integer> {

	Map<Integer, Integer> base;
	Boolean crescente = false;

	public OrdenadorMapInteger(Map<Integer, Integer> base, Boolean crescente) {
		this.base = base;
		this.crescente = crescente;
	}

	// Note: this comparator imposes orderings that are inconsistent with equals.    
	@Override
	public int compare(Integer a, Integer b) {
		if (base.get(a) >= base.get(b)) {
			if (!crescente)
				return -1;
			else
				return 1;
		} else {
			if (!crescente)
				return 1;
			else
				return -1;
		} // returning 0 would merge keys
	}
}