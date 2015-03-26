package br.com.profisio.util;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mailer {

	// método que starta a thread q envia o email
	public void sendMail(String to, String subject, String corpo) {
		MailerThread mailer = new MailerThread(to, subject, corpo);
		mailer.start();
	}

	class MailerThread extends Thread {

		private final String to, subject, corpo;

		public MailerThread(String to, String subject, String corpo) {
			this.to = to;
			this.subject = subject;
			this.corpo = corpo;
		}

		@Override
		public void run() {
			// chama a classe que envia o email
			MailSender mailSender = new MailSender();
			mailSender.sendMailThread(this.to, this.subject, this.corpo);
		}
	}

	class MailSender {

		private void sendMailThread(String to, String subject, String corpo) {
			String meuEmail = "danilo.dct@gmail.com";

			Properties props = new Properties();
			/** Parâmetros de conexão com servidor Gmail */
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("danilo.dct@gmail.com", "email4321");
				}
			});

			/** Ativa Debug para sessão */
			// session.setDebug(true);

			try {

				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress(meuEmail)); // Remetente

				Address[] toUser = InternetAddress // Destinatário(s)
				.parse(to);

				message.setRecipients(Message.RecipientType.TO, toUser);
				message.setSubject(subject);// Assunto
				message.setText(corpo);
				/** Método para enviar a mensagem criada */
				Transport.send(message);

				System.out.println("Feito!!!");

			} catch (MessagingException e) {
				e.printStackTrace();
				System.out.println("Não conseguiu enviar o email...");
			}
		}

		class PopupAuthenticator extends Authenticator {
			@Override
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("danilo.dct@gmail.com", "email4321");
			}
		}
	}

}
