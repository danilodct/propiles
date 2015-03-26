package br.com.pilates.base;

import java.util.Collection;
import java.util.Date;

import br.com.pilates.util.SystemUtils;

public class Cliente extends Pessoa {

	private String profissao;
	private String conhecimentoStudio;
	private Collection<Cadastro> cadastros;
	private Date dataCadastro;
	private boolean virouNovoCliente;

	public Cliente() {
	}

	public String getProfissao() {
		return profissao;
	}

	public void setProfissao(String profissao) {
		this.profissao = profissao;
	}

	public Collection<Cadastro> getCadastros() {
		return cadastros;
	}

	public void setCadastros(Collection<Cadastro> cadastros) {
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
