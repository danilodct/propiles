package br.com.profisio.util;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Mailer {

	//método que starta a thread q envia o email
	public void sendMail(String to, String subject, String corpo, File attachment) {
		MailerThread mailer = new MailerThread(to, subject, corpo, attachment);
		mailer.start();
	}

	class MailerThread extends Thread {

		private final String to, subject, corpo;
		File attachment;

		public MailerThread(String to, String subject, String corpo, File attachment) {
			this.to = to;
			this.subject = subject;
			this.corpo = corpo;
			this.attachment = attachment;
		}

		@Override
		public void run() {
			// chama a classe que envia o email
			MailSender mailSender = new MailSender();
			mailSender.sendMailThread(this.to, this.subject, this.corpo, null);
		}
	}

	class MailSender {

		private void sendMailThread(String to, String subject, String corpo, File attachment) {
			try {
				String from = "noreply@clinicavanity.com.br";
				Properties props = new Properties();
				props.setProperty("mail.transport.protocol", "smtp");
				props.setProperty("mail.host", "smtp.clinicavanity.com.br");
				props.setProperty("mail.user", "noreply@clinicavanity.com.br");
				props.setProperty("mail.password", "email4321");
				props.setProperty("mail.smtp.port", "587");

				String[] emails = extractEmails(to);

				for (String email : emails) {

					Session mailSession = Session.getDefaultInstance(props, null);
					Transport transport;
					transport = mailSession.getTransport();

					MimeMessage message = new MimeMessage(mailSession);
					message.setSubject(subject);

					MimeBodyPart textPart = new MimeBodyPart();

					textPart.setContent(corpo, "text/html; charset=UTF-8");

					Multipart mp = new MimeMultipart();
					mp.addBodyPart(textPart);

					if (attachment != null) {
						MimeBodyPart attachFilePart = new MimeBodyPart();
						FileDataSource fds = new FileDataSource(attachment);
						attachFilePart.setDataHandler(new DataHandler(fds));
						attachFilePart.setFileName(fds.getName());
						mp.addBodyPart(attachFilePart);
					}

					message.setContent(mp);

					message.setSender(new InternetAddress(from, "ProPilEs"));
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

					transport.connect("smtp.clinicavanity.com.br", "noreply@clinicavanity.com.br", "email4321");
					transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
					transport.close();
				}
			} catch (NoSuchProviderException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			System.out.println("enviou o email...");
		}

		private String[] extractEmails(String to) {
			to = to.replaceAll("\\s+", " ");
			to = to.replaceAll(", ", ";");
			to = to.replaceAll("; ", ";");
			return to.split("[,;\\s]");
		}

		class PopupAuthenticator extends Authenticator {
			@Override
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("noreply@clinicavanity.com.br", "email4321");
			}
		}
	}

}
