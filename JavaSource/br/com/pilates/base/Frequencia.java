package br.com.pilates.base;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import br.com.pilates.util.SystemUtils;

public class Frequencia extends ObjetoBasico {

	private Date data;
	private Servico servico;
	private Professor profissional;
	private Cliente cliente;
	private Integer ordem;

	public Frequencia() {
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public void setDataStr(String data) {
		this.data = SystemUtils.parseStringToDate(data);
	}

	public String getHorario() {
		String horario = "";
		if (this.data != null) {
			Calendar calendar = GregorianCalendar.getInstance();
			calendar.setTime(this.data);
			String hora = calendar.get(Calendar.HOUR) + "";
			String minutos = calendar.get(Calendar.MINUTE) + "";
			if (hora.length() == 1)
				hora = "0" + hora;
			if (minutos.length() == 1)
				minutos = "0" + minutos;
			horario = hora + ":" + minutos;
		}
		return horario;
	}

	public void setHorario(String hora) {
		if (this.data != null) {
			Calendar calendar = GregorianCalendar.getInstance();
			calendar.setTime(this.data);
			String[] split = hora.split(":");
			if (Integer.parseInt(split[0]) > 12) {
				split[0] = "" + (Integer.parseInt(split[0]) - 12);
				calendar.set(Calendar.AM_PM, Calendar.PM);
			} else {
				calendar.set(Calendar.AM_PM, Calendar.AM);
			}
			calendar.set(Calendar.HOUR, Integer.parseInt(split[0]));
			calendar.set(Calendar.MINUTE, Integer.parseInt(split[1]));
			this.data = calendar.getTime();
		}
	}

	public Servico getServico() {
		return servico;
	}

	public void setServico(Servico servico) {
		this.servico = servico;
	}

	public Professor getProfissional() {
		return profissional;
	}

	public void setProfissional(Professor profissional) {
		this.profissional = profissional;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Integer getOrdem() {
		return ordem;
	}

	public void setOrdem(Integer ordem) {
		this.ordem = ordem;
	}

}
