package estudo;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Estudo {

	public static void main(String[] args) {
		try {
			String smtphost = "smtp-web.kinghost.net";
			InternetAddress remetente = new InternetAddress("propiles@propiles.com.br"); // Este
																							// email
																							// deve
																							// ser
																							// válido
																							// e
																							// existir
																							// como
																							// conta
																							// de
																							// email
																							// para
																							// o
																							// domínio
			InternetAddress destinatario = new InternetAddress("danilo.dct@gmail.com");
			String assunto = "Assunto do email";
			String conteudo = "Este é um email teste";

			Properties p = new Properties();
			p.put("mail.smtp.host", smtphost);

			Session email = Session.getInstance(p, null);
			MimeMessage msg = new MimeMessage(email);

			msg.setFrom(remetente);
			msg.setRecipient(Message.RecipientType.TO, destinatario);
			msg.setSubject(assunto);
			msg.setContent(conteudo, "text/html");
			msg.saveChanges();

			Transport transport = email.getTransport("smtp");
			transport.connect(smtphost, "");
			transport.sendMessage(msg, msg.getAllRecipients());
			transport.close();
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // Este
		catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}