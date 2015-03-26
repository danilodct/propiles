package br.com.pilates.util;

import java.io.File;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import br.com.pilates.excecao.PilatesException;

public class Mailer {
	public static final String DEFAULT_SENDER = "noreply@vitacorporepilates.com.br";
	
	public static void sendMail(String from, String to, String subject, String messageBody, File[] attachments) {
		Properties prob = System.getProperties();
		prob.put("mail.transport.protocol", "smtp");
		prob.put("mail.smtp.host", "smtp.vitacorporepilates.com.br");
		prob.put("mail.smtp.socketFactory.port", Integer.valueOf(587));
		prob.put("mail.smtp.starttls.enable", "true");
		prob.put("mail.smtp.auth", "true");
		prob.put("mail.smtp.port", Integer.valueOf(587));
		
		Authenticator auth = new PopupAuthenticator();
		
		Session session = Session.getInstance(prob, auth);
		
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(from));
			message.setSubject(subject);
			
			BodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setText(messageBody);
			
			Multipart multipart = new MimeMultipart();
			
			multipart.addBodyPart(messageBodyPart);
			
			addAtachments(attachments, multipart);
			
			message.setContent(multipart);
			
			String[] emails = extractEmails(to);
			for (int i = 0; i < emails.length; ++i) {
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(emails[i]));
			}
			Transport.send(message);
		}
		catch (AddressException e) {
			e.printStackTrace();
			throw new PilatesException(PilatesBundleUtil.getMsgError(PilatesBundleUtil.ERRO_ENVIO_EMAIL));
		}
		catch (MessagingException e) {
			e.printStackTrace();
			throw new PilatesException(PilatesBundleUtil.getMsgError(PilatesBundleUtil.ERRO_ENVIO_EMAIL));
		}
	}
	
	private static String[] extractEmails(String to) {
		to = to.replaceAll("\\s+", " ");
		to = to.replaceAll(", ", ";");
		to = to.replaceAll("; ", ";");
		return to.split("[,;\\s]");
	}
	
	private static void addAtachments(File[] attachments, Multipart multipart) throws MessagingException, AddressException {
		if (attachments != null) {
			for (int i = 0; i <= attachments.length - 1; ++i) {
				File file = attachments[i];
				BodyPart attachmentBodyPart = new MimeBodyPart();
				
				DataSource source = new FileDataSource(file);
				attachmentBodyPart.setDataHandler(new DataHandler(source));
				
				attachmentBodyPart.setFileName(file.getName());
				
				multipart.addBodyPart(attachmentBodyPart);
			}
		}
	}
	
	static class PopupAuthenticator extends Authenticator {
		@Override
		public PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication("danilot@shifti.com.br", "email4321");
		}
	}
}
