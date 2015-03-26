package br.com.profisio.basics;

import java.util.Collection;
import java.util.Date;

import br.com.profisio.util.SystemUtils;

public class Atividade extends ObjetoBasico {

	private Cadastro cadastro;
	private Contrato contrato;
	private Avaliacao avaliacao;
	private Date dataCriacao;
	private Collection<ContaReceber> contasReceber;
	//campo apenas para registrar historico de mudancas de contrato 
	private String historico;

	public Atividade() {
	}

	public Atividade(Integer id) {
		this.setId(id);
	}

	public Cadastro getCadastro() {
		return cadastro;
	}

	public void setCadastro(Cadastro cadastro) {
		this.cadastro = cadastro;
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

	public Contrato getContrato() {
		return contrato;
	}

	public void setContrato(Contrato contrato) {
		this.contrato = contrato;
	}

	public String getHistorico() {
		return historico;
	}

	public void setHistorico(String historico) {
		this.historico = historico;
	}

}
