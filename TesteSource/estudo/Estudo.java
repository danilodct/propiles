package estudo;

import java.util.Date;

import br.com.profisio.util.SystemUtils;

public class Estudo {
	public static void main(String[] args) {
		String duracaoStr = "45";
		Date data = SystemUtils.setHoraData(new Date(), "08:00");
		Double duracao = Double.parseDouble(duracaoStr);
		String horaData = SystemUtils.getHoraData(data);
		String[] partes = horaData.split(":");
		Double horas = Double.parseDouble(partes[0]);
		Double minutos = Double.parseDouble(partes[1]);
		Double minutosTotal = (horas * 60) + minutos + duracao;
		System.out.println(minutosTotal);
		System.out.println(minutosTotal / 60);
		Double horasFinal = Math.floor(minutosTotal / 60);
		System.out.println(horasFinal);
		Double decimais = (minutosTotal / 60) - horasFinal;
		System.out.println(decimais);
		Double minutosFinal = decimais * 60;
		System.out.println(minutosFinal);
		data = SystemUtils.setHoraData(data, horasFinal.intValue() + ":" + minutosFinal.intValue());

	}
}
