package br.com.profisio.basics;

import java.util.Collection;
import java.util.Date;

import br.com.profisio.util.SystemUtils;

public class Cadastro extends Pessoa {

	private String profissao;
	private String conhecimentoStudio;
	private Collection<Atividade> cadastros;
	private Date dataCadastro;

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

}
