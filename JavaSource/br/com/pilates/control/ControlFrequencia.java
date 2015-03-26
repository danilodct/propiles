package br.com.pilates.control;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Cliente;
import br.com.pilates.base.Frequencia;
import br.com.pilates.base.Professor;
import br.com.pilates.base.Servico;
import br.com.pilates.base.enums.Sexo;

public interface ControlFrequencia {

	Collection<Frequencia> getFrequencias(Date dataInicial, Date dataFinal);

	void removerFrequencia(Frequencia frequencia);

	void addFrequencia(Frequencia frequencia);

	Collection<Frequencia> getFrequenciasByCliente(Cliente cliente);

	Collection<Cliente> relatorioAlunosAtivos(Date dataInicial, Date dataFinal, Professor professor, Servico servico, String ordenacao);

	String getQtdClientesAtivosBySexoStr(Date dataInicial, Date dataFinal);

	String getQtdClientesAtivosByServicoStr(Sexo sexo, Date dataInicial, Date dataFinal);

	String getQtdClientesAtivosByEstadoCivilStr(Date dataInicial, Date dataFinal);

	String getQtdClientesAtivosByFaixaEtariaStr(Date dataInicial, Date dataFinal);

	String getQtdClientesAtivosByBairroStr(Date dataInicial, Date dataFinal);

	Collection<Cliente> relatorioEfetividade(Date dataInicial, Date dataFinal, String ordenacao);

	String getQtdClientesAtivosPorPeriodoStr(Date dataInicial, Date dataFinal);

}
