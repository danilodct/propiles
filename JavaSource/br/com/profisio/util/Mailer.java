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

	public static final String EMAIL_PARTE_CIMA_ATE_IMAGEM = "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" bgcolor=\"#6c6c6c\" style=\"border-spacing:0px\"><tbody><tr><td style=\"width:50%\"><a style=\"color:inherit;text-decoration:none\"></a></td><td><table width=\"600\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-spacing:0px\"><tbody style=\"font-family:helvetica,arial,sans-serif\"><tr style=\"height:18px\"><td><a style=\"color:inherit;text-decoration:none\"></a></td></tr><tr><td bgcolor=\"#ECECEC\" style=\"background:#ECECEC\"><table width=\"600\" border=\"0\" cellpadding=\"10px\" cellspacing=\"0\" style=\"border-spacing:0px\"><tbody><tr><td align=\"center\"  bgcolor=\"#ECECEC\" style=\"background:#ECECEC\"><a href=\"http://www.propiles.com.br\" style=\"color:inherit;text-decoration:none;vertical-align:middle\" target=\"_blank\"><img src=\"http://www.propiles.com.br/img/logo.png\" alt=\"ProPilEs\" class=\"\"></a></td></tr></tbody></table></td></tr><tr><td bgcolor=\"#ffffff\" style=\"background:#ffffff\"><table width=\"600\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-spacing:0px\"><tbody><tr><td align=\"center\" bgcolor=\"#ffffff\" style=\"background:#ffffff;padding-top:25px\">";
	public static final String EMAIL_POS_IMAGEM_PRE_CONTEUDO = "</td></tr></tbody></table></td> </tr><tr style=\"font-size:15px\"><td bgcolor=\"#ffffff\" style=\"background:#ffffff\"><table width=\"600\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-spacing:0px\"><tbody><tr><td align=\"center\" bgcolor=\"#ffffff\" style=\"background:#ffffff;font-size:16px;padding:14px;color:#666666\"><div style=\"padding-top:10px;width:90%\"><font face=\"Helvetica Neue Regular, sans-serif\">";
	public static final String EMAIL_POS_CONTEUDO = "</font></div></td></tr><tr><td align=\"center\" width=\"100%\" style=\"background:#ffffff;padding-bottom:25px\" bgcolor=\"#ffffff\">&nbsp;&nbsp;&nbsp;</td></tr></tbody></table></td></tr><tr><td bgcolor=\"#ffffff\" style=\"background:#ffffff\"><table width=\"600\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-spacing:0px\"><tbody><tr><td align=\"center\" bgcolor=\"#ffffff\" valign=\"bottom\" style=\"background:#ffffff;vertical-align:bottom\"><img src=\"http://www.propiles.com.br/img/email.jpg\" style=\"display:block\" class=\"\"><div style=\"font-size:0;line-height:0;max-height:0;overflow:hidden;padding:0\"><img src=\"http://www.propiles.com.br/img/email.jpg\" alt=\"ProPilEs\" class=\"\"></div></td></tr></tbody></table></td></tr><tr style=\"font-size:15px\"><td align=\"center\" style=\"background:#e5e5e5\" bgcolor=\"#e5e5e5\"><div style=\"background:#e5e5e5;border:0px solid #cccccc\"><table width=\"560px\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-spacing:0px\"><tbody><tr><td align=\"center\" style=\"background:#e5e5e5;color:#999999;font-size:10px;padding-bottom:20px;padding-top:10px\" bgcolor=\"#e5e5e5\"><font face=\"helvetica, arial, sans-serif\"><a href=\"http://www.propiles.com.br\" style=\"color:#999999;text-decoration:none\" target=\"_blank\">ProPilEs 2015 - www.propiles.com.br</a></font></td></tr></tbody></table></div></td></tr><tr style=\"height:18px\"><td><a style=\"color:inherit;text-decoration:none\"></a></td></tr></tbody></table></td><td style=\"width:50%\"><a style=\"color:inherit;text-decoration:none\"></a></td></tr></tbody></table>";

	public static final String IMG_CADASTRO = "http://www.propiles.com.br/img/email-falta-pouco.jpg";
	public static final String IMG_RECUPERE_SENHA = "http://www.propiles.com.br/img/email-recupere-senha.jpg";
	public static final String IMG_CONTATO = "http://www.propiles.com.br/img/email-contato.jpg";
	public static final String IMG_UPGRADE = "http://www.propiles.com.br/img/email-upgrade.jpg";
	public static final String IMG_PRONTO = "http://www.propiles.com.br/img/email-pronto.jpg";

	public static final String EMAIL_POS_CONTEUDO_PRE_LINK_URL = "</font></div></td></tr><tr><td style=\"padding-bottom:25px;padding-top:0px;padding-left:0px\" align=\"center\"><div><table border=\"0\" cellpadding=\"10\" cellspacing=\"0\" style=\"border-spacing:0px;width:400px\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"background:#FF8E57;border-radius:5px;padding:15px\" bgcolor=\"#FF8E57\"><a href=\"";
	public static final String EMAIL_POS_LINK_URL_PRE_LINK_TXT = "\" style=\"color:#ffffff;display:block;font-family:Arial,Helvetica Neue,sans-serif;font-size:16px;text-align:center;text-decoration:none\" target=\"_blank\">";
	public static final String EMAIL_POS_LINK_TXT = "</a></td></tr></tbody></table></div></td></tr><tr><td align=\"center\" width=\"100%\" style=\"background:#ffffff;padding-bottom:25px\" bgcolor=\"#ffffff\">&nbsp;&nbsp;&nbsp;</td></tr></tbody></table></td></tr><tr><td bgcolor=\"#ffffff\" style=\"background:#ffffff\"><table width=\"600\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-spacing:0px\"><tbody><tr><td align=\"center\" bgcolor=\"#ffffff\" valign=\"bottom\" style=\"background:#ffffff;vertical-align:bottom\"><img src=\"http://www.propiles.com.br/img/email.jpg\" style=\"display:block\" class=\"\"><div style=\"font-size:0;line-height:0;max-height:0;overflow:hidden;padding:0\"><img src=\"http://www.propiles.com.br/img/email.jpg\" alt=\"ProPilEs\" class=\"\"></div></td></tr></tbody></table></td></tr><tr style=\"font-size:15px\"><td align=\"center\" style=\"background:#e5e5e5\" bgcolor=\"#e5e5e5\"><div style=\"background:#e5e5e5;border:0px solid #cccccc\"><table width=\"560px\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-spacing:0px\"><tbody><tr><td align=\"center\" style=\"background:#e5e5e5;color:#999999;font-size:10px;padding-bottom:20px;padding-top:10px\" bgcolor=\"#e5e5e5\"><font face=\"helvetica, arial, sans-serif\"><a href=\"http://www.propiles.com.br\" style=\"color:#999999;text-decoration:none\" target=\"_blank\">ProPilEs 2015 - www.propiles.com.br</a></font></td></tr></tbody></table></div></td></tr><tr style=\"height:18px\"><td><a style=\"color:inherit;text-decoration:none\"></a></td></tr></tbody></table></td><td style=\"width:50%\"><a style=\"color:inherit;text-decoration:none\"></a></td></tr></tbody></table>";

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

			Properties props = new Properties();
			/** Parâmetros de conexão com servidor Gmail */
			props.put("mail.smtp.host", "smtp.propiles.com.br");
			props.put("mail.smtp.socketFactory.port", "25");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "25");

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("propiles@propiles.com.br", "f9q6f8m8");
				}
			});

			/** Ativa Debug para sessão */
			// session.setDebug(true);

			try {

				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress("propiles@propiles.com.br")); // Remetente

				Address[] toUser = InternetAddress.parse(to); // Destinatário(s)

				message.setRecipients(Message.RecipientType.TO, toUser);
				message.setSubject(subject);// Assunto
				message.setContent(corpo, "text/html; charset=utf-8");

				/** Método para enviar a mensagem criada */
				Transport.send(message);

			} catch (MessagingException e) {
				e.printStackTrace();
				System.out.println("Não conseguiu enviar o email...");
			}
		}

		class PopupAuthenticator extends Authenticator {
			@Override
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("propiles@propiles.com.br", "f9q6f8m8");
			}
		}
	}

}
