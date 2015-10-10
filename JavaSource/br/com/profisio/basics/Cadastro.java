package br.com.profisio.basics;

import java.util.Collection;
import java.util.Date;

import br.com.profisio.util.SystemUtils;

public class Cadastro extends Pessoa {

	private String preferenciaContato;
	private Boolean inativo;
	private String profissao;
	private String conhecimentoStudio;
	private Collection<Atividade> cadastros;
	private Date dataCadastro;

	@Override
	public String toString() {
		return this.getNome();
	}

	// não persistido
	private boolean virouNovoCliente;

	public Cadastro() {
	}

	public String getProfissao() {
		return profissao;
	}

	public void setProfissao(String profissao) {
		this.profissao = profissao;
	}

	public Collection<Atividade> getAtividades() {
		return cadastros;
	}

	public void setAtividades(Collection<Atividade> cadastros) {
		this.cadastros = cadastros;
	}

	public Date getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	public String getDataCadastroStr() {
		return SystemUtils.parseDataToString(dataCadastro);
	}

	public void setDataCadastroStr(String dataCadastro) {
		this.dataCadastro = SystemUtils.parseStringToDate(dataCadastro);
	}

	public String getConhecimentoStudio() {
		return conhecimentoStudio;
	}

	public void setConhecimentoStudio(String conhecimentoStudio) {
		this.conhecimentoStudio = conhecimentoStudio;
	}

	public boolean isVirouNovoCliente() {
		return virouNovoCliente;
	}

	public void setVirouNovoCliente(boolean virouNovoCliente) {
		this.virouNovoCliente = virouNovoCliente;
	}

	public String getPreferenciaContato() {
		return preferenciaContato;
	}

	public void setPreferenciaContato(String preferenciaContato) {
		this.preferenciaContato = preferenciaContato;
	}

	public Boolean getInativo() {
		return inativo;
	}

	public void setInativo(Boolean inativo) {
		this.inativo = inativo;
	}

}
