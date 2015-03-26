package br.com.profisio.basics;

import java.util.Date;

import br.com.profisio.util.SystemUtils;

public class Frequencia extends ObjetoBasico {

	private Date data;
	private Servico servico;
	private Colaborador colaborador;
	private Cadastro cadastro;
	private ContaReceber contaReceber;
	private Integer duracao;
	//nova modelagem da frequencia
	private Atividade atividade;
	private Boolean novo;
	//não é persistido
	private Integer ordem;
	private Double porcentagemColaborador;

	public Frequencia() {
	}

	public Date getData() {
		return data;
	}

	public String getDataStr() {
		return SystemUtils.parseDataToString(data);
	}

	public void setData(Date data) {
		this.data = data;
	}

	public void setDataStr(String data) {
		this.data = SystemUtils.parseStringToDate(data);
	}

	public String getHorario() {
		return SystemUtils.getHoraData(data);
	}

	public void setHorario(String hora) {
		SystemUtils.setHoraData(data, hora);
	}

	public Servico getServicoCerto() {
		Servico servicoTemp = servico;
		if (novo != null && novo && atividade != null && atividade.getContrato() != null)
			servicoTemp = this.atividade.getContrato().getServico();
		return servicoTemp;
	}

	public Servico getServico() {
		return servico;
	}

	public void setServico(Servico servico) {
		this.servico = servico;
	}

	public Integer getOrdem() {
		return ordem;
	}

	public void setOrdem(Integer ordem) {
		this.ordem = ordem;
	}

	public Colaborador getColaboradorCerto() {
		Colaborador colaboradorTemp = colaborador;
		if (colaborador == null && novo != null && novo && atividade != null && atividade.getContrato() != null)
			colaboradorTemp = this.atividade.getContrato().getColaborador();
		return colaboradorTemp;
	}

	public Colaborador getColaborador() {
		return colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}

	public Cadastro getCadastro() {
		Cadastro cadastroTemp = cadastro;
		if (novo != null && novo && atividade != null && atividade.getContrato() != null)
			cadastroTemp = this.atividade.getCadastro();
		return cadastroTemp;
	}

	public void setCadastro(Cadastro cadastro) {
		this.cadastro = cadastro;
	}

	public Atividade getAtividade() {
		return atividade;
	}

	public void setAtividade(Atividade atividade) {
		this.atividade = atividade;
	}

	public Boolean getNovo() {
		return novo;
	}

	public void setNovo(Boolean novo) {
		this.novo = novo;
	}

	public ContaReceber getContaReceber() {
		return contaReceber;
	}

	public void setContaReceber(ContaReceber contaReceber) {
		this.contaReceber = contaReceber;
	}

	public Integer getDuracao() {
		return duracao;
	}

	public void setDuracao(Integer duracao) {
		this.duracao = duracao;
	}

	public String getPorcentagemColaboradorStr() {
		return SystemUtils.parseDoubleToString(porcentagemColaborador);
	}

	public Double getPorcentagemColaborador() {
		return porcentagemColaborador;
	}

	public void setPorcentagemColaborador(Double porcentagemColaborador) {
		this.porcentagemColaborador = porcentagemColaborador;
	}

}
