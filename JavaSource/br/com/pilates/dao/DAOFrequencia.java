package br.com.pilates.dao;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.base.Cliente;
import br.com.pilates.base.Frequencia;
import br.com.pilates.base.Professor;
import br.com.pilates.base.Servico;
import br.com.pilates.base.enums.EstadoCivil;
import br.com.pilates.base.enums.Sexo;

public interface DAOFrequencia extends IHibernateDAO<Frequencia> {

	Collection<Frequencia> getFrequenciasByData(Date dataInicial, Date dataFinal);

	Collection<Frequencia> getFrequenciasByCliente(Cliente cliente);

	Collection<Frequencia> getFrequenciasByDataProfessor(Date dataInicial, Date dataFinal, Professor professor, String ordenacao);

	Collection<Frequencia> getFrequenciasByDataModalidadeSexoBairroEstadocivilFaixaetariaProfessorOrdenacao(Date dataInicial, Date dataFinal, Servico servico, Sexo sexo, String bairro, EstadoCivil estado, int faixaMinima, int faixaMaxima, Professor professor, String ordenacao);

	Collection<Frequencia> getFrequenciasByCliente(Cliente cli, Date dataInicial, Date dataFinal);

}
