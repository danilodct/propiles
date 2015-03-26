package br.com.pilates.base;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.util.SystemUtils;

public class Cadastro extends ObjetoBasico {

	private Cliente cliente;
	private Contrato modalidade;
	private TipoCadastro tipo;
	private Avaliacao avaliacao;
	private Date dataCriacao;
	private Collection<ContaReceber> contasReceber;
	private Collection<Horario> horarios;

	public Cadastro() {
	}

	public Cadastro(Integer id) {
		this.setId(id);
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Contrato getModalidade() {
		return modalidade;
	}

	public void setModalidade(Contrato modalidade) {
		this.modalidade = modalidade;
	}

	public TipoCadastro getTipo() {
		return tipo;
	}

	public void setTipo(TipoCadastro tipo) {
		this.tipo = tipo;
	}

	public Avaliacao getAvaliacao() {
		return avaliacao;
	}

	public void setAvaliacao(Avaliacao avaliacao) {
		this.avaliacao = avaliacao;
	}

	public Date getDataCriacao() {
		return dataCriacao;
	}

	public String getDataCriacaoStr() {
		return SystemUtils.parseDataToString(dataCriacao);
	}

	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public void setDataCriacaoStr(String dataCriacao) {
		this.dataCriacao = SystemUtils.parseStringToDate(dataCriacao);
	}

	public Collection<ContaReceber> getContasReceber() {
		return contasReceber;
	}

	public void setContasReceber(Collection<ContaReceber> contasReceber) {
		this.contasReceber = contasReceber;
	}

	public Collection<Horario> getHorarios() {
		return horarios;
	}

	public void setHorarios(Collection<Horario> horarios) {
		this.horarios = horarios;
	}

}
