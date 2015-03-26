package br.com.pilates.dao.impl;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import br.com.pilates.base.Cadastro;
import br.com.pilates.base.Cliente;
import br.com.pilates.base.Professor;
import br.com.pilates.dao.DAOCadastro;

public class DAOCadastroImpl extends HibernateDAO<Cadastro> implements DAOCadastro {

	@Override
	public Collection<Cadastro> getCadastrosAtivosByCliente(Cliente cliente) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cliente", cliente);
		return this.list("getCadastrosAtivosByCliente", params);
	}

	@Override
	public Collection<Cadastro> relatorioAlunos(Date dataInicial, Date dataFinal, Professor professor, String ordenacao) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		if (professor.getId() == -1) {
			professor = null;
		}
		params.put("professor", professor);
		if (ordenacao == null) {
			ordenacao = "cliente.nome";
		}
		return this.list("relatorioAlunos", params, ordenacao);
	}

	@Override
	public Collection<Cadastro> getCadastrosAnteriores(Cadastro cad) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cliente", cad.getCliente());
		params.put("data", cad.getDataCriacao());
		params.put("id", cad.getId());
		return this.list("getCadastrosAnteriores", params);
	}

}
