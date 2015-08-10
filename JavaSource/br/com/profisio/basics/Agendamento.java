package br.com.profisio.basics;

import java.util.Date;

import br.com.profisio.util.SystemUtils;

public class Agendamento extends ObjetoBasico {

	public static final Integer DURACAO_DEFAULT = 30;

	private String titulo, nota;
	private Date dataInicio, dataFim;
	private Cadastro cadastro;
	private ContaReceber contaReceber;
	private Integer duracao;//em minutos

	public Agendamento() {
	}

	public ContaReceber getContaReceber() {
		return contaReceber;
	}

	public void setContaReceber(ContaReceber contaReceber) {
		this.contaReceber = contaReceber;
	}

	public Date getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(Date data) {
		this.dataInicio = data;
	}

	public String getDataInicioStr() {
		return SystemUtils.parseDataToString(dataInicio);
	}

	public String getDataInicioStrEUA() {
		return SystemUtils.parseDataToStringEUA(dataInicio);
	}

	public String getDataFimStrEUA() {
		return SystemUtils.parseDataToStringEUA(dataFim);
	}

	public void setDataInicioStr(String data) {
		this.dataInicio = SystemUtils.parseStringToDate(data);
	}

	public Date getDataFim() {
		return dataFim;
	}

	public void setDataFim(Date data) {
		this.dataFim = data;
	}

	public String getDataFimStr() {
		return SystemUtils.parseDataToString(dataFim);
	}

	public void setDataFimStr(String data) {
		this.dataFim = SystemUtils.parseStringToDate(data);
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getNota() {
		return nota;
	}

	public void setNota(String nota) {
		this.nota = nota;
	}

	public Cadastro getCadastro() {
		return cadastro;
	}

	public void setCadastro(Cadastro cadastro) {
		this.cadastro = cadastro;
	}

	public void setHorario(String horario) {
		this.dataInicio = SystemUtils.setHoraData(dataInicio, horario);
	}

	public String getHorario() {
		return SystemUtils.getHoraData(dataInicio);
	}

	public String getHorarioFinal() {
		return SystemUtils.getHoraData(dataFim);
	}

	public Integer getDuracao() {
		return duracao;
	}

	public void setDuracao(Integer duracao) {
		if (duracao == null)
			duracao = DURACAO_DEFAULT;
		this.duracao = duracao;
		this.dataFim = SystemUtils.aumentarMinutosData(this.dataInicio, String.valueOf(duracao));
	}

	public String getTituloTratado() {
		String title = this.titulo;
		if (title != null) {
			title = title.replaceAll("\"", "\'");
		}
		return title;
	}

}
