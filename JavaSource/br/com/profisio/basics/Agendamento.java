package br.com.profisio.basics;

import java.util.Date;

import br.com.profisio.basics.enums.RepeticaoAgendamento;
import br.com.profisio.basics.enums.StatusAgendamento;
import br.com.profisio.util.SystemUtils;

public class Agendamento extends ObjetoBasico {

	public static final Integer DURACAO_DEFAULT = 30;

	private String titulo, nota;
	private Date dataInicio, dataFim;
	private Cadastro cadastro;
	private Integer duracao;//em minutos
	private RepeticaoAgendamento repeticao;
	private StatusAgendamento status;
	private Agendamento pai;
	private Atividade atividade;
	private ContaReceber contaReceber;

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

	public RepeticaoAgendamento getRepeticao() {
		return repeticao;
	}

	public void setRepeticao(RepeticaoAgendamento repeticao) {
		this.repeticao = repeticao;
	}

	public String getRepeticaoStr() {
		String repeticaoStr = "";
		if (this.repeticao != null)
			repeticaoStr = this.repeticao.getValue();
		return repeticaoStr;
	}

	public void setRepeticaoStr(String repeticao) {
		this.repeticao = RepeticaoAgendamento.createEnum(repeticao);
	}

	public Agendamento getPai() {
		return pai;
	}

	public void setPai(Agendamento pai) {
		this.pai = pai;
	}

	public void parseDados(Agendamento agendamento) {
		this.setCadastro(agendamento.getCadastro());
		this.setContaReceber(agendamento.getContaReceber());
		this.setDataFim(agendamento.getDataFim());
		this.setDataInicio(agendamento.getDataInicio());
		this.setDuracao(agendamento.getDuracao());
		this.setGeral(agendamento.getGeral());
		this.setHorario(agendamento.getHorario());
		this.setNota(agendamento.getNota());
		this.setPai(agendamento.getPai());
		this.setRepeticao(agendamento.getRepeticao());
		this.setStatusObjeto(agendamento.getStatusObjeto());
		this.setTenant(agendamento.getTenant());
		this.setTitulo(agendamento.getTitulo());
	}

	public StatusAgendamento getStatus() {
		return status;
	}

	public void setStatus(StatusAgendamento status) {
		this.status = status;
	}

	public String getStatusStr() {
		String statusStr = "";
		if (this.status != null)
			statusStr = this.status.getValue();
		return statusStr;
	}

	public void setStatusStr(String status) {
		this.status = StatusAgendamento.createEnum(status);
	}

	public Atividade getAtividade() {
		return atividade;
	}

	public void setAtividade(Atividade atividade) {
		this.atividade = atividade;
	}

	public String getTituloTratado() {
		String title = this.titulo;
		if (title != null) {
			title = title.replaceAll("\"", "\'");
		}
		return title;
	}

}
