package br.com.profisio.util;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import br.com.profisio.cadastro.CadastroControl;

public class TimerCadastrosInativos implements Job {

	public TimerCadastrosInativos() {
	}

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		CadastroControl.getInstance().atualizarCadastrosInativos();
	}

}
