package br.com.profisio.util;

import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.Trigger;
import org.quartz.TriggerUtils;
import org.quartz.impl.StdSchedulerFactory;

@SuppressWarnings("serial")
public class MaquinaTimer extends HttpServlet {

	@Override
	public void init() throws ServletException {
		super.init();
		try {
			SchedulerFactory schedFact = new StdSchedulerFactory();
			Scheduler sched = schedFact.getScheduler();
			sched.start();
			JobDetail jobDetail = new JobDetail("TimerCadastrosInativos", null, TimerCadastrosInativos.class);
			Trigger trigger = TriggerUtils.makeDailyTrigger(15, 12); // a cada
																		// meia
																		// noite
			trigger.setStartTime(TriggerUtils.getEvenSecondDate(new Date())); // starton
																				// the
																				// next
																				// second
			trigger.setName("TimerCadastrosInativos");
			sched.scheduleJob(jobDetail, trigger);
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}

}