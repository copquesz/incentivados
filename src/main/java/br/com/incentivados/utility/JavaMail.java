package br.com.incentivados.utility;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Lucas Copque
 * @version 1.0
 * @since 26/03/2020
 */
public class JavaMail {

    private static Logger logger = Logger.getLogger(JavaMail.class.getName());

    public static void send(String recipient, String subject, String text) throws Exception {

        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.host", "smtp.kinghost.net");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.starttls.required", "true");

        final String myAccount = "no-reply@incentivados.com.br";
        final String password = "yaba2389";

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myAccount, password);
            }
        });

        Message message = prepareMessage(session, myAccount, recipient, subject, text);
        Transport.send(message);
        logger.log(Level.INFO, "E-mail enviado com sucesso para " + recipient);
    }

    private static Message prepareMessage(Session session, String myAccount, String recipient, String subject, String text) throws MessagingException {
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress("Plataforma Incentivados - Leroy Merlin <" + myAccount + ">"));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
        message.setSubject(subject, "utf-8");
        message.setContent(text, "text/html; charset=utf-8");
        return message;
    }
}