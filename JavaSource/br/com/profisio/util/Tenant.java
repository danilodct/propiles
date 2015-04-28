package br.com.profisio.util;

import java.util.Date;

import br.com.profisio.basics.ObjetoBasico;

public class Tenant extends ObjetoBasico {

	private String nome, logo, cor;
	private Date dataCriacao;
	private Plano plano;
	private Boolean aguardandoPagamento;//aguardandoPagamento serve para os plaanos 2 e 3 qd o usuario cofirmou o email, porém ainda nao confirmou o pagamento
	private Boolean tour;//não persistido, apenas para indicar se é para ter o tour inicial

	public Tenant() {
	}

	public Tenant(String nome, Date date, Plano plano) {
		this.setNome(nome);
		this.setDataCriacao(date);
		this.setPlano(plano);
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDataCriacaoStr() {
		return SystemUtils.parseDataToString(dataCriacao);
	}

	public Date getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacaoStr(String dataCriacao) {
		this.dataCriacao = SystemUtils.parseStringToDate(dataCriacao);
	}

	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public Plano getPlano() {
		return plano;
	}

	public void setPlano(Plano plano) {
		this.plano = plano;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getCorFinal() {
		String cor = "teal";
		if (this.cor != null && !this.cor.trim().equalsIgnoreCase(""))
			cor = this.cor;
		return cor;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

	public boolean getAccessRelatorio() {
		return ProfisioSessionUtil.hasAccess(ProfisioSessionUtil.FUNC_RELATORIOS, this);
	}

	public Boolean getAguardandoPagamento() {
		return aguardandoPagamento;
	}

	public void setAguardandoPagamento(Boolean aguardandoPagamento) {
		this.aguardandoPagamento = aguardandoPagamento;
	}

	public Boolean getTour() {
		return tour;
	}

	public void setTour(Boolean tour) {
		this.tour = tour;
	}

}
