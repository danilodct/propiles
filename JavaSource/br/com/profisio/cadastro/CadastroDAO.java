package br.com.profisio.cadastro;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.com.profisio.basics.Agendamento;
import br.com.profisio.basics.Atividade;
import br.com.profisio.basics.Avaliacao;
import br.com.profisio.basics.Cadastro;
import br.com.profisio.basics.Contrato;
import br.com.profisio.basics.FormaConhecimento;
import br.com.profisio.basics.Frequencia;
import br.com.profisio.util.DAOBase;
import br.com.profisio.util.Tenant;

public class CadastroDAO extends DAOBase {

	public CadastroDAO() {
	}

	public static Object daoFactory() {
		return DAOBase.DAOFactory(CadastroDAO.class);
	}

	@SuppressWarnings("unchecked")
	public Collection<Cadastro> getProximosAniversariantes(Tenant tenant, String mesAtual, String mesProximo) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("mesAtual", mesAtual + "/%");
		params.put("mesProximo", mesProximo + "/%");
		return imp.createNamedQuery("getProximosAniversariantesClientes", params).list();
	}

	@SuppressWarnings("unchecked")
	public Collection<FormaConhecimento> getAllFormasConhecimento(Tenant tenant) {
		Collection<FormaConhecimento> formas = new ArrayList<FormaConhecimento>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		List<Cadastro> list = imp.createNamedQuery("getAllFormasConhecimento", params).list();
		if (list != null && list.size() > 0) {
			for (Cadastro cli : list) {
				formas.add(new FormaConhecimento(cli.getConhecimentoStudio()));
			}
		}
		return formas;
	}

	@SuppressWarnings("unchecked")
	public Collection<Cadastro> getCadastros(Tenant tenant, String nomeCliente, Integer sizePag, Integer pagAtual) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("nomeCliente", nomeCliente);
		if (nomeCliente != null)
			params.put("nomeCliente", nomeCliente + "%");
		Collection<Cadastro> retorno = null;
		if (pagAtual != null) {
			int start = (pagAtual - 1) * sizePag;
			retorno = imp.createNamedQuery("getCadastros", params).list().subList(start, sizePag + start);
		} else
			retorno = imp.createNamedQuery("getCadastros", params).list();
		return retorno;
	}

	@SuppressWarnings("unchecked")
	public Integer getQtdCadastros(Tenant tenant, String nomeCliente) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tenant", tenant);
		params.put("nomeCliente", nomeCliente);
		if (nomeCliente != null)
			params.put("nomeCliente", nomeCliente + "%");
		return ((Long) this.imp.createNamedQuery("getQtdCadastros", params).uniqueResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public void editar(Cadastro cadastro) {
		this.imp.update(cadastro);
	}

	@SuppressWarnings("unchecked")
	public Cadastro getCadastroById(Integer id) {
		return (Cadastro) this.imp.read(Cadastro.class, id);
	}

	@SuppressWarnings("unchecked")
	public void cadastrar(Cadastro cadastro) {
		this.imp.insert(cadastro);
	}

	@SuppressWarnings("unchecked")
	public void cadatrarAtividade(Atividade atividade) {
		this.imp.insert(atividade);
	}

	@SuppressWarnings("unchecked")
	public Atividade getAtividadeById(Integer id) {
		return (Atividade) this.imp.read(Atividade.class, id);
	}

	@SuppressWarnings("unchecked")
	public Collection<Atividade> getAtividadesByCadastro(Cadastro cadastro) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cadastro", cadastro);
		return this.imp.createNamedQuery("getAtividadesByCadastro", params).list();
	}

	@SuppressWarnings("unchecked")
	public void editarAtividade(Atividade atividadeBD) {
		this.imp.update(atividadeBD);
	}

	@SuppressWarnings("unchecked")
	public Collection<Frequencia> getFrequenciasByCadastro(Cadastro cadastro, Date dataInicial, Date dataFinal) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cadastro", cadastro);
		if (cadastro != null && cadastro.getId() != null)
			params.put("cadastro", cadastro.getId());
		params.put("dataInicial", dataInicial);
		params.put("dataFinal", dataFinal);
		return this.imp.createNamedQuery("getFrequenciasByCadastro", params).list();
	}

	@SuppressWarnings("unchecked")
	public void editarAvaliacao(Avaliacao avaliacao) {
		this.imp.update(avaliacao);
	}

	@SuppressWarnings("unchecked")
	public Atividade getAtividade(Cadastro cadastro, Contrato contrato) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cadastro", cadastro);
		params.put("contrato", contrato);
		return (Atividade) this.imp.queryObject("getAtividadeByCadastroContrato", params);
	}

	@SuppressWarnings("unchecked")
	public Avaliacao getAvaliacao(Avaliacao avaliacao) {
		return (Avaliacao) this.imp.read(Avaliacao.class, avaliacao.getId());
	}

	@SuppressWarnings("unchecked")
	public Collection<Agendamento> getAgendamentosByCadastro(Cadastro cadastro) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cadastro", cadastro);
		return this.imp.createNamedQuery("getAgendamentosByCadastro", params).list();
	}

}
