package br.com.pilates.control.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import br.com.pilates.base.Cliente;
import br.com.pilates.base.Frequencia;
import br.com.pilates.base.Professor;
import br.com.pilates.base.Servico;
import br.com.pilates.base.enums.EstadoCivil;
import br.com.pilates.base.enums.Sexo;
import br.com.pilates.control.ControlCliente;
import br.com.pilates.control.ControlFrequencia;
import br.com.pilates.control.ControlServico;
import br.com.pilates.dao.DAOCliente;
import br.com.pilates.dao.DAOFrequencia;
import br.com.pilates.dao.impl.DAOClienteImpl;
import br.com.pilates.dao.impl.DAOFrequenciaImpl;
import br.com.pilates.excecao.PilatesException;
import br.com.pilates.util.PilatesBundleUtil;
import br.com.pilates.util.SystemUtils;

public class ControlFrequenciaImpl implements ControlFrequencia {

	private final DAOFrequencia dao;

	public ControlFrequenciaImpl() {
		this.dao = new DAOFrequenciaImpl();
	}

	@Override
	public Collection<Frequencia> getFrequencias(Date dataInicial, Date dataFinal) {
		Calendar calendar = null;
		if (dataInicial == null && dataFinal == null) {
			calendar = GregorianCalendar.getInstance();
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			dataFinal = calendar.getTime();
			calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - 1);
			dataInicial = calendar.getTime();
		}
		calendar = GregorianCalendar.getInstance();
		if (dataInicial != null) {
			calendar.setTime(dataInicial);
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.AM_PM, Calendar.AM);
			dataInicial = calendar.getTime();
		}
		if (dataFinal != null) {
			calendar.setTime(dataFinal);
			calendar.set(Calendar.HOUR, 11);
			calendar.set(Calendar.MINUTE, 59);
			calendar.set(Calendar.AM_PM, Calendar.PM);
			dataFinal = calendar.getTime();
		}
		return this.dao.getFrequenciasByData(dataInicial, dataFinal);
	}

	@Override
	public void removerFrequencia(Frequencia frequencia) {
		if (frequencia == null || frequencia.getId() == null)
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		this.dao.delete(frequencia);
	}

	@Override
	public void addFrequencia(Frequencia frequencia) {
		if (frequencia == null)
			throw new PilatesException(PilatesBundleUtil.NO_OBJECT_SELECTED);
		this.dao.insert(frequencia);
	}

	@Override
	public Collection<Frequencia> getFrequenciasByCliente(Cliente cliente) {
		Collection<Frequencia> frequencias = this.dao.getFrequenciasByCliente(cliente);
		Map<Integer, Integer> ordenador = new HashMap<Integer, Integer>();
		Integer ordem = 0;
		for (Frequencia freq : frequencias) {
			if (ordenador.get(freq.getServico().getId()) == null) {
				ordenador.put(freq.getServico().getId(), 1);
				ordem = 1;
			} else {
				ordem = ordenador.get(freq.getServico().getId());
				ordem += 1;
				ordenador.put(freq.getServico().getId(), ordem);
			}
			freq.setOrdem(ordem);
		}
		return frequencias;
	}

	@Override
	public Collection<Cliente> relatorioAlunosAtivos(Date dataInicial, Date dataFinal, Professor professor, Servico servico, String ordenacao) {
		if (professor != null && professor.getId().intValue() == -1) {
			professor = null;
		}
		if (servico != null && servico.getId() != null && servico.getId().intValue() == -1)
			servico = null;
		Collection<Frequencia> frequencias = this.getFrequenciasByDataModalidadeSexoBairroEstadocivilFaixaetariaProfessorOrdenacao(dataInicial, dataFinal, servico, null, null, null, -1, -1, professor, ordenacao);
		Collection<Cliente> clientes = this.getClientesFromFrequencias(frequencias);
		return clientes;
	}

	// 8888888888888888888 NOVA IMPLEMENTACAO 8888888888888888

	@Override
	public String getQtdClientesAtivosByServicoStr(Sexo sexo, Date dataInicial, Date dataFinal) {
		String retorno = "";
		ControlServico controlServico = new ControlServicoImpl();
		Collection<Servico> allServicos = controlServico.getAllServicos();
		for (Servico servico : allServicos) {
			Collection<Frequencia> frequencias = this.getFrequenciasByDataModalidadeSexoBairroEstadocivilFaixaetariaProfessorOrdenacao(dataInicial, dataFinal, servico, sexo, null, null, -1, -1, null, null);
			Collection<Cliente> clientes = this.getClientesFromFrequencias(frequencias);
			int qtdClientesPorServico = 0;
			if (clientes != null && clientes.size() > 0)
				qtdClientesPorServico = clientes.size();
			retorno += servico.getNome() + "," + qtdClientesPorServico + ";";
		}
		if (retorno.length() > 0) {
			retorno = retorno.substring(0, retorno.length() - 1);
		}
		return retorno;
	}

	private Collection<Cliente> getClientesFromFrequencias(Collection<Frequencia> frequencias) {
		Collection<Cliente> retorno = new ArrayList<Cliente>();
		if (frequencias != null && frequencias.size() > 0) {
			for (Frequencia freq : frequencias) {
				boolean jaTem = false;
				int idCliente = freq.getCliente().getId().intValue();
				for (Cliente cli : retorno) {
					if (idCliente == cli.getId().intValue()) {
						jaTem = true;
					}
				}
				if (!jaTem) {
					retorno.add(freq.getCliente());
				}
			}
		}
		return retorno;
	}

	private Collection<Frequencia> getFrequenciasByDataModalidadeSexoBairroEstadocivilFaixaetariaProfessorOrdenacao(Date dataInicial, Date dataFinal, Servico servico, Sexo sexo, String bairro, EstadoCivil estado, int faixaMinima, int faixaMaxima, Professor professor, String ordenacao) {
		return this.dao.getFrequenciasByDataModalidadeSexoBairroEstadocivilFaixaetariaProfessorOrdenacao(dataInicial, dataFinal, servico, sexo, bairro, estado, faixaMinima, faixaMaxima, professor, ordenacao);
	}

	@Override
	public String getQtdClientesAtivosBySexoStr(Date dataInicial, Date dataFinal) {
		String retorno = "";
		Sexo[] sexos = Sexo.values();
		for (Sexo sexo : sexos) {
			Collection<Frequencia> frequencias = this.getFrequenciasByDataModalidadeSexoBairroEstadocivilFaixaetariaProfessorOrdenacao(dataInicial, dataFinal, null, sexo, null, null, -1, -1, null, null);
			Collection<Cliente> clientes = this.getClientesFromFrequencias(frequencias);
			int qtdClientesPorServico = 0;
			if (clientes != null && clientes.size() > 0)
				qtdClientesPorServico = clientes.size();
			retorno += sexo.getValor() + "," + qtdClientesPorServico + ";";
		}
		if (retorno.length() > 0) {
			retorno = retorno.substring(0, retorno.length() - 1);
		}
		return retorno;
	}

	@Override
	public String getQtdClientesAtivosByEstadoCivilStr(Date dataInicial, Date dataFinal) {
		String retorno = "";
		EstadoCivil[] estados = EstadoCivil.values();
		for (EstadoCivil estado : estados) {
			Collection<Frequencia> frequencias = this.getFrequenciasByDataModalidadeSexoBairroEstadocivilFaixaetariaProfessorOrdenacao(dataInicial, dataFinal, null, null, null, estado, -1, -1, null, null);
			Collection<Cliente> clientes = this.getClientesFromFrequencias(frequencias);
			int qtdClientesPorServico = 0;
			if (clientes != null && clientes.size() > 0)
				qtdClientesPorServico = clientes.size();
			retorno += estado.getValor() + "," + qtdClientesPorServico + ";";
		}
		if (retorno.length() > 0) {
			retorno = retorno.substring(0, retorno.length() - 1);
		}
		return retorno;
	}

	@Override
	public String getQtdClientesAtivosByBairroStr(Date dataInicial, Date dataFinal) {
		String retorno = "";
		DAOCliente daoCliente = new DAOClienteImpl();
		Collection<Cliente> bairros = daoCliente.getBairrosClientes();
		Map<String, Collection<Cliente>> map = new HashMap<String, Collection<Cliente>>();
		for (Cliente bairro : bairros) {
			if (bairro.getEndereco().getBairro() != null && !bairro.getEndereco().getBairro().equals("")) {
				Collection<Frequencia> frequencias = this.getFrequenciasByDataModalidadeSexoBairroEstadocivilFaixaetariaProfessorOrdenacao(dataInicial, dataFinal, null, null, bairro.getEndereco().getBairro(), null, -1, -1, null, null);
				Collection<Cliente> clientes = this.getClientesFromFrequencias(frequencias);
				if (clientes != null && clientes.size() > 0)
					map.put(bairro.getEndereco().getBairro(), clientes);
			}
		}

		Set<String> keys = map.keySet();
		while (map.size() > 0) {
			Integer max = 0;
			String key = "";
			for (String bairro : keys) {
				if (map.get(bairro).size() > max) {
					max = map.get(bairro).size();
					key = bairro;
				}
			}

			retorno += key + "," + map.get(key).size() + ";";
			map.remove(key);
		}

		if (retorno.length() > 0) {
			retorno = retorno.substring(0, retorno.length() - 1);
		}
		return retorno;
	}

	@Override
	public String getQtdClientesAtivosByFaixaEtariaStr(Date dataInicial, Date dataFinal) {
		String retorno = "";

		// retorno += "0 - 10," + qtdClientesPorFaixaEtaria + ";";
		Collection<Frequencia> frequencias = this.getFrequenciasByDataModalidadeSexoBairroEstadocivilFaixaetariaProfessorOrdenacao(dataInicial, dataFinal, null, null, null, null, 0, 10, null, null);
		Collection<Cliente> clientes = this.getClientesFromFrequencias(frequencias);
		int qtdClientesPorServico = 0;
		if (clientes != null && clientes.size() > 0)
			qtdClientesPorServico = clientes.size();
		retorno += "0 - 10," + qtdClientesPorServico + ";";

		// retorno += "11 - 19," + qtdClientesPorFaixaEtaria + ";";
		frequencias = this.getFrequenciasByDataModalidadeSexoBairroEstadocivilFaixaetariaProfessorOrdenacao(dataInicial, dataFinal, null, null, null, null, 11, 19, null, null);
		clientes = this.getClientesFromFrequencias(frequencias);
		qtdClientesPorServico = 0;
		if (clientes != null && clientes.size() > 0)
			qtdClientesPorServico = clientes.size();
		retorno += "11 - 19," + qtdClientesPorServico + ";";

		// retorno += "20 - 39," + qtdClientesPorFaixaEtaria + ";";
		frequencias = this.getFrequenciasByDataModalidadeSexoBairroEstadocivilFaixaetariaProfessorOrdenacao(dataInicial, dataFinal, null, null, null, null, 20, 39, null, null);
		clientes = this.getClientesFromFrequencias(frequencias);
		qtdClientesPorServico = 0;
		if (clientes != null && clientes.size() > 0)
			qtdClientesPorServico = clientes.size();
		retorno += "20 - 39," + qtdClientesPorServico + ";";

		// retorno += "40 - 59," + qtdClientesPorFaixaEtaria + ";";
		frequencias = this.getFrequenciasByDataModalidadeSexoBairroEstadocivilFaixaetariaProfessorOrdenacao(dataInicial, dataFinal, null, null, null, null, 40, 59, null, null);
		clientes = this.getClientesFromFrequencias(frequencias);
		qtdClientesPorServico = 0;
		if (clientes != null && clientes.size() > 0)
			qtdClientesPorServico = clientes.size();
		retorno += "40 - 59," + qtdClientesPorServico + ";";

		// retorno += "60 - 79," + qtdClientesPorFaixaEtaria + ";";
		frequencias = this.getFrequenciasByDataModalidadeSexoBairroEstadocivilFaixaetariaProfessorOrdenacao(dataInicial, dataFinal, null, null, null, null, 60, 79, null, null);
		clientes = this.getClientesFromFrequencias(frequencias);
		qtdClientesPorServico = 0;
		if (clientes != null && clientes.size() > 0)
			qtdClientesPorServico = clientes.size();
		retorno += "60 - 79," + qtdClientesPorServico + ";";

		// retorno += "80," + qtdClientesPorFaixaEtaria;
		frequencias = this.getFrequenciasByDataModalidadeSexoBairroEstadocivilFaixaetariaProfessorOrdenacao(dataInicial, dataFinal, null, null, null, null, 80, -1, null, null);
		clientes = this.getClientesFromFrequencias(frequencias);
		qtdClientesPorServico = 0;
		if (clientes != null && clientes.size() > 0)
			qtdClientesPorServico = clientes.size();
		retorno += "80," + qtdClientesPorServico + ";";

		if (retorno.length() > 0) {
			retorno = retorno.substring(0, retorno.length() - 1);
		}
		return retorno;
	}

	@Override
	public Collection<Cliente> relatorioEfetividade(Date dataInicial, Date dataFinal, String ordenacao) {
		Collection<Cliente> retorno = new ArrayList<Cliente>();
		ControlCliente controlCliente = new ControlClienteImpl();
		if (dataInicial != null) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(dataInicial);
			calendar.set(Calendar.AM_PM, Calendar.AM);
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			dataInicial = calendar.getTime();
		}
		if (dataFinal != null) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(dataFinal);
			calendar.set(Calendar.AM_PM, Calendar.PM);
			calendar.set(Calendar.HOUR, 11);
			calendar.set(Calendar.MINUTE, 59);
			calendar.set(Calendar.SECOND, 59);
			dataFinal = calendar.getTime();
		}
		Collection<Cliente> clientes = controlCliente.getNovosCadastros(dataInicial, dataFinal);
		if (clientes != null && clientes.size() > 0) {
			for (Cliente cli : clientes) {
				Collection<Frequencia> frequencias = this.dao.getFrequenciasByCliente(cli, dataInicial, dataFinal);
				if (frequencias != null && frequencias.size() > 0) {
					cli.setVirouNovoCliente(true);
				} else {
					cli.setVirouNovoCliente(false);
				}
				retorno.add(cli);
			}
		}
		return retorno;
	}

	@Override
	public String getQtdClientesAtivosPorPeriodoStr(Date dataInicial, Date dataFinal) {
		String retorno = "";

		Calendar calInicial = Calendar.getInstance();
		if (dataInicial != null)
			calInicial.setTime(dataInicial);
		calInicial.set(Calendar.DATE, 1);
		calInicial.setTime(SystemUtils.setHoraData(calInicial.getTime(), Calendar.AM, 0, 0, 0));

		Calendar calFinal = Calendar.getInstance();
		if (dataFinal != null)
			calFinal.setTime(dataFinal);
		calFinal.set(Calendar.DAY_OF_MONTH, calFinal.getActualMaximum(Calendar.DAY_OF_MONTH));
		calFinal.setTime(SystemUtils.setHoraData(calFinal.getTime(), Calendar.PM, 23, 59, 59));

		int qtdMeses = calFinal.get(Calendar.MONTH) - calInicial.get(Calendar.MONTH) + 1;

		Calendar calInicialFim = Calendar.getInstance();
		for (int i = 0; i < qtdMeses; i += 1) {
			calInicialFim.setTime(calInicial.getTime());
			calInicialFim.set(Calendar.DAY_OF_MONTH, calInicialFim.getActualMaximum(Calendar.DAY_OF_MONTH));
			calInicialFim.setTime(SystemUtils.setHoraData(calInicialFim.getTime(), Calendar.PM, 23, 59, 59));

			Collection<Frequencia> frequencias = this.getFrequenciasByDataModalidadeSexoBairroEstadocivilFaixaetariaProfessorOrdenacao(calInicial.getTime(), calInicialFim.getTime(), null, null, null, null, -1, -1, null, null);
			Collection<Cliente> clientes = this.getClientesFromFrequencias(frequencias);

			int qtdClientesPorServico = 0;
			if (clientes != null && clientes.size() > 0)
				qtdClientesPorServico = clientes.size();
			retorno += (calInicial.get(Calendar.YEAR)) + SystemUtils.formatarNumeroQtdAlgarismos(calInicial.get(Calendar.MONTH) + 1, 2) + "," + qtdClientesPorServico + ";";

			calInicial.set(Calendar.MONTH, calInicial.get(Calendar.MONTH) + 1);
		}

		if (retorno.length() > 0) {
			retorno = retorno.substring(0, retorno.length() - 1);
		}
		return retorno;

	}
}
